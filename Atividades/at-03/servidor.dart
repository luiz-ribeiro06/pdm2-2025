import 'dart:io';
import 'dart:typed_data';

void main() async {
  // Cria um servidor que escuta na porta 4567
  var server = await ServerSocket.bind('127.0.0.1', 4567);
  print('Servidor iniciado e escutando na porta 4567...');

  // Loop assíncrono para lidar com conexões incoming
  await for (var socket in server) {
    handleConnection(socket);
  }
}

void handleConnection(Socket socket) async {
  print('Nova conexão de ${socket.remoteAddress}:${socket.remotePort}');

  // Escuta por dados incoming de forma assíncrona
  socket.listen((Uint8List data) {
    String message = String.fromCharCodes(data).trim();  // Converte bytes para string
    if (message.isNotEmpty) {
      print('Temperatura recebida: $message graus');
    }
  });

  // Opcional: Lida com o fechamento da conexão
  socket.done.then((_) {
    print('Conexão fechada por ${socket.remoteAddress}:${socket.remotePort}');
  });
}