// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a es locale. All the
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
  String get localeName => 'es';

  static String m0(year) =>
      "©${year} Evoluciona Soluciones de Software - Todos los derechos reservados";

  static String m1(name) => "Apóyanos en ${name}";

  static String m2(n) => "Hace ${n} días";

  static String m3(n) => "En ${n} días";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "about": MessageLookupByLibrary.simpleMessage("Acerca de"),
        "anErrorHasOcurred":
            MessageLookupByLibrary.simpleMessage("Ha ocurrido un error."),
        "appName": MessageLookupByLibrary.simpleMessage("Tempora"),
        "attention": MessageLookupByLibrary.simpleMessage("Atención"),
        "cancel": MessageLookupByLibrary.simpleMessage("Cancelar"),
        "confirm": MessageLookupByLibrary.simpleMessage("Confirmar"),
        "contactDeveloper":
            MessageLookupByLibrary.simpleMessage("Contacta al desarrollador"),
        "copyright": m0,
        "create": MessageLookupByLibrary.simpleMessage("Crear"),
        "createTimer":
            MessageLookupByLibrary.simpleMessage("Crear un nuevo temporizador"),
        "delete": MessageLookupByLibrary.simpleMessage("Eliminar"),
        "deleteTimerQuestion": MessageLookupByLibrary.simpleMessage(
            "¿Seguro que deseas eliminar este temporizador?"),
        "duration": MessageLookupByLibrary.simpleMessage("Duración"),
        "edit": MessageLookupByLibrary.simpleMessage("Editar"),
        "editTimer":
            MessageLookupByLibrary.simpleMessage("Editar temporizador"),
        "email": MessageLookupByLibrary.simpleMessage("Correo"),
        "emailToDeveloperBody": MessageLookupByLibrary.simpleMessage(
            "Hola, me gustaría comentar algo acerca de la app: \n"),
        "enterANameForYourTimer": MessageLookupByLibrary.simpleMessage(
            "Ingresa un nombre para tu temporizador"),
        "favorite": MessageLookupByLibrary.simpleMessage("Favorito"),
        "isFavorite": MessageLookupByLibrary.simpleMessage("Es favorito"),
        "login": MessageLookupByLibrary.simpleMessage("Ingresar"),
        "loginAsGuest":
            MessageLookupByLibrary.simpleMessage("Ingresar como invitado"),
        "loginWithGoogle":
            MessageLookupByLibrary.simpleMessage("Ingresar con Google"),
        "logout": MessageLookupByLibrary.simpleMessage("Cerrar sesión"),
        "minutes": MessageLookupByLibrary.simpleMessage("Minutos"),
        "myTimers": MessageLookupByLibrary.simpleMessage("Mis temporizadores"),
        "name": MessageLookupByLibrary.simpleMessage("Nombre"),
        "noTimersYet": MessageLookupByLibrary.simpleMessage(
            "Aún no hay temporizadores.\n¡Crea el primero!"),
        "nothingToShow": MessageLookupByLibrary.simpleMessage(
            "Ups, no hay nada por aqui aun..."),
        "password": MessageLookupByLibrary.simpleMessage("Contraseña"),
        "pleaseWait":
            MessageLookupByLibrary.simpleMessage("Por favor espere..."),
        "privacyPolicy":
            MessageLookupByLibrary.simpleMessage("Política de privacidad"),
        "rateApp": MessageLookupByLibrary.simpleMessage("Califica esta app"),
        "recommendedApps":
            MessageLookupByLibrary.simpleMessage("Apps recomendadas"),
        "retry": MessageLookupByLibrary.simpleMessage("Reintentar"),
        "saveChanges": MessageLookupByLibrary.simpleMessage("Guardar cambios"),
        "seconds": MessageLookupByLibrary.simpleMessage("Segundos"),
        "settings": MessageLookupByLibrary.simpleMessage("Ajustes"),
        "sortBy": MessageLookupByLibrary.simpleMessage("Ordenar por"),
        "supportUsOn": m1,
        "termsOfUse":
            MessageLookupByLibrary.simpleMessage("Condiciones de uso"),
        "timeLapseDaysAgo": m2,
        "timeLapseDaysLater": m3,
        "timeLapseToday": MessageLookupByLibrary.simpleMessage("Hoy"),
        "timeLapseTomorrow": MessageLookupByLibrary.simpleMessage("Mañana"),
        "timeLapseYesterday": MessageLookupByLibrary.simpleMessage("Ayer"),
        "timerName":
            MessageLookupByLibrary.simpleMessage("Nombre del temporizador"),
        "timesStarted": MessageLookupByLibrary.simpleMessage("Veces iniciado"),
        "unfavorite": MessageLookupByLibrary.simpleMessage("No favorito")
      };
}
