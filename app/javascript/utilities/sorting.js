document.addEventListener('turbo:load', function() {
    const control = document.querySelector('.sort-by-title');
    if (control) {
        control.addEventListener('click', sortRowsByTitle);
    }
});

function sortRowsByTitle() {
    const table = document.querySelector('table');
    const tbody = table.querySelector('.table-group-divider')
    const rows = tbody.querySelectorAll('tr')
    const arrayRows = Array.from(rows);

    const arrowUp = this.querySelector('.octicon-arrow-up');
    const arrowDown = this.querySelector('.octicon-arrow-down');

    if (arrowUp.classList.contains('hide')) {
        arrayRows.sort(compareRowsAsc);
        arrowUp.classList.remove('hide');
        arrowDown.classList.add('hide');
    } else {
        arrayRows.sort(compareRowsDesc);
        arrowDown.classList.remove('hide');
        arrowUp.classList.add('hide');
    }

    const sortedTbody = document.createElement('tbody');
    sortedTbody.classList.add('table-group-divider');
    arrayRows.forEach(row => sortedTbody.appendChild(row));
    table.replaceChild(sortedTbody, tbody);
}

function compareRowsAsc(row1, row2) {
    const testTitle1 = row1.querySelector('td').textContent.trim();
    const testTitle2 = row2.querySelector('td').textContent.trim();
    if (testTitle1 < testTitle2) return -1;
    if (testTitle1 > testTitle2) return 1;
    return 0;
}

function compareRowsDesc(row1, row2) {
    const testTitle1 = row1.querySelector('td').textContent.trim();
    const testTitle2 = row2.querySelector('td').textContent.trim();
    if (testTitle1 < testTitle2) return 1;
    if (testTitle1 > testTitle2) return -1;
    return 0;
}
