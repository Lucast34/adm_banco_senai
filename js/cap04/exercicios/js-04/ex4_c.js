function verificar(){

    const num = Number(document.getElementById('parValor'));

    if (num < 1){
        document.querySelector('h3').innerText = "Valor insuficiente"
    }else if (num > 1){
        document.querySelector('h3').innerText = ` O valor${num} foi adicionado 20 minutos de estacionamento`
    }else if (num == 3){
        document.querySelector('h3').innerText = ` O valor ${num} foi adicionado 40 minutos de estacionamento`
    }

    return false;
}