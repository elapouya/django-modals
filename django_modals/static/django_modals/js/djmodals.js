function djModalsConfirm(message, handler) {
    // set message
    $("#djmodals-confirm .confirm-message").html(message);

    //Trigger the modal
    $("#djmodals-confirm").modal({
        backdrop: 'static',
        keyboard: false
    });

    // If OK button pressed, pass true to a callback function
    $("#djmodals-confirm .btn-yes").off('click');
    $("#djmodals-confirm .btn-yes").on('click',function () {
        handler(true);
        $("#djmodals-confirm").modal("hide");
    });

    //If CANCEL button pressed, pass false to callback function
    $("#djmodals-confirm .btn-no").off('click');
    $("#djmodals-confirm .btn-no").on('click', function () {
        handler(false);
        $("#djmodals-confirm").modal("hide");
    });
}


function djModalsAlert(message) {
    // set message
    $("#djmodals-alert .alert-message").html(message);

    //Trigger the modal
    $("#djmodals-alert").modal({
        backdrop: 'static',
        keyboard: false
    });
}