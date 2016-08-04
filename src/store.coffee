module.exports = (store) ->
    store.on 'client', (client) ->
        client.channel.on 'error', (e) ->
            if e.stack?.startsWith "#{e.name}: #{e.message}"
                # Chrome stack already contains Exception name and message
                stack = e.stack
            else
                stack = "#{e.name}: #{e.message}\n#{e.stack}"
            console.error "CLIENT-SIDE ERROR on #{e.url}: #{stack}"