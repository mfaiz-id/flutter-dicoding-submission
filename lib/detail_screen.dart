import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_submission_dicoding/model/data_rs.dart';

class DetailScreen extends StatelessWidget {
  final DataRs dr;

  DetailScreen({required this.dr});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Image.asset(dr.imageRs),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.grey,
                          child: IconButton(
                            icon: Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                        Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(5.0),
                              child: Text(
                                dr.type,
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.yellow.shade700,
                                border: Border.all(
                                  color: Colors.yellow.shade800,
                                  width: 2,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 16.0),
              child: Text(
                dr.name,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30.0,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 16.0),
              child: Text(
                dr.location,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12.0,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 16.0),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Fasilitas :",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
            Container(
              height: 10000,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text('${index + 1}' + '. ${dr.services[index]}'),
                    ),
                  );
                },
                itemCount: dr.services.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
