<!DOCTYPE html>
<html lang="{{ site.lang | default: "cs-CZ" }}">
  {% include head.html %}
  <body>
        {% include header.html %}

    <main id="content" class="main-content" role="main">
      {{ content }}

    {% include footer.html %}
    </main>

  </body>
</html>
