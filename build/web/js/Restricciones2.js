window.addEventListener('load', (e) => {
    validarocampo();
});
function validarocampo() {
  
    const campoe = document.getElementById('email');
 
    
    const validacionE = document.getElementById('Evalidacion');
    

  
     campo.addEventListener('keyup', (e) => {
        if ( /^[a-zA-Z0-9_.+-]+@[a-zA-Z]+\.[a-zA-Z]+$/.test(campoe.value) || campoe.value === "") {
            validacionE.textContent = "";
        } else {
            validacionE.textContent = "DEBE SER FOMRATO @gmail.com ❌"
        }
//        validacion.textContent = /^\d{8}$/.test(campo.value) ? "" : "EL DNI ES INCORRECTO "

    });
    
}