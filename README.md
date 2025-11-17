# 🌦️ Weather App

Aplicación desarrollada en **Flutter**, utilizando **Clean Architecture**, manejo de **flavors**, geolocalización y Google Maps para mostrar la ubicación del usuario junto con información del clima.

---

## 🧱 Arquitectura Limpia

Este proyecto sigue los principios de **Clean Architecture**, separando el código en capas independientes:

### **Domain**
- Entidades
- Casos de uso
- Repositorios abstractos

### **Data**
- Datasources
- Modelos
- Implementaciones de repositorios

### **Presentation**
- UI (Widgets y Pages)
- Controladores / Estado
- Providers / BLoC (según implementación)

Esto permite tener un código modular, escalable y fácil de probar.

---

## 📍 Geolocalización

El proyecto utiliza:

- **geolocator** → para obtener las coordenadas del usuario  
- **google_maps_flutter** → para mostrar la ubicación en un mapa

### Funcionalidades:
- Solicitud de permisos de ubicación
- Obtención de posición actual
- Renderizado de mapa con marcador inicial usando Google Maps

---

## 🍏 Flavors (dev / prod)

Para manejar los diferentes entornos se utiliza:

### **flutter_flavorizr**

Este paquete automatiza la creación de los flavors:

- `dev`
- `prod`

Cada flavor tiene:
- Nombre de app distinto
- Configuración independiente
- Rutas de íconos personalizadas

---

## 🔐 Variables de entorno

Las variables específicas por entorno se gestionan mediante:

### `enum Flavor { dev, prod }`  
### Clase centralizada `F`

```dart
enum Flavor { dev, prod }

class F {
  static late final Flavor appFlavor;

  static String get name => appFlavor.name;

  static String get title {
    switch (appFlavor) {
      case Flavor.dev:
        return 'Weather Dev';
      case Flavor.prod:
        return 'Weather App';
    }
  }

  static String get apiKey {
    switch (appFlavor) {
      case Flavor.dev:
        return 'SMTCDLYN5X3CMN9KLJKU7ATWV';
      case Flavor.prod:
        return 'SMTCDLYN5X3CMN9KLJKU7ATWV';
    }
  }

  /// 🔥 Base URL quemada
  static String get baseUrl {
    switch (appFlavor) {
      case Flavor.dev:
        return 'https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/';
      case Flavor.prod:
        return 'https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/';
    }
  }

  static String get weatherIconBasePath {
    switch (appFlavor) {
      case Flavor.dev:
        return 'assets/icons/dev/';
      case Flavor.prod:
        return 'assets/icons/prod/';
    }
  }
}
