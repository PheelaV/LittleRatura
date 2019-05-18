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
                <a class="btn btn-dark"
                    href="{{ page.previous.url }}">
                    <<< <span
                        class="post-nav-text">{{ page.previous.title }}</span>
                </a>
                {% else %}
                <span>-</span>
                {% endif %}
                <a href="{{ page.pageDownload }}"
                    class="btn btn-dark"
                    download>💾 <span class="post-nav-text">stáhnout</span>(.docx)</a>
                <a href="#"
                    class="btn btn-dark"
                    onclick="window.print();return false;"
                    rel="nofollow noopener">🖨️ <span class="post-nav-text">vytisknout</span> </a>
                {% if page.next %}
                <a class="btn btn-dark"
                    href="{{ page.next.url }}">>>> <span class="post-nav-text">{{ page.next.title }}</span></a>
                {% else %}
                <span>-</span>
                {% endif %}
            </div>
            {% if page.wip %}
                <a href="" class="wip">Work In Progress</a>
            {% endif%}
            {{ content }}

            {% include footer.html %}
        </main>

    </body>

</html>