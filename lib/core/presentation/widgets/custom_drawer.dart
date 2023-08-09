import 'dart:async';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/presentation/utils/context_extension.dart';
import '../../../../core/presentation/widgets/about_dialog.dart';
import '../../../../core/presentation/widgets/kofi_button.dart';
import '../../../../generated/l10n.dart';
import '../../data/providers/analytics_events.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) => Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView in order to show
          // the drawer header properly.
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onPrimary,
              ),
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Flexible(
                      child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                    child: Image.asset('assets/logo_no_padding.png'),
                  )),
                  Text(
                    S.of(context).appName,
                    style: context.textTheme.titleLarge
                        ?.copyWith(color: context.colorScheme.onBackground),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.star),
              title: Text(S.of(context).rateApp),
              onTap: () async {
                InAppReview.instance.openStoreListing();
              },
            ),
            ListTile(
              leading: const Icon(Icons.apps),
              title: Text(S.of(context).recommendedApps),
              onTap: () async {
                unawaited(FirebaseAnalytics.instance
                    .logEvent(name: AnalyticsEvents.seeMoreApps));
                launchUrl(
                  Uri.parse(
                      'https://play.google.com/store/apps/dev?id=6895873393180134308'),
                  mode: LaunchMode.externalApplication,
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.info_outline_rounded),
              title: Text(S.of(context).about),
              onTap: () {
                showAppAboutDialog(context);
              },
            ),
            const KofiButton(),
          ],
        ),
      );
}
