import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:study_with_buddy/app/app.dart';
import 'package:study_with_buddy/app/theme.dart';
import 'package:study_with_buddy/screens/main_navigation_screen.dart';
import 'package:study_with_buddy/widgets/custom_button.dart';
import 'package:study_with_buddy/widgets/custom_text_field.dart';
import 'package:study_with_buddy/widgets/error_view.dart';
import 'package:study_with_buddy/widgets/loading_indicator.dart';

void main() {
  group('Phase 1 - App Foundation Tests', () {
    testWidgets('App renders splash screen initially and transitions to home', (WidgetTester tester) async {
      await tester.pumpWidget(const StudyWithBuddyApp());

      expect(find.text('Study With Buddy'), findsWidgets);
      expect(find.text('Connect, Collaborate, & Study Together'), findsOneWidget);

      // Advance past splash delay
      await tester.pump(const Duration(milliseconds: 1600));
      await tester.pumpAndSettle();

      // Verifies smooth transition into the main navigation & home screen
      expect(find.text('Welcome back, Student!'), findsOneWidget);
    });

    testWidgets('MainNavigationScreen switches tabs properly', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.lightTheme,
          home: const MainNavigationScreen(),
        ),
      );
      await tester.pumpAndSettle();

      // Starts on Home tab
      expect(find.text('Welcome back, Student!'), findsOneWidget);

      // Tap Buddy tab
      await tester.tap(find.byIcon(Icons.people_outline_rounded));
      await tester.pumpAndSettle();
      expect(find.text('Buddy System'), findsOneWidget);

      // Tap Tasks tab
      await tester.tap(find.byIcon(Icons.check_circle_outline_rounded));
      await tester.pumpAndSettle();
      expect(find.text('Task Management'), findsOneWidget);

      // Tap Study tab
      await tester.tap(find.byIcon(Icons.timer_outlined));
      await tester.pumpAndSettle();
      expect(find.text('Collaborative Study Sessions'), findsOneWidget);

      // Tap Profile tab
      await tester.tap(find.byIcon(Icons.person_outline_rounded));
      await tester.pumpAndSettle();
      expect(find.text('Student Account'), findsOneWidget);
    });

    testWidgets('Reusable widgets render and respond correctly', (WidgetTester tester) async {
      bool buttonClicked = false;

      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.lightTheme,
          home: Scaffold(
            body: Column(
              children: [
                CustomButton(
                  text: 'Submit',
                  onPressed: () {
                    buttonClicked = true;
                  },
                ),
                const CustomTextField(
                  label: 'Email',
                  hintText: 'Enter your email',
                ),
                const AppLoadingIndicator(message: 'Loading data...'),
                const AppErrorView(message: 'Failed to fetch items'),
              ],
            ),
          ),
        ),
      );

      expect(find.text('Submit'), findsOneWidget);
      expect(find.text('Email'), findsOneWidget);
      expect(find.text('Loading data...'), findsOneWidget);
      expect(find.text('Failed to fetch items'), findsOneWidget);

      await tester.tap(find.text('Submit'));
      expect(buttonClicked, isTrue);
    });
  });
}
