{% macro get_relations_by_pattern(schema_pattern, table_pattern='%', exclude='', database=target.database) %}

{% set sql %}
    SELECT t.name as table_name
    FROM {{ database }}.sys.tables t
    INNER JOIN {{ database }}.sys.schemas s ON t.schema_id = s.schema_id
    WHERE s.name = '{{ schema_pattern }}'
      AND t.name LIKE '{{ table_pattern }}'
{% endset %}

{% set results = run_query(sql) %}
{% set relations = [] %}

{% for row in results %}
    {% do relations.append(api.Relation.create(
        database=database,
        schema=schema_pattern,
        identifier=row[0]
    )) %}
{% endfor %}

{{ return(relations) }}

{% endmacro %}