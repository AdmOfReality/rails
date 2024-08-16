document.addEventListener('turbo:load', function() {
    const passwordInput = document.getElementById('user_password');
    const passwordConfirmationInput = document.getElementById('user_password_confirmation');
    const passwordMatchIcon = document.getElementById('password_match_icon');

    // Проверяем, что все необходимые элементы существуют на странице
    if (passwordInput && passwordConfirmationInput && passwordMatchIcon) {
        function checkPasswordMatch() {
            const password = passwordInput.value;
            const passwordConfirmation = passwordConfirmationInput.value;

            const checkIcon = passwordMatchIcon.getAttribute('data-check-icon');
            const xIcon = passwordMatchIcon.getAttribute('data-x-icon');

            if (passwordConfirmation === '') {
                passwordMatchIcon.innerHTML = ''; // Очистка иконки, если поле подтверждения пустое
            } else if (password === passwordConfirmation) {
                passwordMatchIcon.innerHTML = checkIcon; // Галочка
            } else {
                passwordMatchIcon.innerHTML = xIcon; // Крестик
            }
        }

        passwordInput.addEventListener('input', checkPasswordMatch);
        passwordConfirmationInput.addEventListener('input', checkPasswordMatch);
    }
});
