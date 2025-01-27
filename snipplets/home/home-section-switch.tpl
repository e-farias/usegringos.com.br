{% if section_select == 'slider' %}

    {#  **** Home slider ****  #}
    <section data-store="home-slider">
        {% if show_help or (show_component_help and not (has_main_slider or has_mobile_slider)) %}
            {% snipplet 'defaults/home/slider_help.tpl' %}
        {% else %}
            {% include 'snipplets/home/home-slider.tpl' %}
            {% if has_mobile_slider %}
                {% include 'snipplets/home/home-slider.tpl' with {mobile: true} %}
            {% endif %}
        {% endif %}
    </section>

{# {% elseif section_select == 'informatives' %} #}

    {#  **** Informative banners ****  #}
    {# <section data-store="banner-services">
        {% if show_help or (show_component_help and not has_informative_banners) %}
            {% snipplet 'defaults/home/informative_banners_help.tpl' %}
        {% else %}
            {% include 'snipplets/banner-services/banner-services.tpl' %}
        {% endif %}
    </section> #}

{% elseif section_select == 'categories' %}

    {#  **** Categories banners ****  #}
    <section id="categories-short" class="section-banners-home bg-primary p-4 py-8 font-josefin-sans" data-store="home-banner-categories" style="margin-top: -1.5rem; margin-bottom: 0;">
        {# {% if show_help or (show_component_help and not has_category_banners) %}
            {% snipplet 'defaults/home/category_banners_help.tpl' %}
        {% else %}
            {% include 'snipplets/home/home-banners.tpl' %}
        {% endif %} #}
        <div class="row justify-content-center m-0 mx-auto" style="gap: 1.5rem;">
            
            <a id="roupas" href="/roupas" class="d-block col-12 p-0 position-relative border-transparent">
                <div class="video-container">
                    <video class="border-transparent" autoplay loop muted>
                        <source
                            src="{{ "videos/criativo1.mp4" | static_url }}"
                            type="video/mp4"
                        >
                        Your browser does not support the video tag.
                    </video>
                </div>
                <img
                    src="{{ "images/overlay_dark.webp" | static_url }}"
                    class="d-block d-lg-none w-100"
                />
                <img
                    src="{{ "images/roupas_web.webp" | static_url }}"
                    class="d-none d-lg-block w-100"
                />
                <div class="content">
                    <h1 class="w-100 text-white text-center mb-2 font-josefin-sans" style="font-weight: 500;font-size: 42px;">Roupas</h1>
                    <div class="w-100 text-white text-center d-flex justify-content-center align-items-center">
                        <span style="font-weight: 300;font-size: 18px;">ver mais</span>
                        <svg class="icon-inline icon-2x icon-w-4 mx-2">
                            {% include "snipplets/svg/arrow.tpl" %}
                        </svg>
                    </div>
                </div>
            </a>

            <a id="perfumes" href="/perfumes" class="d-block col-12 p-0 position-relative border-transparent">
                <img
                    src="{{ "images/perfumes_mobile.webp" | static_url }}"
                    class="d-block d-lg-none w-100"
                />
                <img
                    src="{{ "images/perfumes_web.webp" | static_url }}"
                    class="d-none d-lg-block w-100"
                />
                <div class="content">
                    <h1 class="w-100 text-white text-center mb-2 font-josefin-sans" style="font-weight: 500;font-size: 42px;">Perfumes</h1>
                    <div class="w-100 text-white text-center d-flex justify-content-center align-items-center">
                        <span style="font-weight: 300;font-size: 18px;">ver mais</span>
                        <svg class="icon-inline icon-2x icon-w-4 mx-2">
                            {% include "snipplets/svg/arrow.tpl" %}
                        </svg>
                    </div>
                </div>
            </a>
        </div>
    </section>

{# {% elseif section_select == 'welcome' %} #}

    {#  **** Welcome message ****  #}
    {# {% if show_help or (show_component_help and not has_welcome) %}
        {% snipplet 'defaults/home/welcome_help.tpl' %}
    {% else %}
        {% include 'snipplets/home/home-welcome-message.tpl' %}
    {% endif %} #}

{# {% elseif section_select == 'brands' %} #}

    {#  **** Brands ****  #}
    {# {% if show_help or (show_component_help and not has_brands) %}
        {% snipplet 'defaults/home/brands_help.tpl' %}
    {% else %}
    {% endif %} #}
    {% include 'snipplets/home/home-brands.tpl' %}
    {% include 'snipplets/home/home-category-pills.tpl' %}
    {% include 'snipplets/home/home-featured-products.tpl' with {'has_featured': true} %}
{# {% elseif section_select == 'video' %} #}

    {#  **** Video embed ****  #}
    {# <section class="section-video-home" data-store="home-video">
        {% if show_help or (show_component_help and not has_video) %}
            {% snipplet 'defaults/home/video_help.tpl' %}
        {% else %}
            {% include 'snipplets/home/home-video.tpl' %}
        {% endif %}
    </section> #}

    {% include 'snipplets/home/home-featured-products.tpl' with {'has_new': true} %}
    {% include 'snipplets/home/home-instafeed.tpl' %}
    {% include 'snipplets/home/home-featured-products.tpl' with {'has_sale': true} %}

{# {% elseif section_select == 'promotional' %} #}

    {#  **** Promotional banners ****  #}
    <section class="section-banners-home" data-store="home-banner-promotional">
        {% if show_help or (show_component_help and not has_promotional_banners) %}
            {% snipplet 'defaults/home/promotional_banners_help.tpl' %}
        {% else %}
            {% include 'snipplets/home/home-promotional.tpl' %}
        {% endif %}
    </section>

{# {% elseif section_select == 'newsletter' %} #}

    {#  **** Newsletter ****  #}
    {# {% include 'snipplets/newsletter.tpl' %} #}

{% endif %}