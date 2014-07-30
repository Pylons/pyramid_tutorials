==============
Override Views
==============

*Base add-on with views that can be customized by overriding.*

- Imagine you have a ready-to-go "Great Site" Python application such as
  Django/Plone

- Your users make sites based on Great Site

- Their sites should turn on with everything working...it is, of course,
  an application

- But you'd like to let them replace any view, for example, the login
  view

Implementation
==============

- myaddon ships with a 'hello' route and a 'next' route

- myapp has a ``@view_config`` that overrides the 'next' route from
  myaddon

- That view in myaddon, though, chooses to use the default jinja2
  template from myaddon via an asset specification