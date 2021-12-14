function signOut() {
    window.gapi.load('auth2', () => {
        window.gapi.auth2
            .init({
                // PUT YOUR CLIENT ID FOR OAUTH
                client_id: 'PUT_YOUR_CLIENT_ID.apps.googleusercontent.com'
            })
            .then(() => {
                window.gapi.auth2
                    .getAuthInstance()
                    .signOut()
                    .then(function() {
                        var redirectUrl = 'DBLogout';
                        //using jquery to post data dynamically
                        var form = $('<form action="' + redirectUrl + '" method="get">' +

                            '</form>');
                        $('body').append(form);
                        form.submit();
                    });
            });
    });
}