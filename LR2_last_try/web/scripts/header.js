function setLanguage(lang) {
    document.cookie = "language =" + lang;
    location.reload()
}

function init(login, cartCost) {
    if (login === "") {
        $('#loggedOut').css("display", "block");
        $('#singout').css("display", "none");
        $('#checkout').css("display", "none");
    } else {
        $('#loggedIn').css("display", "block");
        if (cartCost === 0) {
            $('#checkout').css("display", "none");
        }
    }
}

function logout() {
    $.ajax({
        url: 'Logout',
        type: 'DELETE',
        success: function () {
            location.reload()
        }
    });
}