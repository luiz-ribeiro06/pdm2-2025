import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Processador de Texto',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: TextProcessorScreen(),
    );
  }
}

class TextProcessorScreen extends StatefulWidget {
  @override
  _TextProcessorScreenState createState() => _TextProcessorScreenState();
}

class _TextProcessorScreenState extends State<TextProcessorScreen> {
  final TextEditingController _inputController = TextEditingController();
  String _outputText = '';

  void _processText() {
    String input = _inputController.text;

    // Remove espaços desnecessários (múltiplos espaços consecutivos)
    input = input.replaceAll(RegExp(r'\s+'), ' ');

    // Capitaliza o início do texto e após pontos finais
    List<String> sentences = input.split('.');
    for (int i = 0; i < sentences.length; i++) {
      sentences[i] = sentences[i].trim();
      if (sentences[i].isNotEmpty) {
        sentences[i] = sentences[i][0].toUpperCase() + sentences[i].substring(1);
      }
    }
    String processed = sentences.join('. ');

    // Remove espaço extra no final se houver
    processed = processed.trim();

    setState(() {
      _outputText = processed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Processador de Texto'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _inputController,
              decoration: InputDecoration(
                labelText: 'Digite seu texto aqui',
                border: OutlineInputBorder(),
              ),
              maxLines: 5,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _processText,
              child: Text('Processar Texto'),
            ),
            SizedBox(height: 16),
            Text(
              'Texto Processado:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  _outputText,
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
