function calcular (){
    alert('1')
    
    const nome = document.getElementById('inNom').value; 
    const masculimo = document.getElementById('inMas').checked; 
    const altura = document.getElementById('inAL').value; 

    let peso = masculimo ? Math.pow(altura,2) * 22 : Math.pow(altura,2) * 21;
    alert('2')
    document.querySelector("h3").innerText = `${nome}: Peso ideal ${peso.toFixed(2)}`;
    
    return false; // impedir o refresh da página equivalente ao e.preventDefault()
}

function limpar(){
    document,querySelector("h3").innerText =""
}





// if(masculimo){
//     peso = 22 * Math.pow(altura,2)
// }else{
//     peso = 21 * Math.pow(altura,2)
// }
// const frm = document.querySelector('form');
// const resp = document.querySelector('h3');
// frm.addEventListener('submit', (e) => {
//     e.preventDefault()
//     const nome = frm.inNome.value
//     const masculino = frm.inMas
// )}