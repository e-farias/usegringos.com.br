{# {% if settings.brands and settings.brands is not empty %}
{% endif %} #}

{% set sliders = [
	{
		"image": "images/marks/tommy_hilfiger.webp",
	},
	{
		"image": "images/marks/paco_rabanne.webp",
	},
	{
		"image": "images/marks/carolina_herrera.webp",
	},
	{
		"image": "images/marks/dior.webp",
	},
] %}

<section class="section-brands-home py-8" data-store="home-brands">
	<div class="row">
		<div class="col p-0">
			{# <div class="js-swiper-brands swiper-container">
				<div class="swiper-wrapper">
					{% for slide in sliders %}
					<div class="swiper-slide slide-container">
						<img src="{{ slide.image | static_url }}" class="lazyload brand-image"
							alt="{{ 'Marca {1} de' | translate(loop.index) }} {{ store.name }}">
					</div>
					{% endfor %}
				</div>
			</div> #}
			<div class="brands-swiper">
				<div class="brands-swiper-wrapper">
					{% for slide in sliders %}
					<div class="slide">
						<img src="{{ slide.image | static_url }}" class="lazyload"
							alt="{{ 'Marca {1} de' | translate(loop.index) }} {{ store.name }}">
					</div>
					{% endfor %}

					{% for slide in sliders %}
					<div class="slide">
						<img src="{{ slide.image | static_url }}" class="lazyload"
							alt="{{ 'Marca {1} de' | translate(loop.index) }} {{ store.name }}">
					</div>
					{% endfor %}
				</div>
			</div>
		</div>
	</div>
	{# <div
		class="js-swiper-brands-prev swiper-button-prev d-none d-md-block svg-circle svg-circle-big svg-icon-text{% if settings.icons_solid %} svg-solid{% endif %}">
		<svg class="icon-inline icon-2x mr-1 icon-flip-horizontal">
			<use xlink:href="#chevron" />
		</svg>
	</div>
	<div
		class="js-swiper-brands-next swiper-button-next d-none d-md-block svg-circle svg-circle-big svg-icon-text{% if settings.icons_solid %} svg-solid{% endif %}">
		<svg class="icon-inline icon-2x ml-1">
			<use xlink:href="#chevron" />
		</svg>
	</div> #}
</section>