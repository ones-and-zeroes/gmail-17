import 'package:flutter/widgets.dart';

class EmailItem {
  String avatar, description, subject, sender;
  DateTime date;
  bool fav;
  EmailItem({
    this.avatar,
    this.subject,
    this.sender,
    this.description,
    this.date,
    this.fav,
  });

  void toggleFav() {
    print("a callback");
    this.fav = !this.fav;
  }
}

class EmailData extends ChangeNotifier {
  List<EmailItem> defaultData = <EmailItem>[
    EmailItem(
      avatar: "SY",
      description: "New app launched",
      subject: "Gmail 13",
      fav: false,
      date: DateTime.now(),
      sender: "Github",
    ),
    EmailItem(
      avatar: "AC",
      description: "New app launched",
      subject: "This a damn mong subject oh oh oh",
      fav: false,
      date: DateTime.now(),
      sender: "sfs",
    ),
    EmailItem(
      avatar: "SY",
      description: "New app dasdass launched",
      subject: "sdfdsfsdfsf 13",
      fav: false,
      date: DateTime.now(),
      sender: "Github",
    ),
    EmailItem(
      avatar: "DT",
      description: "lorem ipsum",
      subject: "Gmail 13",
      fav: true,
      date: DateTime.now(),
      sender: "Github",
    ),
    EmailItem(
      avatar: "SY",
      description: "New app launched",
      subject: "Gmail 13",
      fav: false,
      date: DateTime.now(),
      sender: "Github",
    ),
    EmailItem(
      avatar: "SY",
      description: "New app launched",
      subject: "Gmail 13",
      fav: false,
      date: DateTime.now(),
      sender: "Github",
    ),
    EmailItem(
      avatar: "SY",
      description: "New app launched",
      subject: "Gmail 13",
      fav: true,
      date: DateTime.now(),
      sender: "Github",
    ),
  ];

  void toggleFav(EmailItem emailItem) {
    emailItem.toggleFav();
    notifyListeners();
  }

  void addEmail(EmailItem emailItem) {
    defaultData.insert(0, emailItem);
    notifyListeners();
  }
}
