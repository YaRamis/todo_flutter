import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.black,

      appBar: AppBar(
        backgroundColor: Colors.indigo[800],
        title: const Text('Task list', style: TextStyle(
          fontFamily: 'Montserrat',
          fontSize: 30,
        ),),
        centerTitle: true,
      ),

      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              const Padding(padding: EdgeInsets.only(top: 100)),
              const Text('Main screen', style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 20,
                color: Colors.white
              )),
              const Padding(padding: EdgeInsets.only(top: 40)),
              ElevatedButton(
                style: const ButtonStyle(
                  backgroundColor:
                  MaterialStatePropertyAll<Color>(Color(0xFF283593)),
                ),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/home');
                },
                child: const Text('Go to Task List', style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 20,
                  color: Colors.white
                ))
              )
            ],
          )
        ]
      )
    );
  }
}

