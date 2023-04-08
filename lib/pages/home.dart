import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String _task = '';
  List todoList = [];

  @override
  void initState() {
    super.initState();

    todoList.addAll(['Buy milk', 'Walk the dog', 'Wash dishes']);
  }

  void _removeTask(int index) {
    setState(() {
      todoList.removeAt(index);
    });
  }

  void _addTask(String task) {
    setState(() {
      todoList.add(task);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.black,

      drawer: Drawer(
        width: 270,
        child: Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            backgroundColor: Colors.indigo[800],
            title: const Text('Menu', style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 30,
            ),),
            centerTitle: true,
          ),
          body: const Text(
            'ADIDAS', style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 15,
              color: Colors.white
          ),),
        ),
      ),

      appBar: AppBar(
        // leading: IconButton(
        //     onPressed: () {
        //       Navigator.of(context).push(
        //         // MaterialPageRoute(builder: (BuildContext context) {
        //           DialogRoute(context: context, builder: (BuildContext context) {
        //           return Scaffold(
        //             appBar: AppBar(
        //               backgroundColor: Colors.indigo[800],
        //               title: const Text('Menu', style: TextStyle(
        //                 fontFamily: 'Montserrat',
        //                 fontSize: 30,
        //               ),),
        //               centerTitle: true,
        //             ),
        //             body: const Text('adidas'),
        //           );
        //         },
        //         )
        //       );
        //     },
        //     icon: const Icon(
        //       Icons.menu_rounded,
        //       color: Colors.white,
        //       size: 30,
        //     )
        //
        // ),
        backgroundColor: Colors.indigo[800],
        title: const Text('Task list', style: TextStyle(
          fontFamily: 'Montserrat',
          fontSize: 30,
        ),),
        centerTitle: true,
        actions: [
          IconButton(
            // padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 15),
            // alignment: Alignment.centerLeft,
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/');
            },
            icon: const Icon(
              Icons.home_rounded,
              color: Colors.white,
              size: 30,
            )

          )
        ],
      ),

      body: ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (BuildContext context, int index) {
          return Dismissible(

              key: Key(todoList[index]),

              child: Card(
                color: Colors.grey[900],
                child: ListTile(
                  title: Text(
                    todoList[index], style: const TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 15,
                      color: Colors.white
                  ),),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete_rounded),
                    color: Colors.indigo[600],
                    onPressed: () { _removeTask(index); },
                  ),
                ),
              ),

              onDismissed: (direction) {
                _removeTask(index);
              }
          );
        }
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(context: context, builder: (BuildContext context) {
            return AlertDialog(
              backgroundColor: Colors.grey[900],
              title: const Text('Add task', style: TextStyle(
                fontFamily: 'Montserrat',
                color: Colors.white
              ),),
              content: TextField(
                style: const TextStyle(
                    fontFamily: 'Montserrat',
                    color: Colors.white
                ),
                onChanged: (String value) {
                  _task = value;
                },
              ),

              actions: [
                ElevatedButton(
                  style: const ButtonStyle(
                    backgroundColor:
                      MaterialStatePropertyAll<Color>(Color(0xFF283593)),
                  ),
                  onPressed: () {
                    if (_task != '') {
                      _addTask(_task);
                    }
                    Navigator.of(context).pop();
                  },
                  child: const Text('Add', style: TextStyle(
                    fontFamily: 'Montserrat',
                    color: Colors.white
                  ),),
                )
              ],
            );
          });
        },
        backgroundColor: Colors.indigo[800],
        child: const Icon(
          Icons.add_rounded,
          size: 40,
        ),
      ),

    );
  }
}
