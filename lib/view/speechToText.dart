// ignore_for_file: unused_import
import 'package:avatar_glow/avatar_glow.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:flutter/material.dart';
import '../Widget/drawerApp.dart';

class SpeechToTextPage extends StatefulWidget {
  const SpeechToTextPage({super.key});

  @override
  State<SpeechToTextPage> createState() => _SpeechToTextPageState();
}

class _SpeechToTextPageState extends State<SpeechToTextPage> {
  final SpeechToText _stt = SpeechToText();
  bool _speechEnabled = false;
  String _text = '';

  @override
  void initState() {
    super.initState();
    _initialiserSTT();
  }

  void _initialiserSTT() async {
    _speechEnabled = await _stt.initialize();
    setState(() {});
  }

  void _startListening() async {
    _text = 'stop';
    await _stt.listen(onResult: _onSpeechResult);
    setState(() {});
  }

  void _stopListening() async {
    await _stt.stop();
    setState(() {});
  }

  void _onSpeechResult(SpeechRecognitionResult result) {
    setState(() {
      _text = result.recognizedWords;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Speech to text'),
      ),
      drawer: const DrawerApp(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(_stt.isListening.toString()),
            Container(
              padding: const EdgeInsets.all(16),
              child: const Text(
                'Mots reconnus:',
                style: TextStyle(fontSize: 20.0),
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(16),
                child: Text(_text),
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: AvatarGlow(
        animate: _stt.isListening,
        glowColor: Theme.of(context).primaryColor,
        endRadius: 75.0,
        duration: const Duration(milliseconds: 2000),
        repeatPauseDuration: const Duration(milliseconds: 100),
        repeat: true,
        child: FloatingActionButton(
          onPressed:
              // If not yet listening for speech start, otherwise stop
              _stt.isNotListening ? _startListening : _stopListening,
          tooltip: 'Listen',
          child: Icon(_stt.isNotListening ? Icons.mic_off : Icons.mic),
        ),
      ),
    );
  }
}
