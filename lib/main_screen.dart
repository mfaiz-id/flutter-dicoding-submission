import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Pilih Rumah Sakit"),
      // ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 130),
                child: Image.asset(
                  "assets/images/hospital.png",
                  width: 200,
                  height: 200,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Text(
                  "SELAMAT DATANG",
                  style: TextStyle(
                      fontSize: 40,
                      fontFamily: 'arial',
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Text(
                  "Aplikasi ini berisikan informasi rumah sakit yang ada di Surabaya",
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Container(
                child: Text(
                  "Beserta informasi fasilitas yang ada di dalam rumah sakit",
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 60),
                child: OutlinedButton(
                  onPressed: () {},
                  child: Text("Masuk"),
                  style: OutlinedButton.styleFrom(
                    primary: Colors.purple,
                    backgroundColor: Colors.white,
                    side: BorderSide(color: Colors.purple, width: 1),
                    fixedSize: Size(200, 40),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
