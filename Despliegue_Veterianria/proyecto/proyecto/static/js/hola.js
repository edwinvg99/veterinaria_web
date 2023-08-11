
console.log("Comprobando javascript")
console.log("Comprobando ubicacion")

document.addEventListener("DOMContentLoaded", function() {
  var ubicacionActual = new URL(window.location.href);
  var enlaceLogo = document.querySelector('.logo a');

  enlaceLogo.addEventListener('click', function(event) {
    event.preventDefault(); // Evita el comportamiento predeterminado del enlace

    if (ubicacionActual.pathname.includes('login')) {
      window.location.href = 'http://127.0.0.1:8000/login';

    } else if (ubicacionActual.pathname.includes('inicioVeterinario')) {
      window.location.href = 'http://127.0.0.1:8000/inicioVeterinario';

    } else if (ubicacionActual.pathname.includes('inicioVendedor')) {
      window.location.href = 'http://127.0.0.1:8000/inicioVendedor/';
    
    } else if (ubicacionActual.pathname.includes('crearPersonahtml')) {
      window.location.href = 'http://127.0.0.1:8000/login';
    }

  });
});


 // Función para mostrar la ventana emergente con el mensaje de error
 function mostrarVentanaEmergente(errorMessage) {
  var modal = document.getElementById("modal-container");
  var errorContainer = document.getElementById("error-message");
  errorContainer.innerText = errorMessage;
  modal.style.display = "flex";
}


// Función para volver a la página anterior
function volver() {
  history.back();
}

// Hacer una solicitud al servidor y manejar la respuesta
function hacerSolicitud() {
  // Hacer la solicitud al servidor
  // Por ejemplo, utilizando fetch() o XMLHttpRequest

  fetch('CrearMascota', {
      method: 'GET',
  })
  .then(response => {
      if (response.ok) {
          // La solicitud fue exitosa, manejar la respuesta
          // ...
      } else {
          // La solicitud falló, obtener el mensaje de error
          return response.json().then(data => {
              mostrarVentanaEmergente(data.error_message);
          });
      }
  })
  .catch(error => {
      console.error('Error:', error);
      // Mostrar un mensaje de error genérico en la ventana emergente
      var errorMessage = "Ha ocurrido un error.";
      mostrarVentanaEmergente(errorMessage);
  });
}