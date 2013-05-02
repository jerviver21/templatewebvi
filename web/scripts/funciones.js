var a = 1;
var b =1;

function readURL() {
    error = document.URL.split("error=");
    if(error.length > 1){
        mensaje = error[1];
        mensaje = mensaje.replace("%20", " ");
        mensaje = mensaje.replace("%20", " ");
        mensaje = mensaje.replace("%20", " ");
        comp = document.getElementById("error");
        comp.innerHTML = mensaje;
    }
    a = Math.ceil(Math.random() * 10);
    b = Math.ceil(Math.random() * 10);       
    capt = document.getElementById("verificador");
    capt.innerHTML = "Cuanto es "+a+" + "+b+"?";
    
}

function validarCatchap() {
    formulario = document.form;
    valor = document.getElementById("v_verificador");
    if(valor.value == (a+b)){
        formulario.submit();
    }else{
        alert(a+" + "+b+" = "+(a+b)+" - Es una verificación de seguridad vuelva a intentar! ");
    }
    
}
