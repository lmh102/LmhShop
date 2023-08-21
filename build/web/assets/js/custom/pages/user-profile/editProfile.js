"use strict";

// Class definition
var KTSignupGeneral = function () {
    // Elements
    var form;
    var submitButton;
    var validator;
    var passwordMeter;
    //Handle Validate
        // Init form validation rules. For more info check the FormValidation plugin's official documentation:https://formvalidation.io/
    var handleValidation = function (e) {
        validator = FormValidation.formValidation(
                form,
                {
                    fields: {
                        'fullName': {
                            validators: {
                                notEmpty: {
                                    message: 'FullName is required'
                                }
                            }
                        },
                        'phone': {
                            validators: {
                                notEmpty: {
                                    message: 'phone is required'
                                }
                            }
                        },
                        'address': {
                            validators: {
                                notEmpty: {
                                    message: 'address is required'
                                }
                            }
                        },
                        'dob': {
                            validators: {
                                notEmpty: {
                                    message: 'Date of birth is required'
                                }
                            }
                        }
                    },
                    plugins: {
                        trigger: new FormValidation.plugins.Trigger(),
                        bootstrap: new FormValidation.plugins.Bootstrap5({
                            rowSelector: '.fv-row',
                            eleInvalidClass: '', // comment to enable invalid state icons
                            eleValidClass: '' // comment to enable valid state icons
                        })
                    }
                }
        );
    };
    // Handle form
    var handleForm = function () {
        // Handle form submit
        submitButton.addEventListener('click', function (e) {
            e.preventDefault();

            validator.validate().then(function (status) {
                if (status === 'Valid') {
                    // Show loading indication
                    submitButton.setAttribute('data-kt-indicator', 'on');

                    // Disable button to avoid multiple click
                    submitButton.disabled = true;

                    // Simulate ajax request
                    setTimeout(function () {
                        // Hide loading indication
                        submitButton.removeAttribute('data-kt-indicator');

                        // Enable button
                        submitButton.disabled = false;
                       form.submit();
                    }, 2000);
                } else {
                    // Show error popup. For more info check the plugin's official documentation: https://sweetalert2.github.io/
                    Swal.fire({
                        text: "Please fill in the correct format!",
                        icon: "error",
                        buttonsStyling: false,
                        confirmButtonText: "Ok, got it!",
                        customClass: {
                            confirmButton: "btn btn-primary"
                        }
                    });
                }
            });
        });
    };

    // Public functions
    return {
        // Initialization
        init: function () {
            // Elements
            form = document.querySelector('#kt_account_profile_details_form');
            submitButton = document.querySelector('#kt_account_profile_details_submit');
            handleValidation();
            handleForm();
        }
    };
}();

// On document ready
KTUtil.onDOMContentLoaded(function () {
    KTSignupGeneral.init();
});
