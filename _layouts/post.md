<!DOCTYPE html>
<html lang="{{ site.lang | default: "cs-CZ" }}">
    {% include head.html %}

    <body>
        <header class="page-header"
            role="banner">
            <h1 class="project-name">
                {{ page.title | default: site.title | default: site.github.repository_name }}</h1>
            <h2 class="project-tagline">
                {{ page.description | default: site.description | default: site.github.project_tagline }}</h2>

            <a href="/LittleRatura/index.html"
                class="btn logo-btn">LittleRatura</a></li>
            {% for item in site.data.siteList.docs %}
            <a href="{{ item.url }}"
                class="btn btn-info">{{ item.title }}</a></li>
            {% endfor %}
        </header>

        <main id="content"
            class="main-content"
            role="main">
            <div class="post-nav">
                {% if page.previous %}
                <a href="/LittleRatura/{{ page.previous.url }}">Před: {{ page.previous.title }}</a>
                {% endif %}
                {% if page.next %}
                <a href="/LittleRatura/{{ page.next.url }}">Dále: {{ page.netx.title }}</a>
                {% endif %}
            </div>
            {{ content }}

            {% include footer.html %}
        </main>

    </body>

</html>