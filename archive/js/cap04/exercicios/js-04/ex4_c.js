const frm = document.querySelector('form')
const resp1 = document.querySelector('h3')
const resp2 = document.querySelector('h4')


frm.addEventListener('submit', (e) => {
    e.preventDefault()
    const valor = Number (frm.parValor.value)
    let troco = 0
    if (valor < 1){
        resp1.innerText = "Valor insuficiente"
    }else if (valor >=1 && valor < 1.75){
        resp1.innerText = `O valor ${valor} foi adicionado 30 minutos de estacionamento`
        troco= valor-1
    }else if (valor < 3){
        resp1.innerText = `O valor ${valor} foi adicionado 60 minutos de estacionamento`
        troco= valor-1.75
    }else{
        resp1.innerText = `O valor ${valor} foi adicionado 120 minutos de estacionamento`
        troco= valor-3
    }
    resp2.innerText = `Troco de R$ ${troco.toFixed(2)}`
})










// function verificar(){

//     const num = Number(document.getElementById('parValor'));

//     if (num < 1){
//         document.querySelector('h3').innerText = "Valor insuficiente"
//     }else if (num > 1){
//         document.querySelector('h3').innerText = ` O valor${num} foi adicionado 20 minutos de estacionamento`
//     }else if (num == 3){
//         document.querySelector('h3').innerText = ` O valor ${num} foi adicionado 40 minutos de estacionamento`
//     }

//     return false;
// }