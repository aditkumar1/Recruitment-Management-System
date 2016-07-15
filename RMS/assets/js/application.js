$(function () { 
    $('#login_form').on('submit', function (e) {
        e.preventDefault();
        $('#submit-button').attr('disabled', 'true');
        var color = $('#submit-button').css('background-color');
        $('#submit-button').css('background-color', 'grey');
        var data = $("#login_form :input").serialize();
        $.post("login.aspx",data, function (data) {
            $('#submit-button').removeAttr('disabled');
            $('#submit-button').css('background-color', color);
            if (data.error) {
                console.log(data.error);
                $('#status_message').text(data.error);
                $('#status_message').attr('class', 'alert-danger');                
            }
            if (data.success) {
                console.log(data.success);
                $('#status_message').text("Redirecting");
                $('#status_message').attr('class', 'alert-success');
                window.location.href = '../' + data.success;
            }
        });
    });
});
function resizeIframe(obj) {
    obj.style.height = obj.contentWindow.document.body.scrollHeight + 'px';
}