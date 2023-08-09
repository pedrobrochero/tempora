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
      "©${year} Evoluciona Soluciones de Software. All rights reserved.";

  static String m1(name) => "Support us on ${name}";

  static String m2(n) => "${n} days ago";

  static String m3(n) => "In ${n} days";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "about": MessageLookupByLibrary.simpleMessage("About"),
        "anErrorHasOcurred":
            MessageLookupByLibrary.simpleMessage("An error has ocurred."),
        "appName": MessageLookupByLibrary.simpleMessage("Tempora"),
        "attention": MessageLookupByLibrary.simpleMessage("Attention"),
        "cancel": MessageLookupByLibrary.simpleMessage("Cancel"),
        "confirm": MessageLookupByLibrary.simpleMessage("Confirm"),
        "contactDeveloper":
            MessageLookupByLibrary.simpleMessage("Contact developer"),
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
        "email": MessageLookupByLibrary.simpleMessage("email"),
        "emailToDeveloperBody": MessageLookupByLibrary.simpleMessage(
            "Hi, I would like to comment something about the app: \n"),
        "enterANameForYourTimer":
            MessageLookupByLibrary.simpleMessage("Enter a name for your timer"),
        "favorite": MessageLookupByLibrary.simpleMessage("Favorite"),
        "isFavorite": MessageLookupByLibrary.simpleMessage("Is favorite"),
        "login": MessageLookupByLibrary.simpleMessage("Login"),
        "loginAsGuest": MessageLookupByLibrary.simpleMessage("Login as guest"),
        "loginWithGoogle":
            MessageLookupByLibrary.simpleMessage("Login with Google"),
        "logout": MessageLookupByLibrary.simpleMessage("Logout"),
        "minutes": MessageLookupByLibrary.simpleMessage("Minutes"),
        "myTimers": MessageLookupByLibrary.simpleMessage("My timers"),
        "name": MessageLookupByLibrary.simpleMessage("Name"),
        "noTimersYet":
            MessageLookupByLibrary.simpleMessage("No timers yet. Create one!"),
        "nothingToShow": MessageLookupByLibrary.simpleMessage(
            "Oops, there\'s nothing here yet..."),
        "password": MessageLookupByLibrary.simpleMessage("password"),
        "pleaseWait": MessageLookupByLibrary.simpleMessage("Please wait..."),
        "privacyPolicy": MessageLookupByLibrary.simpleMessage("Privacy policy"),
        "rateApp": MessageLookupByLibrary.simpleMessage("Rate this app"),
        "recommendedApps":
            MessageLookupByLibrary.simpleMessage("Recommended apps"),
        "retry": MessageLookupByLibrary.simpleMessage("Retry"),
        "saveChanges": MessageLookupByLibrary.simpleMessage("Save changes"),
        "seconds": MessageLookupByLibrary.simpleMessage("Seconds"),
        "settings": MessageLookupByLibrary.simpleMessage("Settings"),
        "sortBy": MessageLookupByLibrary.simpleMessage("Sort by"),
        "supportUsOn": m1,
        "termsOfUse": MessageLookupByLibrary.simpleMessage("Terms of use"),
        "timeLapseDaysAgo": m2,
        "timeLapseDaysLater": m3,
        "timeLapseToday": MessageLookupByLibrary.simpleMessage("Today"),
        "timeLapseTomorrow": MessageLookupByLibrary.simpleMessage("Tomorrow"),
        "timeLapseYesterday": MessageLookupByLibrary.simpleMessage("Yesterday"),
        "timerName": MessageLookupByLibrary.simpleMessage("Timer name"),
        "timesStarted": MessageLookupByLibrary.simpleMessage("Times started"),
        "unfavorite": MessageLookupByLibrary.simpleMessage("Unfavorite")
      };
}
