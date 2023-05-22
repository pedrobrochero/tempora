import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

@RoutePage()
class DevPage extends StatelessWidget {
  const DevPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('$runtimeType'),
              const SizedBox(height: 4),
              ElevatedButton(onPressed: () {}, child: const Text('Dev action')),
            ],
          ),
        ),
      );
}
