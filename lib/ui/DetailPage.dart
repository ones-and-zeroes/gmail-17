import 'package:flutter/material.dart';
import 'package:gmail17/data/EmailData.dart';
import 'package:provider/provider.dart';

class DetailPage extends StatelessWidget {
  final int index;
  final Function toggleFavCallback;
  final EmailItem data;
  DetailPage({
    this.index,
    this.toggleFavCallback,
    this.data,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.archive),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.delete),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.markunread),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.more_vert),
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 15),
                  child: Text(
                    data.subject,
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                ),
              ),
              IconButton(
                  onPressed: toggleFavCallback,
                  icon: Icon(
                      Provider.of<EmailData>(context).defaultData[index].fav
                          ? Icons.star
                          : Icons.star_border)),
            ],
          ),
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  child: Text(data.avatar),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(data.sender),
                ),
              ),
              Icon(Icons.reply),
              Icon(Icons.more_vert),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(data.description),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: OutlineButton(
                    onPressed: null,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Icon(Icons.reply),
                        Text("Reply"),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: OutlineButton(
                    onPressed: null,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Icon(Icons.reply_all),
                        Text("Reply All"),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: OutlineButton(
                    onPressed: null,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Icon(Icons.forward),
                        Text("Forward"),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
