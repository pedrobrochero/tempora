// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Flutter base`
  String get appName {
    return Intl.message(
      'Flutter base',
      name: 'appName',
      desc: '',
      args: [],
    );
  }

  /// `Confirmar`
  String get confirm {
    return Intl.message(
      'Confirmar',
      name: 'confirm',
      desc: '',
      args: [],
    );
  }

  /// `Cancelar`
  String get cancel {
    return Intl.message(
      'Cancelar',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Reintentar`
  String get retry {
    return Intl.message(
      'Reintentar',
      name: 'retry',
      desc: '',
      args: [],
    );
  }

  /// `Atención`
  String get attention {
    return Intl.message(
      'Atención',
      name: 'attention',
      desc: '',
      args: [],
    );
  }

  /// `Por favor espere...`
  String get pleaseWait {
    return Intl.message(
      'Por favor espere...',
      name: 'pleaseWait',
      desc: '',
      args: [],
    );
  }

  /// `Ups, no hay nada por aqui aun...`
  String get nothingToShow {
    return Intl.message(
      'Ups, no hay nada por aqui aun...',
      name: 'nothingToShow',
      desc: '',
      args: [],
    );
  }

  /// `Ha ocurrido un error.`
  String get anErrorHasOcurred {
    return Intl.message(
      'Ha ocurrido un error.',
      name: 'anErrorHasOcurred',
      desc: '',
      args: [],
    );
  }

  /// `©{year} Evoluciona Soluciones de Software - Reservados todos los derechos`
  String copyright(Object year) {
    return Intl.message(
      '©$year Evoluciona Soluciones de Software - Reservados todos los derechos',
      name: 'copyright',
      desc: '',
      args: [year],
    );
  }

  /// `Condiciones de uso`
  String get termsOfUse {
    return Intl.message(
      'Condiciones de uso',
      name: 'termsOfUse',
      desc: '',
      args: [],
    );
  }

  /// `Política de privacidad`
  String get privacyPolicy {
    return Intl.message(
      'Política de privacidad',
      name: 'privacyPolicy',
      desc: '',
      args: [],
    );
  }

  /// `Contacta al desarrollador`
  String get contactDeveloper {
    return Intl.message(
      'Contacta al desarrollador',
      name: 'contactDeveloper',
      desc: '',
      args: [],
    );
  }

  /// `Hola, me gustaría comentar algo acerca de la app: `
  String get emailToDeveloperBody {
    return Intl.message(
      'Hola, me gustaría comentar algo acerca de la app: ',
      name: 'emailToDeveloperBody',
      desc: '',
      args: [],
    );
  }

  /// `Hoy`
  String get timeLapseToday {
    return Intl.message(
      'Hoy',
      name: 'timeLapseToday',
      desc: '',
      args: [],
    );
  }

  /// `Hace {n} días`
  String timeLapseDaysAgo(Object n) {
    return Intl.message(
      'Hace $n días',
      name: 'timeLapseDaysAgo',
      desc: '',
      args: [n],
    );
  }

  /// `En {n} días`
  String timeLapseDaysLater(Object n) {
    return Intl.message(
      'En $n días',
      name: 'timeLapseDaysLater',
      desc: '',
      args: [n],
    );
  }

  /// `Mañana`
  String get timeLapseTomorrow {
    return Intl.message(
      'Mañana',
      name: 'timeLapseTomorrow',
      desc: '',
      args: [],
    );
  }

  /// `Ayer`
  String get timeLapseYesterday {
    return Intl.message(
      'Ayer',
      name: 'timeLapseYesterday',
      desc: '',
      args: [],
    );
  }

  /// `Ajustes`
  String get settings {
    return Intl.message(
      'Ajustes',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Ingresar como invitado`
  String get loginAsGuest {
    return Intl.message(
      'Ingresar como invitado',
      name: 'loginAsGuest',
      desc: '',
      args: [],
    );
  }

  /// `Correo`
  String get email {
    return Intl.message(
      'Correo',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Contraseña`
  String get password {
    return Intl.message(
      'Contraseña',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Ingresar`
  String get login {
    return Intl.message(
      'Ingresar',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Ingresar con Google`
  String get loginWithGoogle {
    return Intl.message(
      'Ingresar con Google',
      name: 'loginWithGoogle',
      desc: '',
      args: [],
    );
  }

  /// `Aún no tienes acceso al sistema, contacta al administrador.`
  String get youHaveNoAccess {
    return Intl.message(
      'Aún no tienes acceso al sistema, contacta al administrador.',
      name: 'youHaveNoAccess',
      desc: '',
      args: [],
    );
  }

  /// `Cerrar sesión`
  String get logout {
    return Intl.message(
      'Cerrar sesión',
      name: 'logout',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'es'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
