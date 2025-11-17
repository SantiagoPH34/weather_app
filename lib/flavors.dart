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
        // Usa íconos 'dev' que pueden ser diferentes (ej. marcas de agua)
        return 'assets/icons/dev/';
      case Flavor.prod:
        // Usa íconos 'prod' limpios
        return 'assets/icons/prod/';
    }
  }
}
