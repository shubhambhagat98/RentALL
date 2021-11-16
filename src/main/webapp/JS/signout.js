function signOut() {
    window.gapi.load('auth2', () => {
        window.gapi.auth2
            .init({
                client_id: '359199286110-30sbl7a4t5qc2do4javmsm8se8g33jms.apps.googleusercontent.com'
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