from flask import Flask
import socket
import os

app = Flask(__name__)

# Function to get the host's IP address
def get_host_ip():
    try:
        host_ip = socket.gethostbyname(socket.gethostname())
        return host_ip
    except Exception as e:
        return str(e)

# Get the port from the environment variable, or use a default value (e.g., 5000)
port = int(os.environ.get('PORT', 5000))

@app.route('/')
def hello_world():
    host_ip = get_host_ip()
    return f'Hello, World!<br>Host IP Address: {host_ip}<br>Port: {port}'

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=port)
