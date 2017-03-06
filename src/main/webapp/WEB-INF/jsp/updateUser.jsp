<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<t:admin title="User Update">

    <jsp:attribute name="error">${error}</jsp:attribute>
    <jsp:attribute name="table">
        <c:url value="/resources/js/helper.js" var="helperJsUrl"/>
        <script src="${helperJsUrl}"></script>
        <div class="col-xs-12 col-sm-12 col-md-12">

            <form class="form-signin" id="updateUser" action="update" method="post" onsubmit="return validateForm()">

                <div class="row">
                    <div class="col-xs-4 col-sm-4 col-md-4">
                        <div class="form-group row">
                            <label class="col-2 col-form-label">User ID</label>
                            <input title="Your ID." class="form-control input-md" type="text" name="userID"
                                   value="${user.userID}"
                                   id="userID" readonly>
                        </div>
                    </div>
                    <div class="col-xs-4 col-sm-4 col-md-4">
                        <div class="form-group row">
                            <fieldset class="form-group">
                                <label>User Role</label>
                                <select title="Choose role." class="form-control" name="userRole" id="userRole">
                                    <option ${user.userRole.equals("Guest")?"selected":""}>Guest</option>
                                    <option ${user.userRole.equals("Reader")?"selected":""}>Reader</option>
                                    <option ${user.userRole.equals("Librarian")?"selected":""}>Librarian</option>
                                    <option ${user.userRole.equals("Admin")?"selected":""}>Admin</option>
                                </select>
                            </fieldset>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-xs-4 col-sm-4 col-md-4">
                        <div class="form-group row">
                            <label class="col-2 col-form-label">First Name</label>
                            <input title="Input your first name." class="form-control input-md" type="text"
                                   name="firstName" value="${user.firstName}" id="firstName">
                            <span style="color:red" id="firstNameError"></span>
                        </div>
                    </div>
                    <div class="col-xs-4 col-sm-4 col-md-4">
                        <div class="form-group row">
                            <label class="col-2 col-form-label">Last Name</label>
                            <input title="Input your last name." class="form-control input-md" type="text"
                                   name="lastName" value="${user.lastName}"
                                   id="lastName">
                            <span style="color:red" id="lastNameError"></span>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-xs-4 col-sm-4 col-md-4">
                        <div class="form-group row">
                            <label class="col-2 col-form-label">Email</label>
                            <input title="Input your email." class="form-control input-md" type="email" name="email"
                                   value="${user.email}"
                                   id="email">
                            <span style="color:red" id="emailError"></span>
                        </div>
                    </div>
                    <div class="col-xs-4 col-sm-4 col-md-4">
                        <div class="form-group row">
                            <label class="col-2 col-form-label">Phone</label>
                            <input title="Input phone number with country code and plus '+'"
                                   class="form-control input-md" type="text" name="phoneNumber"
                                   value="${user.phoneNumber}" id="phoneNumber">
                            <span style="color:red" id="phoneNumberError"></span>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-xs-4 col-sm-4 col-md-4">
                        <div class="form-group row">
                            <label class="col-2 col-form-label">Password</label>
                            <input title="Enter password from 6 to 30 symbols." class="form-control input-md"
                                   type="password" name="password"
                                   value="${user.password}"
                                   id="password">
                            <span style="color:red" id="passwordError"></span>
                        </div>
                    </div>
                    <div class="col-xs-4 col-sm-4 col-md-4">
                        <div class="form-group row">
                            <label class="col-2 col-form-label">Confirm Password</label>
                            <input title="Enter the password for confirmation." class="form-control input-md"
                                   type="password" name="confirmPassword"
                                   value="${user.password}" id="confirmPassword">
                            <span style="color:red" id="confirmPasswordError"></span>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-xs-4 col-sm-4 col-md-4">
                        <div class="form-group row">
                            <label class="col-2 col-form-label">City</label>
                            <input title="Enter city name." class="form-control input-md" type="text" name="cityName"
                                   value="${user.cityName}"
                                   id="cityName">
                            <span style="color:red" id="cityNameError"></span>
                        </div>
                    </div>
                    <div class="col-xs-4 col-sm-4 col-md-4">
                        <div class="form-group row">
                            <label class="col-2 col-form-label">Street</label>
                            <input title="Enter street name." class="form-control input-md" type="text"
                                   name="streetName"
                                   value="${user.streetName}" id="streetName">
                            <span style="color:red" id="streetNameError"></span>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-xs-4 col-sm-4 col-md-4">
                        <div class="form-group row">
                            <label class="col-2 col-form-label">House Number</label>
                            <input title="Enter house number." class="form-control input-md" type="text"
                                   name="houseNumber"
                                   value="${user.houseNumber}" id="houseNumber">
                            <span style="color:red" id="houseNumberError"></span>
                        </div>
                    </div>
                    <div class="col-xs-4 col-sm-4 col-md-4">
                        <div class="form-group row">
                            <label class="col-2 col-form-label">Flat Number</label>
                            <input title="Enter flat number." class="form-control input-md" type="text"
                                   name="flatNumber"
                                   value="${user.flatNumber}" id="flatNumber">
                            <span style="color:red" id="flatNumberError"></span>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-xs-4 col-sm-4 col-md-4">
                        <div class="form-group row">
                            <input type="hidden" class="form-control input-md" name="addressID"
                                   value="${user.addressID}" id="addressID">
                        </div>
                    </div>
                    <div class="col-xs-4 col-sm-4 col-md-4">
                        <div class="form-group row">
                            <input class="form-control input-md" type="hidden" name="documentID"
                                   value="${user.documentID}" id="documentID">
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-xs-4 col-sm-4 col-md-4">
                        <div class="form-group row">
                            <fieldset class="form-group">
                                <label>Document Type</label>
                                <select title="Select the type of document." class="form-control" name="documentType"
                                        id="documentType">
                                    <option ${user.documentType.equals("Passport")?"selected":""}>Passport</option>
                                    <option ${user.documentType.equals("Driving licence")?"selected":""}>Driving
                                        licence
                                    </option>
                                </select>
                            </fieldset>
                        </div>
                    </div>
                    <div class="col-xs-4 col-sm-4 col-md-4">
                        <div class="form-group row">
                            <label class="col-2 col-form-label">Series</label>
                            <input title="Enter document series." class="form-control input-md" type="text"
                                   name="series" value="${user.series}"
                                   id="series">
                            <span style="color:red" id="seriesError"></span>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-xs-4 col-sm-4 col-md-4">
                        <div class="form-group row">
                            <label class="col-2 col-form-label">Number</label>
                            <input title="Enter document number." class="form-control input-md" type="text"
                                   name="number" value="${user.number}"
                                   id="number">
                            <span style="color:red" id="numberError"></span>
                        </div>
                    </div>
                    <div class="col-xs-4 col-sm-4 col-md-4">
                        <div class="form-group row">
                            <label class="col-2 col-form-label">Issued By</label>
                            <input title="Enter the name of the organization issuing the document."
                                   class="form-control input-md" type="text" name="issuedBy" value="${user.issuedBy}"
                                   id="issuedBy">
                            <span style="color:red" id="issuedByError"></span>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-xs-4 col-sm-4 col-md-4">
                        <div class="form-group row">
                            <label class="col-2 col-form-label">Data Of Issue</label>
                            <input title="Enter the date of issuance of the document." class="form-control input-md"
                                   type="text" name="dateOfIssue"
                                   value="${user.dateOfIssue}" id="dateOfIssue">
                            <span style="color:red" id="dateOfIssueError"></span>
                        </div>
                    </div>
                    <div class="col-xs-4 col-sm-4 col-md-4">
                        <div class="form-group row">
                            <label class="col-2 col-form-label">User Karma</label>
                            <input title="Karma should be equals or greater than 0." class="form-control input-md"
                                   type="text" name="karma"
                                   value="${user.karma}" id="karma">
                            <span style="color:red" id="karmaError"></span>
                        </div>
                    </div>
                </div>
                <div class="block2" id="mess">
                    <div class="form-group row">
                        <button class="btn btn-lg btn-primary btn-block" type="submit"
                                style="WIDTH: 235px; HEIGHT: 51px">Update
                        </button>
                    </div>
                </div>
            </form>
            <script src="/resources/js/formValidation.js"></script>
        </div>
</jsp:attribute>
    <jsp:attribute name="action">admin</jsp:attribute>
    <jsp:attribute name="actionDescription">Back</jsp:attribute>
</t:admin>