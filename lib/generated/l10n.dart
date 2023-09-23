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

  /// `Tempora`
  String get appName {
    return Intl.message(
      'Tempora',
      name: 'appName',
      desc: '',
      args: [],
    );
  }

  /// `Rate this app`
  String get rateApp {
    return Intl.message(
      'Rate this app',
      name: 'rateApp',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get confirm {
    return Intl.message(
      'Confirm',
      name: 'confirm',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Retry`
  String get retry {
    return Intl.message(
      'Retry',
      name: 'retry',
      desc: '',
      args: [],
    );
  }

  /// `Attention`
  String get attention {
    return Intl.message(
      'Attention',
      name: 'attention',
      desc: '',
      args: [],
    );
  }

  /// `Please wait...`
  String get pleaseWait {
    return Intl.message(
      'Please wait...',
      name: 'pleaseWait',
      desc: '',
      args: [],
    );
  }

  /// `Oops, there's nothing here yet...`
  String get nothingToShow {
    return Intl.message(
      'Oops, there\'s nothing here yet...',
      name: 'nothingToShow',
      desc: '',
      args: [],
    );
  }

  /// `An error has ocurred.`
  String get anErrorHasOcurred {
    return Intl.message(
      'An error has ocurred.',
      name: 'anErrorHasOcurred',
      desc: '',
      args: [],
    );
  }

  /// `©{year} Evoluciona Soluciones de Software. All rights reserved.`
  String copyright(Object year) {
    return Intl.message(
      '©$year Evoluciona Soluciones de Software. All rights reserved.',
      name: 'copyright',
      desc: '',
      args: [year],
    );
  }

  /// `Terms of use`
  String get termsOfUse {
    return Intl.message(
      'Terms of use',
      name: 'termsOfUse',
      desc: '',
      args: [],
    );
  }

  /// `Privacy policy`
  String get privacyPolicy {
    return Intl.message(
      'Privacy policy',
      name: 'privacyPolicy',
      desc: '',
      args: [],
    );
  }

  /// `Contact developer`
  String get contactDeveloper {
    return Intl.message(
      'Contact developer',
      name: 'contactDeveloper',
      desc: '',
      args: [],
    );
  }

  /// `Hi, I would like to comment something about the app: \n`
  String get emailToDeveloperBody {
    return Intl.message(
      'Hi, I would like to comment something about the app: \n',
      name: 'emailToDeveloperBody',
      desc: '',
      args: [],
    );
  }

  /// `Today`
  String get timeLapseToday {
    return Intl.message(
      'Today',
      name: 'timeLapseToday',
      desc: '',
      args: [],
    );
  }

  /// `{n} days ago`
  String timeLapseDaysAgo(Object n) {
    return Intl.message(
      '$n days ago',
      name: 'timeLapseDaysAgo',
      desc: '',
      args: [n],
    );
  }

  /// `In {n} days`
  String timeLapseDaysLater(Object n) {
    return Intl.message(
      'In $n days',
      name: 'timeLapseDaysLater',
      desc: '',
      args: [n],
    );
  }

  /// `Tomorrow`
  String get timeLapseTomorrow {
    return Intl.message(
      'Tomorrow',
      name: 'timeLapseTomorrow',
      desc: '',
      args: [],
    );
  }

  /// `Yesterday`
  String get timeLapseYesterday {
    return Intl.message(
      'Yesterday',
      name: 'timeLapseYesterday',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Login as guest`
  String get loginAsGuest {
    return Intl.message(
      'Login as guest',
      name: 'loginAsGuest',
      desc: '',
      args: [],
    );
  }

  /// `email`
  String get email {
    return Intl.message(
      'email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `password`
  String get password {
    return Intl.message(
      'password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Login with Google`
  String get loginWithGoogle {
    return Intl.message(
      'Login with Google',
      name: 'loginWithGoogle',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logout {
    return Intl.message(
      'Logout',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete this timer?`
  String get deleteTimerQuestion {
    return Intl.message(
      'Are you sure you want to delete this timer?',
      name: 'deleteTimerQuestion',
      desc: '',
      args: [],
    );
  }

  /// `Create a new timer`
  String get createTimer {
    return Intl.message(
      'Create a new timer',
      name: 'createTimer',
      desc: '',
      args: [],
    );
  }

  /// `Timer name`
  String get timerName {
    return Intl.message(
      'Timer name',
      name: 'timerName',
      desc: '',
      args: [],
    );
  }

  /// `Enter a name for your timer`
  String get enterANameForYourTimer {
    return Intl.message(
      'Enter a name for your timer',
      name: 'enterANameForYourTimer',
      desc: '',
      args: [],
    );
  }

  /// `Create`
  String get create {
    return Intl.message(
      'Create',
      name: 'create',
      desc: '',
      args: [],
    );
  }

  /// `Minutes`
  String get minutes {
    return Intl.message(
      'Minutes',
      name: 'minutes',
      desc: '',
      args: [],
    );
  }

  /// `Seconds`
  String get seconds {
    return Intl.message(
      'Seconds',
      name: 'seconds',
      desc: '',
      args: [],
    );
  }

  /// `Edit timer`
  String get editTimer {
    return Intl.message(
      'Edit timer',
      name: 'editTimer',
      desc: '',
      args: [],
    );
  }

  /// `Save changes`
  String get saveChanges {
    return Intl.message(
      'Save changes',
      name: 'saveChanges',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get delete {
    return Intl.message(
      'Delete',
      name: 'delete',
      desc: '',
      args: [],
    );
  }

  /// `Edit`
  String get edit {
    return Intl.message(
      'Edit',
      name: 'edit',
      desc: '',
      args: [],
    );
  }

  /// `No timers yet. Create one!`
  String get noTimersYet {
    return Intl.message(
      'No timers yet. Create one!',
      name: 'noTimersYet',
      desc: '',
      args: [],
    );
  }

  /// `My timers`
  String get myTimers {
    return Intl.message(
      'My timers',
      name: 'myTimers',
      desc: '',
      args: [],
    );
  }

  /// `Sort by`
  String get sortBy {
    return Intl.message(
      'Sort by',
      name: 'sortBy',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message(
      'Name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Duration`
  String get duration {
    return Intl.message(
      'Duration',
      name: 'duration',
      desc: '',
      args: [],
    );
  }

  /// `Times started`
  String get timesStarted {
    return Intl.message(
      'Times started',
      name: 'timesStarted',
      desc: '',
      args: [],
    );
  }

  /// `Is favorite`
  String get isFavorite {
    return Intl.message(
      'Is favorite',
      name: 'isFavorite',
      desc: '',
      args: [],
    );
  }

  /// `Unfavorite`
  String get unfavorite {
    return Intl.message(
      'Unfavorite',
      name: 'unfavorite',
      desc: '',
      args: [],
    );
  }

  /// `Favorite`
  String get favorite {
    return Intl.message(
      'Favorite',
      name: 'favorite',
      desc: '',
      args: [],
    );
  }

  /// `About`
  String get about {
    return Intl.message(
      'About',
      name: 'about',
      desc: '',
      args: [],
    );
  }

  /// `Recommended apps`
  String get recommendedApps {
    return Intl.message(
      'Recommended apps',
      name: 'recommendedApps',
      desc: '',
      args: [],
    );
  }

  /// `Support us on {name}`
  String supportUsOn(Object name) {
    return Intl.message(
      'Support us on $name',
      name: 'supportUsOn',
      desc: '',
      args: [name],
    );
  }

  /// `{something} ended`
  String somethingEnded(Object something) {
    return Intl.message(
      '$something ended',
      name: 'somethingEnded',
      desc: '',
      args: [something],
    );
  }

  /// `Timer`
  String get timer {
    return Intl.message(
      'Timer',
      name: 'timer',
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
