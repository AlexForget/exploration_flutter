import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:premier_test/l10n/app_localisations_context.dart';
import 'package:premier_test/portageApiClient.dart';
import 'package:premier_test/router/app_router.dart';

class Connexion extends StatefulWidget {
  const Connexion({super.key});

  @override
  State<Connexion> createState() => _ConnexionState();
}

class _ConnexionState extends State<Connexion> {
  Future<void> validerConnexionUtilisateur() async {
    final api = PortageApiClient();
    String affichage = '';

    try {
      final utilisateur =
          await api.fetcUtilisateur(_nomUtilisateurController.text);
      if (utilisateur != null) {
        if (_nomUtilisateurController.text == utilisateur.pseudo &&
            _motDePasseController.text == utilisateur.pwd) {
          ouvrirAccueil();
          return;
        } else {
          affichage = context.loc.echecConnexion;
        }
      } else {
        affichage = context.loc.echecConnexion;
      }
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(affichage)));
    } on PortageApiException catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message)));
    }
    setState(() {});
  }

  void ouvrirAccueil() {
    context.pushNamed(AppRouter.accueil.name);
    // Navigator.of(context)
    //     .push(MaterialPageRoute(builder: (context) => const Accueil()));
  }

  final _nomUtilisateurController = TextEditingController();
  final _motDePasseController = TextEditingController();
  String affichage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.loc.connexion),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Image(
              image: AssetImage('portage.png'),
            ),
            const SizedBox(height: 10.0),
            TextField(
              decoration: InputDecoration(
                labelText: context.loc.nomUtilisateur,
                border: const OutlineInputBorder(),
              ),
              controller: _nomUtilisateurController,
            ),
            const SizedBox(height: 10.0),
            TextField(
              decoration: InputDecoration(
                labelText: context.loc.motDePasse,
                border: const OutlineInputBorder(),
              ),
              controller: _motDePasseController,
              obscureText: true,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: ouvrirAccueil /*validerConnexionUtilisateur*/,
                  child: Text(context.loc.connexion),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
