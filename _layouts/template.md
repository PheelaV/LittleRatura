<!DOCTYPE html>
<html lang="{{ site.lang | default: "cs-CZ" }}">
  {% include head.html %}
  <body>
    <header class="page-header" role="banner">
        <h1 class="project-name">
        {{ page.title | default: site.title | default: site.github.repository_name }}</h1>
        <h2 class="project-tagline">{{ page.description | default: site.description | default: site.github.project_tagline }}</h2>

        {% for item in site.data.siteList.docs %}
            <a href="{{ item.url }}" class="btn btn-info">{{ item.title }}</a></li>
        {% endfor %}
    </header>

    <main id="content" class="main-content" role="main">
      {{ content }}

    {% include footer.html %}
    </main>

  </body>
</html>
