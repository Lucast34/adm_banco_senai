const frm = document.querySelector("form");
const resp = document.querySelector("h3");

frm.addEventListener("submit", (e)=>{
    const inputPrice = frm.inVa.value;
    const inputTime = frm.inMin.value;

    const calcTotal = Number((inputPrice * Math.ceil(inputTime / 15)));

    resp.innerText = `O valor total é R$${calcTotal.toFixed(2)}`;
    e.preventDefault()
});