function validate() {
    var fn = document.getElementById("ContentPlaceHolder1_txtFN").value;
    var ln = document.getElementById("ContentPlaceHolder1_txtLN").value;
    var em = document.getElementById("ContentPlaceHolder1_txtEm").value;
    var addr = document.getElementById("ContentPlaceHolder1_txtAddr").value;
//    var cont = document.getElementById("ContentPlaceHolder1_drpCont").value;
    var state = document.getElementById("ContentPlaceHolder1_drpState").value;
    var city = document.getElementById("ContentPlaceHolder1_drpCity").value;
//    var post = document.getElementById("ContentPlaceHolder1_drpPost").value;
    var phone = document.getElementById("ContentPlaceHolder1_txtMob").value;
    var gen1 = document.getElementById("ContentPlaceHolder1_rbMale").checked;
    var gen2 = document.getElementById("ContentPlaceHolder1_rbFemale").checked;
    var user = document.getElementById("ContentPlaceHolder1_txtUser").value;
    var pass = document.getElementById("ContentPlaceHolder1_txtPass").value;
    var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/; 
    if (fn.trim() == "") {
        val.innerHTML = "Please enter first name";
        document.getElementById("ContentPlaceHolder1_txtFN").focus();
        return false;
    }
    if (ln.trim() == "") {
        val.innerHTML = "Please enter last name";
        document.getElementById("ContentPlaceHolder1_txtLN").focus();
        return false;
    }
    if (em.trim() == "") {
        val.innerHTML = "Please enter Email ID";
        document.getElementById("ContentPlaceHolder1_txtEm").focus();
        return false;
    }
    if (em != "") {
        if (!em.match(mailformat)) {
            val.innerHTML = "Invalid Email ID! Please try again";
            document.getElementById("ContentPlaceHolder1_txtEm").focus();
            return false;
        }
    }
    if (addr.trim() == "") {
        val.innerHTML = "Please enter address";
        document.getElementById("ContentPlaceHolder1_txtAddr").focus();
        return false;
    }
//    if (cont == "0") {
//        val.innerHTML = "Please select country";
//        document.getElementById("ContentPlaceHolder1_drpCont").focus();
//        return false;
    //    }
    if (city == "--Please select--") {
        val.innerHTML = "Please select city";
        document.getElementById("ContentPlaceHolder1_drpCity").focus();
        return false;
    }
    if (state == "--Please select--") {
        val.innerHTML = "Please select state";
        document.getElementById("ContentPlaceHolder1_drpState").focus();
        return false;
    }
    
//    if (post == "0") {
//        val.innerHTML = "Please select postcode";
//        document.getElementById("ContentPlaceHolder1_drpPost").focus();
//        return false;
//    }
    if (phone.trim() == "") {
        val.innerHTML = "Please enter phone number";
        document.getElementById("ContentPlaceHolder1_txtMob").focus();
        return false;
    }
    if (gen1==false && gen2==false) {
        val.innerHTML = "Please select gender";
        document.getElementById("ContentPlaceHolder1_rbMale").focus();
        return false;
    }
    if (user.trim() == "") {
        val.innerHTML = "Please enter username";
        document.getElementById("ContentPlaceHolder1_txtUser").focus();
        return false;
    }
    if (pass.trim() == "") {
        val.innerHTML = "Please enter password";
        document.getElementById("ContentPlaceHolder1_txtPass").focus();
        return false;
    }

}

