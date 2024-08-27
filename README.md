#Guía para Iniciar la Aplicación Flutter

Requisitos Previos

Asegúrate de tener instalados los siguientes componentes antes de comenzar:

Flutter SDK: Descarga e instala desde flutter.dev.
Dart SDK: Viene incluido con Flutter, así que asegúrate de que esté configurado correctamente.
Android Studio o VS Code: Para un entorno de desarrollo adecuado.
Dispositivo o Emulador: Un dispositivo físico con depuración USB habilitada o un emulador configurado.

Pasos para Configurar y Ejecutar la Aplicación

1-. Clonar el Repositorio

Clona el repositorio en tu máquina local utilizando el siguiente comando:

https://github.com/NeoNoir40/Prueba_Tecnica.git

Despues accede a la carpeta que se descargo

cd prueba_tecnica

2-. Instala las dependencias para que la aplicación funcione correctamente

flutter pub get

3-. Conectar Dispositivo o Iniciar Emulador

Si estás utilizando un emulador, asegúrate de que esté corriendo. Si estás usando un dispositivo físico, conéctalo y verifica que sea reconocido.

3-.Compilar y Ejecutar la Aplicación

Finalmente, compila y ejecuta la aplicación con:

flutter run

4-.Compilación para Producción

Si deseas compilar la aplicación para producción, ejecuta:

flutter build apk


#Problemas Comunes
Si encuentras problemas, ejecuta flutter doctor para verificar el estado de tu entorno de desarrollo y solucionar cualquier inconveniente.

flutter doctor
