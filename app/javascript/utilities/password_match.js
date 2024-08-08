function checkPasswordMatch() {
  const password = document.getElementById('user_password').value;
  const passwordConfirmation = document.getElementById('user_password_confirmation').value;
  const passwordMatchIcon = document.getElementById('password_match_icon');

  const checkIcon = passwordMatchIcon.getAttribute('data-check-icon');
  const xIcon = passwordMatchIcon.getAttribute('data-x-icon');

  if (passwordConfirmation === '') {
    passwordMatchIcon.innerHTML = ''; // Очистка иконки, если поле подтверждения пустое
  } else if (password === passwordConfirmation) {
    passwordMatchIcon.innerHTML = checkIcon; // Галочка Хуялочка
  } else {
    passwordMatchIcon.innerHTML = xIcon; // Крестик
  }
}

document.getElementById('user_password').addEventListener('input', checkPasswordMatch);
document.getElementById('user_password_confirmation').addEventListener('input', checkPasswordMatch);
