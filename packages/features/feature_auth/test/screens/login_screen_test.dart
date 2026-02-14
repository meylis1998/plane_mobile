import 'package:feature_auth/src/models/auth_state.dart';
import 'package:feature_auth/src/providers/auth_state_provider.dart';
import 'package:feature_auth/src/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

class _FakeAuthNotifier extends AuthStateNotifier {
  AuthState _state = const AuthState.unauthenticated();

  @override
  AuthState build() => _state;

  void setState(AuthState newState) {
    _state = newState;
    state = newState;
  }

  @override
  Future<void> login({
    required String apiKey,
    required String baseUrl,
  }) async {
    state = const AuthState.authenticating();
    // Don't do real API calls in tests
  }

  @override
  Future<void> logout() async {
    state = const AuthState.unauthenticated();
  }

  @override
  Future<void> checkAuth() async {}
}

Widget _buildApp({_FakeAuthNotifier? authNotifier}) {
  final notifier = authNotifier ?? _FakeAuthNotifier();
  return ProviderScope(
    overrides: [
      authStateNotifierProvider.overrideWith(() => notifier),
    ],
    child: const MaterialApp(
      home: LoginScreen(),
    ),
  );
}

void main() {
  group('LoginScreen', () {
    testWidgets('renders branding elements', (tester) async {
      await tester.pumpWidget(_buildApp());
      await tester.pumpAndSettle();

      expect(find.text('Plane'), findsOneWidget);
      expect(find.text('Connect with your API key'), findsOneWidget);
    });

    testWidgets('renders base URL and API key fields', (tester) async {
      await tester.pumpWidget(_buildApp());
      await tester.pumpAndSettle();

      expect(find.text('Base URL'), findsOneWidget);
      expect(find.text('API Key'), findsOneWidget);
    });

    testWidgets('renders Connect button', (tester) async {
      await tester.pumpWidget(_buildApp());
      await tester.pumpAndSettle();

      expect(find.text('Connect'), findsOneWidget);
    });

    testWidgets('base URL defaults to https://api.plane.so', (tester) async {
      await tester.pumpWidget(_buildApp());
      await tester.pumpAndSettle();

      final baseUrlField = find.byType(TextFormField).first;
      expect(baseUrlField, findsOneWidget);

      final textField = tester.widget<TextFormField>(baseUrlField);
      expect(textField.controller?.text, 'https://api.plane.so');
    });

    testWidgets('validates empty API key', (tester) async {
      await tester.pumpWidget(_buildApp());
      await tester.pumpAndSettle();

      await tester.tap(find.text('Connect'));
      await tester.pumpAndSettle();

      expect(find.text('API key is required'), findsOneWidget);
    });

    testWidgets('validates empty base URL', (tester) async {
      await tester.pumpWidget(_buildApp());
      await tester.pumpAndSettle();

      // Clear the default base URL
      final baseUrlFields = find.byType(TextFormField);
      await tester.enterText(baseUrlFields.first, '');

      await tester.tap(find.text('Connect'));
      await tester.pumpAndSettle();

      expect(find.text('Base URL is required'), findsOneWidget);
    });

    testWidgets('validates invalid URL', (tester) async {
      await tester.pumpWidget(_buildApp());
      await tester.pumpAndSettle();

      final baseUrlFields = find.byType(TextFormField);
      await tester.enterText(baseUrlFields.first, 'not-a-url');

      await tester.tap(find.text('Connect'));
      await tester.pumpAndSettle();

      expect(find.text('Enter a valid URL'), findsOneWidget);
    });

    testWidgets('shows loading state during authentication', (tester) async {
      final notifier = _FakeAuthNotifier();
      await tester.pumpWidget(_buildApp(authNotifier: notifier));
      await tester.pumpAndSettle();

      // Enter valid API key and base URL
      final fields = find.byType(TextFormField);
      await tester.enterText(fields.at(1), 'plane_api_test_key');

      // Tap connect
      await tester.tap(find.text('Connect'));
      await tester.pump();

      // Should show a loading indicator
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('shows error message when auth fails', (tester) async {
      final notifier = _FakeAuthNotifier();
      await tester.pumpWidget(_buildApp(authNotifier: notifier));
      await tester.pumpAndSettle();

      // Set error state
      notifier.setState(const AuthState.error('Invalid API key'));
      await tester.pumpAndSettle();

      expect(find.text('Invalid API key'), findsOneWidget);
      expect(find.byIcon(Icons.error_outline), findsOneWidget);
    });

    testWidgets('toggle API key visibility', (tester) async {
      await tester.pumpWidget(_buildApp());
      await tester.pumpAndSettle();

      // Initially the API key should be obscured
      expect(find.byIcon(Icons.visibility_off), findsOneWidget);

      // Tap visibility toggle
      await tester.tap(find.byIcon(Icons.visibility_off));
      await tester.pump();

      expect(find.byIcon(Icons.visibility), findsOneWidget);
    });
  });
}
