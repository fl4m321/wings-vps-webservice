const express = require('express');
const http = require('http');
const WebSocket = require('ws');

const app = express();
const server = http.createServer(app);

// Setup WebSocket for console interaction
const wss = new WebSocket.Server({ server });

// Serve the web page for the console
app.get('/', (req, res) => {
  res.sendFile(__dirname + '/index.html');
});

// Handle WebSocket connections
wss.on('connection', (ws) => {
  console.log('New WebSocket connection');
  
  // Example: send a message to the console
  ws.send("Wings VPS Console Initialized");

  // Example: handle messages from the console
  ws.on('message', (message) => {
    console.log('Received message:', message);
    // Forward commands to the Wings API here if needed
    // wingsApi.sendCommand(message);
  });

  ws.on('close', () => {
    console.log('Connection closed');
  });
});

// Start the web service
server.listen(3000, () => {
  console.log('Web service running on port 3000');
});
