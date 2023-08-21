"use strict";

// Class definition
var KTAppEcommerceProducts = function () {
    // Shared variables
    var table;
    var datatable;

    // Private functions
    var initDatatable = function () {
        // Init datatable --- more info on datatables: https://datatables.net/manual/
        datatable = $(table).DataTable({
            "info": false,
            'order': [],
            'pageLength': 10,
            'columnDefs': [
                {render: DataTable.render.number(',', '.', 2), targets: 4},
                {orderable: false, targets: 6}, // Disable ordering on column 6 (actions)
            ]
        });

        // Re-init functions on datatable re-draws
        datatable.on('draw', function () {
            handleDeleteRows();
        });
    }
    // Init noUIslider
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
    // Search Datatable --- official docs reference: https://datatables.net/reference/api/search()
    var handleSearchDatatable = () => {
        const filterSearch = document.querySelector('[data-kt-ecommerce-product-filter="search"]');
        filterSearch.addEventListener('keyup', function (e) {
            datatable.search(e.target.value).draw();
        });
    }

    // Handle status filter dropdown
    var handleStatusFilter = () => {
        const filterStatus = document.querySelector('[data-kt-ecommerce-product-filter="status"]');
        $(filterStatus).on('change', e => {
            let value = e.target.value;
            if (value === 'all') {
                value = '';
            }
            datatable.column(5).search(value).draw();
        });
    }

    // Delete cateogry
    var handleDeleteRows = () => {
        // Select all delete buttons
        const deleteButtons = table.querySelectorAll('[data-kt-ecommerce-product-filter="delete_row"]');

        deleteButtons.forEach(d => {
            // Delete button on click
            d.addEventListener('click', function (e) {
                e.preventDefault();

                // Select parent row
                const parent = e.target.closest('tr');

                // Get category name
                const productName = parent.querySelector('[data-kt-ecommerce-product-filter="product_name"]').innerText;
                const productId = document.getElementById("productId").innerText;
                // SweetAlert2 pop up --- official docs reference: https://sweetalert2.github.io/
                Swal.fire({
                    text: "Are you sure you want to delete " + productName + "?",
                    icon: "warning",
                    showCancelButton: true,
                    buttonsStyling: false,
                    confirmButtonText: "Yes, delete!",
                    cancelButtonText: "No, cancel",
                    customClass: {
                        confirmButton: "btn fw-bold btn-danger",
                        cancelButton: "btn fw-bold btn-active-light-primary"
                    }
                }).then(function (result) {
                    if (result.value) {
                        Swal.fire({
                            text: "You have deleted " + productName + "!.",
                            icon: "success",
                            buttonsStyling: false,
                            confirmButtonText: "Ok, got it!",
                            customClass: {
                                confirmButton: "btn fw-bold btn-primary",
                            }
                        }).then(function () {
                            // Remove current row
                            location = "/LmhShop/admin/deleteProduct?id=" + productId;
                        });
                    } else if (result.dismiss === 'cancel') {
                        Swal.fire({
                            text: productName + " was not deleted.",
                            icon: "error",
                            buttonsStyling: false,
                            confirmButtonText: "Ok, got it!",
                            customClass: {
                                confirmButton: "btn fw-bold btn-primary",
                            }
                        });
                    }
                });
            })
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
                                },
                                between: {
                                    min: 0,
                                    max: 999999999,
                                    message: "Price must be greater than 0"
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
                                },
                                between: {
                                    min: 0,
                                    max: 999999999,
                                    message: "quantity must be greater than 0"
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
    
    const handleSubmitForm2 = () => {
        // Define variables
        let validator;

        // Get elements
        var form = document.getElementById('setDiscountForm');
        var submitButton = document.getElementById('formSetDiscountButtonSubmit');

        // Init form validation rules. For more info check the FormValidation plugin's official documentation:https://formvalidation.io/
        validator = FormValidation.formValidation(
                form,
                {
                    fields: {
                        'top': {
                            validators: {
                                notEmpty: {
                                    message: 'Top Rate is required'
                                },
                                between: {
                                    min: 1,
                                    max: 99,
                                    message: "Top Rate must be between 1 and 100"
                                }
                            }
                        },
                        'discount': {
                            validators: {
                                notEmpty: {
                                    message: 'Discount is required'
                                },
                                between: {
                                    min: 1,
                                    max: 100,
                                    message: "Discount must be between 1 and 100"
                                }
                            }
                        }
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

            table = document.querySelector('#kt_ecommerce_products_table');

            if (!table) {
                return;
            }
            initDatatable();
            initSlider();
            handleSearchDatatable();
            handleStatusFilter();
            handleDeleteRows();
            handleSubmit();
            handleSubmitForm2();
        }
    };
}();

// On document ready
KTUtil.onDOMContentLoaded(function () {
    KTAppEcommerceProducts.init();
});
