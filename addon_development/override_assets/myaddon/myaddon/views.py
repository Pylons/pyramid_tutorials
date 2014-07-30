from pyramid.view import view_config


@view_config(route_name='home', renderer="myaddon:templates/home.jinja2")
def home_view(request):
    return dict(pagetitle='Home Page', otherroute='next')


@view_config(route_name='next', renderer="myaddon:templates/next.jinja2")
def next_view(request):
    return dict(pagetitle='Next Page', otherroute='home')
