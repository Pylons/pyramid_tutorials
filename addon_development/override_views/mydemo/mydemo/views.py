from pyramid.view import view_config

@view_config(route_name='next',
             renderer="myaddon:templates/site.jinja2")
def next_view(request):
    return dict(pagetitle='Overridden Next Page',
                otherroute='home')
