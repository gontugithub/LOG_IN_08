
function fMostrarLogin(){
    // MOSTRAR EL FORMULARIO LOGIN
    document.querySelector("#div_modal").style.display = "flex";

}

function fCerrarModalLogin(){
    document.querySelector("#div_modal").style.display = "none";
}

function fControlLogin(){
    // LEER EL ALIAS
    // LEER EL PASSWRD
    let alias = document.querySelector("#usuario").value;
    let password = document.querySelector("#password").value;


    let URL = "assets/php/servidor.php?peticion=login";

    URL += "&alias=" + alias;
    URL += "&password=" + password;

        fetch(URL)
        .then((response) => response.json())
        .then((data) => {
            console.log(data);    

            if (data.datos.length > 0){

                let mensajelog = "BIENVENIDO " + (data.datos[0].nombre);

    
                document.querySelector("#info_error").innerHTML = mensajelog;
                document.querySelector("#info_error").style.textTransform = "uppercase";
                document.querySelector("#info_error").style.color = "black";
                document.querySelector("#info_error").style.display = "block";
                setTimeout(fCerrarModalLogin, 2000)
                
                
            } else {
                document.querySelector("#info_error").innerHTML = "ACCESO DENEGADO"
                document.querySelector("#info_error").style.color = "red";
                document.querySelector("#info_error").style.display = "block";
            }
           

        })
        .finally ( ()=>{
            setTimeout(fquitarmensajerror, 2000)
        } );

   


}

function fquitarmensajerror(){
    document.querySelector("#info_error").style.display = "none";
}
























//CREAS UNA VARIABLE CON LO QUE TE PIDEN
let me_han_pedido = "";

function fFiltrarClientes(){
     me_han_pedido = "clientes"
     document.querySelector("aside").style.visibility = 'visible';

}

function fFiltrarProductos(){
    me_han_pedido = "productos"
    document.querySelector("aside").style.visibility = 'visible';

}

function fFiltrarSecciones(){
    me_han_pedido = "secciones"
    document.querySelector("aside").style.visibility = 'visible';

}

function fBuscar(){
    //Recuperar el filtro
    //Recuperamos lo que ha decretado el usuario
    let filtro = document.querySelector("#filtro").value;

    //clientes
    if(me_han_pedido == "clientes"){

        fClientes(filtro);
        
    }
    //productos
    if(me_han_pedido == "productos"){

        fProductos(filtro);
        
    }
    //secciones
    if(me_han_pedido == "secciones"){

        fSecciones(filtro);
        
    }

    //Si me han pedido clientes, recuperar clientes filtrados
    //Si me han pedido productos, recuperar productos filtrados
    //Si me han pedido secciones, recuperar secciones filtradas
 

}

function fTodos(){
    //Buscar los clientes filtrados en la BBDD

    //
        const URL = "Assets/php/servidor.php?peticion=cargar_todos";

        fetch(URL)
        .then((response) => response.json())
        .then((data) => {
    
            //Para asegurarme de que funciona, imprimo los datos en la consola
            console.log(data);    
            //Para cada elemento de la lista, mostrarlo en el section
            let html = "<table>";
            //`cli_codigo`, `cli_empresa`, `cli_direccion`, `cli_poblacion`, `cli_telefono`, `cli_responsable`
            html += "<tr>"
                html += "<th> Código </th>";
                html += "<th> Empresa </th>";
                html += "<th> Direcciçon </th>";
                html += "<th> Teléfono </th>";
                html += "<th> Responsable </th>";

                for(i=0; i<data.datos.length; i++){
                    html+= "<tr>";
                    html+= "<td>" + data.datos[i].cli_codigo + "</td>";
                    html+= "<td>" + data.datos[i].cli_empresa + "</td>";
                    html+= "<td>" + data.datos[i].cli_direccion + "</td>";
                    html+= "<td>" + data.datos[i].cli_poblacion + "</td>";
                    html+= "<td>" + data.datos[i].cli_telefono + "</td>";
                    html+= "<td>" + data.datos[i].cli_responsable + "</td>";

                    html+= "</tr>";
                }
            html += "</tr>"

            html += "</table>";

            document.querySelector("section").innerHTML = html;

        })
}

