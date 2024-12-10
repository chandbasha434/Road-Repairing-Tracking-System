<%-- 
    Document   : signup
    Created on : 23-Dec-2023, 9:33:23 PM
    Author     : apiiit123
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Registration</title>
    <link rel="stylesheet" href="user_register.css">
    <style>
        /* Your CSS styles go here */
    </style>
    <script>
        // Your JavaScript validation function goes here (validateForm)
        function validateForm() {
            var username = document.getElementById('username').value;
            var email = document.getElementById('email').value;
            var phone = document.getElementById('phone').value
            var password = document.getElementById('password').value;
            var confpassword = document.getElementById('confpassword').value;
            var usernameError = document.getElementById('usernameError');
            var emailError = document.getElementById('emailError')
            var phoneError = document.getElementById('phoneError')
            var passwordError = document.getElementById('passwordError');
            var confpasswordError = document.getElementById('confpasswordError')

            // Clear any previous error messages
            usernameError.textContent = '';
            passwordError.textContent = '';
            confpasswordError.textContent = '';
            phoneError.textContent = ''

            if (username === '') {
                usernameError.textContent = 'Please enter your username.';
                return false;
            }
            if (!/^[a-zA-Z]/.test(username)) {
                usernameError.textContent = 'Username must start with a letter.';
                return false;
            }
            if (!/_.*\d/.test(username)) {
                usernameError.textContent = 'Username must contain underscore and at least one digit.';
                return false;
            }

            if (/\s/.test(username)) {
                usernameError.textContent = 'Username should not contain spaces.';
                return false;
            }
            if (username.length < 3 || username.length > 20) {
                usernameError.textContent = 'Username must be between 3 and 20 characters.';
                return false;
            }

            if (email === '') {
                emailError.textContent = 'Please enter email'
            }
            var emailRegex = /^[a-zA-Z0-9]+@gmail\.com$/;
            if (!emailRegex.test(email)) {
                emailError.textContent = 'Invalid email address format.only alphanumeric';
                return false;
            }
            emailError.textContent = '';

            if (!/^\d+$/.test(phone)) {
                phoneError.textContent = "Phone number can only contain digits";
                return false;
            }
            if (phone.length !== 10) {
                phoneError.textContent = "Phone number must contain exactly 10 digits";
                return false
            }

            if (password === '') {
                passwordError.textContent = 'Please enter your password.';
                return false;
            }
            if (password.length < 8 || password.length > 20) {
                passwordError.textContent = 'Password must be between 8 and 20 characters.';
                return false;
            }
            if (!/(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$#!%*?&])[A-Za-z\d@$!%*?&]/.test(password)) {
                passwordError.textContent = 'Password should include uppercase, lowercase, numbers, and special characters.';
                return false;
            }
            if (/\s/.test(password)) {
                passwordError.textContent = 'Password should not contain spaces.';
                return false;
            }
            if (password.toLowerCase() === username.toLowerCase()) {
                passwordError.textContent = 'Password should not be the same as the username.';
                return false;
            }
            if (confpassword === '') {
                confpassword.textContent = 'Please enter your password.';
                return false;
            }
            if (password !== confpassword) {
                // Display the error message under the "Confirm Password" field
                confirmPasswordError.textContent = 'Passwords do not match. Please confirm your password.';
                return false;
            }
            // Add more validation rules as needed

            return true; // Allow the form to be submitted
        }
    </script>
</head>
<body style="background: linear-gradient(to right, #0000ff, #800080);">

    

    <form name="form" action="SignupServlet" method="post" onsubmit="return validateForm()">
        <div class="container">
            <div class="brand-logo"></div>
            <div class="brand-title">User Registration </div>
            <div class="inputs">
                <label>USERNAME</label>
                <input class="input-field" type="text" id="username" name="username" placeholder="user_123" />
                <p class="error-message" id="usernameError"></p>

                <label>EMAIL</label>
                <input class="input-field" type="email" id="email" name="email" placeholder="example@test.com" />
                <p class="error-message" id="emailError"></p>

                <label>MOBILE</label>
                <input class="input-field" type="tel" id="phone" name="phone" placeholder="9998899988" />
                <p class="error-message" id="PhoneError"></p>

                <label>PASSWORD</label>
                <input class="input-field" type="password" id="password" name="password"
                    placeholder="Min 8 charaters long" />
                <p class="error-message" id="passwordError"></p>

                <label>CONFORM PASSWORD</label>
                <input class="input-field" type="password" id="confpassword" name="confpassword"
                    placeholder="Min 8 charaters long" />
                <p class="error-message" id="confpasswordError"></p>


                <button type="submit" class="login-button">Sign-Up</button>
            </div>
            <div class="card">
                <P class="footer-text"> Already have an account,<a href="userlogin.html"
                        class="registration-link">Login</a>
                </P>
            </div>
        </div>
    </form>
</html>


