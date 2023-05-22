import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../generated/l10n.dart';

const _termsOfUseUrl = 'https://evolucionass.com/flutter_base-terms-of-use/';
const _privacyPolicyUrl =
    'https://evolucionass.com/flutter_base-privacy-policy/';
const _developerEmail = 'info@evolucionass.com';
const _emailSubject = 'flutter_base app comment';

// TODO add media licenses

Future<void> showAppAboutDialog(BuildContext context) async {
  final version = (await PackageInfo.fromPlatform()).version;
  final year = DateTime.now().year;
  showAboutDialog(
    context: context,
    applicationIcon: Image.asset('assets/logo.png'),
    applicationVersion: version,
    applicationLegalese: S.of(context).copyright(year),
    children: [
      const SizedBox(height: 16),
      GestureDetector(
        child: Text(S.of(context).termsOfUse,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  decoration: TextDecoration.underline,
                  color: Colors.blue,
                )),
        onTap: () => launchUrl(Uri.parse(_termsOfUseUrl)),
      ),
      const SizedBox(height: 8),
      GestureDetector(
        child: Text(S.of(context).privacyPolicy,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  decoration: TextDecoration.underline,
                  color: Colors.blue,
                )),
        onTap: () => launchUrl(Uri.parse(_privacyPolicyUrl)),
      ),
      const SizedBox(height: 8),
      GestureDetector(
        child: Text(S.of(context).contactDeveloper,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  decoration: TextDecoration.underline,
                  color: Colors.blue,
                )),
        onTap: () {
          final subject = Uri.encodeComponent(_emailSubject);
          final body = Uri.encodeComponent(S.of(context).emailToDeveloperBody);
          final uri = 'mailto:$_developerEmail?subject=$subject&body=$body';
          launchUrl(Uri.parse(uri));
        },
      ),
    ],
  );
}
