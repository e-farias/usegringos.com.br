<div class="nav-categories">
	<ul class="nav-list-mobile-categories d-flex justify-content-center">
		{% for category in categories %}
			<li class="nav-item">
	        	<a class="{% if desktop_nav %}nav-link-category{% else %}nav-list-link {{ item.current ? 'selected' : '' }}{% endif %}" href="{{ category.url }}">{{ category.name }}</a>
	        </li>
		{% endfor %}
	</ul>
</div>