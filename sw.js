---
layout: null
---
var APP_PREFIX = 'LittleRatura'; // Identifier for this app (this needs to be consistent across every cache update)
var VERSION = '{{ site.github.build_revision }}'; // Version of the off-line cache (change this value everytime you want to update cache)
var CACHE_NAME = APP_PREFIX + VERSION;
var urlsToCache  = [

];

// Cache assets
{% for asset in site.static_files %}
    {% if asset.path contains '/assets/images' or asset.path contains '/assets/posts' or asset.extname == '.js' %}
    urlsToCache.push("{{ file.path }}")
    {% endif %}
{% endfor %}

// Cache posts
{% for post in site.posts %}
    {% unless post.url contains 'example'  %}
        urlsToCache.push("{{ post.url }}")
    {% endunless %}
{% endfor %}

// Cache pages
{% for page in site.html_pages %}
  urlsToCache.push("{{ page.url }}")
{% endfor %}

// Respond with cached resources
self.addEventListener('fetch', function(e) {
  console.log('fetch request : ' + e.request.url);
  e.respondWith(
    caches.match(e.request).then(function(request) {
      if (request) {
        // if cache is available, respond with cache
        console.log('responding with cache : ' + e.request.url);
        return request;
      } else {
        // if there are no cache, try fetching request
        console.log('file is not cached, fetching : ' + e.request.url);
        return fetch(e.request);
      }

      // You can omit if/else for console.log & put one line below like this too.
      // return request || fetch(e.request)
    }).catch(function() {
        // If it can't fetch the asset, display the offline only page
        return caches.match('/offline.html')
      })
  );
});

// Cache resources
self.addEventListener('install', function(e) {
  e.waitUntil(
    caches.open(CACHE_NAME)
    .then(function(cache) {
      console.log('installing cache : ' + CACHE_NAME);
      return cache.addAll(urlsToCache );
    })
  );
});

// Delete outdated caches
self.addEventListener('activate', function(e) {
  e.waitUntil(
    caches.keys().then(function(keyList) {
      // `keyList` contains all cache names under your username.github.io
      // filter out ones that has this app prefix to create white list
      var cacheWhitelist = keyList.filter(function(key) {
        return key.indexOf(APP_PREFIX);
      });
      // add current cache name to white list
      cacheWhitelist.push(CACHE_NAME);

      return Promise.all(
        keyList.map(function(key, i) {
          if (cacheWhitelist.indexOf(key) === -1) {
            console.log('deleting cache : ' + keyList[i]);
            return caches.delete(keyList[i]);
          }
        })
      );
    })
  );
});
