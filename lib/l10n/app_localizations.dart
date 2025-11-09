import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_es.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('es'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'AppTest'**
  String get appTitle;

  /// No description provided for @loginWelcomeBack.
  ///
  /// In en, this message translates to:
  /// **'Welcome Back'**
  String get loginWelcomeBack;

  /// No description provided for @loginSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Sign in to continue to AppTest'**
  String get loginSubtitle;

  /// No description provided for @loginEmailLabel.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get loginEmailLabel;

  /// No description provided for @loginEmailHint.
  ///
  /// In en, this message translates to:
  /// **'Enter your email'**
  String get loginEmailHint;

  /// No description provided for @loginEmailRequired.
  ///
  /// In en, this message translates to:
  /// **'Please enter your email'**
  String get loginEmailRequired;

  /// No description provided for @loginEmailInvalid.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid email'**
  String get loginEmailInvalid;

  /// No description provided for @loginPasswordLabel.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get loginPasswordLabel;

  /// No description provided for @loginPasswordHint.
  ///
  /// In en, this message translates to:
  /// **'Enter your password'**
  String get loginPasswordHint;

  /// No description provided for @loginPasswordRequired.
  ///
  /// In en, this message translates to:
  /// **'Please enter your password'**
  String get loginPasswordRequired;

  /// No description provided for @loginPasswordTooShort.
  ///
  /// In en, this message translates to:
  /// **'Password must be at least 6 characters'**
  String get loginPasswordTooShort;

  /// No description provided for @loginForgotPassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot Password?'**
  String get loginForgotPassword;

  /// No description provided for @loginSignIn.
  ///
  /// In en, this message translates to:
  /// **'Sign In'**
  String get loginSignIn;

  /// No description provided for @loginNoAccount.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account?'**
  String get loginNoAccount;

  /// No description provided for @loginSignUp.
  ///
  /// In en, this message translates to:
  /// **'Sign Up'**
  String get loginSignUp;

  /// No description provided for @loginOr.
  ///
  /// In en, this message translates to:
  /// **'OR'**
  String get loginOr;

  /// No description provided for @loginGoogle.
  ///
  /// In en, this message translates to:
  /// **'Continue with Google'**
  String get loginGoogle;

  /// No description provided for @loginApple.
  ///
  /// In en, this message translates to:
  /// **'Continue with Apple'**
  String get loginApple;

  /// No description provided for @loginErrorGeneric.
  ///
  /// In en, this message translates to:
  /// **'Login failed. Please check your credentials.'**
  String get loginErrorGeneric;

  /// No description provided for @loginErrorInvalidCredentials.
  ///
  /// In en, this message translates to:
  /// **'Invalid email or password. Please try again.'**
  String get loginErrorInvalidCredentials;

  /// No description provided for @loginErrorEmailNotConfirmed.
  ///
  /// In en, this message translates to:
  /// **'Please verify your email address first.'**
  String get loginErrorEmailNotConfirmed;

  /// No description provided for @loginErrorNetwork.
  ///
  /// In en, this message translates to:
  /// **'Network error. Please check your connection.'**
  String get loginErrorNetwork;

  /// No description provided for @loginGoogleComingSoon.
  ///
  /// In en, this message translates to:
  /// **'Google Sign In coming soon!'**
  String get loginGoogleComingSoon;

  /// No description provided for @loginAppleComingSoon.
  ///
  /// In en, this message translates to:
  /// **'Apple Sign In coming soon!'**
  String get loginAppleComingSoon;

  /// No description provided for @signupTitle.
  ///
  /// In en, this message translates to:
  /// **'Create Account'**
  String get signupTitle;

  /// No description provided for @signupSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Sign up to get started with AppTest'**
  String get signupSubtitle;

  /// No description provided for @signupNameLabel.
  ///
  /// In en, this message translates to:
  /// **'Full Name'**
  String get signupNameLabel;

  /// No description provided for @signupNameHint.
  ///
  /// In en, this message translates to:
  /// **'Enter your full name'**
  String get signupNameHint;

  /// No description provided for @signupNameRequired.
  ///
  /// In en, this message translates to:
  /// **'Please enter your name'**
  String get signupNameRequired;

  /// No description provided for @signupNameTooShort.
  ///
  /// In en, this message translates to:
  /// **'Name must be at least 2 characters'**
  String get signupNameTooShort;

  /// No description provided for @signupEmailLabel.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get signupEmailLabel;

  /// No description provided for @signupEmailHint.
  ///
  /// In en, this message translates to:
  /// **'Enter your email'**
  String get signupEmailHint;

  /// No description provided for @signupEmailRequired.
  ///
  /// In en, this message translates to:
  /// **'Please enter your email'**
  String get signupEmailRequired;

  /// No description provided for @signupEmailInvalid.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid email'**
  String get signupEmailInvalid;

  /// No description provided for @signupPasswordLabel.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get signupPasswordLabel;

  /// No description provided for @signupPasswordHint.
  ///
  /// In en, this message translates to:
  /// **'Enter your password'**
  String get signupPasswordHint;

  /// No description provided for @signupPasswordRequired.
  ///
  /// In en, this message translates to:
  /// **'Please enter your password'**
  String get signupPasswordRequired;

  /// No description provided for @signupPasswordTooShort.
  ///
  /// In en, this message translates to:
  /// **'Password must be at least 6 characters'**
  String get signupPasswordTooShort;

  /// No description provided for @signupConfirmPasswordLabel.
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get signupConfirmPasswordLabel;

  /// No description provided for @signupConfirmPasswordHint.
  ///
  /// In en, this message translates to:
  /// **'Re-enter your password'**
  String get signupConfirmPasswordHint;

  /// No description provided for @signupConfirmPasswordRequired.
  ///
  /// In en, this message translates to:
  /// **'Please confirm your password'**
  String get signupConfirmPasswordRequired;

  /// No description provided for @signupConfirmPasswordMismatch.
  ///
  /// In en, this message translates to:
  /// **'Passwords do not match'**
  String get signupConfirmPasswordMismatch;

  /// No description provided for @signupRoleLabel.
  ///
  /// In en, this message translates to:
  /// **'I am a'**
  String get signupRoleLabel;

  /// No description provided for @signupRoleClient.
  ///
  /// In en, this message translates to:
  /// **'Client'**
  String get signupRoleClient;

  /// No description provided for @signupRoleHealthProfessional.
  ///
  /// In en, this message translates to:
  /// **'Health Professional'**
  String get signupRoleHealthProfessional;

  /// No description provided for @signupRoleLogistics.
  ///
  /// In en, this message translates to:
  /// **'Logistics'**
  String get signupRoleLogistics;

  /// No description provided for @signupButton.
  ///
  /// In en, this message translates to:
  /// **'Sign Up'**
  String get signupButton;

  /// No description provided for @signupTerms.
  ///
  /// In en, this message translates to:
  /// **'By signing up, you agree to our Terms of Service and Privacy Policy'**
  String get signupTerms;

  /// No description provided for @signupAlreadyHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'Already have an account?'**
  String get signupAlreadyHaveAccount;

  /// No description provided for @signupSignIn.
  ///
  /// In en, this message translates to:
  /// **'Sign In'**
  String get signupSignIn;

  /// No description provided for @signupErrorGeneric.
  ///
  /// In en, this message translates to:
  /// **'Sign up failed. Please try again.'**
  String get signupErrorGeneric;

  /// No description provided for @forgotTitle.
  ///
  /// In en, this message translates to:
  /// **'Reset Password'**
  String get forgotTitle;

  /// No description provided for @forgotSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Enter your email to receive reset instructions'**
  String get forgotSubtitle;

  /// No description provided for @forgotCheckEmailTitle.
  ///
  /// In en, this message translates to:
  /// **'Check Your Email'**
  String get forgotCheckEmailTitle;

  /// No description provided for @forgotCheckEmailSubtitle.
  ///
  /// In en, this message translates to:
  /// **'We\'ve sent password reset instructions to your email'**
  String get forgotCheckEmailSubtitle;

  /// No description provided for @forgotEmailLabel.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get forgotEmailLabel;

  /// No description provided for @forgotEmailHint.
  ///
  /// In en, this message translates to:
  /// **'Enter your email'**
  String get forgotEmailHint;

  /// No description provided for @forgotEmailRequired.
  ///
  /// In en, this message translates to:
  /// **'Please enter your email'**
  String get forgotEmailRequired;

  /// No description provided for @forgotEmailInvalid.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid email'**
  String get forgotEmailInvalid;

  /// No description provided for @forgotSendResetLink.
  ///
  /// In en, this message translates to:
  /// **'Send Reset Link'**
  String get forgotSendResetLink;

  /// No description provided for @forgotBackToLogin.
  ///
  /// In en, this message translates to:
  /// **'Back to Login'**
  String get forgotBackToLogin;

  /// No description provided for @forgotEmailSentTitle.
  ///
  /// In en, this message translates to:
  /// **'Email Sent!'**
  String get forgotEmailSentTitle;

  /// No description provided for @forgotEmailSentSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Please check your email and follow the instructions to reset your password.'**
  String get forgotEmailSentSubtitle;

  /// No description provided for @forgotErrorGeneric.
  ///
  /// In en, this message translates to:
  /// **'Unable to send reset email. Please try again.'**
  String get forgotErrorGeneric;

  /// No description provided for @aboutTitle.
  ///
  /// In en, this message translates to:
  /// **'About Us'**
  String get aboutTitle;

  /// No description provided for @aboutAppName.
  ///
  /// In en, this message translates to:
  /// **'AppTest'**
  String get aboutAppName;

  /// No description provided for @aboutTagline.
  ///
  /// In en, this message translates to:
  /// **'Modern Consulting Platform'**
  String get aboutTagline;

  /// No description provided for @aboutMissionTitle.
  ///
  /// In en, this message translates to:
  /// **'Our Mission'**
  String get aboutMissionTitle;

  /// No description provided for @aboutMissionDescription.
  ///
  /// In en, this message translates to:
  /// **'To provide exceptional consulting services that empower individuals to achieve their health and wellness goals through personalized support and cutting-edge technology.'**
  String get aboutMissionDescription;

  /// No description provided for @aboutVisionTitle.
  ///
  /// In en, this message translates to:
  /// **'Our Vision'**
  String get aboutVisionTitle;

  /// No description provided for @aboutVisionDescription.
  ///
  /// In en, this message translates to:
  /// **'To revolutionize the consulting industry by creating seamless connections between clients and professionals, making expert guidance accessible to everyone.'**
  String get aboutVisionDescription;

  /// No description provided for @aboutValuesTitle.
  ///
  /// In en, this message translates to:
  /// **'Our Values'**
  String get aboutValuesTitle;

  /// No description provided for @aboutValuesDescription.
  ///
  /// In en, this message translates to:
  /// **'Integrity, excellence, innovation, and compassion guide everything we do. We believe in putting people first and delivering results that matter.'**
  String get aboutValuesDescription;

  /// No description provided for @aboutWhatWeOfferTitle.
  ///
  /// In en, this message translates to:
  /// **'What We Offer'**
  String get aboutWhatWeOfferTitle;

  /// No description provided for @aboutFeatureRealtimeTitle.
  ///
  /// In en, this message translates to:
  /// **'Real-time Communication'**
  String get aboutFeatureRealtimeTitle;

  /// No description provided for @aboutFeatureRealtimeDescription.
  ///
  /// In en, this message translates to:
  /// **'Connect with your team instantly through our integrated chat system.'**
  String get aboutFeatureRealtimeDescription;

  /// No description provided for @aboutFeatureSchedulingTitle.
  ///
  /// In en, this message translates to:
  /// **'Easy Scheduling'**
  String get aboutFeatureSchedulingTitle;

  /// No description provided for @aboutFeatureSchedulingDescription.
  ///
  /// In en, this message translates to:
  /// **'Book appointments and manage your calendar effortlessly.'**
  String get aboutFeatureSchedulingDescription;

  /// No description provided for @aboutFeatureCatalogTitle.
  ///
  /// In en, this message translates to:
  /// **'Product Catalog'**
  String get aboutFeatureCatalogTitle;

  /// No description provided for @aboutFeatureCatalogDescription.
  ///
  /// In en, this message translates to:
  /// **'Browse and order from our curated selection of health products.'**
  String get aboutFeatureCatalogDescription;

  /// No description provided for @aboutFeatureExpertTeamTitle.
  ///
  /// In en, this message translates to:
  /// **'Expert Team'**
  String get aboutFeatureExpertTeamTitle;

  /// No description provided for @aboutFeatureExpertTeamDescription.
  ///
  /// In en, this message translates to:
  /// **'Work with certified health professionals and logistics experts.'**
  String get aboutFeatureExpertTeamDescription;

  /// No description provided for @aboutContactTitle.
  ///
  /// In en, this message translates to:
  /// **'Get in Touch'**
  String get aboutContactTitle;

  /// No description provided for @aboutContactSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Have questions? We\'re here to help!'**
  String get aboutContactSubtitle;

  /// No description provided for @aboutContactEmail.
  ///
  /// In en, this message translates to:
  /// **'support@apptest.com'**
  String get aboutContactEmail;

  /// No description provided for @aboutVersionLabel.
  ///
  /// In en, this message translates to:
  /// **'Version 1.0.0'**
  String get aboutVersionLabel;

  /// No description provided for @aboutCopyright.
  ///
  /// In en, this message translates to:
  /// **'© 2025 AppTest. All rights reserved.'**
  String get aboutCopyright;

  /// No description provided for @appointmentsClientTitle.
  ///
  /// In en, this message translates to:
  /// **'My Appointments'**
  String get appointmentsClientTitle;

  /// No description provided for @appointmentsTeamTitle.
  ///
  /// In en, this message translates to:
  /// **'Team Appointments'**
  String get appointmentsTeamTitle;

  /// No description provided for @appointmentDialogStart.
  ///
  /// In en, this message translates to:
  /// **'Start'**
  String get appointmentDialogStart;

  /// No description provided for @appointmentDialogEnd.
  ///
  /// In en, this message translates to:
  /// **'End'**
  String get appointmentDialogEnd;

  /// No description provided for @appointmentDialogNotes.
  ///
  /// In en, this message translates to:
  /// **'Notes'**
  String get appointmentDialogNotes;

  /// No description provided for @appointmentDialogNoNotes.
  ///
  /// In en, this message translates to:
  /// **'No notes'**
  String get appointmentDialogNoNotes;

  /// No description provided for @appointmentDialogMeetingLink.
  ///
  /// In en, this message translates to:
  /// **'Meeting Link'**
  String get appointmentDialogMeetingLink;

  /// No description provided for @appointmentDialogClose.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get appointmentDialogClose;

  /// No description provided for @appointmentsTableEmpty.
  ///
  /// In en, this message translates to:
  /// **'No appointments found.'**
  String get appointmentsTableEmpty;

  /// No description provided for @appointmentsTableDate.
  ///
  /// In en, this message translates to:
  /// **'Date'**
  String get appointmentsTableDate;

  /// No description provided for @appointmentsTableTime.
  ///
  /// In en, this message translates to:
  /// **'Time'**
  String get appointmentsTableTime;

  /// No description provided for @appointmentsTableProfessional.
  ///
  /// In en, this message translates to:
  /// **'Professional'**
  String get appointmentsTableProfessional;

  /// No description provided for @appointmentsTableStatus.
  ///
  /// In en, this message translates to:
  /// **'Status'**
  String get appointmentsTableStatus;

  /// No description provided for @appointmentsTableNotes.
  ///
  /// In en, this message translates to:
  /// **'Notes'**
  String get appointmentsTableNotes;

  /// No description provided for @appointmentsTableLocation.
  ///
  /// In en, this message translates to:
  /// **'Location'**
  String get appointmentsTableLocation;

  /// No description provided for @homeWelcomeBack.
  ///
  /// In en, this message translates to:
  /// **'Welcome back,'**
  String get homeWelcomeBack;

  /// No description provided for @homeDefaultUser.
  ///
  /// In en, this message translates to:
  /// **'User'**
  String get homeDefaultUser;

  /// No description provided for @homeQuickActions.
  ///
  /// In en, this message translates to:
  /// **'Quick Actions'**
  String get homeQuickActions;

  /// No description provided for @homeActionBrowseProductsTitle.
  ///
  /// In en, this message translates to:
  /// **'Browse Products'**
  String get homeActionBrowseProductsTitle;

  /// No description provided for @homeActionBrowseProductsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'View catalog'**
  String get homeActionBrowseProductsSubtitle;

  /// No description provided for @homeActionMessagesTitle.
  ///
  /// In en, this message translates to:
  /// **'Messages'**
  String get homeActionMessagesTitle;

  /// No description provided for @homeActionMessagesSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Chat with team'**
  String get homeActionMessagesSubtitle;

  /// No description provided for @homeActionAppointmentsTitle.
  ///
  /// In en, this message translates to:
  /// **'Appointments'**
  String get homeActionAppointmentsTitle;

  /// No description provided for @homeActionAppointmentsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Schedule meeting'**
  String get homeActionAppointmentsSubtitle;

  /// No description provided for @homeActionOrdersTitle.
  ///
  /// In en, this message translates to:
  /// **'My Orders'**
  String get homeActionOrdersTitle;

  /// No description provided for @homeActionOrdersSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Track orders'**
  String get homeActionOrdersSubtitle;

  /// No description provided for @homeRecentActivity.
  ///
  /// In en, this message translates to:
  /// **'Recent Activity'**
  String get homeRecentActivity;

  /// No description provided for @homeActivitySetupTitle.
  ///
  /// In en, this message translates to:
  /// **'Setup Complete!'**
  String get homeActivitySetupTitle;

  /// No description provided for @homeActivitySetupSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Your account is ready to use'**
  String get homeActivitySetupSubtitle;

  /// No description provided for @homeActivityWelcomeTitle.
  ///
  /// In en, this message translates to:
  /// **'Welcome to AppTest'**
  String get homeActivityWelcomeTitle;

  /// No description provided for @homeActivityWelcomeSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Start exploring our features'**
  String get homeActivityWelcomeSubtitle;

  /// No description provided for @homeActivityJustNow.
  ///
  /// In en, this message translates to:
  /// **'Just now'**
  String get homeActivityJustNow;

  /// No description provided for @homeActivityToday.
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get homeActivityToday;

  /// No description provided for @productsTitle.
  ///
  /// In en, this message translates to:
  /// **'Products'**
  String get productsTitle;

  /// No description provided for @productsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Browse our health products'**
  String get productsSubtitle;

  /// No description provided for @productsSearchHint.
  ///
  /// In en, this message translates to:
  /// **'Search products...'**
  String get productsSearchHint;

  /// No description provided for @productsEmptyTitle.
  ///
  /// In en, this message translates to:
  /// **'No products available'**
  String get productsEmptyTitle;

  /// No description provided for @productsEmptySubtitle.
  ///
  /// In en, this message translates to:
  /// **'Check back later for new items'**
  String get productsEmptySubtitle;

  /// No description provided for @productsNotFoundTitle.
  ///
  /// In en, this message translates to:
  /// **'No products found'**
  String get productsNotFoundTitle;

  /// No description provided for @productsNotFoundSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Try a different search term'**
  String get productsNotFoundSubtitle;

  /// No description provided for @productsErrorTitle.
  ///
  /// In en, this message translates to:
  /// **'Failed to load products'**
  String get productsErrorTitle;

  /// No description provided for @productsErrorRetry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get productsErrorRetry;

  /// Snackbar label to view a product
  ///
  /// In en, this message translates to:
  /// **'View {productName}'**
  String productsViewProduct(Object productName);

  /// No description provided for @productsLowStock.
  ///
  /// In en, this message translates to:
  /// **'Low stock'**
  String get productsLowStock;

  /// No description provided for @productsOutOfStock.
  ///
  /// In en, this message translates to:
  /// **'Out of stock'**
  String get productsOutOfStock;

  /// No description provided for @profileEditTitle.
  ///
  /// In en, this message translates to:
  /// **'Edit Profile'**
  String get profileEditTitle;

  /// No description provided for @profileNoUser.
  ///
  /// In en, this message translates to:
  /// **'No user logged in'**
  String get profileNoUser;

  /// No description provided for @profileEmailLabel.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get profileEmailLabel;

  /// No description provided for @profileRoleLabel.
  ///
  /// In en, this message translates to:
  /// **'Role'**
  String get profileRoleLabel;

  /// No description provided for @profileFullNameLabel.
  ///
  /// In en, this message translates to:
  /// **'Full Name'**
  String get profileFullNameLabel;

  /// No description provided for @profileFullNameHint.
  ///
  /// In en, this message translates to:
  /// **'Enter your full name'**
  String get profileFullNameHint;

  /// No description provided for @profileFullNameRequired.
  ///
  /// In en, this message translates to:
  /// **'Please enter your full name'**
  String get profileFullNameRequired;

  /// No description provided for @profilePhoneLabel.
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get profilePhoneLabel;

  /// No description provided for @profilePhoneHint.
  ///
  /// In en, this message translates to:
  /// **'Enter your phone number'**
  String get profilePhoneHint;

  /// No description provided for @profilePhoneInvalid.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid phone number'**
  String get profilePhoneInvalid;

  /// No description provided for @profileSaveChanges.
  ///
  /// In en, this message translates to:
  /// **'Save Changes'**
  String get profileSaveChanges;

  /// No description provided for @profileCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get profileCancel;

  /// No description provided for @profileUpdateSuccess.
  ///
  /// In en, this message translates to:
  /// **'Profile updated successfully'**
  String get profileUpdateSuccess;

  /// No description provided for @profileUpdateError.
  ///
  /// In en, this message translates to:
  /// **'Failed to update profile. Please try again.'**
  String get profileUpdateError;

  /// No description provided for @profileLoadError.
  ///
  /// In en, this message translates to:
  /// **'Failed to load profile.'**
  String get profileLoadError;

  /// No description provided for @profileAccountSettings.
  ///
  /// In en, this message translates to:
  /// **'Account Settings'**
  String get profileAccountSettings;

  /// No description provided for @profileOptionEditProfileTitle.
  ///
  /// In en, this message translates to:
  /// **'Edit Profile'**
  String get profileOptionEditProfileTitle;

  /// No description provided for @profileOptionEditProfileSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Update your personal information'**
  String get profileOptionEditProfileSubtitle;

  /// No description provided for @profileOptionMedicalHistoryTitle.
  ///
  /// In en, this message translates to:
  /// **'Medical history'**
  String get profileOptionMedicalHistoryTitle;

  /// No description provided for @profileOptionMedicalHistorySubtitle.
  ///
  /// In en, this message translates to:
  /// **'View or edit your medical history'**
  String get profileOptionMedicalHistorySubtitle;

  /// No description provided for @profileOptionNotificationsTitle.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get profileOptionNotificationsTitle;

  /// No description provided for @profileOptionNotificationsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Manage notification preferences'**
  String get profileOptionNotificationsSubtitle;

  /// No description provided for @profileOptionPrivacyTitle.
  ///
  /// In en, this message translates to:
  /// **'Privacy & Security'**
  String get profileOptionPrivacyTitle;

  /// No description provided for @profileOptionPrivacySubtitle.
  ///
  /// In en, this message translates to:
  /// **'Password and security settings'**
  String get profileOptionPrivacySubtitle;

  /// No description provided for @profileMoreTitle.
  ///
  /// In en, this message translates to:
  /// **'More'**
  String get profileMoreTitle;

  /// No description provided for @profileOptionAboutTitle.
  ///
  /// In en, this message translates to:
  /// **'About Us'**
  String get profileOptionAboutTitle;

  /// No description provided for @profileOptionAboutSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Learn more about AppTest'**
  String get profileOptionAboutSubtitle;

  /// No description provided for @profileOptionHelpTitle.
  ///
  /// In en, this message translates to:
  /// **'Help & Support'**
  String get profileOptionHelpTitle;

  /// No description provided for @profileOptionHelpSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Get help with your account'**
  String get profileOptionHelpSubtitle;

  /// No description provided for @profileNotificationsComingSoon.
  ///
  /// In en, this message translates to:
  /// **'Notifications settings coming soon!'**
  String get profileNotificationsComingSoon;

  /// No description provided for @profileSecurityComingSoon.
  ///
  /// In en, this message translates to:
  /// **'Security settings coming soon!'**
  String get profileSecurityComingSoon;

  /// No description provided for @profileHelpComingSoon.
  ///
  /// In en, this message translates to:
  /// **'Help center coming soon!'**
  String get profileHelpComingSoon;

  /// No description provided for @profileSignOut.
  ///
  /// In en, this message translates to:
  /// **'Sign Out'**
  String get profileSignOut;

  /// No description provided for @profileSignOutConfirmTitle.
  ///
  /// In en, this message translates to:
  /// **'Sign Out'**
  String get profileSignOutConfirmTitle;

  /// No description provided for @profileSignOutConfirmMessage.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to sign out?'**
  String get profileSignOutConfirmMessage;

  /// No description provided for @profileSignOutCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get profileSignOutCancel;

  /// No description provided for @profileSignOutConfirm.
  ///
  /// In en, this message translates to:
  /// **'Sign Out'**
  String get profileSignOutConfirm;

  /// No description provided for @profileRoleAdmin.
  ///
  /// In en, this message translates to:
  /// **'Administrator'**
  String get profileRoleAdmin;

  /// No description provided for @profileRoleHealthProfessional.
  ///
  /// In en, this message translates to:
  /// **'Health Professional'**
  String get profileRoleHealthProfessional;

  /// No description provided for @profileRoleLogistics.
  ///
  /// In en, this message translates to:
  /// **'Logistics'**
  String get profileRoleLogistics;

  /// No description provided for @profileRoleClient.
  ///
  /// In en, this message translates to:
  /// **'Client'**
  String get profileRoleClient;

  /// No description provided for @mainSetupComplete.
  ///
  /// In en, this message translates to:
  /// **'Setup Complete!'**
  String get mainSetupComplete;

  /// No description provided for @mainSetupError.
  ///
  /// In en, this message translates to:
  /// **'Setup Error'**
  String get mainSetupError;

  /// No description provided for @mainSetupSuccessDetail.
  ///
  /// In en, this message translates to:
  /// **'All systems initialized successfully'**
  String get mainSetupSuccessDetail;

  /// No description provided for @mainSetupErrorDetail.
  ///
  /// In en, this message translates to:
  /// **'Could not connect to Supabase'**
  String get mainSetupErrorDetail;

  /// No description provided for @mainTechRowFlutter.
  ///
  /// In en, this message translates to:
  /// **'Flutter'**
  String get mainTechRowFlutter;

  /// No description provided for @mainTechRowTheme.
  ///
  /// In en, this message translates to:
  /// **'Theme System'**
  String get mainTechRowTheme;

  /// No description provided for @mainTechRowRiverpod.
  ///
  /// In en, this message translates to:
  /// **'Riverpod'**
  String get mainTechRowRiverpod;

  /// No description provided for @mainTechRowSupabase.
  ///
  /// In en, this message translates to:
  /// **'Supabase'**
  String get mainTechRowSupabase;

  /// No description provided for @mainFooterHighlights.
  ///
  /// In en, this message translates to:
  /// **'🎨 Soft Blue Theme • 💬 Real-time Chat • 📦 Order Management'**
  String get mainFooterHighlights;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'es'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
