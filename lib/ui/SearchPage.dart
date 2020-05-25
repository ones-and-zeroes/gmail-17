import 'package:flutter/material.dart';
import 'package:gmail17/ui/EmailList.dart';
import 'package:gmail17/ui/FloatAppBar.dart';

class SearchPage extends StatelessWidget {
  final String text;
  SearchPage(this.text);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          appBar: FloatAppBar(text),
          body: EmailList(),
        ),
      ),
    );
  }
}
