const frm = document.querySelector("form")

frm.addEventListener("submit", (e) => {
    e.preventDefault();
    incluir();

})

let lista = []
const tbody = document.querySelector("tbody")
function incluir(){
    lista.push(frm.inItem.value);
   atualizarLista();
   alert("Item nas lista");
}

function atualizarLista(){
    tbody.innerHTML =""
    for(let i in lista){
        tbody.innerHTML += `<tr><td onlick="alert(${i})">${lista[i]}</td></tr>`
    }
    //tbody.innerHTML +=`<tr><td>${frm.inItem.value}</td></tr>`
}

function editar(i){
    frm.inItem.value = lista[i]
    frm.inID= i
}