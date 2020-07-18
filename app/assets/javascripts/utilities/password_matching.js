function validatePassword() {
  var password = document.getElementById('user_password').value;
  var confirm_password = document.getElementById('user_password_confirmation').value;
  
  if (password == '') {
    return document.getElementById('message').innerHTML = ' ';
  }

  if (password == confirm_password) {
    document.getElementById('message').style.color = 'green';
    document.getElementById('message').innerHTML = 'matching';
  } else {
    document.getElementById('message').style.color = 'red';
    document.getElementById('message').innerHTML = 'not matching';
  }
}

document.addEventListener('input', validatePassword)
