from pyramid.config import Configurator


def main(global_config, **settings):
    config = Configurator(settings=settings)
    config.add_static_view(name='mydemo_static', path='myaddon:static')
    config.include('myaddon')

    # # Change the logo used by the core software
    config.override_asset(to_override='myaddon:static/logo.png',
                          override_with='mydemo:static/pyramid.png')

    # # Use a different custom.css than that provided in the core
    config.override_asset(to_override='myaddon:static/custom.css',
                          override_with='mydemo:static/mysite.css')

    # Replace the template used by the core software for one view
    config.override_asset(to_override='myaddon:templates/next.jinja2',
                          override_with='mydemo:templates/mynext.jinja2')

    config.scan('.views')

    return config.make_wsgi_app()