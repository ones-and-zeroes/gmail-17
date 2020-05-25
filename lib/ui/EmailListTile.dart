import 'package:flutter/material.dart';
import 'package:gmail17/data/EmailData.dart';
import 'package:gmail17/ui/DetailPage.dart';
import 'package:gmail17/ui/HomePage.dart';

class EmailListTile extends StatelessWidget {
  final EmailItem tileEmailData;
  final Function toggleFavCallback;
  final int index;
  EmailListTile({
    this.index,
    this.tileEmailData,
    this.toggleFavCallback,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 0),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailPage(
                toggleFavCallback: toggleFavCallback,
                index: index,
                data: tileEmailData,
              ),
            ),
          );
        },
        child: ListTile(
          leading: CircleAvatar(
            child: Text(tileEmailData.avatar),
          ),
          title: Text(tileEmailData.sender),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(tileEmailData.subject),
              Text(tileEmailData.description),
            ],
          ),
          trailing: Column(
            children: <Widget>[
              Text("${DateTime.now().hour}:${DateTime.now().minute}"),
              Expanded(
                child: IconButton(
                  onPressed: toggleFavCallback,
                  icon:
                      Icon(tileEmailData.fav ? Icons.star : Icons.star_border),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
