================================
Starting a Nix Build Environment
================================

Conducting training classes is a good illustration of the pain involved
in setting up environments. This isn't just true for beginners:
experienced developers have decades-old calluses acquired from getting
lots of different software working together.

Nix helps the problem of getting different kinds of software working
together, repeatably, over the lifetime of your software's versions.
Additionally, it helps you do development and deployments *in
isolation*. Instead of having one approach for Python isolation
(virtualenv) or another for NodeJS (nvm), Nix brings some clever ideas
to unify your project.

In this tutorial step we will do the following:

- Create a repeatable Nix build environment

- Frontend support for NodeJS and npm

- Backend support both Python 2.7.8 and 3.4.1

.. note::

    Compares to: virtualenv, pyvenv, buildout, nvm

Nix Build Environment
=====================


Rok Questions
=============

- readline support on OS X

- Switching between Python 2 and 3 e.g. for tox tests

Notes
=====

- Due to Nix, this tutorial is non-Windows

- Keep the

References
==========

- https://nixos.org/wiki/Howto_develop_software_on_nixos

- https://www.domenkozar.com/2014/01/02/getting-started-with-nix-package-manager/