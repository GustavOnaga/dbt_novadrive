{% macro generate_schema_name(custom_schema_name, node) -%}

    {%- set default_schema = target.schema -%}

    {# Se o modelo/seed definir custom_schema como raw_novadrive, ignora o 'dev' do profile #}
    {%- if custom_schema_name == 'raw_novadrive' -%}

        {{ custom_schema_name | trim }}

    {# Se tiver outro custom_schema #}
    {%- elif custom_schema_name is not none -%}

        {%- if target.name == 'prod' -%}
            {{ custom_schema_name | trim }}
        {%- else -%}
            {{ default_schema }}_{{ custom_schema_name | trim }}
        {%- endif -%}

    {# Se não definir nada, usa o 'dev' do profiles.yml #}
    {%- else -%}

        {{ default_schema }}

    {%- endif -%}

{%- endmacro %}