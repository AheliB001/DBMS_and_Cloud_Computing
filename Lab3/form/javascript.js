function validateForm() {

    // Name check
    if (document.getElementById("name").value === "") {
        alert("Please enter your name");
        return false;
    }

    // Email check
    if (document.getElementById("email").value === "") {
        alert("Please enter your email");
        return false;
    }

    // Password length check
    if (document.getElementById("password").value.length < 6) {
        alert("Password must be at least 6 characters");
        return false;
    }

    // Confirm password check
    if (
        document.getElementById("password").value !==
        document.getElementById("confirm_password").value
    ) {
        alert("Passwords do not match");
        return false;
    }

    // Category check
    if (
        !document.getElementById("student").checked &&
        !document.getElementById("professional").checked
    ) {
        alert("Please select a category");
        return false;
    }

    // State check
    if (document.getElementById("state").value === "") {
        alert("Please select a state");
        return false;
    }

    // Terms check
    if (!document.getElementById("terms").checked) {
        alert("Please accept the terms and conditions");
        return false;
    }

    // If everything is correct
    return true;
}
