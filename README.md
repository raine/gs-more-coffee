gs-more-coffee
==============

An API library for the *unofficial* API (more.php) of Grooveshark.

Don't use this if you want to make API calls from a centralized location
(like your web app). However, you might want to use this if you want to make
calls without an API key due to the nature of your app, e.g. a command-line
script.

This module was developed to satisfy needs of
[gs-tool](http://github.com/raneksi/gs-tool) so it may not implement the API
thoroughly. It's pretty easy to extend, though.

Check the [docs](http://coffeedoc.info/github/raneksi/gs-more-coffee/master/) or code for implement methods.

---

### Installation

    npm install gs-more

### Example

List URLs of the playlists for the logged-in user

    client = new gs.Client
    client.login 'username', 'password', (err, user) ->
        if err
            console.log err
        else
            user.getPlaylists (err, playlists) ->
                console.log e.url for e in playlists
