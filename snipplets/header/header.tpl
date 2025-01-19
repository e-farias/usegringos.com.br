{# Site Overlay #}
<div class="js-overlay site-overlay" style="display: none;"></div>


{# Header #}

{% set show_transparent_head = template == 'home' and settings.head_transparent and settings.slider and not settings.slider is empty %}

{% set logo_desktop_class = settings.logo_position_desktop == 'center' ? 'logo-desktop-center' %}

<header class="js-head-main head-main head-{{ settings.head_background }} {% if settings.head_fix %}head-fix{% endif %} transition-soft {{ logo_desktop_class }}" data-store="head">

    {# Topbar = Social + Advertising + Language #}

    {% set has_social_network = store.facebook or store.twitter or store.pinterest or store.instagram or store.tiktok or store.youtube %}
    {% set has_languages = languages | length > 1 %}
    {% set has_ad_bar = settings.ad_bar and settings.ad_text %}
    {% set show_topbar =  has_ad_bar or has_social_network or has_languages %}
    {% if show_topbar %}
        <section class="js-topbar section-topbar {% if not has_ad_bar %}d-none d-lg-block{% endif %}">
            <div class="container-fluid">
                <div class="row justify-content-center text-primary py-1">
                    <strong>FRETE GRÁTIS</strong>   
                    <span class="mx-2">|</span>
                    <span>COMPRAS ACIMA DE R$ 300</span>
                </div>
            </div>
        </section>
    {% endif %}
	<div class="container-fluid">
		<div class="{% if not settings.head_fix %}js-nav-logo-bar{% endif %} row no-gutters align-items-center p-2 px-lg-2 py-lg-1">

            {# Menu icon for all mobile combinations except when categories are exposed and logo is centered #}
            <!-- {% if settings.head_utility == 'searchbox' or settings.head_utility == 'icons' or (settings.logo_position_mobile == 'left' and settings.head_utility == 'categories') %}
            {% endif %} -->
            <div class="col-auto {% if settings.logo_position_mobile == 'left' %}order-last ml-2{% else %}text-left{% endif %} d-block d-lg-none">
                <a href="#" class="js-modal-open utilities-link utilities-item" data-toggle="#nav-hamburger" aria-label="{{ 'Menú' | translate }}" data-component="menu-button">
                    <svg class="icon-inline icon-2x icon-w-12"><use xlink:href="#bars"/></svg>
                </a>
                <!-- {% if store.country == 'AR'%}
                    {# Notification icon for quick login on AR stores #}
                {% endif %} -->
                <div class="js-quick-login-badge badge badge-overlap swing" style="display: none;"></div>
            </div>

            {# Logo for mobile and desktop #}
			<div class="{% if settings.logo_position_desktop == 'center' %}{% if settings.icons_size_desktop == 'big' %}col-lg-6{% else %}col-lg-4{% endif %}{% else %}col-lg-2{% endif %} {% if settings.logo_position_mobile == 'left' %} text-left{% else %}col text-center{% endif %} {% if settings.logo_position_desktop == 'center' %}text-lg-center {% if settings.icons_size_desktop == 'small' %}offset-lg-1{% endif %} order-lg-2{% else %}text-lg-left{% endif %}">
                {% set logo_size_class = settings.logo_size == 'small' ? 'logo-img-small' : settings.logo_size == 'big' ? 'logo-img-big' %}
                {{ component('logos/logo', {logo_img_classes: 'transition-soft pl-4 pl-lg-0 ' ~ logo_size_class, logo_text_classes: 'h5 h3-lg mb-0'}) }}
            </div>

            {# Search icon used for mobile when categories are exposed #}
            {# {% if settings.head_utility == 'categories' or (settings.head_utility == 'categories' and settings.logo_position_mobile == 'left') or settings.head_utility == 'icons' %}
            {% endif %} #}
            <div class="col-auto {% if settings.logo_position_mobile == 'left' or (settings.logo_position_mobile == 'center' and settings.head_utility == 'icons') %}order-2 {% if not (settings.logo_position_mobile == 'center' and settings.head_utility == 'icons') %}ml-2{% endif %}{% else %}text-left{% endif %} d-block d-lg-none">
                <a
                    href="#"
                    class="js-modal-open utilities-link utilities-item"
                    data-toggle="#nav-search"
                    aria-label="{{ 'Buscador' | translate }}"
                >
                    <svg class="icon-inline icon-2x icon-w-14">
                        {% include "snipplets/svg/search.tpl" %}
                    </svg>
                </a>
            </div>

            {# Desktop Search, used on mobile when setting is set to show "big search" #}
            {# <div class="d-none d-lg-flex col-lg-6 text-center transition-soft">
                {% snipplet "header/header-search.tpl" %}
            </div> #}

            {# Utility icons: Help, Account and Cart (also used on mobile) #}
            
            <div class="d-none d-lg-block col-8 p-0">
                {% snipplet "navigation/navigation-categories.tpl" %}
                {# {% snipplet "navigation/navigation.tpl" %} #}
            </div>

			<div class="col-auto col-lg-2 text-right">
                {% snipplet "header/header-utilities.tpl" %}
                {% if settings.head_fix and settings.ajax_cart %}
                    <div class="d-none d-lg-block">
                        {% include "snipplets/notification.tpl" with {add_to_cart: true} %}
                    </div>
                {% endif %}
            </div>
		</div>
        {% if settings.head_fix and settings.ajax_cart %}
            <div class="d-lg-none">
                {% include "snipplets/notification.tpl" with {add_to_cart: true, add_to_cart_mobile: true} %}
            </div>
        {% endif %}

	</div>    
    {% include "snipplets/notification.tpl" with {order_notification: true} %}
</header>

{# Show cookie validation message #}

{% include "snipplets/notification.tpl" with {show_cookie_banner: true} %}

{# Add notification for quick login cancellation #}

{% if template == 'home' or template == 'product' %}
    {% include "snipplets/notification.tpl" with {show_quick_login: true} %}
{% endif %}

{# Add to cart notification for non fixed header #}

{% if not settings.head_fix and settings.ajax_cart %}
    {% include "snipplets/notification.tpl" with {add_to_cart: true, add_to_cart_fixed: true} %}
{% endif %}

{# Quick login modal #}

{% embed "snipplets/modal.tpl" with{modal_id: 'quick-login', modal_class: 'bottom modal-centered-small', modal_position: 'center', modal_transition: 'slide', modal_header: false, modal_footer: false, modal_width: 'centered', modal_zindex_top: true, modal_close_class: 'float-right mr-0'} %}
    {% block modal_body %}
        <div class="text-center h5 mt-3">{{ "¡Qué bueno verte de nuevo!" | translate }}</div>
        <div class="text-center p-2">{{ "Iniciá sesión para comprar más rápido y ver todos tus pedidos." | translate }}</div>
        {% embed "snipplets/forms/form.tpl" with{form_id: 'quick-login-form', form_action: '/account/login/', submit_custom_class: 'btn-block', submit_text: 'Iniciar sesión' | translate, data_store: 'account-login' } %}
            {% block form_body %}
                {% embed "snipplets/forms/form-input.tpl" with{type_hidden: true, input_value: current_url, input_name: 'redirect_to'} %}{% endembed %}
                {% embed "snipplets/forms/form-input.tpl" with{type_hidden: true, input_value: 'quick-login', input_name: 'from'} %}{% endembed %}
                {% embed "snipplets/forms/form-input.tpl" with{input_for: 'email', type_email: true, input_value: result.email, input_name: 'email', input_custom_class: 'js-account-input', input_label_text: 'Email' | translate } %}{% endembed %}
                {% embed "snipplets/forms/form-input.tpl" with{input_for: 'password', type_password: true, input_name: 'password', input_custom_class: 'js-account-input', input_help: true, input_help_link: store.customer_reset_password_url, input_link_class: 'btn-link-primary font-small float-right mb-4 mt-3n', input_label_text: 'Contraseña' | translate } %}{% endembed %}
            {% endblock %}
        {% endembed %}
    {% endblock %}
{% endembed %}

{# Hamburger panel #}

{% embed "snipplets/modal.tpl" with {modal_id: 'nav-hamburger',modal_class: 'nav-hamburger head-'~ settings.head_background ~ ' modal-docked-small', modal_position: 'left', modal_transition: 'fade', modal_width: 'full', modal_topbar: true, modal_fixed_footer: true, modal_footer: true, modal_footer_class: 'p-0' } %}
    {% block modal_topbar %}
        {% snipplet "navigation/navigation-topbar.tpl" %}
    {% endblock %}
    {% block modal_body %}
        {% include "snipplets/navigation/navigation-panel.tpl" with {primary_links: true} %}
    {% endblock %}
    {% block modal_foot %}
        {% include "snipplets/navigation/navigation-panel.tpl" %}
    {% endblock %}
{% endembed %}
{# Notifications #}

{# Modal Search #}

{% embed "snipplets/modal.tpl" with{modal_id: 'nav-search',modal_class: 'nav-search', modal_position: 'left', modal_transition: 'slide', modal_width: 'docked-lg', modal_header: true } %}
    {% block modal_head %}
            {% block page_header_text %}{{ "Buscar" | translate }}{% endblock page_header_text %}
    {% endblock %}
    {% block modal_body %}
        {% snipplet "header/header-search.tpl" %}
    {% endblock %}
{% endembed %}

{% if not store.is_catalog and settings.ajax_cart and template != 'cart' %}           

    {# Cart Ajax #}

    {% embed "snipplets/modal.tpl" with{modal_id: 'modal-cart', modal_position: 'right', modal_transition: 'slide', modal_width: 'docked-lg', modal_form_action: store.cart_url, modal_form_class: 'js-ajax-cart-panel', modal_header: true, modal_mobile_full_screen: true, modal_form_hook: 'cart-form', data_component:'cart' } %}
        {% block modal_head %}
            {% block page_header_text %}{{ "Carrito de Compras" | translate }}{% endblock page_header_text %}
        {% endblock %}
        {% block modal_body %}
            {% snipplet "cart-panel.tpl" %}
        {% endblock %}
    {% endembed %}

{% endif %}

{% if settings.add_to_cart_recommendations %}

    {# Recommended products on add to cart #}

    {% embed "snipplets/modal.tpl" with{modal_id: 'related-products-notification', modal_class: 'bottom modal-overflow-none modal-bottom-sheet h-auto', modal_header: true, modal_header_class: 'modal-header-light px-0 pt-0 mb-2 m-0 w-100', modal_position: 'bottom', modal_transition: 'slide', modal_footer: false, modal_width: 'centered-lg modal-centered-lg-600px m-0 p-3', modal_close_class: 'float-right mr-0'} %}
        {% block modal_head %}
            {{ '¡Agregado al carrito!' | translate }}
        {% endblock %}
        {% block modal_body %}

            {# Product added info #}

            {% include "snipplets/notification-cart.tpl" with {related_products: true} %}

            <div class="divider my-3"></div>

            {# Product added recommendations #}

            <div class="js-related-products-notification-container" style="display: none"></div>

        {% endblock %}
    {% endembed %}
{% endif %}
