import starter_pack.routing as routing
from starter_pack.routes.ping import Ping


def create_blueprint_with_routes():
    blueprint = routing.create_blueprint('starter_pack')
    routing.add_pluggable_route(blueprint, Ping)
    return blueprint
