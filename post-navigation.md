---
title: Knížky
layout: template
description: Rozcestník
---

# Knížky:

{% for category in site.categories %}

  <h3>{{ category[0] }}</h3>
  <ul>
    {% for post in category[1] %}
      <li><a href="{{ post.url }}">{{ post.title }} {% if post.wip %} (WIP) {% endif %}</a></li>
    {% endfor %}
  </ul>
{% endfor %}
