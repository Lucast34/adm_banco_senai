// Convertendo minutos para horas

const frm = document.querySelector("form");
const resp = document.querySelector("h3");
const resp2 = document.querySelector("h4");

frm.addEventListener("submit", (e)=>{
    const nome = frm.inName.value;
    const min = frm.inDuracao.value;
    
    // Convertendo minutos em horas
    const horas = Math.floor(min / 60);
    const minnut = Math.floor(min % 60);

    // Exibindo retorno na tela
    resp.innerText = `Titulo: ${nome}`;
    resp2.innerText = `Ao todo o filme tem ${horas}:${minnut}hrs`;
    e.preventDefault()
});