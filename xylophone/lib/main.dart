import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  final AudioPlayer player = AudioPlayer(); // Khởi tạo AudioPlayer

  // Hàm phát âm thanh theo số thứ tự nốt nhạc
  void playSound(int noteNumber) async {
    await player.play(AssetSource('note$noteNumber.wav'));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: <Widget>[
              buildKey(Colors.red, 1),
              buildKey(Colors.orange, 2),
              buildKey(Colors.yellow, 3),
              buildKey(Colors.green, 4),
              buildKey(Colors.blue, 5),
              buildKey(Colors.indigo, 6),
              buildKey(Colors.purple, 7),
            ],
          ),
        ),
      ),
    );
  }

  // Hàm tạo nút bấm với màu sắc và âm thanh tương ứng
  Widget buildKey(Color color, int noteNumber) {
    return Expanded(
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(color), // Màu nền
        ),
        onPressed: () => playSound(noteNumber), // Phát âm thanh tương ứng
        child: Text("Note $noteNumber",
            style: TextStyle(color: Colors.white)), // Nội dung nút
      ),
    );
  }
}
