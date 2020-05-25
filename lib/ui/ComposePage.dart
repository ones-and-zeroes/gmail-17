import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:gmail17/data/EmailData.dart';

class ComposePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String from = "", to = "", subject = "", description = "";
    return Scaffold(
      appBar: AppBar(
        title: Text("Compose"),
        actions: <Widget>[
          IconButton(
            onPressed: null,
            icon: Icon(Icons.attachment),
          ),
          IconButton(
            onPressed: () {
              Provider.of<EmailData>(context, listen: false).addEmail(
                EmailItem(
                  avatar: "XX",
                  sender: from,
                  description: description,
                  subject: subject,
                  fav: false,
                  date: DateTime.now(),
                ),
              );
              Navigator.pop(context);
            },
            icon: Icon(Icons.send),
          ),
          IconButton(
            onPressed: null,
            icon: Icon(Icons.more_vert),
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 40,
                  child: Text("From"),
                ),
              ),
              Expanded(
                child: TextField(
                  onChanged: (text) {
                    from = text;
                  },
                ),
              )
            ],
          ),
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 40,
                  child: Text("To"),
                ),
              ),
              Expanded(
                child: TextField(
                  onChanged: (text) {
                    to = text;
                  },
                ),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Subject",
              ),
              onChanged: (text) {
                subject = text;
              },
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(8),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Compose email",
                ),
                onChanged: (text) {
                  description = text;
                },
                minLines: 40,
                maxLines: null,
              ),
            ),
          )
        ],
      ),
    );
  }
}
