import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:premier_test/l10n/app_localisations_context.dart';

class SousRoute extends StatelessWidget {
  const SousRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.loc.sousRoute),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              context.loc.pageNonAccessibleDepuisMenu,
              textAlign: TextAlign.center,
            ),
            ElevatedButton(
                onPressed: () => context.pop(),
                child: Text(context.loc.retournerPagePrecedente))
          ],
        ),
      ),
    );
  }
}
