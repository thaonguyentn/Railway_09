function goToRegister() {
    window.open('register.html', 'self')
}

// Reset Form Register
function resetForm() {
    document.getElementById('Full_Name_ID').value = ''
    document.getElementById('Email_ID').value = ''
    document.getElementById('Password_ID').value = ''
    document.getElementById('Re_Password_ID').value = ''
    document.getElementById('Birthday_ID').value = ''
}


// Create Account
function createNewUser() {
    var v_Full_Name = document.getElementById('Full_Name_ID').value
    var v_Email = document.getElementById('Email_ID').value
    var v_Password = document.getElementById('Password_ID').value
    var v_Re_Password = document.getElementById('Re_Password_ID').value
    var v_Birthday = document.getElementById('Birthday_ID').value
    if (v_Password != v_Re_Password) {
        alert("Mat khau khong trung khop")
    }
    var user = {
        Full_Name: v_Full_Name,
        Email: v_Email,
        Password: v_Password,
        Birthday: v_Birthday,
    }

    window.open('login.html', '_self')
    var json = JSON.stringify(user)
    localStorage.setItem('user', json)
}

function loginSuccess() {
    var v_Email_Login_id = document.getElementById('Email_Login_id').value
    var v_Password_Login_id = document.getElementById('pwd_id').value
    var user = JSON.parse(localStorage.getItem('user'))


    // Get the value of the specified local storage item:
    if ((user.Email == v_Email_Login_id) && (user.Password == v_Password_Login_id)) {
        alert('Đăng nhập thành công')
        window.open('Home.html', '_self')
    }
    else {
        alert('Kiểm tra lại thông tin!!!')
    }
}

