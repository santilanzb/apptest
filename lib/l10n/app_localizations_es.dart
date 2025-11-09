// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appTitle => 'AppTest';

  @override
  String get loginWelcomeBack => 'Bienvenido de nuevo';

  @override
  String get loginSubtitle => 'Inicia sesión para continuar en AppTest';

  @override
  String get loginEmailLabel => 'Correo electrónico';

  @override
  String get loginEmailHint => 'Introduce tu correo electrónico';

  @override
  String get loginEmailRequired => 'Por favor introduce tu correo electrónico';

  @override
  String get loginEmailInvalid =>
      'Por favor introduce un correo electrónico válido';

  @override
  String get loginPasswordLabel => 'Contraseña';

  @override
  String get loginPasswordHint => 'Introduce tu contraseña';

  @override
  String get loginPasswordRequired => 'Por favor introduce tu contraseña';

  @override
  String get loginPasswordTooShort =>
      'La contraseña debe tener al menos 6 caracteres';

  @override
  String get loginForgotPassword => '¿Olvidaste tu contraseña?';

  @override
  String get loginSignIn => 'Iniciar sesión';

  @override
  String get loginNoAccount => '¿No tienes una cuenta?';

  @override
  String get loginSignUp => 'Regístrate';

  @override
  String get loginOr => 'O';

  @override
  String get loginGoogle => 'Continuar con Google';

  @override
  String get loginApple => 'Continuar con Apple';

  @override
  String get loginErrorGeneric =>
      'Error al iniciar sesión. Verifica tus credenciales.';

  @override
  String get loginErrorInvalidCredentials =>
      'Correo o contraseña inválidos. Inténtalo de nuevo.';

  @override
  String get loginErrorEmailNotConfirmed =>
      'Primero verifica tu dirección de correo.';

  @override
  String get loginErrorNetwork => 'Error de red. Revisa tu conexión.';

  @override
  String get loginGoogleComingSoon =>
      'Inicio de sesión con Google pronto disponible';

  @override
  String get loginAppleComingSoon =>
      'Inicio de sesión con Apple pronto disponible';

  @override
  String get signupTitle => 'Crear cuenta';

  @override
  String get signupSubtitle => 'Regístrate para comenzar con AppTest';

  @override
  String get signupNameLabel => 'Nombre completo';

  @override
  String get signupNameHint => 'Introduce tu nombre completo';

  @override
  String get signupNameRequired => 'Por favor introduce tu nombre';

  @override
  String get signupNameTooShort => 'El nombre debe tener al menos 2 caracteres';

  @override
  String get signupEmailLabel => 'Correo electrónico';

  @override
  String get signupEmailHint => 'Introduce tu correo electrónico';

  @override
  String get signupEmailRequired => 'Por favor introduce tu correo electrónico';

  @override
  String get signupEmailInvalid =>
      'Por favor introduce un correo electrónico válido';

  @override
  String get signupPasswordLabel => 'Contraseña';

  @override
  String get signupPasswordHint => 'Introduce tu contraseña';

  @override
  String get signupPasswordRequired => 'Por favor introduce tu contraseña';

  @override
  String get signupPasswordTooShort =>
      'La contraseña debe tener al menos 6 caracteres';

  @override
  String get signupConfirmPasswordLabel => 'Confirmar contraseña';

  @override
  String get signupConfirmPasswordHint => 'Vuelve a introducir tu contraseña';

  @override
  String get signupConfirmPasswordRequired =>
      'Por favor confirma tu contraseña';

  @override
  String get signupConfirmPasswordMismatch => 'Las contraseñas no coinciden';

  @override
  String get signupRoleLabel => 'Soy';

  @override
  String get signupRoleClient => 'Cliente';

  @override
  String get signupRoleHealthProfessional => 'Profesional de la salud';

  @override
  String get signupRoleLogistics => 'Logística';

  @override
  String get signupButton => 'Registrarse';

  @override
  String get signupTerms =>
      'Al registrarte, aceptas nuestros Términos de servicio y Política de privacidad';

  @override
  String get signupAlreadyHaveAccount => '¿Ya tienes una cuenta?';

  @override
  String get signupSignIn => 'Iniciar sesión';

  @override
  String get signupErrorGeneric => 'Error al registrarse. Inténtalo de nuevo.';

  @override
  String get forgotTitle => 'Restablecer contraseña';

  @override
  String get forgotSubtitle =>
      'Introduce tu correo electrónico para recibir instrucciones';

  @override
  String get forgotCheckEmailTitle => 'Revisa tu correo';

  @override
  String get forgotCheckEmailSubtitle =>
      'Hemos enviado instrucciones para restablecer tu contraseña';

  @override
  String get forgotEmailLabel => 'Correo electrónico';

  @override
  String get forgotEmailHint => 'Introduce tu correo electrónico';

  @override
  String get forgotEmailRequired => 'Por favor introduce tu correo electrónico';

  @override
  String get forgotEmailInvalid =>
      'Por favor introduce un correo electrónico válido';

  @override
  String get forgotSendResetLink => 'Enviar enlace de restablecimiento';

  @override
  String get forgotBackToLogin => 'Volver al inicio de sesión';

  @override
  String get forgotEmailSentTitle => 'Correo enviado';

  @override
  String get forgotEmailSentSubtitle =>
      'Revisa tu correo y sigue las instrucciones para restablecer tu contraseña.';

  @override
  String get forgotErrorGeneric =>
      'No se pudo enviar el correo de restablecimiento. Inténtalo de nuevo.';

  @override
  String get aboutTitle => 'Sobre nosotros';

  @override
  String get aboutAppName => 'AppTest';

  @override
  String get aboutTagline => 'Plataforma moderna de consultoría';

  @override
  String get aboutMissionTitle => 'Nuestra misión';

  @override
  String get aboutMissionDescription =>
      'Brindar servicios de consultoría excepcionales que empoderen a las personas a alcanzar sus metas de salud y bienestar mediante apoyo personalizado y tecnología de vanguardia.';

  @override
  String get aboutVisionTitle => 'Nuestra visión';

  @override
  String get aboutVisionDescription =>
      'Revolucionar la industria de la consultoría creando conexiones fluidas entre clientes y profesionales, haciendo que la orientación experta sea accesible para todos.';

  @override
  String get aboutValuesTitle => 'Nuestros valores';

  @override
  String get aboutValuesDescription =>
      'La integridad, la excelencia, la innovación y la empatía guían todo lo que hacemos. Creemos en poner a las personas primero y entregar resultados que importan.';

  @override
  String get aboutWhatWeOfferTitle => 'Qué ofrecemos';

  @override
  String get aboutFeatureRealtimeTitle => 'Comunicación en tiempo real';

  @override
  String get aboutFeatureRealtimeDescription =>
      'Conéctate con tu equipo al instante a través de nuestro sistema de chat integrado.';

  @override
  String get aboutFeatureSchedulingTitle => 'Programación sencilla';

  @override
  String get aboutFeatureSchedulingDescription =>
      'Agenda citas y gestiona tu calendario sin complicaciones.';

  @override
  String get aboutFeatureCatalogTitle => 'Catálogo de productos';

  @override
  String get aboutFeatureCatalogDescription =>
      'Explora y ordena de nuestra selección curada de productos de salud.';

  @override
  String get aboutFeatureExpertTeamTitle => 'Equipo experto';

  @override
  String get aboutFeatureExpertTeamDescription =>
      'Trabaja con profesionales de la salud certificados y expertos en logística.';

  @override
  String get aboutContactTitle => 'Contáctanos';

  @override
  String get aboutContactSubtitle =>
      '¿Tienes preguntas? Estamos aquí para ayudarte.';

  @override
  String get aboutContactEmail => 'support@apptest.com';

  @override
  String get aboutVersionLabel => 'Versión 1.0.0';

  @override
  String get aboutCopyright => '© 2025 AppTest. Todos los derechos reservados.';

  @override
  String get appointmentsClientTitle => 'Mis citas';

  @override
  String get appointmentsTeamTitle => 'Citas del equipo';

  @override
  String get appointmentDialogStart => 'Inicio';

  @override
  String get appointmentDialogEnd => 'Fin';

  @override
  String get appointmentDialogNotes => 'Notas';

  @override
  String get appointmentDialogNoNotes => 'Sin notas';

  @override
  String get appointmentDialogMeetingLink => 'Enlace de reunión';

  @override
  String get appointmentDialogClose => 'Cerrar';

  @override
  String get appointmentsTableEmpty => 'No se encontraron citas.';

  @override
  String get appointmentsTableDate => 'Fecha';

  @override
  String get appointmentsTableTime => 'Hora';

  @override
  String get appointmentsTableProfessional => 'Profesional';

  @override
  String get appointmentsTableStatus => 'Estado';

  @override
  String get appointmentsTableNotes => 'Notas';

  @override
  String get appointmentsTableLocation => 'Ubicación';

  @override
  String get homeWelcomeBack => 'Bienvenido de nuevo,';

  @override
  String get homeDefaultUser => 'Usuario';

  @override
  String get homeQuickActions => 'Acciones rápidas';

  @override
  String get homeActionBrowseProductsTitle => 'Ver productos';

  @override
  String get homeActionBrowseProductsSubtitle => 'Ver catálogo';

  @override
  String get homeActionMessagesTitle => 'Mensajes';

  @override
  String get homeActionMessagesSubtitle => 'Chatear con el equipo';

  @override
  String get homeActionAppointmentsTitle => 'Citas';

  @override
  String get homeActionAppointmentsSubtitle => 'Programar reunión';

  @override
  String get homeActionOrdersTitle => 'Mis pedidos';

  @override
  String get homeActionOrdersSubtitle => 'Seguir pedidos';

  @override
  String get homeRecentActivity => 'Actividad reciente';

  @override
  String get homeActivitySetupTitle => 'Configuración completa';

  @override
  String get homeActivitySetupSubtitle => 'Tu cuenta está lista para usar';

  @override
  String get homeActivityWelcomeTitle => 'Bienvenido a AppTest';

  @override
  String get homeActivityWelcomeSubtitle =>
      'Empieza a explorar nuestras funciones';

  @override
  String get homeActivityJustNow => 'Justo ahora';

  @override
  String get homeActivityToday => 'Hoy';

  @override
  String get productsTitle => 'Productos';

  @override
  String get productsSubtitle => 'Explora nuestros productos de salud';

  @override
  String get productsSearchHint => 'Buscar productos...';

  @override
  String get productsEmptyTitle => 'No hay productos disponibles';

  @override
  String get productsEmptySubtitle =>
      'Vuelve más tarde para ver nuevos artículos';

  @override
  String get productsNotFoundTitle => 'No se encontraron productos';

  @override
  String get productsNotFoundSubtitle => 'Prueba con otro término de búsqueda';

  @override
  String get productsErrorTitle => 'Error al cargar productos';

  @override
  String get productsErrorRetry => 'Reintentar';

  @override
  String productsViewProduct(Object productName) {
    return 'Ver $productName';
  }

  @override
  String get productsLowStock => 'Pocas unidades';

  @override
  String get productsOutOfStock => 'Agotado';

  @override
  String get profileEditTitle => 'Editar perfil';

  @override
  String get profileNoUser => 'Ningún usuario ha iniciado sesión';

  @override
  String get profileEmailLabel => 'Correo electrónico';

  @override
  String get profileRoleLabel => 'Rol';

  @override
  String get profileFullNameLabel => 'Nombre completo';

  @override
  String get profileFullNameHint => 'Introduce tu nombre completo';

  @override
  String get profileFullNameRequired =>
      'Por favor introduce tu nombre completo';

  @override
  String get profilePhoneLabel => 'Número de teléfono';

  @override
  String get profilePhoneHint => 'Introduce tu número de teléfono';

  @override
  String get profilePhoneInvalid =>
      'Por favor introduce un número de teléfono válido';

  @override
  String get profileSaveChanges => 'Guardar cambios';

  @override
  String get profileCancel => 'Cancelar';

  @override
  String get profileUpdateSuccess => 'Perfil actualizado correctamente';

  @override
  String get profileUpdateError =>
      'No se pudo actualizar el perfil. Inténtalo de nuevo.';

  @override
  String get profileLoadError => 'Error al cargar el perfil.';

  @override
  String get profileAccountSettings => 'Configuración de la cuenta';

  @override
  String get profileOptionEditProfileTitle => 'Editar perfil';

  @override
  String get profileOptionEditProfileSubtitle =>
      'Actualiza tu información personal';

  @override
  String get profileOptionMedicalHistoryTitle => 'Historial médico';

  @override
  String get profileOptionMedicalHistorySubtitle =>
      'Ver o editar tu historial médico';

  @override
  String get profileOptionNotificationsTitle => 'Notificaciones';

  @override
  String get profileOptionNotificationsSubtitle =>
      'Gestiona las preferencias de notificación';

  @override
  String get profileOptionPrivacyTitle => 'Privacidad y seguridad';

  @override
  String get profileOptionPrivacySubtitle =>
      'Contraseña y opciones de seguridad';

  @override
  String get profileMoreTitle => 'Más';

  @override
  String get profileOptionAboutTitle => 'Sobre nosotros';

  @override
  String get profileOptionAboutSubtitle => 'Conoce más sobre AppTest';

  @override
  String get profileOptionHelpTitle => 'Ayuda y soporte';

  @override
  String get profileOptionHelpSubtitle => 'Obtén ayuda con tu cuenta';

  @override
  String get profileNotificationsComingSoon =>
      'La configuración de notificaciones estará disponible pronto';

  @override
  String get profileSecurityComingSoon =>
      'La configuración de seguridad estará disponible pronto';

  @override
  String get profileHelpComingSoon =>
      'El centro de ayuda estará disponible pronto';

  @override
  String get profileSignOut => 'Cerrar sesión';

  @override
  String get profileSignOutConfirmTitle => 'Cerrar sesión';

  @override
  String get profileSignOutConfirmMessage =>
      '¿Estás seguro de que quieres cerrar sesión?';

  @override
  String get profileSignOutCancel => 'Cancelar';

  @override
  String get profileSignOutConfirm => 'Cerrar sesión';

  @override
  String get profileRoleAdmin => 'Administrador';

  @override
  String get profileRoleHealthProfessional => 'Profesional de la salud';

  @override
  String get profileRoleLogistics => 'Logística';

  @override
  String get profileRoleClient => 'Cliente';

  @override
  String get mainSetupComplete => 'Configuración completa';

  @override
  String get mainSetupError => 'Error de configuración';

  @override
  String get mainSetupSuccessDetail =>
      'Todos los sistemas se inicializaron correctamente';

  @override
  String get mainSetupErrorDetail => 'No se pudo conectar a Supabase';

  @override
  String get mainTechRowFlutter => 'Flutter';

  @override
  String get mainTechRowTheme => 'Sistema de temas';

  @override
  String get mainTechRowRiverpod => 'Riverpod';

  @override
  String get mainTechRowSupabase => 'Supabase';

  @override
  String get mainFooterHighlights =>
      '🎨 Tema azul suave • 💬 Chat en tiempo real • 📦 Gestión de pedidos';
}