function fGrabar(){
    //Buscar los clientes filtrados en la BBDD
    let cod = document.querySelector("#codigo").value;
    let empresa = document.querySelector("#empresa").value;
    let direccion = document.querySelector("#direccion").value;
    let poblacion = document.querySelector("#poblacion").value;
    let telefono = document.querySelector("#telefono").value;
    let responsable = document.querySelector("#responsable").value;

    //CAMBIAMOS LA URL VARIABLE, 
    let URL = "Assets/php/servidor.php?peticion=grabar";
    URL += "&cod=" + cod;
    URL += "&empresa=" + empresa;
    URL += "&direccion=" + direccion;
    URL += "&poblacion=" + poblacion;
    URL += "&telefono=" + telefono;
    URL += "&responsable=" + responsable;

        fetch(URL)
        .then((response) => response.json())
        .then((data) => {
    
            //Para asegurarme de que funciona, imprimo los datos en la consola
            console.log(data);    


        })
}

function fModificar(){
    //Buscar los clientes filtrados en la BBDD
    let cod = document.querySelector("#codigo").value;
    let empresa = document.querySelector("#empresa").value;
    let direccion = document.querySelector("#direccion").value;
    let poblacion = document.querySelector("#poblacion").value;
    let telefono = document.querySelector("#telefono").value;
    let responsable = document.querySelector("#responsable").value;

    //CAMBIAMOS LA URL VARIABLE, 
    let URL = "Assets/php/servidor.php?peticion=modificar";
    URL += "&cod=" + cod;
    URL += "&empresa=" + empresa;
    URL += "&direccion=" + direccion;
    URL += "&poblacion=" + poblacion;
    URL += "&telefono=" + telefono;
    URL += "&responsable=" + responsable;

        fetch(URL)
        .then((response) => response.json())
        .then((data) => {
    
            //Para asegurarme de que funciona, imprimo los datos en la consola
            console.log(data);    


        })
}

function fBorrar(){
    let cod = document.querySelector("#codigo").value;
    //Cambiamos de constante a variable la url y le añadiremos los valores de arriba
    let URL = 'assets/php/servidor.php?peticion=Borrar';
    URL += "&cod=" + cod;
    fetch(URL)
    .then((response) => response.json())
    .then((data) => {
        console.log(data);
    })
}


function fProductos(filtro){
    //MOSTRAR EN EL SECTION LOS PRODUCTOS

    const URL = "Assets/php/servidor.php?peticion=cargar_productos&filtro=" + filtro;

        //Debemos de pedirsela al servidor
    
        fetch(URL)
        .then((response) => response.json())
        .then((data) => {
    
            //Para asegurarme de que funciona, imprimo los datos en la consola
            console.log(data);

            //Para cada elemento de la lista, mostrarlo en el section
            let html = "<table>";

             // `prod_codigo`, `prod_seccion`, `prod_nombre`, `prod_precio`, `prod_fecha`, `prod_importado`, `prod_pais_origen`   
            html += "<tr>"
            html += "<th> Código </th>";
            html += "<th> Sección </th>";
            html += "<th> Nombre </th>";
            html += "<th> Precio </th>";
            html += "<th> País Origen </th>";


            for(i=0; i<data.datos.length; i++){
                html+= "<tr>";
                html+= "<td>" + data.datos[i].prod_codigo + "</td>";
                html+= "<td>" + data.datos[i].prod_seccion + "</td>";
                html+= "<td>" + data.datos[i].prod_nombre + "</td>";
                html+= "<td>" + data.datos[i].prod_precio + "</td>";
                html+= "<td>" + data.datos[i].prod_pais_origen + "</td>";

                html+= "</tr>";
            }
        html += "</tr>"

        html += "</table>";

        document.querySelector("section").innerHTML = html;
    
        })

}

function fSecciones(filtro){
    //MOSTRAR EN EL SECTION LAS SECCIONES

    const URL = "Assets/php/servidor.php?peticion=cargar_secciones&filtro=" + filtro;

        //Debemos de pedirsela al servidor

        fetch(URL)
        .then((response) => response.json())
        .then((data) => {
    
            //Para asegurarme de que funciona, imprimo los datos en la consola
            console.log(data);    
            //Para cada elemento de la lista, mostrarlo en el section
            let html = "<table>";

            html += "<tr>"
            html += "<th> Tipos de Secciones </th>";

            for(i=0; i<data.datos.length; i++){
                html+= "<tr>";
                html+= "<td>" + data.datos[i].prod_seccion + "</td>";
                html+= "</tr>";
            }

            html += "</tr>";
            html += "</table>"

            document.querySelector("section").innerHTML = html;

        })
}