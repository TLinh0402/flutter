import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("I am Rich ", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.grey,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Có giá 100000000 VND "),
            Image(
              image: AssetImage("images/diamond.png"),
            )
            // Image.network(
            //   "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS_oPMKhJrvuBPAp3OfBxGR3KeBBSAKouUHPg&s",
            //   width: 400,
            //   height: 350,
            //   errorBuilder: (context, error, stackTrace) {
            //     return Text("Lỗi tải ảnh!");
            //   },
            // ),
          ],
        ),
      ),
    ),
  ));
}
