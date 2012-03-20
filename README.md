# HTML5 PushState Demo

This is an experiment to implement a demo web application that's:

* Crazy fast: by not loading the full page with each navigation
* Degradable: works even without Javascript enabled, but perhaps not
  with the crazy speed
* Bookmark-able and SEO-friendly: the URL+Title can be bookmarked and
  accessed directly through the browser or by search engines
* Browser history friendly: the back and forward browser buttons do
  the expected thing

The HTML5 PushState mainly provides the last point, but is essential
for this approach to work. To provide the other bits, it turns out
that there are 2 main strategies (that I know of anyway):

1. PJAX: Like AJAX but instead of pulling data from the server, this
   pulls partial pages, and uses PushState to update the title and
   history
2. A Javascript MVC (or equivalent) Client-side Framework that works
   with HTML5 PushState. In this case, I'd selected Backbone.js.

The different versions are in branches of the repository:

* `master` is the plain jane web application
* `pjax` branch contains the version using jquery-pjax.js
* `backbone` branch contains the version using Backbone.js

