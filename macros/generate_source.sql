{% macro generate_source(schema_name, database_name=target.database, generate_columns=False,
    include_descriptions=False, include_data_types=True, table_pattern='%', exclude='',
    name=schema_name, table_names=None, include_database=False, include_schema=False,
    case_sensitive_databases=False, case_sensitive_schemas=False, case_sensitive_tables=False,
    case_sensitive_cols=False) %}

{# Llamada a tu macro local que obtiene las tablas #}
{% if table_names is none %}
    {% set tables = get_tables_in_schema(schema_name, database_name, table_pattern, exclude) %}
{% else %}
    {% set tables = table_names %}
{% endif %}

{% set sources_yaml = [] %}
{% do sources_yaml.append('version: 2') %}
{% do sources_yaml.append('') %}
{% do sources_yaml.append('sources:') %}
{% do sources_yaml.append('  - name: ' ~ name | lower) %}

{% if include_descriptions %}
    {% do sources_yaml.append('    description: ""') %}
{% endif %}

{% if database_name != target.database or include_database %}
    {% do sources_yaml.append('    database: ' ~ (database_name if case_sensitive_databases else database_name | lower)) %}
{% endif %}

{% if schema_name != name or include_schema %}
    {% do sources_yaml.append('    schema: ' ~ (schema_name if case_sensitive_schemas else schema_name | lower)) %}
{% endif %}

{% do sources_yaml.append('    tables:') %}

{% for table in tables %}
    {% do sources_yaml.append('      - name: ' ~ (table if case_sensitive_tables else table | lower)) %}

    {% if include_descriptions %}
        {% do sources_yaml.append('        description: ""') %}
    {% endif %}

    {% if generate_columns %}
        {% do sources_yaml.append('        columns:') %}
        {% set table_relation = api.Relation.create(
            database=database_name,
            schema=schema_name,
            identifier=table
        ) %}
        {% set columns = adapter.get_columns_in_relation(table_relation) %}

        {% for column in columns %}
            {% do sources_yaml.append('          - name: ' ~ (column.name if case_sensitive_cols else column.name | lower)) %}
            {% if include_data_types %}
                {% do sources_yaml.append('            data_type: ' ~ column.data_type) %}
            {% endif %}
            {% if include_descriptions %}
                {% do sources_yaml.append('            description: ""') %}
            {% endif %}
        {% endfor %}
        {% do sources_yaml.append('') %}
    {% endif %}
{% endfor %}

{% set joined = sources_yaml | join('\n') %}
{{ print(joined) }}
{% do return(joined) %}

{% endmacro %}