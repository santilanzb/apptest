import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/theme/app_theme.dart';
import 'core/router/app_router.dart';
import 'data/services/supabase_service.dart';
import 'l10n/app_localizations.dart';


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

class MyApp extends ConsumerWidget {
  final bool supabaseInitialized;
  final String? errorMessage;
  
  const MyApp({
    super.key,
    required this.supabaseInitialized,
    this.errorMessage,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(goRouterProvider);
    
    return MaterialApp.router(
      onGenerateTitle: (context) => AppLocalizations.of(context)?.appTitle ?? 'AppTest - Consulting App',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      routerConfig: router,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
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
    final t = AppLocalizations.of(context)!;
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
                  Text(
                    t.appTitle,
                    style: const TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    t.aboutTagline,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.white70,
                    ),
                  ),
                  const SizedBox(height: 48),

                  // Status Card
                  Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: Colors.white.withValues(alpha: 0.3),
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
                              ? '✅ ${t.mainSetupComplete}'
                              : '❌ ${t.mainSetupError}',
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          supabaseInitialized
                              ? t.mainSetupSuccessDetail
                              : t.mainSetupErrorDetail,
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
                              color: Colors.red.withValues(alpha: 0.2),
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
                        _buildStatusRow(t.mainTechRowFlutter, true),
                        _buildStatusRow(t.mainTechRowTheme, true),
                        _buildStatusRow(t.mainTechRowRiverpod, true),
                        _buildStatusRow(t.mainTechRowSupabase, supabaseInitialized),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),
                  Text(
                    t.mainFooterHighlights,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
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
