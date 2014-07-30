===============
Override Assets
===============

*Let users customize individual logos, CSS, JSS, or even Jinja2
templates, without modifying your core code*.

Implementation
==============

- Start with a "Great Site" addon with a logo and a CSS file

- Throw in the use of Bootstrap

- Refactor the Jinja2 templates to have a master template

- Have myaddon customize its Great Site, *without touching* the code of
  myaddon:

  - Provide a new logo...note that a different filename on disk still
    winds up at the URL logo.png

  - Override the site CSS file

  - Override the template for just one part of the site, the heading