const frm = document.querySelector("form");
const h2 = document.querySelector("h2");
const h3 = document.querySelector("h3");

frm.addEventListener("submit", (e)=>{
    e.preventDefault();
    const name = frm.nameProduct.value;
    const price = Number(frm.valueProduct.value);
    const promotion = price - (price * 0.5); // promoção de 50%

    h2.innerText = `${name} - Promoção: Leve 3 por: R$${((price * 2) + promotion).toFixed(2)}`;
    h3.innerText = `O 3° produto custa apenas R$${promotion.toFixed(2)}`
});