import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gmail17/ui/SearchPage.dart';

class FloatAppBar extends StatelessWidget with PreferredSizeWidget {
  final String floatBarText;
  FloatAppBar([this.floatBarText]);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          top: 10,
          right: 15,
          left: 15,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey.shade200,
                width: 2,
              ),
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
            child: FloatSearchBarRow(floatBarText),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(70);
}

class FloatSearchBarRow extends StatefulWidget {
  String floatBarText;
  FloatSearchBarRow(this.floatBarText);
  @override
  _FloatSearchBarRowState createState() =>
      _FloatSearchBarRowState(floatBarText);
}

class _FloatSearchBarRowState extends State<FloatSearchBarRow> {
  String floatBarText;
  _FloatSearchBarRowState(this.floatBarText);
  TextEditingController textController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Material(
          type: MaterialType.transparency,
          child: IconButton(
            splashColor: Colors.grey,
            icon: Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
        Expanded(
          child: TextField(
            controller: textController,
            onChanged: (text) {
              setState(() {
                floatBarText = text;
                if (floatBarText == "") floatBarText = null;
              });
            },
            onSubmitted: (text) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SearchPage(text),
                ),
              );
            },
            enableInteractiveSelection: true,
            enableSuggestions: true,
            cursorColor: Colors.black,
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.go,
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(horizontal: 15),
                hintText: "Search"),
          ),
        ),
        SizedBox(
          height: 50,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: floatBarText == null
                ? CircleAvatar(
                    child: Text("SY"),
                  )
                : Center(
                    child: IconButton(
                      icon: Icon(Icons.close),
                      onPressed: () {
                        setState(() {
                          floatBarText = null;
                          textController.text = "";
                        });
                      },
                    ),
                  ),
          ),
        )
      ],
    );
  }
}
