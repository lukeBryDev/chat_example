import 'package:flutter_dotenv/flutter_dotenv.dart';

class Env {
  late EnvMode _mode;

  static final Env _instance = Env._internal();

  Env._internal();

  factory Env(EnvMode mode) {
    _instance._mode = mode;

    _apiProduction = dotenv.env['API_PRODUCTION']!;
    _apiSandbox = dotenv.env['API_SANDBOX']!;
    _apiLocal = dotenv.env['API_LOCAL']!;

    _socketUriProduction = dotenv.env['SOCKET_URI_PRODUCTION']!;
    _socketUriSandbox = dotenv.env['SOCKET_URI_SANDBOX']!;
    _socketUriLocal = dotenv.env['SOCKET_URI_LOCAL']!;

    return _instance;
  }

  static EnvMode get mode => _instance._mode;

  static String _apiProduction = "";
  static String _apiSandbox = "";
  static String _apiLocal = "";

  static String _socketUriProduction = "";
  static String _socketUriSandbox = "";
  static String _socketUriLocal = "";

  static String get api {
    switch (_instance._mode) {
      case EnvMode.production:
        return _apiProduction;
      case EnvMode.sandbox:
        return _apiSandbox;
      case EnvMode.local:
        return _apiLocal;
    }
  }

  static String get socketUri {
    switch (_instance._mode) {
      case EnvMode.production:
        return _socketUriProduction;
      case EnvMode.sandbox:
        return _socketUriSandbox;
      case EnvMode.local:
        return _socketUriLocal;
    }
  }
}

enum EnvMode {
  production,
  sandbox,
  local,
}

extension EnvModeExtension on EnvMode {
  String get label {
    Map<EnvMode, String> fromStoreGpsType = {
      EnvMode.production: "production",
      EnvMode.sandbox: "sandbox",
      EnvMode.local: "local",
    };

    return fromStoreGpsType[this] ?? '';
  }
}
