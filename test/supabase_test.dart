import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:study_with_buddy/app/theme.dart';
import 'package:study_with_buddy/core/config/supabase_config.dart';
import 'package:study_with_buddy/services/supabase_service.dart';
import 'package:study_with_buddy/widgets/supabase_status_card.dart';

void main() {
  group('Phase 2 - Supabase Setup Tests', () {
    test('SupabaseConfig correctly identifies unconfigured state', () {
      // By default without .env, isConfigured should be false
      expect(SupabaseConfig.isConfigured, isFalse);
    });

    test('SupabaseService initializes gracefully when unconfigured', () async {
      final success = await SupabaseService.initialize();
      expect(success, isFalse);
      expect(SupabaseService.isInitialized, isFalse);
    });

    testWidgets('SupabaseStatusCard renders pending configuration state', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.lightTheme,
          home: const Scaffold(
            body: SupabaseStatusCard(),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Supabase: Pending Configuration'), findsOneWidget);
      expect(find.byIcon(Icons.link_off_rounded), findsOneWidget);
      expect(find.byIcon(Icons.refresh), findsOneWidget);

      // Verify tapping refresh doesn't crash
      await tester.tap(find.byIcon(Icons.refresh));
      await tester.pumpAndSettle();
    });
  });
}
