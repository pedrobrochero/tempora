import 'package:flutter/material.dart';

import '../../../generated/l10n.dart';

class LoadingOverlayComponent extends StatelessWidget {
  const LoadingOverlayComponent({
    required this.isLoading,
    required this.child,
    this.loadingMessage,
    Key? key,
  }) : super(key: key);
  final String? loadingMessage;
  final Widget child;
  final bool isLoading;

  @override
  Widget build(BuildContext context) => Stack(
        children: [
          child,
          if (isLoading)
            SizedBox.expand(
              child: Container(
                color: Colors.black87,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        loadingMessage ?? S.of(context).pleaseWait,
                        textAlign: TextAlign.center,
                        // style: Theme.of(context).textTheme.headline5,
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall
                            ?.copyWith(color: Colors.white),
                      ),
                      const SizedBox(height: 16),
                      const CircularProgressIndicator(),
                    ],
                  ),
                ),
              ),
            ),
        ],
      );
}
