document.addEventListener('turbo:load', function () {
  const timerElement = document.getElementById('timer'); 
  if (timerElement) {
    let timeLeft = parseInt(timerElement.dataset.timeLeft, 10); 
    const i18nTimer = timerElement.dataset.i18nTimer;

    const countdown = setInterval(() => {
      if (timeLeft <= 0) {
        clearInterval(countdown); 
        window.location.href = timerElement.dataset.timeoutUrl; 
      } else {
        timeLeft -= 1; 
        const minutes = Math.floor(timeLeft / 60);
        const seconds = (timeLeft % 60).toString().padStart(2, '0');

        // Форматируем строку с использованием шаблона i18n
        timerElement.textContent = i18nTimer
          .replace('%{minutes}', minutes)
          .replace('%{seconds}', seconds);
      }
    }, 1000);
  }
});
