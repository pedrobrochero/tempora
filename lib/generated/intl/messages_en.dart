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

  static String m1(n) => "Hace ${n} días";

  static String m2(n) => "En ${n} días";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "anErrorHasOcurred":
            MessageLookupByLibrary.simpleMessage("Ha ocurrido un error."),
        "appName": MessageLookupByLibrary.simpleMessage("Flutter base"),
        "attention": MessageLookupByLibrary.simpleMessage("Atención"),
        "cancel": MessageLookupByLibrary.simpleMessage("Cancelar"),
        "confirm": MessageLookupByLibrary.simpleMessage("Confirmar"),
        "contactDeveloper":
            MessageLookupByLibrary.simpleMessage("Contacta al desarrollador"),
        "copyright": m0,
        "email": MessageLookupByLibrary.simpleMessage("Correo"),
        "emailToDeveloperBody": MessageLookupByLibrary.simpleMessage(
            "Hola, me gustaría comentar algo acerca de la app: "),
        "login": MessageLookupByLibrary.simpleMessage("Ingresar"),
        "loginAsGuest":
            MessageLookupByLibrary.simpleMessage("Ingresar como invitado"),
        "loginWithGoogle":
            MessageLookupByLibrary.simpleMessage("Ingresar con Google"),
        "logout": MessageLookupByLibrary.simpleMessage("Cerrar sesión"),
        "nothingToShow": MessageLookupByLibrary.simpleMessage(
            "Ups, no hay nada por aqui aun..."),
        "password": MessageLookupByLibrary.simpleMessage("Contraseña"),
        "pleaseWait":
            MessageLookupByLibrary.simpleMessage("Por favor espere..."),
        "privacyPolicy":
            MessageLookupByLibrary.simpleMessage("Política de privacidad"),
        "retry": MessageLookupByLibrary.simpleMessage("Reintentar"),
        "settings": MessageLookupByLibrary.simpleMessage("Ajustes"),
        "termsOfUse":
            MessageLookupByLibrary.simpleMessage("Condiciones de uso"),
        "timeLapseDaysAgo": m1,
        "timeLapseDaysLater": m2,
        "timeLapseToday": MessageLookupByLibrary.simpleMessage("Hoy"),
        "timeLapseTomorrow": MessageLookupByLibrary.simpleMessage("Mañana"),
        "timeLapseYesterday": MessageLookupByLibrary.simpleMessage("Ayer"),
        "youHaveNoAccess": MessageLookupByLibrary.simpleMessage(
            "Aún no tienes acceso al sistema, contacta al administrador.")
      };
}
