import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Dockerpage extends StatefulWidget {
  @override
  _DockerpageState createState() => _DockerpageState();
}

class _DockerpageState extends State<Dockerpage> {
  var command = " ";
  String? output;
  action() async {
    print(command);
    var url = Uri.http("192.168.--.---", "/cgi-bin/sample.py",{"cmd": command});
    var r1 = await http.get(url);
    print(r1.body);
    print(r1.statusCode);
    output = r1.body;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text("Docker"),
          leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: () => Navigator.pop(context),),
          backgroundColor: Colors.cyan,
          ),
          body: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('docker.jpg'),
              //fit: BoxFit.cover,
              ),
          ),
          child: Center(
            child: Container(
              width:300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  TextField(
                    cursorColor: Colors.cyan,
                    style: TextStyle(color: Colors.white),
                    onChanged: (value) {
                      command = value;
                    },
                    decoration: InputDecoration(
                        fillColor: Colors.black54,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.cyanAccent),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        filled: true,
                        hintText: "Enter docker command",
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.cyan),
                          borderRadius: BorderRadius.circular(10),
                        )
                      ),

                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Material(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.black87,
                    elevation: 5,
                    child: MaterialButton(
                      child: Text(
                        'Enter',
                        style: TextStyle(color: Colors.white,fontSize: 30, fontWeight: FontWeight.w400, letterSpacing: 1.2),
                      ),
                      onPressed: action,
                      minWidth: 130,
                      height: 50,
                    ),
                  ),
                  Center(child: Container(
                    width: 350,
                    child: Center(
                      child: Text("$output",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                      borderRadius:  BorderRadius.circular(15),
                      color: Colors.orange, 
                      border: Border.all(color: Colors.green, 
                        width: 2
                      ) ,
                    ),
                  )
                )
                ],
              ),
            ),
          ),
        ),
      );
  }

}
