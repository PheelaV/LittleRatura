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
                <a href="/{{ page.previous.url }}"> _<<< {{ page.previous.title }}_</a>
                        {% else %}
                        <span>-</span>
                        {% endif %}
                        <a href="../docs/processed/word.docx"
                            download>💾 stáhnout(.docx)</a>
                        <a href="#"
                            onclick="window.print();return false;"
                            rel="nofollow noopener">🖨️ vytisknout </a>
                        {% if page.next %}
                        <a href="/{{ page.next.url }}"> _>>> {{ page.next.title }}_ </a>
                        {% else %}
                        <span>-</span>
                        {% endif %}
            </div>
            {{ content }}

            {% include footer.html %}
        </main>

    </body>

</html>