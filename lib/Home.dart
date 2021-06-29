import 'package:flutter/material.dart';

List<dynamic> fist = [];
var gotValue = '';

class TODO extends StatefulWidget {
  @override
  _TODOState createState() => _TODOState();
}

class _TODOState extends State<TODO> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ListView.builder(
            itemCount: fist.length,
            itemBuilder: (context, index) {
              return Container(
                color: Colors.pinkAccent,
                height: 50,
                margin: EdgeInsets.only(top: 10),
                child: ListTile(
                  trailing: Container(
                    width: 60,
                    child: Row(
                      children: [
                        Padding(padding: EdgeInsets.all(5)),
                        GestureDetector(
                            onTap: () {
                              setState(() {
                                fist.remove(index);
                              });
                            },
                            child: Icon(Icons.delete)),
                        GestureDetector(
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text('EDIT TODO'),
                                      content: TextField(onChanged: (value) {
                                        gotValue = value;
                                      }),
                                      actions: [
                                        ElevatedButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();

                                              setState(() {
                                                fist.replaceRange(
                                                    index, index+1, {gotValue});
                                              });
                                            },
                                            child: Text('Update'))
                                      ],
                                    );
                                  });
                            },
                            child: Icon(Icons.edit)),
                      ],
                    ),
                  ),
                  title: Text(
                    '${fist[index]}',
                  ),
                ),
              );
            }),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text('Add TODO'),
                    content: TextField(onChanged: (value) {
                      gotValue = value;
                    }),
                    actions: [
                      ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();

                            setState(() {
                              fist.add(gotValue);
                            });
                          },
                          child: Text('Add'))
                    ],
                  );
                });
          },
          child: Text(
            ' Add',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
