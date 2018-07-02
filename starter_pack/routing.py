import flask

def create_blueprint(name):
    blueprint = flask.Blueprint(name, __name__)
    return blueprint


def add_pluggable_route(blueprint, route):
    if not (
        hasattr(route, '_url_path') and
        hasattr(route, '_view_name')
    ):
        raise Exception(
            'can not plug a route without _url_path and _view_name'
        )

    blueprint.add_url_rule(
        route._url_path,
        view_func=route.as_view(route._view_name)
    )


def pluggable_route(url_path, view_name):
    def wrap(cls):
        cls._url_path = url_path
        cls._view_name = view_name
        return cls
    return wrap
