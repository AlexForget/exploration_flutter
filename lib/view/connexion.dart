import 'package:flutter/material.dart';
import 'package:premier_test/portageApiClient.dart';
import 'package:premier_test/view/notifChannel.dart';

class Connexion extends StatefulWidget {
  const Connexion({super.key, required this.titre});

  final String titre;

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
          affichage = 'Échec de connexion';
        }
      } else {
        affichage = 'Échec de connexion';
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
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const NotifChannel()));
  }

  final _nomUtilisateurController = TextEditingController();
  final _motDePasseController = TextEditingController();
  String affichage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.titre),
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
              decoration: const InputDecoration(
                labelText: 'Nom d\'utilisateur',
                border: OutlineInputBorder(),
              ),
              controller: _nomUtilisateurController,
            ),
            const SizedBox(height: 10.0),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Mot de passe',
                border: OutlineInputBorder(),
              ),
              controller: _motDePasseController,
              obscureText: true,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: ouvrirAccueil /*validerConnexionUtilisateur*/,
                  child: const Text('Connexion'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
