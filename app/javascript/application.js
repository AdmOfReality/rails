// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import { Turbo } from "@hotwired/turbo-rails";
import { Application } from "@hotwired/stimulus";

// Import Stimulus controllers
import "./controllers"; // относительный путь

// Import other libraries
import "jquery";
import "popper";
import "bootstrap";
import "./utilities/sorting"; // относительный путь
import "./utilities/password_match";
import "./utilities/form_inline";
import "./utilities/progress_bar";
import "./utilities/timer";

// Stimulus application configuration
const application = Application.start();

// Configure Stimulus development experience
application.debug = false;
window.Stimulus = application;

export { application };
