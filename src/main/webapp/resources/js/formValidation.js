var userOptions = {
    firstName: [
        {
            isValid: function (domElement) {
                return domElement.value.length > 1 && domElement.value.length < 30;
            },
            message: "Invalid first name! First name should be from 2 to 29 symbols."
        }
    ],

    lastName: [
        {
            isValid: function (domElement) {
                return domElement.value.length > 1 && domElement.value.length < 30;
            },
            message: "Invalid last name! Last name should be from 2 to 29 symbols."
        }
    ],

    email: [
        {
            isValid: function (domElement) {
                var regex = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
                return regex.test(domElement.value);
            },
            message: "Invalid email!"
        }
    ],

    password: [
        {
            isValid: function (domElement) {
                return domElement.value.length > 5 && domElement.value.length < 31;
            },
            message: "Password have to be from 6 to 30 symbols."
        }
    ],

    confirmPassword: [
        {
            isValid: function (domElement) {
                var password = document.getElementsByName("password")[0].value;
                return password === domElement.value;
            },
            message: "Passwords does not match!"
        }
    ],

    phoneNumber: [
        {
            isValid: function (domElement) {
                var regex = /^(?:(?:\(?(?:00|\+)([1-4]\d\d|[1-9]\d?)\)?)?[\-\.\ \\\/]?)?((?:\(?\d{1,}\)?[\-\.\ \\\/]?){0,})(?:[\-\.\ \\\/]?(?:#|ext\.?|extension|x)[\-\.\ \\\/]?(\d+))?$/i;
                return regex.test(domElement.value);
            },
            message: "Invalid phone number!"
        }
    ],

    streetName: [
        {
            isValid: function (domElement) {
                return domElement.value.length > 2 && domElement.value.length < 30;
            },
            message: "Invalid street name! Street name should be from 3 to 29 symbols."
        }
    ],

    houseNumber: [
        {
            isValid: function (domElement) {
                return domElement.value.length > 0 && domElement.value.length < 5;
            },
            message: "Invalid house number! House number should be from 1 to 4 symbols."
        }
    ],

    flatNumber: [
        {
            isValid: function (domElement) {
                return domElement.value.length > 0 && domElement.value.length < 5;
            },
            message: "Invalid flat number! Flat number should be from 1 to 4 symbols."
        }
    ],
    series: [
        {
            isValid: function (domElement) {
                return domElement.value.length > 1 && domElement.value.length < 5;
            },
            message: "Invalid document series! Series should be from 2 to 4 symbols."
        }
    ],

    number: [
        {
            isValid: function (domElement) {
                return domElement.value.length > 3 && domElement.value.length < 9;
            },
            message: "Invalid document number! Number should be from 4 to 8 symbols."
        }
    ],

    issuedBy: [
        {
            isValid: function (domElement) {
                return domElement.value.length > 3 && domElement.value.length < 30;
            },
            message: "Invalid organization issuing the document.! Organization issuing the document should contains from 4 to 29 symbols."
        }
    ],

    dateOfIssue: [
        {
            isValid: function (domElement) {
                var regex = /^\d{4}-\d{2}-\d{2}$/;
                return regex.test(domElement.value);
            },
            message: "Invalid date format! Input in format YYYY-MM-DD"
        }
    ],

    karma: [
        {
            isValid: function (domElement) {
                return domElement.value >= 0 && domElement.value.length <= 200;
            },
            message: "Invalid karma. Karma should be from 0 to 200."
        }
    ]
}

function validateForm() {
    return validate(document.getElementById("updateUser"), userOptions);
}

function validate(form, options) {
    var inputFields = form.getElementsByTagName("input");
    var isValid = true;
    for (i = 0; i < inputFields.length; i++) {
        var input = inputFields[i];
        var validations = userOptions[input.name];
        for (j in validations) {
            if (!validations[j].isValid(input)) {
                isValid = false;
                document.getElementById(input.name + "Error").innerHTML = validations[j].message;
                break;
            } else {
                document.getElementById(input.name + "Error").innerHTML = "";
                isValid = isValid && true;
            }
        }
    }

    return isValid;
}