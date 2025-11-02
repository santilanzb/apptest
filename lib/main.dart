import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/theme/app_theme.dart';
import 'data/services/supabase_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  bool supabaseInitialized = false;
  String? errorMessage;
  
  try {
    // Initialize Supabase
    await SupabaseService.initialize();
    supabaseInitialized = true;
    debugPrint('✅ Supabase initialized successfully');
  } catch (e) {
    errorMessage = e.toString();
    debugPrint('❌ Error initializing Supabase: $e');
  }
  
  runApp(
    ProviderScope(
      child: MyApp(
        supabaseInitialized: supabaseInitialized,
        errorMessage: errorMessage,
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  final bool supabaseInitialized;
  final String? errorMessage;
  
  const MyApp({
    super.key,
    required this.supabaseInitialized,
    this.errorMessage,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AppTest - Consulting App',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: TestHomeScreen(
        supabaseInitialized: supabaseInitialized,
        errorMessage: errorMessage,
      ),
    );
  }
}

class TestHomeScreen extends StatelessWidget {
  final bool supabaseInitialized;
  final String? errorMessage;
  
  const TestHomeScreen({
    super.key,
    required this.supabaseInitialized,
    this.errorMessage,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF6B9FE8),
              Color(0xFFA8CAFF),
            ],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.health_and_safety_rounded,
                    size: 120,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'AppTest',
                    style: TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Modern Consulting Platform',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white70,
                    ),
                  ),
                  const SizedBox(height: 48),
                  
                  // Status Card
                  Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: Colors.white.withOpacity(0.3),
                        width: 1,
                      ),
                    ),
                    child: Column(
                      children: [
                        Icon(
                          supabaseInitialized ? Icons.check_circle : Icons.error,
                          size: 64,
                          color: supabaseInitialized ? Colors.white : Colors.red[200],
                        ),
                        const SizedBox(height: 16),
                        Text(
                          supabaseInitialized
                              ? '✅ Setup Complete!'
                              : '❌ Setup Error',
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          supabaseInitialized
                              ? 'All systems initialized successfully'
                              : 'Could not connect to Supabase',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.white70,
                          ),
                        ),
                        if (errorMessage != null) const SizedBox(height: 16),
                        if (errorMessage != null)
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.red.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              errorMessage!,
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                                fontFamily: 'monospace',
                              ),
                            ),
                          ),
                        const SizedBox(height: 24),
                        const Divider(color: Colors.white24),
                        const SizedBox(height: 16),
                        _buildStatusRow('Flutter', true),
                        _buildStatusRow('Theme System', true),
                        _buildStatusRow('Riverpod', true),
                        _buildStatusRow('Supabase', supabaseInitialized),
                      ],
                    ),
                  ),
                  
                  const SizedBox(height: 24),
                  const Text(
                    '🎨 Soft Blue Theme • 💬 Real-time Chat • 📦 Order Management',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white60,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  
  Widget _buildStatusRow(String label, bool status) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.white,
            ),
          ),
          Icon(
            status ? Icons.check_circle_outline : Icons.cancel_outlined,
            size: 20,
            color: status ? Colors.greenAccent : Colors.red[200],
          ),
        ],
      ),
    );
  }
}
