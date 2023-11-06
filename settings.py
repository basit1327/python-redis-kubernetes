import os

# Server settings
SERVER_HOST = "0.0.0.0"
SERVER_PORT = os.environ.get("SERVER_PORT", 80)

# Redis settings
REDIS_HOST = os.environ.get("REDIS_HOST", "localhost")
REDIS_PORT = 6379
REDIS_PWD = ""