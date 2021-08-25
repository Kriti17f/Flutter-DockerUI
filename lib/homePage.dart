import 'package:flutter/material.dart';
import 'package:first_app/Docker.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.cyanAccent,
          title: Text('Euphoric| Docker UI',
          style: TextStyle(color: Colors.black, fontFamily: 'Raleway', fontSize: 30, fontWeight: FontWeight.bold, letterSpacing: 1.2),
          ),
        ), 
        body: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
            const SizedBox(
              height: 245,
            ),
            Material(
              borderRadius: BorderRadius.circular(5),
              color: Colors.orangeAccent,
              elevation: 6,
              child: MaterialButton(
              padding: EdgeInsets.all(15),

              child: const Text(
                'Docker',
                style: TextStyle(color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold, letterSpacing: 1.2),
              ),
              onPressed: () => docker(),

              minWidth: 400,
              height: 100,

              ), 
            ),
            ]),
        ),
      );
  }

  docker()
  {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        return Dockerpage();
      }),
    );
  }
}
