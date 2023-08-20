from flask import Flask
from ..bin.pylibs.helpers import command

app = Flask(__name__)

@app.route("/")
def hello_world():
    return command('pwd')
    return "<p>Hello, World!</p>"
