import 'package:flutter/material.dart';
import 'package:flutter_submission_dicoding/model/data_rs.dart';
import 'package:flutter_submission_dicoding/detail_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isGrid = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Rumah Sakit"),
      ),
      floatingActionButton: Container(
          padding: EdgeInsets.only(bottom: 3),
          child: Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  margin: EdgeInsets.only(right: 55),
                  child: FloatingActionButton(
                    child: Icon(
                      Icons.format_list_bulleted,
                      color: isGrid ? Colors.grey.shade800 : Colors.white,
                    ),
                    backgroundColor: isGrid ? Colors.white : Colors.purple,
                    onPressed: () {
                      setState(() {
                        isGrid = false;
                      });
                    },
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  margin: EdgeInsets.only(left: 55),
                  child: FloatingActionButton(
                    child: Icon(
                      Icons.grid_view,
                      color: isGrid ? Colors.white : Colors.grey.shade800,
                    ),
                    onPressed: () {
                      setState(() {
                        isGrid = true;
                      });
                    },
                    backgroundColor: isGrid ? Colors.purple : Colors.white,
                  ),
                ),
              ),
            ],
          )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: isGrid ? MyGrid() : MyList(),
    );
  }
}

class MyList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        final DataRs dr = dataRsList[index];
        return InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return DetailScreen(dr: dr);
            }));
          },
          child: Card(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Image.asset(
                    dr.imageRs,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          dr.name,
                          style: TextStyle(fontSize: 16.0),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(dr.location)
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
      itemCount: dataRsList.length,
    );
  }
}

class MyGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: dataRsList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 8.0 / 10.0,
          crossAxisCount: 2,
        ),
        itemBuilder: (BuildContext context, int index) {
          final DataRs dr = dataRsList[index];
          return InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return DetailScreen(dr: dr);
              }));
            },
            child: Padding(
              padding: EdgeInsets.all(5),
              child: Card(
                semanticContainer: true,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                clipBehavior: Clip.antiAlias,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              dr.imageRs,
                            ),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        dr.name,
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
