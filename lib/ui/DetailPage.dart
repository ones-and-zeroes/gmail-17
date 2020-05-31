import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:gmail17/data/AvatarColors.dart';
import 'package:gmail17/data/EmailData.dart';
import 'package:gmail17/ui/EmailListTile.dart';
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
            onPressed: () {
              Provider.of<EmailData>(context, listen: false).deleteEmail(data);
              Navigator.pop(context);
            },
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
        crossAxisAlignment: CrossAxisAlignment.start,
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
                        : Icons.star_border),
                color: Colors.amber,
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  backgroundColor: avatarColors[data.colorIndex],
                  child: Text(data.avatar),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        data.recName,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text("to me"),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                child: Text(getTileDate(data.date)),
              ),
              Icon(Icons.reply),
              Icon(Icons.more_vert),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: data.recEmail == "anonymous@secret.com"
                  ? Image.asset("assets/rickroll.webp")
                  : Text(
                      data.description,
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 15),
                    ),
            ),
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
