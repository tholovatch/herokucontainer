from flask import Flask, jsonify, request


app = Flask(__name__)


@app.route('/')
def hello():
    return jsonify('hello')


@app.route("/multiplicate")
def multiplicate():
    x = int(request.args.get('x', 1))
    y = int(request.args.get('y', 2))
    return jsonify(x*y)


if __name__ == '__main__':
    app.run(host='0.0.0.0')
