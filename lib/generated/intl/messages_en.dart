// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(year) =>
      "©${year} Evoluciona Soluciones de Software - Reservados todos los derechos";

  static String m1(name) => "Support us on ${name}";

  static String m2(n) => "Hace ${n} días";

  static String m3(n) => "En ${n} días";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "about": MessageLookupByLibrary.simpleMessage("About"),
        "anErrorHasOcurred":
            MessageLookupByLibrary.simpleMessage("Ha ocurrido un error."),
        "appName": MessageLookupByLibrary.simpleMessage("Tempora"),
        "attention": MessageLookupByLibrary.simpleMessage("Atención"),
        "cancel": MessageLookupByLibrary.simpleMessage("Cancelar"),
        "confirm": MessageLookupByLibrary.simpleMessage("Confirmar"),
        "contactDeveloper":
            MessageLookupByLibrary.simpleMessage("Contacta al desarrollador"),
        "copyright": m0,
        "create": MessageLookupByLibrary.simpleMessage("Create"),
        "createTimer":
            MessageLookupByLibrary.simpleMessage("Create a new timer"),
        "delete": MessageLookupByLibrary.simpleMessage("Delete"),
        "deleteTimerQuestion": MessageLookupByLibrary.simpleMessage(
            "Are you sure you want to delete this timer?"),
        "duration": MessageLookupByLibrary.simpleMessage("Duration"),
        "edit": MessageLookupByLibrary.simpleMessage("Edit"),
        "editTimer": MessageLookupByLibrary.simpleMessage("Edit timer"),
        "email": MessageLookupByLibrary.simpleMessage("Correo"),
        "emailToDeveloperBody": MessageLookupByLibrary.simpleMessage(
            "Hola, me gustaría comentar algo acerca de la app: "),
        "enterANameForYourTimer":
            MessageLookupByLibrary.simpleMessage("Enter a name for your timer"),
        "favorite": MessageLookupByLibrary.simpleMessage("Favorite"),
        "isFavorite": MessageLookupByLibrary.simpleMessage("Is favorite"),
        "login": MessageLookupByLibrary.simpleMessage("Ingresar"),
        "loginAsGuest":
            MessageLookupByLibrary.simpleMessage("Ingresar como invitado"),
        "loginWithGoogle":
            MessageLookupByLibrary.simpleMessage("Ingresar con Google"),
        "logout": MessageLookupByLibrary.simpleMessage("Cerrar sesión"),
        "minutes": MessageLookupByLibrary.simpleMessage("Minutes"),
        "myTimers": MessageLookupByLibrary.simpleMessage("My timers"),
        "name": MessageLookupByLibrary.simpleMessage("Name"),
        "noTimersYet":
            MessageLookupByLibrary.simpleMessage("No timers yet. Create one!"),
        "nothingToShow": MessageLookupByLibrary.simpleMessage(
            "Ups, no hay nada por aqui aun..."),
        "password": MessageLookupByLibrary.simpleMessage("Contraseña"),
        "pleaseWait":
            MessageLookupByLibrary.simpleMessage("Por favor espere..."),
        "privacyPolicy":
            MessageLookupByLibrary.simpleMessage("Política de privacidad"),
        "rateApp": MessageLookupByLibrary.simpleMessage("Rate this app"),
        "recommendedApps":
            MessageLookupByLibrary.simpleMessage("Recommended apps"),
        "retry": MessageLookupByLibrary.simpleMessage("Reintentar"),
        "saveChanges": MessageLookupByLibrary.simpleMessage("Save changes"),
        "seconds": MessageLookupByLibrary.simpleMessage("Seconds"),
        "settings": MessageLookupByLibrary.simpleMessage("Ajustes"),
        "sortBy": MessageLookupByLibrary.simpleMessage("Sort by"),
        "supportUsOn": m1,
        "termsOfUse":
            MessageLookupByLibrary.simpleMessage("Condiciones de uso"),
        "timeLapseDaysAgo": m2,
        "timeLapseDaysLater": m3,
        "timeLapseToday": MessageLookupByLibrary.simpleMessage("Hoy"),
        "timeLapseTomorrow": MessageLookupByLibrary.simpleMessage("Mañana"),
        "timeLapseYesterday": MessageLookupByLibrary.simpleMessage("Ayer"),
        "timerName": MessageLookupByLibrary.simpleMessage("Timer name"),
        "timesStarted": MessageLookupByLibrary.simpleMessage("Times started"),
        "unfavorite": MessageLookupByLibrary.simpleMessage("Unfavorite"),
        "youHaveNoAccess": MessageLookupByLibrary.simpleMessage(
            "Aún no tienes acceso al sistema, contacta al administrador.")
      };
}
