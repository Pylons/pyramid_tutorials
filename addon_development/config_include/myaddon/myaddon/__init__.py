def myaddon_view(request):
    return dict(addon_title='myaddon')


def includeme(config):
    config.include('pyramid_jinja2')
    config.add_route('myaddon', '/myaddon')
    config.add_view(myaddon_view, route_name='myaddon',
                    renderer='templates/myaddon.jinja2')
