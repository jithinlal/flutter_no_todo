import 'package:flutter/material.dart';
import 'package:todo/model/nodo_item.dart';
import 'package:todo/util/database_client.dart';

class NoToDoScreen extends StatefulWidget {
  @override
  _NoToDoScreenState createState() => _NoToDoScreenState();
}

class _NoToDoScreenState extends State<NoToDoScreen> {
  final TextEditingController _textEditingController =
      new TextEditingController();
  var db = new DatabaseHelper();
  void _handleSubmit(String text) async {
    _textEditingController.clear();
    NoDoItem noDoItem = new NoDoItem(text, DateTime.now().toIso8601String());
    int savedItemId = await db.saveItem(noDoItem);
    print('Item saved with id: $savedItemId');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Column(),
      floatingActionButton: FloatingActionButton(
        tooltip: "Add Item",
        backgroundColor: Colors.redAccent,
        child: ListTile(
          title: Icon(Icons.add),
        ),
        onPressed: _showFormDialog,
      ),
    );
  }

  void _showFormDialog() {
    var alert = AlertDialog(
      content: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              controller: _textEditingController,
              autofocus: true,
              decoration: InputDecoration(
                  labelText: 'Item',
                  hintText: 'eg. Dont buy stuff',
                  icon: Icon(Icons.note_add)),
            ),
          )
        ],
      ),
      actions: <Widget>[
        FlatButton(
            onPressed: () {
              _handleSubmit(_textEditingController.text);
              _textEditingController.clear();
            },
            child: Text('Save')),
        FlatButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Cancel'))
      ],
    );
    showDialog(
        context: context,
        builder: (_) {
          return alert;
        });
  }
}
