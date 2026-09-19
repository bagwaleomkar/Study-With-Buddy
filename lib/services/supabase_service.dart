import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../core/config/supabase_config.dart';

/// Centralized service handling Supabase client initialization, lifecycle, and queries.
class SupabaseService {
  SupabaseService._();

  static bool _isInitialized = false;
  static bool get isInitialized => _isInitialized;

  /// Returns the global SupabaseClient instance if initialized, or throws an informative StateError.
  static SupabaseClient get client {
    if (!_isInitialized) {
      throw StateError(
        'SupabaseService has not been initialized. Ensure valid credentials in .env or --dart-define and call SupabaseService.initialize().',
      );
    }
    return Supabase.instance.client;
  }

  /// Initializes dotenv and Supabase client with graceful fallback.
  static Future<bool> initialize() async {
    // 1. Attempt to load .env file if available
    try {
      await dotenv.load(fileName: '.env');
    } catch (_) {
      debugPrint('[SupabaseService] No .env asset found; falling back to compile-time variables or defaults.');
    }

    // 2. Validate configuration
    if (!SupabaseConfig.isConfigured) {
      debugPrint('[SupabaseService] Notice: Supabase credentials not configured yet.');
      _isInitialized = false;
      return false;
    }

    // 3. Initialize Supabase
    try {
      await Supabase.initialize(
        url: SupabaseConfig.url,
        // ignore: deprecated_member_use
        anonKey: SupabaseConfig.anonKey,
      );

      _isInitialized = true;
      debugPrint('[SupabaseService] Connected to Supabase successfully.');
      return true;
    } catch (e, stackTrace) {
      debugPrint('[SupabaseService] Failed to initialize Supabase: $e');
      debugPrint('$stackTrace');
      _isInitialized = false;
      return false;
    }
  }

  /// Pings the database to verify live connectivity.
  static Future<bool> checkConnection() async {
    if (!_isInitialized) return false;

    try {
      // Perform a lightweight query on the public schema
      await client.from('users').select('id').limit(1);
      return true;
    } catch (e) {
      debugPrint('[SupabaseService] Connection check failed: $e');
      return false;
    }
  }
}
