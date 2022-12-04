import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

import '../Widget/drawerApp.dart';

class PushNotification extends StatelessWidget {
  const PushNotification({super.key});

  @override
  Widget build(BuildContext context) {
    final player = AudioPlayer();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lecture fichier audio'),
      ),
      drawer: const DrawerApp(),
      body: Center(
          child: Column(
        children: [
          ElevatedButton(
            onPressed: () => {
              player.setAsset('assets/testAudio.mp3'),
              player.play(),
            },
            child: const Text('Jouer fichier audio local (asset)'),
          ),
          ElevatedButton(
            onPressed: () => {
              player.setUrl(
                  'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-7.mp3'),
              player.play(),
            },
            child: const Text('Jouer fichier audio en ligne (url)'),
          ),
        ],
      )),
    );
  }
}
