import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Ẩn banner debug
      theme: ThemeData(
        textTheme: GoogleFonts.sourceSans3TextTheme(), // Dùng Source Sans 3
      ),
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage("images/lvvlogo.jpeg"),
              ),
              SizedBox(height: 10),
              Text(
                "Thuy Linh",
                style: GoogleFonts.pacifico(
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 5),
              Text(
                "FLUTTER DEVELOPER",
                style: GoogleFonts.sourceSans3(
                  textStyle: TextStyle(
                    fontSize: 20,
                    letterSpacing: 2,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal.shade100,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10), // Bo góc hộp thoại
                ),
                margin: EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.phone,
                      color: Colors.teal,
                    ),
                    SizedBox(width: 10),
                    Text(
                      "0763016901",
                      style: GoogleFonts.sourceSans3(
                        textStyle: TextStyle(
                          color: Colors.teal.shade900,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                  color: Colors.white,
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.email,
                        color: Colors.teal,
                      ),
                      Text(
                        "linhntt.22itb@vku.udn.vn",
                        style: GoogleFonts.sourceSans3(
                          fontSize: 20,
                          color: Colors.teal.shade900,
                        ),
                      )
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
