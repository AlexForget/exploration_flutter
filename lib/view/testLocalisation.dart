import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:premier_test/l10n/string_hardcoded.dart';
import 'package:premier_test/router/app_router.dart';

import '../Widget/drawerApp.dart';

class TestLocalisation extends StatefulWidget {
  const TestLocalisation({super.key});

  @override
  State<TestLocalisation> createState() => _TestLocalisationState();
}

class _TestLocalisationState extends State<TestLocalisation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Localisation'),
      ),
      drawer: const DrawerApp(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(AppLocalizations.of(context)!.helloWorld),
            ElevatedButton(
              onPressed: () => context.pushNamed(AppRouter.sousRouter.name),
              child: Text(
                'Aller à la sous router'.hardcoded,
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}
