<section class="section-instafeed-home" data-store="home-instagram-feed">
    <div class="js-instagram-feed">
        <div class="container">
            <div class="row w-100 justify-content-center align-items-center m-0">
                {% set instuser = store.instagram|split('/')|last %}
                <div class="d-flex flex-column text-center">
                    <a
                        target="_blank"
                        href="https://www.instagram.com/usegringos/"
                        class="mb-0"
                        aria-label="{{ 'Instagram de' | translate }} {{ store.name }}"
                    >
                        <div class="d-flex justify-content-center align-items-center instafeed-title{% if settings.theme_rounded %} svg-icon-primary{% else %} svg-icon-text{% endif %} mb-2">
                            <svg class="icon-inline h1 mt-0 mr-2" style="font-size: 22px;">
                                <use xlink:href="#instagram"/>
                            </svg>
                            <h2
                                class="instafeed-user mb-0 font-lexend-exa"
                                style="font-size: 20px; font-weight: 500;"
                            >
                                usegringos
                            </h2>
                        </div>

                        {# Instagram fallback info in case feed fails to load #}
                        <div class="js-ig-fallback">
                            <h5
                                class="font-weight-light font-lexend-exa"
                                style="color: #444444; font-size: 14px;"
                            >
                                Acompanhe no instagram
                            </h5>
                        </div>
                    </a>
                </div>
            </div>
        </div>

        <div class="js-ig-success row no-gutters mt-3"
            data-ig-feed
            data-ig-items-count="6"
            data-ig-item-class="col-4 col-md-2"
            data-ig-link-class="instafeed-link"
            data-ig-image-class="instafeed-img w-100 fade-in"
            data-ig-aria-label="{{ 'Publicación de Instagram de' | translate }} {{ store.name }}"
            style="display: none;">
        </div>
    </div>
</section>