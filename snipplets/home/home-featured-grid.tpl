{# /*============================================================================
  #Home featured grid
==============================================================================*/

#Properties

#Featured Slider

#}

{% set featured_products = featured_products | default(false) %}
{% set new_products = new_products | default(false) %}
{% set sale_products = sale_products | default(false) %}

{# Check if slider is used #}

{% set has_featured_products_and_slider = featured_products and settings.featured_products_format != 'grid' %}
{% set has_new_products_and_slider = new_products and settings.new_products_format != 'grid' %}
{% set has_sale_products_and_slider = sale_products and settings.sale_products_format != 'grid' %}
{% set use_slider = has_featured_products_and_slider or has_new_products_and_slider or has_sale_products_and_slider %}

{% if featured_products %}
    {% set sections_products = sections.primary.products %}
    {% set section_name = 'primary' %}
    {% set highlighted_products_setting_name = 'featured' %}
    {% set section_title = settings.featured_products_title %}
    {% set section_format = settings.featured_products_format %}
{% endif %}
{% if new_products %}
    {% set sections_products = sections.new.products %}
    {% set section_name = 'new' %}
    {% set highlighted_products_setting_name = 'new' %}
    {% set section_title = settings.new_products_title %}
    {% set section_format = settings.new_products_format %}
{% endif %}
{% if sale_products %}
    {% set sections_products = sections.sale.products %}
    {% set section_name = 'sale' %}
    {% set highlighted_products_setting_name = 'sale' %}
    {% set section_title = settings.sale_products_title %}
    {% set section_format = settings.sale_products_format %}
{% endif %}

<div class="container">
    <div class="row js-products-{{ highlighted_products_setting_name }}-container" data-format="{{ section_format }}" data-desktop-columns="{% if settings.grid_columns == 2 %}4{% else %}3{% endif %}">
        
        {% if section_name == 'new' %}
            <div class="d-flex col-12 justify-content-center mb-3 font-lexend-exa font-weight-light">
                <p class="text-center text-uppercase">
                    VERÃO 25’
                </p>
            </div>

            <div class="d-flex col-12 justify-content-center mb-3 font-lexend-exa font-weight-bold">
                <p class="text-center" style="font-size: 2rem; line-height: 1;">
                    Moda Praia-Verão
                </p>
            </div>

            <div class="d-flex col-12 justify-content-center font-lexend font-weight-light">
                <p class="text-center">
                    Um convite para respirar fundo, sentir a areia nos pés e deixar o ritmo desacelerar. A natureza nos inspira, o vento nos guia, o horizonte nos encanta.
                </p>
            </div>
            <div class="d-flex col-12 justify-content-center mb-4 font-lexend font-weight-light">
                <p class="text-center">
                    A coleção traduz a leveza dos dias dourados. Descubra o equilíbrio entre estilo e simplicidade com looks que celebram o espírito do verão.
                </p>
            </div>
        {% endif %}

        <div class="col-12 title pl-4 pl-lg-0 p-lg-0">
            <h2 class="font-josefin-sans js-products-{{ highlighted_products_setting_name }}-title {% if settings.theme_rounded %}text-primary{% endif %}" {% if not section_title %}style="display: none"{% endif %}>{{ section_title }}</h2>
        </div>

        {% if use_slider %}
            <div class="col-12 p-0 pl-3 pl-lg-0" style="z-index:555;">
                <div class="js-swiper-{{ highlighted_products_setting_name }} swiper-container">
                    <div class="swiper-wrapper">
        {% endif %}

        {% for product in sections_products %}
            {% if use_slider %}
                {% include 'snipplets/grid/item.tpl' with {'slide_item': true, 'section_name': section_name} %}
            {% else %}
                {% include 'snipplets/grid/item.tpl' %}
            {% endif %}
        {% endfor %}

        {% if use_slider %}
                    </div>
                </div>
            </div>
        {% endif %}

        {% if show_help %}
            {% for i in 1..4 %}
                {% if loop.index % 4 == 1 %}
                    <div class="grid-row">
                {% endif %}

                <div class="span3">
                    <div class="item">
                        <div class="item-image-container">
                            <a href="/admin/products/new" target="_top">{{'placeholder-product.png' | static_url | img_tag}}</a>
                        </div>
                        <div class="item-info-container">
                            <div class="title"><a href="/admin/products/new" target="_top">{{"Producto" | translate}}</a></div>
                            <div class="price">{{"$0.00" | translate}}</div>
                        </div>
                    </div>
                </div>

                {% if loop.index % 4 == 0 or loop.last %}
                    </div>
                {% endif %}
            {% endfor %}
        {% endif %}

        {% if use_slider %}
            <div class="js-swiper-{{ highlighted_products_setting_name }}-prev swiper-button-prev d-none d-lg-flex svg-icon-text justify-content-center align-items-center" style="z-index:999; width: 50px; height: 50px; border-radius: 100%;">
                <svg class="icon-inline icon-2x icon-flip-horizontal"><use xlink:href="#chevron"/></svg>
            </div>
            <div class="js-swiper-{{ highlighted_products_setting_name }}-next swiper-button-next d-none d-lg-flex svg-icon-text justify-content-center align-items-center" style="z-index:999; width: 50px; height: 50px; border-radius: 100%;">
                <svg class="icon-inline icon-2x"><use xlink:href="#chevron"/></svg>
            </div>
        {% endif %}

        {% if section_name == 'new' %}
            <div class="d-flex col-12 justify-content-center" style="margin-bottom: 4rem">
                <a
                    href="/colecao-verao"
                    class="d-flex justify-content-center align-items-center svg-icon-text"
                    style="background: #F5F5F5; border-radius: .75rem; padding: 1rem 1.75rem;"
                >
                    <span class="mt-1" style="font-weight: 500;font-size: 14px; color: #494949;">VER MAIS</span>
                    <svg class="icon-inline icon-md ml-2"><use xlink:href="#chevron"/></svg>
                </a>
            </div>
        {% endif %}
    </div>
</div>