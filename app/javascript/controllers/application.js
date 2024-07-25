import { Application } from "@hotwired/stimulus"

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }

import { Turbo } from "@hotwired/turbo-rails";

// Импорт модуля sorting
import sorting from 'utilities/sorting';

// Использование модуля sorting при загрузке страницы
document.addEventListener('turbo:load', function() {
    sorting.init();
});
