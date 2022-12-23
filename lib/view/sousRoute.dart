import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:premier_test/l10n/string_hardcoded.dart';

class SousRoute extends StatelessWidget {
  const SousRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sous route'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Page non accessible depuis le menu. Pour tester une sous route avec Go_Router',
              textAlign: TextAlign.center,
            ),
            ElevatedButton(
                onPressed: () => context.pop(),
                child: Text('Retourner à la page précédente'.hardcoded))
          ],
        ),
      ),
    );
  }
}
