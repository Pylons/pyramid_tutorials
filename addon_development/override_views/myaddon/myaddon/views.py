from pyramid.view import view_config


class AddonViews:
    def __init__(self, request):
        self.request = request

    @view_config(route_name='home',
                 renderer='templates/myaddon.jinja2')
    def home_view(self):
        return dict(addon_title='myaddon')
