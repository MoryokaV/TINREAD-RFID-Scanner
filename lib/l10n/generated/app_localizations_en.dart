// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get signIn => 'Sign In';

  @override
  String get username => 'Username';

  @override
  String get usernameInputHint => 'e.g. johnpeter86';

  @override
  String get password => 'Password';

  @override
  String get rememberMe => 'Remember me';
}
