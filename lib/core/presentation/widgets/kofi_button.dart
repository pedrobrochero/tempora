import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../generated/l10n.dart';
import '../utils/context_extension.dart';

// A button that links to my Ko-fi page (https://ko-fi.com/evoluciona_ss)
class KofiButton extends StatelessWidget {
  const KofiButton({super.key});

  @override
  Widget build(BuildContext context) => Center(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Ink(
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Colors.black,
                  Color(0xff444444),
                ],
              ),
              boxShadow: const [
                BoxShadow(
                  blurRadius: 4,
                  color: Colors.black45,
                  offset: Offset(0, 2),
                )
              ],
              borderRadius: BorderRadius.circular(8),
            ),
            child: InkWell(
              onTap: () {
                launchUrl(Uri.parse('https://ko-fi.com/evoluciona_ss'),
                    mode: LaunchMode.externalApplication);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      'assets/kofi.png',
                      width: 32,
                      height: 32,
                    ),
                    const SizedBox(width: 4),
                    Text(S.of(context).supportUsOn('Ko-fi'),
                        style: context.textTheme.titleSmall?.copyWith(
                          color: Colors.white,
                        )),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
}
