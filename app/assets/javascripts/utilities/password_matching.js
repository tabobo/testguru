function validatePassword() {
  if (document.getElementById('user_password').value == '') {
    document.getElementById('message').innerHTML = ' ';
  }
  else if (document.getElementById('user_password').value ==
    document.getElementById('user_password_confirmation').value) {
    document.getElementById('message').style.color = 'green';
    document.getElementById('message').innerHTML = 'matching';
  } else {
    document.getElementById('message').style.color = 'red';
    document.getElementById('message').innerHTML = 'not matching';
  }
}

document.addEventListener('input', validatePassword)
document.addEventListener('input', validatePassword)
