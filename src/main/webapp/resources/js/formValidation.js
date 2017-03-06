//window.onload = function() {
//    var popups = document.getElementsByClassName("popup");
//    var show = function() {
//        this.parentElement.getElementsByClassName("popup-text")[0].classList.add("show");
//    };
//    var hide = function() {
//        this.parentElement.getElementsByClassName("popup-text")[0].classList.remove("show");
//    };
//    for (var i = 0; i < popups.length; i++) {
//        var input = popups[i].getElementsByTagName("input")[0];
//        input.onfocus = show;
//        input.onblur = hide;
//        input.onmouseover = show;
//        input.onmouseout = hide;
//    }
//};
//
//
//function formValidation() {
//    var options = {
//        firstName: [
//            {
//                isValid: function(domElement) {
//                    var regex = /\b([A-Za-z]+)\b/;
//                    return regex.test(domElement.value);
//                },
//                message: "First name must contain only latin letters!"
//            }
//        ],
//        middleName: [
//            {
//                isValid: function(domElement) {
//                    if (domElement.value) {
//                        var regex = /\b([A-Za-z]+)\b/;
//                        return regex.test(domElement.value);
//                    }
//                    return true;
//                },
//                message: "Middle name must contain only latin letters!"
//            }
//        ],
//        lastName: [
//            {
//                isValid: function(domElement) {
//                    var regex = /\b([A-Za-z]+)\b/;
//                    return regex.test(domElement.value);
//                },
//                message: "Last name must contain only latin letters!"
//            }
//        ],
//        birthDate: [
//            {
//                isValid: function(domElement) {
//                    var regex = /\b\d{4}-\d{2}-\d{2}\b/;
//                    return regex.test(domElement.value);
//                },
//                message: "Wrond birthDate format!"
//            },
//            {
//                isValid: function(domElement) {
//                    return (Date.now().valueOf() - Date.parse(domElement.value)) > 0;
//                },
//                message: "Date must be in the past!"
//            }
//        ],
//        email: [
//            {
//                isValid: function(domElement) {
//                    var regex = /[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?/;
//                    return regex.test(domElement.value);
//                },
//                message: "Invalid email!"
//            }
//        ],
//        password: [
//            {
//                isValid: function(domElement) {
//                    return domElement.value.length > 4;
//                },
//                message: "Password must be longer than 4 symbols!"
//            }
//        ],
//        confirmPassword: [
//            {
//                isValid: function(domElement) {
//                    var password = document.getElementsByName("password")[0].value;
//                    return password === domElement.value;
//                },
//                message: "Passwords does not match!"
//            }
//        ],
//        phone: [
//            {
//                isValid: function(domElement) {
//                    if (domElement.value) {
//                        var regex = /^\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})$/;
//                        return regex.test(domElement.value);
//                    }
//                    return true;
//                },
//                message: "Invalid phone! Allowed formats are " +
//                "XXX-XXX-XXXX, XXX.XXX.XXXX, XXX XXX XXXX."
//            }
//        ]
//    };
//    var form = document.getElementById("updateUser");
//    return validate(form, options);
//}
//
//function validate(form, options) {
//    var isValid = true;
//    for (var option in options) {
//        // Make sure that the element in the right form
//        var domElements = document.getElementsByName(option);
//        for (var i = 0; i < domElements.length; i++) {
//            if (form.contains(domElements[i])) {
//                var domElement = domElements[i];
//                break;
//            }
//        }
//        if (!domElement) {
//            throw new Error("Element with name " + option + " was not found in the form.");
//        }
//
//        for (var i = 0; i < options[option].length; i++) {
//            // If error message already exists then rewrite its content otherwise create new
//            var node;
//            if (domElement.parentNode.lastChild.classList &&
//                domElement.parentNode.lastChild.classList.contains("validation-error")) {
//                node = domElement.parentNode.lastChild;
//                node.innerHTML = "";
//            } else {
//                node = document.createElement("div");
//                node.classList.add("validation-error");
//            }
//
//            if (!options[option][i].isValid(domElement)) {
//                // Append error message
//                var pnode = document.createElement("p");
//                pnode.innerHTML = options[option][i].message;
//                node.appendChild(pnode);
//                domElement.parentNode.appendChild(node);
//                isValid = false;
//
//                // Error message disappears on focus out
//                domElement.onblur = function () {
//                    this.parentNode.removeChild(this.parentNode.lastChild);
//                    this.onblur = null;
//                };
//            }
//        }
//    }
//    return isValid;
//}