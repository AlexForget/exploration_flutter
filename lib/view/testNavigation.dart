import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:premier_test/l10n/string_hardcoded.dart';
import 'package:premier_test/router/app_router.dart';

import '../Widget/drawerApp.dart';

class TestNavigation extends StatefulWidget {
  const TestNavigation({super.key});

  @override
  State<TestNavigation> createState() => _TestNavigationState();
}

class _TestNavigationState extends State<TestNavigation> {
  TextEditingController entreUrilisateurController = TextEditingController();
  String entreUtilisateur = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Localisation'.hardcoded),
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
                'Aller à la sous route'.hardcoded,
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(80.0, 0, 80, 0),
              child: TextField(
                controller: entreUrilisateurController,
                decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: 'Entrer du text'.hardcoded),
                onChanged: (text) =>
                    entreUtilisateur = entreUrilisateurController.text,
              ),
            ),
            ElevatedButton(
              onPressed: () => context.pushNamed(AppRouter.sousRouteParam.name,
                  params: {'paraTest': entreUtilisateur}),
              child: Text(
                'Aller à la sous route avec un paramètre'.hardcoded,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
