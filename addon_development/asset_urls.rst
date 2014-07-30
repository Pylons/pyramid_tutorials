===================
Changing Asset URLs
===================

*Change static URLs used by external add-ons.*

Imagine you make a form library such as Deform which, to be visually
appealing, has a bunch of CSS/JS/image static assets. You have users
that include this Pyramid add-on form library into their application.

You want your add-on to wire itself up, out-of-the-box, so users don't
have to know internal details such as the URL for the JS. All your
templates then point to the needed JS.

But what if you choose a URL prefix that clashes with their URL space?
What if you change your mind later to a new prefix, thus breaking
everything on their side? What if that one site wants to move all the
static resources out to be served from a CDN?

Pyramid's static views can point at package-based asset specifications,
rather than URL paths, and have the URL path generated. The prefix used
can change, either in the add-on *or* via customization by the user,
and nothing will break.

Implementation
==============

- myaddon has some css that its jinja2 template points at via an asset
  specification

- The addon's includeme wires up a static view tied to that asset spec

- mydemo's configuration changes the URL prefix to something else,
  without touching the template in myaddon
