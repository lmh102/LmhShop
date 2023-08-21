const initQuill = () => {
    // Define all elements for quill editor
    // Init quill --- more info: https://quilljs.com/docs/quickstart/
    const quill = new Quill('#kt_ecommerce_add_comment', {
        modules: {
            toolbar: [
                [{
                        header: [1, 2, false]
                    }],
                ['bold', 'italic', 'underline'],
                ['image', 'code-block']
            ]
        },
        placeholder: 'Type your text here...',
        theme: 'snow' // or 'bubble'
    });
    datatable = $("#table_comment").DataTable({
        "info": false,
        'order': [],
        'pageLength': 10
    });
    function submitForm() {
        var content = quill.root.innerHTML;
        document.getElementById("Comment_Content").value = content;
        console.log(document.getElementById("Comment_Content").value);
        document.getElementById("save-comment-form").submit();
    }
    const submitButton = document.getElementById('kt_ecommerce_save_comment_submit');
    submitButton.addEventListener('click', e => {
        submitForm();
    });
};

const initSlider = () => {
    var slider = document.querySelector("#kt_ecommerce_add_product_discount_slider");
    var value = document.querySelector("#kt_ecommerce_add_product_discount_label");
    var discount = document.querySelector("#discountInput");
    noUiSlider.create(slider, {
        start: [discount.value],
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
                                message: "quantity must be greater than or equal to 0"
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
// On document ready
KTUtil.onDOMContentLoaded(function () {
    initQuill();
    handleSubmit();
    initSlider()
});

//// Lấy thẻ <img> và <input>
//const imgElement = document.querySelector('img');
//const fileInput = document.querySelector('input[type="file"]');
//
//// Lấy dữ liệu base64 từ thuộc tính src của thẻ <img>
//const base64Data = imgElement.src.split(',')[1];
//
//// Chuyển đổi base64 thành Blob
//const byteCharacters = atob(base64Data);
//const byteArrays = [];
//for (let i = 0; i < byteCharacters.length; i++) {
//  byteArrays.push(byteCharacters.charCodeAt(i));
//}
//const blob = new Blob([new Uint8Array(byteArrays)], { type: 'image/png' });
//
//// Tạo File từ Blob
//const file = new File([blob], 'image.png', { type: 'image/png' });
//
//// Tạo FileList chứa File
//const fileList = new FileList();
//fileList.append(file);
//
//// Gán FileList cho thuộc tính files của <input type="file">
//fileInput.files = fileList;