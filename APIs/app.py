from flask import Flask
import os


app = Flask(__name__)


@app.route('/run-script', methods=['POST'])
def run_script():
    os.system("bash process_images.sh")
    return "SEARCH4AKASH! Script executed!", 200

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080)
