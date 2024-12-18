# frozen_string_literal: true

# Pin npm packages by running ./bin/importmap

pin 'application', preload: true
pin '@hotwired/turbo-rails', to: 'turbo.min.js', preload: true
pin '@hotwired/stimulus', to: 'stimulus.min.js', preload: true
pin '@hotwired/stimulus-loading', to: 'stimulus-loading.js', preload: true
pin 'bootstrap', to: 'bootstrap.min.js', preload: true
pin 'popper', to: 'popper.js', preload: true
pin 'jquery', to: 'https://code.jquery.com/jquery-3.6.0.min.js', preload: true
pin 'utilities/sorting', to: 'utilities/sorting.js'
pin_all_from 'app/javascript/controllers', under: 'controllers'
pin_all_from 'app/javascript/utilities', under: 'utilities'
