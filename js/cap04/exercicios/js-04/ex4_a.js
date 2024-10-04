const frm = document.querySelector('form');
const num = document.querySelector('h2');

frm.addEventListener('submit', (e)=>{
    e.defaultPrevented();
    
    if (frm % 2 == 0 ){
        document.querySelector('h2').innerText
    }else{
        num.innerText = 'O número é ímpar';
    }
})