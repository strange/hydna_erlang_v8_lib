var Channel = {
    send: function(path, data) {
        return external.run('hydna', ['send', path, data]);
    }
};
