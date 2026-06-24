{%- set fruits = ['apple', 'banana', 'orange', 'grapes', 'lemon'] -%}
{% for fruit in fruits%}
    {% if fruit != 'lemon'%}
        {{fruit}}
    {% else %}
        I hate {{fruit}}
    {% endif %}
{% endfor%}