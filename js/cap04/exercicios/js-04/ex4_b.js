const frm = document.querySelector("form");
const response = document.querySelector("h2");

frm.addEventListener("submit", (e)=>{
    const velPermitida = Number(frm.inVelPermitida.value);
    const velAtual = Number(frm.inVelCondutor.value);
    
    if (velPermitida > velAtual){
        response.innerText = "Sem multa!";
    }
    else if (velPermitida + velPermitida * 0.20 > velAtual){
        response.innerText = "Multa leve!";
    }
    else if (velPermitida + velPermitida * 0.20 < velAtual){
        response.innerText = "Multa grave!";
    }
    e.preventDefault();
});