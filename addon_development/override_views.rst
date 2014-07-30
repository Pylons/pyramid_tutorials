================================
Override Views and Static Assets
================================

*Base add-on with views that can be customized by overriding.*

- Imagine you have a ready-to-go application such as Django/Plone

- In your site, you want that application to wire up any views or
  CSS/JS/PNG needed so that you don't have to know the inner details

- But you might want to replace individual pieces

Implementation
==============

- myaddon ships with a 'hello' route and a 'next' route

- myapp has a ``@view_config`` that overrides the 'next' route from
  myaddon

- That view in myaddon, though, chooses to use the default jinja2
  template from myaddon via an asset specification