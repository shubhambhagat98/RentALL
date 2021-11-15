function signOut() {
    window.gapi.load('auth2', () => {
        window.gapi.auth2
            .init({
                client_id: '986571061196-flj7n9ugit4okm866o9utn6eakp3ng32.apps.googleusercontent.com'
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