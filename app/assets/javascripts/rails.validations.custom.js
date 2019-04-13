window.ClientSideValidations.validators.local['cas_number_format'] = function(element, options) {
    // Your validator code goes in here
    if (!/[0-9]{2,7}-[0-9]{2}-[0-9]/.test(element.val())) {
        // When the value fails to pass validation you need to return the error message.
        // It can be derived from validator.message
        return options.message;
    }
}

//unless record.cas_number&.match(/[0-9]{2,7}-[0-9]{2}-[0-9]/)