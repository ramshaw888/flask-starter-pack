import os
import flask
import json
import flask_swagger_ui
import apispec
import starter_pack.routes


ENV_ENV_VAR = 'ENV'


def create_app():
    app = flask.Flask(__name__)
    app.config.from_object(get_config())

    api_title = 'starter_pack'
    version = '1.0.0'

    spec = apispec.APISpec(
        title=api_title,
        version=version,
        plugins=[
            'apispec.ext.flask',
        ],
    )

    swagger_url = '/docs'

    def doc_spec():
        return json.dumps(spec.to_dict())

    blueprint = starter_pack.routes.create_blueprint_with_routes()
    blueprint.add_url_rule('/spec.json', view_func=doc_spec)
    app.register_blueprint(
        create_swagger_ui(swagger_url, api_title), url_prefix=swagger_url
    )
    app.register_blueprint(blueprint)

    print('Environment: {}'.format(app.config['ENVIRONMENT']))
    return app


def create_swagger_ui(swagger_url, api_title):
    return flask_swagger_ui.get_swaggerui_blueprint(
        swagger_url,
        '/spec.json',
        config={
            'app_name': api_title,
        }
    )


def get_config():
    env = os.environ.get(ENV_ENV_VAR) or 'prod'
    if env == 'prod':
        import starter_pack.config.prod as config_module
    elif env == 'dev':
        import starter_pack.config.dev as config_module
    else:
        raise Exception('failed to init environment config "{}"'.format(env))
    return config_module.Config
