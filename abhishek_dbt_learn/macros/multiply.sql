{% macro multiply(col1, col2) %}
  {{ col1 | float }} * {{ col2 | float }}
{% endmacro %}