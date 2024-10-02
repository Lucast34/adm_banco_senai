const frm = document.querySelector('form');

frm.addEventListener('submit', (e) => {
    e.preventDefault();
    const nome = frm.inNome.value;
    //alert(nome)
    const nota1 = Number( frm.inN1.value);
    const nota2 = Number( frm.inN2.value);

    const media = (nota1 + nota2)/2;
    
    alert(media.toFixed(2));

// se media >=7 então "Aprovado" senão "Reprovado"

if (media >= 7){
    alert("Aprovado ")
} else{
    alert("Reprovado")
}
    
})