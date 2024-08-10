#!/bin/bash
SERVER_ID=$(hostname)

# Generate the index.html file with the server number
echo "<html><body><h1>Response from Server $SERVER_ID</h1></body></html>" > /usr/share/nginx/html/index.html

# Start Nginx
nginx -g "daemon off;"
