// app/javascript/controllers/utilities/sorting.js
document.addEventListener('turbo:load', function() {
    var control = document.querySelector('.sort-by-title');

    control.addEventListener('click', function() {
    	alert('Click');
    })
});

export default {
    init: function() {
        // Этот метод может использоваться для инициализации, если это необходимо
    }
};
