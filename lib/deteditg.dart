import 'package:flutter/material.dart';
import 'dart:async';

void main() {
//  debugPaintSizeEnabled = true;
  runApp(DEditApp());
}

class DEditApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'hakutakuzoo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: DeteditPage(title: 'hakutakuzoo'),
    );
  }
}

class DeteditPage extends StatefulWidget {
  DeteditPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _DeteditPageState createState() => _DeteditPageState();
}

class _DeteditPageState extends State<DeteditPage> {
  _update(BuildContext context, bool b){  //更新
    setState(() {

    });
    Navigator.pop(context);
  }
  _delete(BuildContext context, bool b){  //削除
    setState(() {

    });
    Navigator.pop(context);
  }

  Future _showAlertDialogU(BuildContext context) async { //更新
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("更新"),
          content: Text("この内容で更新しますか？"),
          actions: <Widget>[
            FlatButton(
              child: Text("いいえ"),
              onPressed: () => _update(context, false),
            ),
            FlatButton(
              child: Text("はい"),
              onPressed: () => _update(context, true),
            ),
          ],
        );
      },
    );
  }

  Future _showAlertDialogD(BuildContext context) async { //削除
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("削除"),
          content: Text("本当に削除してよろしいですか？"),
          actions: <Widget>[
            FlatButton(
              child: Text("いいえ"),
              onPressed: () => _delete(context, false),
            ),
            FlatButton(
              child: Text("はい"),
              onPressed: () => _delete(context, true),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false, //キーボード
        appBar: AppBar(
          //左側のアイコン
          leading: Icon(Icons.arrow_back),
        ),

        body: Container(
          height: 800.0,
          padding: EdgeInsets.all(40),

          child: SingleChildScrollView(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("品種名",
                        style: TextStyle(
                          color:Colors.black,
                          fontSize: 20.0,
                        ),
                      ),
                      TextField(
                        decoration: InputDecoration(
                          labelStyle: TextStyle(
                            fontSize: 20.0,
                          ),
                        ),
                        autocorrect: false,
                        autofocus: false,
                        keyboardType: TextInputType.text,
                      ),
                    ],
                  ),

                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("詳細",
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),

                      TextField(
                        decoration: InputDecoration(
                          hintText: ("書いてね"),
                          border: new OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(0.0),
                            ),
                            borderSide: new BorderSide(
                              color: Colors.black,
                              width: 1.0,
                            ),

                          ),
                        ),
                        maxLines: 5,
                      ),
                    ],
                  ),

                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        OutlineButton(
                          onPressed: () => _showAlertDialogU(context),
                          borderSide: BorderSide(color: Colors.black),
                          child: Text(
                            '更新',
                            style: TextStyle(
                              color:Colors.black,
                              fontSize: 20.0,
                            ),
                          ),
                        ),

                        OutlineButton(
                          onPressed: () => _showAlertDialogD(context),
                          borderSide: BorderSide(color: Colors.black),
                          child: Text(
                            '削除',
                            style: TextStyle(
                              color:Colors.black,
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                ],
              ),
            ),
          ),
        )
    );
  }
}