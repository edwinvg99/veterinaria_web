import subprocess

libreria = "pymongo"

try:
    import pymongo
except ImportError:
    subprocess.check_call(["pip", "install", libreria])
    import pymongo
from pymongo import MongoClient

MONGO_URI='mongodb://localhost'

client = MongoClient(MONGO_URI)
db=client['apiMongo']
collection = db['companies']