Playlist = require './playlist'

class User
	constructor: (@client, data) ->
		@profile = data

	getPlaylists: (cb) ->
		if @playlists
			cb null, @playlists
		else
			@client.request 'userGetPlaylists', userID: @profile.userID, (err, res) =>
				return cb err if err
				@playlists = []

				for data in res.Playlists
					@playlists.push new Playlist @client, data

				cb null, @playlists

	createPlaylist: (name, description='', songs=[], cb) ->
		@client.request 'createPlaylist',
			playlistName: name
			playlistAbout: description
			songIDs: songs
		, (err, playlistId) ->
			cb err, playlistId

	deletePlaylist: (playlistID, cb) ->
		@client.request 'deletePlaylist',
			playlistID: playlistID
			name: '' # This parameter doesn't seem to matter but has to be in the request
		, (err, res) ->
			cb err, res

module.exports = User
