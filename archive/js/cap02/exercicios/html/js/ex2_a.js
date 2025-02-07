const frm = document.querySelector("form");
const resp1 = document.querySelector("out-R1");
const resp2 = document.querySelector("out-R2");
const resp3 = document.querySelector("out-R3");

frm.addEventListener("submit", (e)=>{
    const med = frm.inMed.value
    const preco = Number(frm.inPreco.value)

    resp1.innerText= `O Preço do ${med} é (o valor já descontado)${preco.toFixed(2)}`
    resp2.innerText= `${(Math.florr(preco)*2).toFixed(2)}`
    e.preventDefault()
})