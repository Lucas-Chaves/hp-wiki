import '../../src/features/features.dart';

class CustomRoutes {
  static customRoute<String, WidgetBuilder>() {
    return {
      '/home': (context) => const HomePage(),
    };
  }
}
