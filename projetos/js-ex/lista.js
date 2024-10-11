frm = document.querySelector("form")

frm.addEventListener("submit", (e) => {
    e.preventDefault();
    incluir();

})

let lista = []

function incluir(){
    lista.push(frm.inItem.value) 
}