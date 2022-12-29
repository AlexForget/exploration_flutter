import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:premier_test/l10n/string_hardcoded.dart';
import 'package:premier_test/router/app_router.dart';

class PageNonExistente extends StatelessWidget {
  const PageNonExistente({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Page non existente, retourner à l\'accueil'.hardcoded,
            ),
            ElevatedButton(
              onPressed: () => context.goNamed(AppRouter.accueil.name),
              child: Text('Aller à l\'accueil'.hardcoded),
            )
          ],
        ),
      ),
    );
  }
}
