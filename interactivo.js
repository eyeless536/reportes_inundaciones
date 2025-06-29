// interactividad.js

// Mostrar en consola cuando se hace clic en botones principales
document.addEventListener("DOMContentLoaded", () => {
  const botones = document.querySelectorAll(".btn");
  botones.forEach(btn => {
    btn.addEventListener("click", () => {
      console.log(`Botón clickeado: ${btn.textContent}`);
    });
  });

  // Alerta de bienvenida (puedes reemplazar por clima real después)
  alert("¡Bienvenido! Consulta las zonas con posibles inundaciones en Chimalhuacán.");
});
