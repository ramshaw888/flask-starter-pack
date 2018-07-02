import flask
import starter_pack.routes


def create_app():
    app = flask.Flask(__name__)
    blueprint = starter_pack.routes.create_blueprint_with_routes()
    app.register_blueprint(blueprint)
    return app
