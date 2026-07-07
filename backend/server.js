// The Forest-Pixel Backend Server
// Main server file for multiplayer functionality

const express = require('express');
const socketIO = require('socket.io');
const cors = require('cors');
require('dotenv').config();

// Initialize Express app
const app = express();
const PORT = process.env.PORT || 3000;

// Middleware
app.use(cors());
app.use(express.json());

// Socket.IO setup
const io = socketIO(app, {
	cors: {
		origin: "*",
		methods: ["GET", "POST"]
	}
});

// Basic routes
app.get('/api/status', (req, res) => {
	res.json({
		status: 'online',
		version: '0.1.0',
		timestamp: new Date().toISOString()
	});
});

app.get('/api/servers', (req, res) => {
	// Return list of available servers
	res.json({
		servers: [
			{
				id: 1,
				name: 'Forest Server 1',
				players: 5,
				max_players: 10,
				difficulty: 'normal',
				region: 'US-East',
				seed: 12345,
				ping: 25
			},
			{
				id: 2,
				name: 'Forest Server 2',
				players: 3,
				max_players: 10,
				difficulty: 'hard',
				region: 'EU-West',
				seed: 54321,
				ping: 45
			}
		]
	});
});

// Socket.IO events
io.on('connection', (socket) => {
	console.log(`New player connected: ${socket.id}`);
	
	// Player login
	socket.on('player_login', (data) => {
		console.log(`Player logged in: ${data.username}`);
		socket.emit('login_success', {
			player_id: socket.id,
			username: data.username,
			timestamp: new Date().toISOString()
		});
	});
	
	// Player movement
	socket.on('player_move', (data) => {
		// Broadcast player position to other clients
		socket.broadcast.emit('player_moved', {
			player_id: socket.id,
			position: data.position,
			timestamp: new Date().toISOString()
		});
	});
	
	// Chat message
	socket.on('chat_message', (data) => {
		console.log(`Chat from ${socket.id}: ${data.message}`);
		io.emit('chat_message', {
			player_id: socket.id,
			username: data.username,
			message: data.message,
			timestamp: new Date().toISOString()
		});
	});
	
	// Player disconnection
	socket.on('disconnect', () => {
		console.log(`Player disconnected: ${socket.id}`);
		io.emit('player_disconnected', {
			player_id: socket.id,
			timestamp: new Date().toISOString()
		});
	});
});

// Start server
const server = app.listen(PORT, () => {
	console.log(`🌲 The Forest-Pixel Server running on port ${PORT}`);
	console.log(`📡 Socket.IO listening for connections`);
});

module.exports = { app, io };