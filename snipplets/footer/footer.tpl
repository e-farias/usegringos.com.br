{% set has_social_network = store.facebook or store.twitter or store.pinterest or store.instagram or store.tiktok or store.youtube %}
{% set has_footer_contact_info = (store.whatsapp or store.phone or store.email or store.address or store.blog) and settings.footer_contact_show %}          

{% set has_footer_menu = settings.footer_menu and settings.footer_menu_show %}
{% set has_footer_menu_secondary = settings.footer_menu_secondary and settings.footer_menu_secondary_show %}
{% set has_footer_about = settings.footer_about_show and (settings.footer_about_title or settings.footer_about_description) %}
{% set has_payment_logos = settings.payments %}
{% set has_shipping_logos = settings.shipping %}
{% set has_shipping_payment_logos = has_payment_logos or has_shipping_logos %}

{% set has_seal_logos = store.afip or ebit or settings.custom_seal_code or ("seal_img.jpg" | has_custom_image) %}
{% set show_help = not has_products and not has_social_network %}
<footer class="js-hide-footer-while-scrolling display-when-content-ready" data-store="footer">
	<div class="container px-md-5">
		<div class="row element-footer mb-0">
			
			<div class="d-flex col-12 col-lg-4 pt-4 mb-5">

				<div class="row w-100 m-0 justify-content-center">
					<div class="d-flex col-12 justify-content-center" style="margin-bottom: 7rem;">
						<img
							src="{{ "images/logo/full.webp" | static_url }}"
							class="lazyload"
							alt="Footer logo"
							style="width: 50%;"
						/>
					</div>

					<div class="d-flex col-12 p-0">
						{% include 'snipplets/newsletter-footer.tpl' %}
					</div>
				</div>

			</div>

			<div class="d-flex col-12 col-lg-4 mb-5 px-lg-5 pt-lg-5 mt-lg-5">
				<div class="row w-100 m-0 align-content-start pl-lg-5">
					<div
						class="d-flex col-12 p-0 text-uppercase font-josefin-sans mb-4"
						style="font-size: 18px; font-weight: 500;"
					>
						Sobre a Gringo’s
					</div>

					<div class="d-flex col-12 p-0">
						<ul class="pl-0 m-0 font-lexend-exa">
							<li class="mb-3">
								<a href="https://usegringos.com.br/quem-somos">
									Quem somos
								</a>
							</li>
							<li class="mb-3">
								<a href="https://usegringos.com.br/seguranca">
									Segurança
								</a>
							</li>
							<li class="mb-3">
								<a href="https://usegringos.com.br/rastrear-pedido">
									Rastrear Pedido
								</a>
							</li>
							<li class="mb-3">
								<a href="https://usegringos.com.br/trocas-e-devolucoes">
									Trocas e Devoluções
								</a>
							</li>
							<li class="mb-3">
								<a href="https://usegringos.com.br/politica-de-privacidade">
									Política de Privacidade
								</a>
							</li>
						</ul>
					</div>
				</div>
			</div>

			<div class="d-flex col-12 col-lg-4 mb-5 px-lg-5 pt-lg-5 mt-lg-5">
				<div class="row w-100 m-0 align-content-start pl-lg-5">
					<div
						class="d-flex col-12 p-0 text-uppercase font-josefin-sans mb-4"
						style="font-size: 18px; font-weight: 500;"
					>
						Contato
					</div>

					<div class="d-flex col-12 p-0">
						<ul class="pl-0 m-0 font-lexend-exa">
							<li class="mb-3">
								<a href="https://api.whatsapp.com/send/?phone=5581997914696&text&type=phone_number" target="_blank">
									WhatsApp: +55 81 99791-4696
								</a>
							</li>
							<li class="mb-3">
								<a href="mailto:contato@usegringos.com.br" target="_blank">
									Email: contato@usegringos.com.br
								</a>
							</li>
							<li class="mb-3">
								<a href="/contato">
									Enviar Mensagem
								</a>
							</li>
							<li class="mb-3">
								<a href="https://www.instagram.com/usegringos" target="_blank">
									Instagram: usegringos
								</a>
							</li>
						</ul>
					</div>
				</div>
			</div>

			<div class="d-flex col-12 text-center mb-2 mt-lg-5">
				<div class="row w-100 m-0 justify-content-center">
					<a
						target="_blank"
						href="https://www.instagram.com/usegringos"
						class="mx-2"
						style="width: 1.5rem;"
					>
						{% include "snipplets/svg/icon-instagram.tpl" %}
					</a>

					<a
						target="_blank"
						href="https://tiktok.com/@usegringos"
						class="mx-2"
						style="width: 1.2rem;"
					>
						{% include "snipplets/svg/icon-tiktok.tpl" %}
					</a>

					<a
						target="_blank"
						href="https://api.whatsapp.com/send/?phone=5581997914696&text&type=phone_number"
						class="mx-2"
						style="width: 1.5rem;"
					>
						{% include "snipplets/svg/icon-whatsapp.tpl" %}
					</a>
					
				</div>
			</div>
			
			<div class="d-flex col-12 mb-5">
				<div
					class="row w-100 m-0 text-center justify-content-center font-lexend-exa"
					style="font-weight: 300;font-size: 12px;"
				>
					Loja Gringo's - Posto Shell, Av. Henrique <br>
					de Holanda, 367 - Matriz, Vitória de <br>
					Santo Antão - PE, 55602-000
				</div>
			</div>

			<div class="d-flex col-12">
				<div class="row w-100 m-0 justify-content-center align-items-center">
					<a target="_blank" href="#" class="col-4 col-lg-2">
						<img
							src="{{ "images/google-safe.webp" | static_url }}"
							class="w-100"
						/>
					</a>

					<a href="https://usegringos.com.br/seguranca" class="col-4 col-lg-2">
						<img
							src="{{ "images/safe-buy.webp" | static_url }}"
							class="w-100"
						/>
					</a>
				</div>
			</div>

		</div>
	</div>
	<div class="js-footer-legal footer-legal pt-1">
		<div class="container px-md-5">
			<div class="row">

				<div class="col-12 mb-3">
					<div class="d-inline-block mr-md-2 w-100 text-center font-lexend-exa" style="color: #444444;">
						{{ "Copyright {1} - {2}. Todos los derechos reservados." | translate( (store.business_name ? store.business_name : store.name) ~ (store.business_id ? ' - ' ~ store.business_id : ''), "now" | date('Y') ) }}
					</div>
					{{ component('claim-info', {
						container_classes: "d-md-inline-block mt-md-0 mt-3",
						divider_classes: "mx-1",
						text_classes: {text_consumer_defense: 'd-inline-block mb-1'},
						link_classes: {
							link_consumer_defense: "font-weight-bold",
							link_order_cancellation: "font-weight-bold",
						},
					})}}
				</div>

				<div class="col-12 text-center">
					{#
					La leyenda que aparece debajo de esta linea de código debe mantenerse
					con las mismas palabras y con su apropiado link a Tienda Nube;
					como especifican nuestros términos de uso: http://www.tiendanube.com/terminos-de-uso .
					Si quieres puedes modificar el estilo y posición de la leyenda para que se adapte a
					tu sitio. Pero debe mantenerse visible para los visitantes y con el link funcional.
					Os créditos que aparece debaixo da linha de código deverá ser mantida com as mesmas
					palavras e com seu link para Nuvem Shop; como especificam nossos Termos de Uso:
					http://www.nuvemshop.com.br/termos-de-uso. Se você quiser poderá alterar o estilo
					e a posição dos créditos para que ele se adque ao seu site. Porém você precisa
					manter visivél e com um link funcionando.
					#}
					{# {{ new_powered_by_link }} #}
					<a
						class="d-flex w-100"
						target="_blank"
						title="Nuvemshop"
						href="https://www.nuvemshop.com.br/partners/fariasdev"
						style="max-height: 15px;"	
					>
						{% include "snipplets/svg/nuvemshop-fariasdev.tpl" %}
					</a>
				</div>

			</div>
		</div>
	</div>
</footer>