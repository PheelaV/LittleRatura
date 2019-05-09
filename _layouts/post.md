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
                <a class="btn"
                    href="/{{ page.previous.url }}">
                    <<< {{ page.previous.title }}</a>
                        {% else %}
                        <span>-</span>
                        {% endif %}
                        <a href="docs/processed/word.docx"
                            download>💾 stáhnout(.docx)</a>
                        <a href="#"
                            onclick="window.print();return false;"
                            rel="nofollow noopener">🖨️ vytisknout </a>
                        {% if page.next %}
                        <a class="btn"
                            href="/{{ page.next.url }}">>>> {{ page.next.title }}</a>
                        {% else %}
                        <span>-</span>
                        {% endif %}
            </div>
            {{ content }}

            {% include footer.html %}
        </main>

    </body>

</html>