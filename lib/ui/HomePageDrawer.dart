import 'package:flutter/material.dart';

class HomePageDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: Colors.blueAccent),
            accountName: Text("dsad"),
            accountEmail: Text("dsfs"),
            currentAccountPicture: Icon(
              Icons.account_circle,
              size: 50.0,
              color: Colors.white,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Gmail 13",
              style: TextStyle(
                fontSize: 25,
              ),
            ),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("ALL LABELS"),
          ),
          drawerTile(Icons.inbox, "Inbox"),
          drawerTile(Icons.star, "Starred"),
          drawerTile(Icons.access_time, "Snoozed"),
          drawerTile(Icons.label, "Important"),
          drawerTile(Icons.send, "Sent"),
          drawerTile(Icons.note, "Drafts"),
          drawerTile(Icons.error, "Spam"),
          drawerTile(Icons.delete, "Bin"),
          Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Google Apps"),
          ),
          drawerTile(Icons.calendar_today, "Calendar"),
          drawerTile(Icons.people, "Contacts"),
          Divider(),
          drawerTile(Icons.settings, "Settings"),
          drawerTile(Icons.help, "Help"),
        ],
      ),
    );
  }

  Widget drawerTile(IconData icon, String text) {
    return Row(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Icon(icon),
        ),
        Text(text),
      ],
    );
  }
}
