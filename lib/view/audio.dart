import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:premier_test/l10n/string_hardcoded.dart';

import '../Widget/drawerApp.dart';

class AudioTest extends StatefulWidget {
  const AudioTest({super.key});

  @override
  State<AudioTest> createState() => _AudioTestState();
}

class _AudioTestState extends State<AudioTest> {
  final playerAsset = AudioPlayer();
  final playerUrl = AudioPlayer();

  bool enLectureLocal = false;
  bool enLectureUrl = false;

  void jouerFichierUrl() {
    if (!enLectureUrl) {
      playerUrl.setUrl(
          'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-7.mp3');
      enLectureUrl = true;
    }
    playerUrl.play();
  }

  void jouerFichierAsset() {
    if (!enLectureLocal) {
      playerAsset.setAsset('assets/testAudio.mp3');
      enLectureLocal = true;
    }
    playerAsset.play();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lecture fichier audio'.hardcoded),
      ),
      drawer: const DrawerApp(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Fichier local (assets)'.hardcoded),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: jouerFichierAsset,
                  icon: const Icon(Icons.play_arrow),
                ),
                IconButton(
                  onPressed: () => {playerAsset.pause()},
                  icon: const Icon(Icons.pause),
                ),
                IconButton(
                  onPressed: () => {
                    playerAsset.stop(),
                    enLectureLocal = false,
                  },
                  icon: const Icon(Icons.stop),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.all(100),
            ),
            Text('Fichier en ligne (url)'.hardcoded),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: jouerFichierUrl,
                  icon: const Icon(Icons.play_arrow),
                ),
                IconButton(
                  onPressed: () => {playerUrl.pause()},
                  icon: const Icon(Icons.pause),
                ),
                IconButton(
                  onPressed: () => {
                    playerUrl.stop(),
                    enLectureUrl = false,
                  },
                  icon: const Icon(Icons.stop),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
