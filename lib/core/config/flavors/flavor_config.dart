enum Flavor {
  dev,
  prod,
}

class FlavorConfig {
  final Flavor flavor;
  final String name;
  final String baseUrl;
  final String apiKey;

  static late FlavorConfig instance;

  factory FlavorConfig({
    required Flavor flavor,
    required String name,
    required String baseUrl,
    required String apiKey,
  }) {
    instance = FlavorConfig._internal(flavor, name, baseUrl, apiKey);
    return instance;
  }

  FlavorConfig._internal(this.flavor, this.name, this.baseUrl, this.apiKey);

  static bool get isProd => instance.flavor == Flavor.prod;
  static bool get isDev => instance.flavor == Flavor.dev;
}
