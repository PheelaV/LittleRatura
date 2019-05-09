<!DOCTYPE html>
<html lang="{{ site.lang | default: "cs-CZ" }}">
  {% include head.html %}
  <body>
    <header class="page-header" role="banner">
        <h1 class="project-name">
        {{ page.title | default: site.title | default: site.github.repository_name }}</h1>
        <h2 class="project-tagline">{{ page.description | default: site.description | default: site.github.project_tagline }}</h2>
        {% if site.github.is_project_page %}
            <a href="{{ site.github.repository_url }}" class="btn btn-info">View on GitHub</a>
        {% endif %}
        <!-- {% for page in site.pages %}

            <a href=/LittleRatura/{{ page.filename }} class="btn">{{ page.title }}</a>
        {% endfor %} -->

        {% for item in site.data.samplelist.docs %}
            <a href="{{ item.url }}" class="btn btn-info">{{ item.title }}</a></li>
        {% endfor %}
        {%- comment -%} {% if site.show_downloads %}
            <a href="{{ site.github.zip_url }}" class="btn">Download .zip</a>
            <a href="{{ site.github.tar_url }}" class="btn">Download .tar.gz</a>
        {% endif %} {%- endcomment -%}
    </header>

    <main id="content" class="main-content" role="main">
      {{ content }}

    {% include footer.html %}
    </main>

  </body>
</html>
