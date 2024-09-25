// criar ums referencia ao form e ao h3 (onde será exibida a resposta)
const frm = document.querySelector("form");// selecionando o form
const rsp = document.querySelector("h3");// selecioando o h3 

// cria um ouvinte de evento,acionado quando o botão submit for clicado
frm.addEventListener("submit",(e)=>{ //uma forma diferente de fazer função
    const nome = frm.inNome.value;// obtém o nome digitado no form
    rsp.innerText = `Olá ${nome}`;// exibe a reposta do programa
    e.preventDefault();// vai evitar que o form envio os dados pro destino.php
});



// function mostrar(){

// }