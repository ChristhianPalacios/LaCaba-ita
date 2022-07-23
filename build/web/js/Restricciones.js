window.addEventListener('load', (e) => {
    validarocampo();
});

function validarocampo() {
    const campo = document.getElementById('DNI');
    const campoe = document.getElementById('correo');
    const campot = document.getElementById('telefono');
    const validacion = document.getElementById('validacion');
    const validacionE = document.getElementById('Evalidacion');
    const validacionT = document.getElementById('Tvalidacion');

    campo.addEventListener('keyup', (e) => {
        if (/^\d{8}$/.test(campo.value) || campo.value === "") {
            validacion.textContent = "";
        } else {
            validacion.textContent = "El DNI es Incorrecto ❌"
        }
//        validacion.textContent = /^\d{8}$/.test(campo.value) ? "" : "EL DNI ES INCORRECTO "

    });
    campoe.addEventListener('keyup', (e) => {
        if (/^[a-zA-Z0-9_.+-]+@[a-zA-Z]+\.[a-zA-Z]+$/.test(campoe.value) || campoe.value === "") {
            validacionE.textContent = "";
        } else {
            validacionE.textContent = "El Correo es Incorrecto ❌"
        }
//        validacion.textContent = /^\d{8}$/.test(campo.value) ? "" : "EL DNI ES INCORRECTO "

    });
    campot.addEventListener('keyup', (e) => {
        if (/^\d{9}$/.test(campot.value) || campot.value === "") {
            validacionT.textContent = "";
        } else {
            validacionT.textContent = "Digitar Numeros, solo 9 digitos ❌"
        }
//        validacion.textContent = /^\d{8}$/.test(campo.value) ? "" : "EL DNI ES INCORRECTO "

    });
}