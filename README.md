#  GreenGo Logistics

![Flutter](https://img.shields.io/badge/Flutter-3.0+-02569B?logo=flutter)
![Dart](https://img.shields.io/badge/Dart-3.0+-0175C2?logo=dart)

**Aplicación móvil para gestión de entregas sostenibles en bicicleta**

Prototipo funcional desarrollado para el Flutter Challenge - "Soluciona un problema real"

---

##  Descripción del Problema

**GreenGo Logistics** es una startup ficticia que coordina repartidores en bicicleta para entregas sostenibles en la ciudad. El problema principal era:

> Los repartidores deben reportar manualmente cuando entregan un pedido, y los supervisores no tienen una forma rápida de ver qué entregas siguen pendientes o cuáles ya se completaron.

---

##  Solución Implementada

Una aplicación Flutter con dos roles principales:

###  Vista Repartidor
- Lista de entregas pendientes del día
- Marcado rápido de entregas con un solo toque
- Sistema de prioridades (Urgente, Normal, Baja)
- Barra de progreso animada
- Feedback visual inmediato al completar entregas

###  Vista Supervisor
- Estadísticas en tiempo real (completadas, pendientes, progreso)
- Vista global de todas las entregas
- Dashboard con métricas clave
- Seguimiento del progreso del equipo

--- 

##  Arquitectura

El proyecto sigue una arquitectura limpia y escalable:
```
lib/
├── main.dart                      # Punto de entrada de la aplicación
├── models/
│   └── delivery.dart              # Modelo de datos con enum y extensions
├── services/
│   └── delivery_service.dart      # Lógica de negocio y cálculos
├── utils/
│   ├── app_colors.dart            # Paleta de colores centralizada
│   └── constants.dart             # Constantes de la app
├── screens/
│   ├── home_page.dart             # Pantalla principal con TabBar
│   ├── delivery_view.dart         # Vista del repartidor
│   └── supervisor_view.dart       # Vista del supervisor
└── widgets/
    ├── app_header.dart            # Header reutilizable
    ├── delivery_card.dart         # Tarjeta de entrega individual
    ├── progress_card.dart         # Tarjeta de progreso
    ├── stats_card.dart            # Tarjeta de estadísticas
    └── delivery_list_item.dart    # Item de lista compacto
```

### Principios aplicados:
- **Separación de responsabilidades** - Cada archivo tiene un propósito único
- **Reutilización de componentes** - Widgets modulares y composables
- **Single Source of Truth** - Estado manejado centralmente
- **Extensibilidad** - Fácil agregar nuevas funcionalidades

---

##  Tecnologías Utilizadas

- **Flutter 3.0+** - Framework de desarrollo multiplataforma
- **Dart 3.0+** - Lenguaje de programación
- **Material Design 3** - Sistema de diseño
- **State Management** - setState (escalable a Provider/Bloc)

---

##  Instalación

### Prerrequisitos
- Flutter SDK 3.0 o superior
- Dart SDK 3.0 o superior
- Android Studio / VS Code con extensiones de Flutter

### Pasos

1. **Clonar el repositorio**
```bash
git clone https://github.com/tu-usuario/greengo-logistics.git
cd greengo-logistics
```

2. **Instalar dependencias**
```bash
flutter pub get
```

3. **Verificar instalación de Flutter**
```bash
flutter doctor
```

4. **Ejecutar la aplicación**

En emulador/dispositivo Android:
```bash
flutter run
```

En navegador web:
```bash
flutter run -d chrome
```

En iOS:
```bash
flutter run -d ios
```

---

##  Demo
<img src="demo.gif" alt="Ejecución del prototipo" width="500" height="auto">
---

## ℹ️

- **Desarrollador Principal**: Edinson Giovanny Ojeda Ortega
- **Challenge**: <a href=https://www.notion.so/Flutter-Challenge-Soluciona-un-problema-real-29b64691fed480ff851cd2e143c7f6c8> Flutter Challenge - Soluciona un problema real</a>

---

<div align="center">

</div>
