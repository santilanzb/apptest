import 'package:flutter/material.dart';

/// App Color Palette - Soft Blue Theme
class AppColors {
  // Primary Colors - Soft Blue Shades
  static const Color primary = Color(0xFF6B9FE8);
  static const Color primaryLight = Color(0xFFA8CAFF);
  static const Color primaryDark = Color(0xFF4A7BC4);
  
  // Accent Colors
  static const Color accent = Color(0xFFFFB84D); // Warm Orange
  static const Color success = Color(0xFF7FD8BE); // Mint Green
  static const Color error = Color(0xFFFF7B7B); // Soft Red
  static const Color warning = Color(0xFFFFC960); // Soft Yellow
  static const Color info = Color(0xFF64B5F6); // Light Blue
  
  // Neutral Colors
  static const Color background = Color(0xFFF8FAFF); // Almost White Blue
  static const Color surface = Color(0xFFFFFFFF); // Pure White
  static const Color cardBg = Color(0xFFF0F4FF); // Light Blue Gray
  
  // Text Colors
  static const Color textPrimary = Color(0xFF1A2335);
  static const Color textSecondary = Color(0xFF6B7280);
  static const Color textTertiary = Color(0xFF9CA3AF);
  static const Color textOnPrimary = Color(0xFFFFFFFF);
  
  // Border & Divider
  static const Color border = Color(0xFFE5E7EB);
  static const Color divider = Color(0xFFF3F4F6);
  
  // Glassmorphism
  static const Color glassBg = Color(0x1AFFFFFF);
  static const Color glassStroke = Color(0x33FFFFFF);
  
  // Gradients
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [primary, primaryLight],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  
  static const LinearGradient accentGradient = LinearGradient(
    colors: [accent, Color(0xFFFFD88D)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  
  static const LinearGradient backgroundGradient = LinearGradient(
    colors: [background, Color(0xFFE8F1FF)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
  
  // Role-based Colors
  static const Color clientColor = Color(0xFF6B9FE8); // Soft Blue
  static const Color healthProfessionalColor = Color(0xFF7FD8BE); // Mint
  static const Color logisticsColor = Color(0xFFFFB84D); // Orange
  static const Color adminColor = Color(0xFF9B7BF5); // Purple
  
  // Status Colors
  static const Color statusPending = Color(0xFFFFC960);
  static const Color statusConfirmed = Color(0xFF64B5F6);
  static const Color statusInProgress = Color(0xFFFFB84D);
  static const Color statusCompleted = Color(0xFF7FD8BE);
  static const Color statusCancelled = Color(0xFFFF7B7B);
}
