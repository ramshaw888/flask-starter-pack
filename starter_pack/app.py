import os
import flask
import starter_pack.routes


ENV_ENV_VAR = 'ENV'


def create_app():
    app = flask.Flask(__name__)
    app.config.from_object(get_config())
    blueprint = starter_pack.routes.create_blueprint_with_routes()
    app.register_blueprint(blueprint)

    print('Environment: {}'.format(app.config['ENVIRONMENT']))
    return app


def get_config():
    env = os.environ.get(ENV_ENV_VAR) or 'prod'
    if env == 'prod':
        import starter_pack.config.prod as config_module
    elif env == 'dev':
        import starter_pack.config.dev as config_module
    else:
        raise Exception('failed to init environment config "{}"'.format(env))
    return config_module.Config
