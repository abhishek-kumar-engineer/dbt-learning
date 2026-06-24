{% set init_flag = 1 %}
{% set last_load = 3 %}

{% set selected_col = ['sales_id', 'date_sk', 'net_amount', 'payment_method']%}

SELECT 

    {{ selected_col | join(', ') }}

FROM {{ ref('bronze_sales') }}

{% if init_flag == 1 %}
    
WHERE date_sk > {{ last_load }}

{% endif %}
