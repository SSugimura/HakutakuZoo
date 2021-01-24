import 'package:flutter/material.dart';

void main() {
//  debugPaintSizeEnabled = true;
  runApp(DetailApp());
}

class DetailApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'hakutakuzoo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: DetailPage(title: 'hakutakuzoo'),
    );
  }
}

class DetailPage extends StatefulWidget {
  DetailPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,  //キーボード
        appBar: AppBar(
          //左側のアイコン
          leading: Icon(Icons.arrow_back),
          centerTitle: true,
          title: Icon(Icons.star_border),
          actions: <Widget>[
            Container(
              margin: EdgeInsets.all(8.0),
              child: Icon(
                Icons.settings,
              ),
            ),
          ],
        ),

        body: Container(
          height: 800.0,
          padding: EdgeInsets.all(40),

          child: SingleChildScrollView(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Image.asset("images/kab.jpg"),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("品種名",
                        style: TextStyle(
                          color:Colors.black,
                          fontSize: 20.0,
                        ),
                      ),

                      Text("カブトムシ",
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontSize: 20.0,
                        ),
                      ),
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("発見場所",
                        style: TextStyle(
                          color:Colors.black,
                          fontSize: 20.0,
                        ),
                      ),

                      Text("神奈川県川崎市宮前区神木本町",
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontSize: 15.0,
                        ),
                      ),
                    ],
                  ),

                  Column(
                    children: <Widget>[
                      Text("詳細",
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),

                      TextField(
                        decoration: InputDecoration(
                          hintText: ("発見時の状態など、詳細なテキストが書かれている"),
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

                  Column(
                    children: <Widget>[
                      Text("もしかして",
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
//このコードバグにつき一時除去（上のもしかしてもキモかったら消す）
                      // ListView(
                      //   children: <Widget>[
                      //     ListTile(
                      //       title: Text("＃カブトムシ"),
                      //       leading: Icon(Icons.mood_rounded),
                      //     ),
                      //   ],
                      // ),

                    ],
                  ),

                ],
              ),
            ),
          ),
        )
    );
  }
}