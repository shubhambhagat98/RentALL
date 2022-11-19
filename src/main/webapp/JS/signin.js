function onSignIn(CredentialResponse) {

    var redirectUrl = 'GoogleLogin';
    //using jquery to post data dynamically
    var form = $('<form action="' + redirectUrl + '" method="post">' +
        '<input type="hidden" name="id_token" value="' + CredentialResponse.credential + '" />' +
        '</form>');
    $('body').append(form);
    form.submit();
}