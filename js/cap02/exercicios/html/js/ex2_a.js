const frm = document.querySelector("form");
const resp1 = document.querySelector("out-R1");
const resp2 = document.querySelector("out-R2");
const resp3 = document.querySelector("out-R3");

frm.addEventListener("submit", (e)=>{
    const med = frm.inMedicamento.value
    const preco = Number(frm.inPreco.value)

    resp1.innerText= `O Preço é (o valor já descontado)${preco.toFixed(2)}`
    
    e.preventDefault()
})