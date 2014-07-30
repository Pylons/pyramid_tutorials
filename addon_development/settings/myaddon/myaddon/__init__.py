def home_view(request):
    # Get the settings off the request
    settings = request.registry.settings
    contact_email = settings.get("contact_email", "No email")
    play_loud = settings.get("play_loud", False)
    if play_loud:
        loud = "YES!"
    else:
        loud = "no....whimper"
    return dict(contact_email=contact_email, loud=loud)


def includeme(config):
    config.include('pyramid_jinja2')
    config.add_route('home', '/')
    config.add_view(home_view, route_name='home',
                    renderer='templates/home.jinja2')
