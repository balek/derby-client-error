derby = require 'derby'


module.exports = (app) ->
    if not derby.util.isServer
        app.on 'error', (e) ->
        #    app.model.channel.send 'error', _.pick e, 'name', 'message', 'stack'
            console.error 'APP ERROR!!!'
            throw e

        app.on 'model', (model) ->
            global.model = model
            model.on 'error', (e) ->
                e.url = window.location.pathname + window.location.search
                model.channel.send 'error', _.pick e, 'url', 'name', 'message', 'stack'
                setTimeout ->
                        console.error 'MODEL ERROR!!!'
                        throw e
                    , 0