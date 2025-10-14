import 'dart:io';
import 'dart:async';
import 'dart:math';  // Para gerar números aleatórios

void main() async {
  try {
    // Conecta ao servidor de forma assíncrona
    var socket = await Socket.connect('127.0.0.1', 4567);
    print('Conectado ao servidor na porta 4567');

    // Timer assíncrono para enviar dados a cada 10 segundos
    Timer.periodic(Duration(seconds: 10), (timer) async {
      double temperature = 20 + Random().nextDouble() * 10;  // Gera uma temperatura aleatória entre 20 e 30
      String message = '${temperature.toStringAsFixed(1)}\n';  // Formata como "XX.X\n"
      
      socket.write(message);  // Envia a mensagem pelo socket
      print('Enviada temperatura: $message');
    });

    // O programa continua rodando devido ao timer; não há necessidade de um loop explícito
  } catch (e) {
    print('Erro ao conectar ao servidor: $e');
  }
}