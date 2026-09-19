import 'package:flutter_dotenv/flutter_dotenv.dart';

/// Manages Supabase configuration and environment variables.
class SupabaseConfig {
  SupabaseConfig._();

  // Can be provided via --dart-define or loaded from .env
  static const String _defineUrl = String.fromEnvironment('SUPABASE_URL', defaultValue: '');
  static const String _defineAnonKey = String.fromEnvironment('SUPABASE_ANON_KEY', defaultValue: '');

  static String get url {
    if (_defineUrl.isNotEmpty) return _defineUrl;
    if (dotenv.isInitialized) {
      return dotenv.env['SUPABASE_URL'] ?? '';
    }
    return '';
  }

  static String get anonKey {
    if (_defineAnonKey.isNotEmpty) return _defineAnonKey;
    if (dotenv.isInitialized) {
      return dotenv.env['SUPABASE_ANON_KEY'] ?? '';
    }
    return '';
  }


  /// Checks whether valid Supabase credentials have been supplied.
  static bool get isConfigured {
    final u = url.trim();
    final k = anonKey.trim();
    return u.isNotEmpty &&
        k.isNotEmpty &&
        !u.contains('your-project-ref') &&
        !k.contains('your-anon-key');
  }
}
