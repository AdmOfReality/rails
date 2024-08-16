document.addEventListener('turbo:load', () => {
  const progressBar = document.getElementById('progress-bar');
  
  if (progressBar) {
    const progress = progressBar.dataset.progress;

    if (progress) {
      progressBar.style.width = `${progress}%`;
    }
  }
});
