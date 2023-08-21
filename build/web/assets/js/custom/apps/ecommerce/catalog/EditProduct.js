"use strict";

// Class definition
var KTAppEcommerceEditProducts = function () {
    // Shared variables
    var table;
    var datatable;
    const initSlider = () => {
        var slider = document.querySelector("#kt_ecommerce_add_product_discount_slider");
        var value = document.querySelector("#kt_ecommerce_add_product_discount_label");
        var discount = document.querySelector("#discountInput");
        noUiSlider.create(slider, {
            start: [0],
            connect: true,
            range: {
                "min": 0,
                "max": 100
            }
        });

        slider.noUiSlider.on("update", function (values, handle) {
            value.innerHTML = Math.round(values[handle]);
            discount.value = Math.round(values[handle]);
            if (handle) {
                value.innerHTML = Math.round(values[handle]);
                discount.value = Math.round(values[handle]);
            }
        });
    }
    const handleSubmit = () => {
        // Define variables
        let validator;

        // Get elements
        var form = document.getElementById('kt_modal_new_target_form');
        var submitButton = document.getElementById('kt_modal_new_target_submit');

        // Init form validation rules. For more info check the FormValidation plugin's official documentation:https://formvalidation.io/
        validator = FormValidation.formValidation(
                form,
                {
                    fields: {
                        'productName': {
                            validators: {
                                notEmpty: {
                                    message: 'Product name is required'
                                }
                            }
                        },
                        'categoryId': {
                            validators: {
                                notEmpty: {
                                    message: 'Category is required'
                                }
                            }
                        },
                        'image': {
                            validators: {
                                notEmpty: {
                                    message: 'Image is required'
                                }
                            }
                        },
                        'price': {
                            validators: {
                                notEmpty: {
                                    message: 'Price is required'
                                }
                            }
                        },
                        'description': {
                            validators: {
                                notEmpty: {
                                    message: 'Description is required'
                                }
                            }
                        },
                        'quantity': {
                            validators: {
                                notEmpty: {
                                    message: 'Quantity is required'
                                }
                            }
                        },
                    },
                    plugins: {
                        trigger: new FormValidation.plugins.Trigger(),
                        bootstrap: new FormValidation.plugins.Bootstrap5({
                            rowSelector: '.fv-row',
                            eleInvalidClass: '',
                            eleValidClass: ''
                        })
                    }
                }
        );

        // Handle submit button
        submitButton.addEventListener('click', e => {
            e.preventDefault();

            // Validate form before submit
            if (validator) {
                validator.validate().then(function (status) {
                    console.log('validated!');

                    if (status == 'Valid') {
                        submitButton.setAttribute('data-kt-indicator', 'on');

                        // Disable submit button whilst loading
                        submitButton.disabled = true;

                        setTimeout(function () {
                            submitButton.removeAttribute('data-kt-indicator');

                            Swal.fire({
                                text: "Form has been successfully submitted!",
                                icon: "success",
                                buttonsStyling: false,
                                confirmButtonText: "Ok, got it!",
                                customClass: {
                                    confirmButton: "btn btn-primary"
                                }
                            }).then(function (result) {
                                if (result.isConfirmed) {
                                    // Enable submit button after loading
                                    submitButton.disabled = false;

                                    form.submit();
                                    // Redirect to customers list page
                                }
                            });
                        }, 1000);
                    } else {
                        Swal.fire({
                            html: "Sorry, looks like there are some errors detected, please try again. <br/><br/>Please note that there may be errors in the <strong>General</strong> or <strong>Advanced</strong> tabs",
                            icon: "error",
                            buttonsStyling: false,
                            confirmButtonText: "Ok, got it!",
                            customClass: {
                                confirmButton: "btn btn-primary"
                            }
                        });
                    }
                });
            }
        });
    };
    // Public methods
    return {
        init: function () {
            console.log("Lam Manh HUng");
            initSlider();
            handleSubmit();
        }
    };
}();

// On document ready
KTUtil.onDOMContentLoaded(function () {
            console.log("Lam Manh HUng");
    KTAppEcommerceEditProducts.init();
});
