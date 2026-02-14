import 'package:feature_auth/src/models/auth_state.dart';
import 'package:feature_auth/src/providers/auth_state_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theme/theme.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _apiKeyController = TextEditingController();
  final _baseUrlController = TextEditingController(
    text: 'https://api.plane.so',
  );
  final _formKey = GlobalKey<FormState>();
  bool _obscureApiKey = true;

  @override
  void dispose() {
    _apiKeyController.dispose();
    _baseUrlController.dispose();
    super.dispose();
  }

  Future<void> _onConnect() async {
    if (!_formKey.currentState!.validate()) return;

    await ref.read(authStateNotifierProvider.notifier).login(
          apiKey: _apiKeyController.text.trim(),
          baseUrl: _baseUrlController.text.trim(),
        );
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authStateNotifierProvider);
    final isLoading = authState is Authenticating;

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 48),
                  // Logo / branding
                  Container(
                    width: 72,
                    height: 72,
                    decoration: BoxDecoration(
                      color: PlaneColors.primary,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Icon(
                      Icons.flight,
                      color: Colors.white,
                      size: 36,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Plane',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Connect with your API key',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: PlaneColors.textSecondaryLight,
                        ),
                  ),
                  const SizedBox(height: 48),

                  // Base URL field
                  TextFormField(
                    controller: _baseUrlController,
                    decoration: const InputDecoration(
                      labelText: 'Base URL',
                      hintText: 'https://api.plane.so',
                      prefixIcon: Icon(Icons.link),
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.url,
                    textInputAction: TextInputAction.next,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Base URL is required';
                      }
                      final uri = Uri.tryParse(value.trim());
                      if (uri == null || !uri.hasScheme) {
                        return 'Enter a valid URL';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),

                  // API Key field
                  TextFormField(
                    controller: _apiKeyController,
                    decoration: InputDecoration(
                      labelText: 'API Key',
                      hintText: 'plane_api_...',
                      prefixIcon: const Icon(Icons.vpn_key_outlined),
                      border: const OutlineInputBorder(),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscureApiKey
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscureApiKey = !_obscureApiKey;
                          });
                        },
                      ),
                    ),
                    obscureText: _obscureApiKey,
                    textInputAction: TextInputAction.done,
                    onFieldSubmitted: (_) => _onConnect(),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'API key is required';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 24),

                  // Error display
                  if (authState is AuthError) ...[
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: PlaneColors.errorLight,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.error_outline,
                            color: PlaneColors.error,
                            size: 20,
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              authState.message,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(color: PlaneColors.error),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                  ],

                  // Connect button
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: FilledButton(
                      onPressed: isLoading ? null : _onConnect,
                      style: FilledButton.styleFrom(
                        backgroundColor: PlaneColors.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: isLoading
                          ? const SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: Colors.white,
                              ),
                            )
                          : const Text('Connect'),
                    ),
                  ),
                  const SizedBox(height: 48),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
