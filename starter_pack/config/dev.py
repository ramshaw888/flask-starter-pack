from starter_pack.config.common import Config as CommonConfig


class Config(CommonConfig):
    ENVIRONMENT = 'dev'
    DEBUG = True
    TESTING = True
