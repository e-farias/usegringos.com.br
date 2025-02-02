{% set newsletter_contact_error = contact.type == 'newsletter' and not contact.success %}

<div class="js-newsletter newsletter w-100">
	<div
		class="mb-2 font-body text-uppercase font-josefin-sans"
		style="font-size: 18px; font-weight: 500;"
	>
		{{ 'Newsletter' | translate }}
	</div>

	{# <h2 class="h1 mb-4 js-home-newstetter-title">{{ settings.news_title }}</h2> #}
	<p class="js-home-newstetter-text font-lexend-exa mb-3 font-weight-light" style="font-size: 12px;">
		Inscreva-se e faça parte da comunidade Gringos
	</p>

	{% if contact and contact.type == 'newsletter' %}
		{% if contact.success %}
			<div class="alert alert-success">{{ "¡Gracias por suscribirte! A partir de ahora vas a recibir nuestras novedades en tu email" | translate }}</div>
		{% else %}
			<div class="alert alert-danger">{{ "Necesitamos tu email para enviarte nuestras novedades." | translate }}</div>
		{% endif %}
	{% endif %}

	<form class="w-100 d-block" method="post" action="/winnie-pooh" onsubmit="this.setAttribute('action', '');" data-store="newsletter-form">
		<div
			class="d-flex flex-row w-100 m-0"
			style="border: 1px solid #FFF; border-radius: 10px; min-height: 3rem; overflow: hidden;"
		>

			{# {% embed "snipplets/forms/form-input.tpl" with{input_for: 'email', type_email: true, input_name: 'email', input_id: 'email', input_placeholder: 'Digite seu email', input_custom_class: "form-control-big", input_aria_label: 'Email' | translate } %}
			{% endembed %} #}
			<input
				id="email"
				type="email"
				class="form-control d-flex col-10 font-lexend-exa"
				autocorrect="off"
				autocapitalize="off"
				name="email"
				placeholder="Digite seu e-mail"
				aria-label="Email"
			/>

			<div class="winnie-pooh" style="display: none;">
				<label for="winnie-pooh-newsletter">{{ "No completar este campo" | translate }}</label>
				<input id="winnie-pooh-newsletter" type="text" name="winnie-pooh"/>
			</div>

			<input type="hidden" name="name" value="{{ "Sin nombre" | translate }}" />
			<input type="hidden" name="message" value="{{ "Pedido de inscripción a newsletter" | translate }}" />
			<input type="hidden" name="type" value="newsletter" />
			<input type="hidden" name="contact" value="{{ "Enviar" | translate }}" />
			<button
				type="submit"
				class="btn d-flex col-2 justify-content-center align-items-center relative"
				style="position: static; background: #FFF;border-radius: 10px 0 0 10px; height: auto; width: auto;max-width: 3rem;margin-left: auto;"
			>
				<!-- <input type="submit" name="contact" class="btn newsletter-btn" value="{{ "Enviar" | translate }}"> -->
				<!-- <svg class="icon-inline newsletter-btn svg-icon-primary">
					<use xlink:href="#arrow"/>
				</svg> -->
				{# <input
					type="submit"
					name="contact"
					value="{{ "Enviar" | translate }}"
					class="w-100 h-100 absolute"
				> #}
				<span style="filter: invert(1);width: .5rem;">
					{% include "snipplets/svg/arrow.tpl" %}
				</span>
			</button>
			
		</div>
	</form>
</div>
