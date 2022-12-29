// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:premier_test/l10n/string_hardcoded.dart';

class SousRouteParam extends StatelessWidget {
  const SousRouteParam({Key? key, required this.paramRecu}) : super(key: key);
  final String paramRecu;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sous route'.hardcoded),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              paramRecu,
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
