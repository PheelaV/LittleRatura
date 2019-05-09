<!DOCTYPE html>
<html lang="{{ site.lang | default: "cs-CZ" }}">
    {% include head.html %}

    <body>
        {% include header.html %}
        <main id="content"
            class="main-content"
            role="main">
            <div class="post-nav">
                {% if page.previous %}
                <a href="/LittleRatura/{{ page.previous.url }}">Před: {{ page.previous.title }}</a>
                {% else %}
                <span>-</span>
                {% endif %}
                {% if page.next %}
                <a href="/LittleRatura/{{ page.next.url }}">Dále: {{ page.next.title }}</a>
                {% else %}
                <span>-</span>
                {% endif %}
            </div>
            {{ content }}

            {% include footer.html %}
        </main>

    </body>

</html>