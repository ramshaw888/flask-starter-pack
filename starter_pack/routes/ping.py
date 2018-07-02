import json
import flask
import flask.views
from starter_pack.routing import pluggable_route


@pluggable_route('/ping', 'ping')
class Ping(flask.views.MethodView):
    def get(self):
        resp_json = {
            'status': 'success',
        }
        return flask.make_response(json.dumps(resp_json), 200)
