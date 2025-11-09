import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constants/colors.dart';
import '../../../core/constants/text_styles.dart';
import '../../providers/auth_provider.dart';
import '../../widgets/common/custom_button.dart';
import '../../widgets/common/custom_text_field.dart';
import 'package:apptest/l10n/app_localizations.dart';

class SignupScreen extends ConsumerStatefulWidget {
  const SignupScreen({super.key});

  @override
  ConsumerState<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends ConsumerState<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  bool _isLoading = false;
  String _selectedRole = 'client';

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> _handleSignup() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    try {
      await ref.read(authProvider.notifier).signUp(
        email: _emailController.text.trim(),
        password: _passwordController.text,
        fullName: _nameController.text.trim(),
        role: _selectedRole,
      );

      if (mounted) {
        // Navigation will be handled by router
      }
    } catch (e) {
      if (mounted) {
        final t = AppLocalizations.of(context)!;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(t.signupErrorGeneric),
            backgroundColor: AppColors.error,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

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
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Logo
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.2),
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white.withValues(alpha: 0.3),
                        width: 2,
                      ),
                    ),
                    child: const Icon(
                      Icons.health_and_safety_rounded,
                      size: 64,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 24),

                  Text(
                    t.signupTitle,
                    style: AppTextStyles.h1.copyWith(
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    t.signupSubtitle,
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: Colors.white70,
                    ),
                  ),
                  const SizedBox(height: 48),

                  // Signup Form Card
                  Container(
                    constraints: const BoxConstraints(maxWidth: 400),
                    padding: const EdgeInsets.all(32),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.1),
                          blurRadius: 20,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          CustomTextField(
                            controller: _nameController,
                            label: t.signupNameLabel,
                            hint: t.signupNameHint,
                            keyboardType: TextInputType.name,
                            prefixIcon: const Icon(Icons.person_outlined),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return t.signupNameRequired;
                              }
                              if (value.length < 2) {
                                return t.signupNameTooShort;
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 20),

                          CustomTextField(
                            controller: _emailController,
                            label: t.signupEmailLabel,
                            hint: t.signupEmailHint,
                            keyboardType: TextInputType.emailAddress,
                            prefixIcon: const Icon(Icons.email_outlined),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return t.signupEmailRequired;
                              }
                              if (!value.contains('@')) {
                                return t.signupEmailInvalid;
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 20),

                          CustomTextField(
                            controller: _passwordController,
                            label: t.signupPasswordLabel,
                            hint: t.signupPasswordHint,
                            obscureText: _obscurePassword,
                            prefixIcon: const Icon(Icons.lock_outlined),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _obscurePassword
                                    ? Icons.visibility_outlined
                                    : Icons.visibility_off_outlined,
                              ),
                              onPressed: () {
                                setState(() {
                                  _obscurePassword = !_obscurePassword;
                                });
                              },
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return t.signupPasswordRequired;
                              }
                              if (value.length < 6) {
                                return t.signupPasswordTooShort;
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 20),

                          CustomTextField(
                            controller: _confirmPasswordController,
                            label: t.signupConfirmPasswordLabel,
                            hint: t.signupConfirmPasswordHint,
                            obscureText: _obscureConfirmPassword,
                            prefixIcon: const Icon(Icons.lock_outlined),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _obscureConfirmPassword
                                    ? Icons.visibility_outlined
                                    : Icons.visibility_off_outlined,
                              ),
                              onPressed: () {
                                setState(() {
                                  _obscureConfirmPassword = !_obscureConfirmPassword;
                                });
                              },
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return t.signupConfirmPasswordRequired;
                              }
                              if (value != _passwordController.text) {
                                return t.signupConfirmPasswordMismatch;
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 20),

                          // Role Selection (optional - hidden by default for clients)
                          Text(
                            t.signupRoleLabel,
                            style: AppTextStyles.label.copyWith(
                              color: AppColors.textPrimary,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Wrap(
                            spacing: 12,
                            runSpacing: 12,
                            children: [
                              _buildRoleChip(t.signupRoleClient, 'client', Icons.person),
                              _buildRoleChip(t.signupRoleHealthProfessional, 'health_professional', Icons.medical_services),
                              _buildRoleChip(t.signupRoleLogistics, 'logistics', Icons.local_shipping),
                            ],
                          ),
                          const SizedBox(height: 32),

                          CustomButton(
                            text: t.signupButton,
                            onPressed: _handleSignup,
                            isLoading: _isLoading,
                          ),
                          const SizedBox(height: 24),

                          // Terms
                          Text(
                            t.signupTerms,
                            textAlign: TextAlign.center,
                            style: AppTextStyles.caption.copyWith(
                              color: AppColors.textTertiary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Sign In Link
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${t.signupAlreadyHaveAccount} ',
                        style: AppTextStyles.bodyMedium.copyWith(
                          color: Colors.white70,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          context.go('/auth/login');
                        },
                        child: Text(
                          t.signupSignIn,
                          style: AppTextStyles.bodyMedium.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRoleChip(String label, String value, IconData icon) {
    final isSelected = _selectedRole == value;
    
    return ChoiceChip(
      label: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 18,
            color: isSelected ? AppColors.textOnPrimary : AppColors.textSecondary,
          ),
          const SizedBox(width: 8),
          Text(label),
        ],
      ),
      selected: isSelected,
      onSelected: (selected) {
        if (selected) {
          setState(() {
            _selectedRole = value;
          });
        }
      },
      backgroundColor: AppColors.cardBg,
      selectedColor: AppColors.primary,
      labelStyle: AppTextStyles.labelSmall.copyWith(
        color: isSelected ? AppColors.textOnPrimary : AppColors.textSecondary,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(
          color: isSelected ? AppColors.primary : AppColors.border,
        ),
      ),
    );
  }
}
