const frm = documment.querySelector('frm');
const resp1 = document.querySelector('h3');
const resp2 = document.querySelector('h3');

frm.addEventListener('submit', (e) => {
  e.preventDefault();

  const ladoA = Number(frm.ladoA.value);
  const ladoB = Number(frm.ladoB.value);
  const ladoC = Number(frm.ladoC.value);

  if (ladoA >(ladoB + ladoC) && ladoB>(ladoC + ladoA) && ladoC > (ladoA + ladoB)) {
    resp1.innerText = 'Os lados fornecidos não formam um triângulo.'
  }else{
    resp1.innerText = 'Os lados fornecidos não formam um triângulo'
  }
    if (ladoA == ladoB && ladoB == ladoC) {
        resp2.innerText ='O triangulo é Equilátero'
    }else if (ladoA != ladoB && ladoB != ladoC) {
        resp2.innerText ='O triangulo é Escaleno'
    }else{
        resp2.innerText ='O triangulo é Isósceles'
    }
})











// function trianguloCalculo(){
//     const frm = documment.querySelector('frm');
//     const resp = document.querySelector('h3');

//     const ladoA = Number(document.getElementById('ladoA'));
//     const ladoB = Number(document.getElementById('ladoB'));
//     const ladoC = Number(document.getElementById('ladoC'));
//     // Operador ternario
//     let verifica = ladoA + ladoB > ladoC || ladoC + ladoB > ladoA || ladoC + ladoA > ladoB ? 

//     if (ladoA + ladoB > ladoC || ladoC + ladoB > ladoA || ladoC + ladoA > ladoB){
        
        
//     }
 // }