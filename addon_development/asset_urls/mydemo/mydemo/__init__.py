from pyramid.config import Configurator


def main(global_config, **settings):
    config = Configurator(settings=settings)
    config.add_static_view(name='mydemo_static', path='myaddon:static')
    config.include('myaddon')
    config.scan('.views')

    return config.make_wsgi_app()