const frm = document.querySelector('form');
const resp1 = document.querySelector('h2');


frm.addEventListener('submit', (e)=>{
    e.defaultPrevented();
    
    if (frm % 2 == 0 ){
        resp1.innerText = 'O número é par';
    }else{
        resp1.innerText = 'O número é ímpar';
    }
})