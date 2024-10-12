const frm = document.querySelector("form")

frm.addEventListener("submit", (e) => {
    e.preventDefault();
    let id = frm.inID.value
    if (id != ""){
        atualizar(id)
    } else{
        incluir()
    }

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
        tbody.innerHTML += `<tr><td onclick="editar(${i})">${lista[i]}</td></tr>`
    }
    frm.reset();
    //tbody.innerHTML +=`<tr><td>${frm.inItem.value}</td></tr>`
}

function editar(i){
    frm.inItem.value = lista[i]
    frm.inID.value= i
}

function excluir(i){
    lista.splice(frm.inID.value, 1)
    atualizarLista()
}

function atualizar(i){
    lista[i]= frm.inItem.value
    atualizarLista()
}
