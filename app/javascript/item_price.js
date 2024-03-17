function itemPrice () {
  const priceInput = document.getElementById("item-price");
  const addTaxDom = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");

  priceInput.addEventListener("input", () =>{
    const inputValue = priceInput.value;
    const tax = Math.floor(inputValue * 0.1);
    addTaxDom.innerHTML = tax.toLocaleString();
    profit.innerHTML = (inputValue - tax).toLocaleString();
  });
};

window.addEventListener('turbo:load', itemPrice);