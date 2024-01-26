<p align='center'>
<img src="https://esfot.epn.edu.ec/images/headers/logo_esfot_buho.png" alt="Esfot" width="300px">
</p>
</div>

[![Flutter](https://img.shields.io/badge/Flutter-%2302569B?style=for-the-badge&logo=flutter&logoColor=white)](https://flutter.dev/) [![Dart](https://img.shields.io/badge/Dart-%230175C2?style=for-the-badge&logo=dart&logoColor=white)](https://dart.dev/) 

# Aplicativo movil echo en Flutter con un Login
- Jose Galarza
- Joel Tates
- Dany Vinueza

## Pasos para crear la aplicación desde el tutorial 🔗
- Primero clonamos el repositorio
  ```bash
  git clone git clone https://github.com/flutter/codelabs.git flutter-codelabs
  ```
 [![clonar.png](https://i.postimg.cc/ZqhYPPkN/clonar.png)](https://postimg.cc/sMwRshgf)
- Seguido nos dirigimos al path y abrimos con *code .* visual studio code en ese directorio
  ```bash
  cd flutter-codelabs/firebase-get-to-know-flutter/step_02
  ```
- Ejecutamos la aplicación para que se instale todos las librerias que se requieran para que no exista ningun error
  > Si existe una ventana diciendo que existe errores y no se puede seguir con el debug dar click en *debug anyway*

Al resolver todos los errores que hacia falta de instalar algunas librerias, ya nos muestra la aplicación en ejecución

  [![inicio.png](https://i.postimg.cc/SQ8wbBHW/inicio.png)](https://postimg.cc/vDYPWNYB)

- Habilitamos en firebase una vez creado el proyecto, el Authentication por correo electronico

  [![auth.png](https://i.postimg.cc/fb73VcWH/auth.png)](https://postimg.cc/WD3pKJkr)
- Creamos cloud firestore
  [![cloud.png](https://i.postimg.cc/zXm4DKMb/cloud.png)](https://postimg.cc/SjrgD2mk)
- En dentro del proyecto agregamos las siguientes dependencias:
  ```bash
  flutter pub add firebase_core
  ```
  [![d1.png](https://i.postimg.cc/jdpqbD6Z/d1.png)](https://postimg.cc/w7kY5TGm)
  ```bash
  flutter pub add firebase_auth
  ```
  [![d2.png](https://i.postimg.cc/4xw9Nv8X/d2.png)](https://postimg.cc/Sn2sg9FP)
  ```bash
  flutter pub add cloud_firestore
  ```
  [![d3.png](https://i.postimg.cc/7Lst72Lk/d3.png)](https://postimg.cc/zLhkY3Wt)
  ```bash
  flutter pub add provider
  ```
  [![d4.png](https://i.postimg.cc/mkbcstQP/d4.png)](https://postimg.cc/njPVKVSx)
  ```bash
  flutter pub add firebase_ui_auth
  ```
  [![d5.png](https://i.postimg.cc/FHXMs3YC/d5.png)](https://postimg.cc/nCTR3sYq)
- Se instala la CLI de FlutterFire,m con el siguiente codigo:
  ```bash
  dart pub global activate flutterfire_cli
  ```
  [![cli1.png](https://i.postimg.cc/BnD129QQ/cli1.png)](https://postimg.cc/yD1dzGZw)
- Configuración del proyecto, con el siguiente comando:
  ```bash
  flutterfire configure
  ```
