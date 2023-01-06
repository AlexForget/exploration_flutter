import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:premier_test/l10n/app_localisations_context.dart';
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
        title: Text(context.loc.navigation),
      ),
      drawer: const DrawerApp(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(context.loc.helloWorld),
            ElevatedButton(
              onPressed: () => context.pushNamed(AppRouter.sousRouter.name),
              child: Text(
                context.loc.allerSousRoute,
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(80.0, 0, 80, 0),
              child: TextField(
                controller: entreUrilisateurController,
                decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: context.loc.entrerText),
                onChanged: (text) =>
                    entreUtilisateur = entreUrilisateurController.text,
              ),
            ),
            ElevatedButton(
              onPressed: () => context.pushNamed(AppRouter.sousRouteParam.name,
                  params: {'paraTest': entreUtilisateur}),
              child: Text(
                context.loc.allerSousRouteParametre,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
