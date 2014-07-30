from pyramid.config import Configurator
from pyramid.response import Response

def hello_view(request):
    return Response('<p>Visit <a href="/myaddon">myaddon</a></p>')


def main(global_config, **settings):
    config = Configurator(settings=settings)
    config.include('myaddon')

    config.add_route('hello', '/')
    config.add_view(hello_view, route_name='hello')

    return config.make_wsgi_app()