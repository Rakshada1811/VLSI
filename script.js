var re = /^\d{10}$/; // Mobile number - exactly 10 digits
var em = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/; // Valid email pattern
var nameRegex = /^[A-Za-z\s]+$/; // Letters and spaces only

function submitForm() {
  clearErrors();
  let isValid = true;

  let name = document.getElementById("fname").value.trim();
  let mobile = document.getElementById("mnumber").value.trim();
  let email = document.getElementById("email").value.trim();
  let address = document.getElementById("address").value.trim();
  let city = document.getElementById("city").value.trim();
  let state = document.getElementById("state").value.trim();
  let gender = document.querySelector('input[name="gender"]:checked');

  // Name validation
  if (name.length < 3 || !name.match(nameRegex)) {
    document.getElementById("nameError").innerText = "Please enter a valid name (min 3 letters, no numbers)";
    isValid = false;
  }

  // Mobile validation
  if (!re.test(mobile)) {
    document.getElementById("mobileError").innerText = "Enter a valid 10-digit mobile number";
    isValid = false;
  }

  // Email validation
  if (!em.test(email)) {
    document.getElementById("emailError").innerText = "Enter a valid email address";
    isValid = false;
  }

  // Gender validation
  if (!gender) {
    document.getElementById("genderError").innerText = "Please select gender";
    isValid = false;
  }

  // Address validation
  if (address.length < 3) {
    document.getElementById("addressError").innerText = "Enter a valid address (min 3 characters)";
    isValid = false;
  }

  // City validation
  if (!city.match(nameRegex)) {
    document.getElementById("cityError").innerText = "Enter valid city name (no numbers)";
    isValid = false;
  }

  // State validation
  if (!state.match(nameRegex)) {
    document.getElementById("stateError").innerText = "Enter valid state name (no numbers)";
    isValid = false;
  }

  // Save to localStorage and redirect if valid
  if (isValid) {
    let formData = {
      name: name,
      mobile: mobile,
      email: email,
      gender: gender.value,
      address: address,
      city: city,
      state: state,
    };
    localStorage.setItem("formData", JSON.stringify(formData));
    window.location.href = "confirm.html";
  }
}

function clearErrors() {
  let errorFields = [
    "nameError",
    "mobileError",
    "emailError",
    "genderError",
    "addressError",
    "cityError",
    "stateError"
  ];
  errorFields.forEach(id => document.getElementById(id).innerText = "");
}
