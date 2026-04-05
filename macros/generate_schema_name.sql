{% macro generate_schema_name(custom_schema_name, node) %}

    {# Respeta schema manual si lo defines en config() #}
    {% if custom_schema_name is not none %}
        {{ custom_schema_name }}
    {% else %}

        {% set path = node.path.split('/') %}
        {% set layer = path[0] %}
        {% set domain = path[1] if path | length > 1 else 'default' %}

        {% if layer == 'bronze' %}
            {{ 'brz_' ~ domain }}
        {% elif layer == 'silver' %}
            {{ 'slv_' ~ domain }}
        {% elif layer == 'gold' %}
            {{ 'gld_' ~ domain }}
        {% elif layer == 'platinum' %}
            {{ 'plt_' ~ domain }}
        {% else %}
            {{ target.schema }}
        {% endif %}

    {% endif %}

{% endmacro %}