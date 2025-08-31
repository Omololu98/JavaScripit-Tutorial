function subscribe() {
    const buttonElement = document.querySelector('.js-subscribe-button');
    if (buttonElement.innerText === 'Subscribe') {
        buttonElement.innerText = 'Subscribed';
        buttonElement.classList.add('is-subscribed');
    } else {
        buttonElement.innerText = 'Subscribe';
        buttonElement.classList.remove('is-subscribed');
    }
}

function calculateTotal() {
    const inputElement = document.querySelector('.js-cost-input');
    const totalCostElement = document.querySelector('.js-total-cost');
    const cost = Number(inputElement.value);
    if (isNaN(cost) || cost <= 0) {
        totalCostElement.innerText = 'Please enter a valid cost.';
        totalCostElement.classList.add('error-message');
    } else {
        let totalCost = 0;
        if (cost < 40) {
            totalCost = cost + 10;
        } else {
            totalCost = cost;
        }
        totalCostElement.innerText = `Total Cost: $${totalCost}`;
        totalCostElement.classList.remove('error-message');

    }

}