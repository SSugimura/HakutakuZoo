import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:hakutakuzoo/detailg.dart';
import 'package:hakutakuzoo/deteditg.dart';

//アプリ実行したらMyAppクラスを読み込む
void main() {
//  debugPaintSizeEnabled = true;

//画面遷移実装で問題発生したので以下のコードを切り替えて作業してください(こんなんしなくてもＩＤＥからできるけど)
  //main.dartが走る
  runApp(MyApp());
  //detailg.dart
  // runApp(DetailApp());
  //detedit.dart
  // runApp(DEditApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'hakutakuzoo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'hakutakuzoo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  File _image;                     //ライブラリ
 final picker = ImagePicker();

  final _locationMap = {
    '0': '哺乳類',
    '1': '鳥類',
    '2': '爬虫類',
    '3': '両生類',
    '4': '魚類',
    '5': '虫',
  };
  var _selectedLocation = '0';

  Future getImageFromGallery() async {
   final pickedFile = await picker.getImage(source: ImageSource.gallery);

   setState(() {
     _image = File(pickedFile.path);
   });
  }

  bool _flag = false;
  void _handleCheckbox(bool e) {
    setState(() {
      _flag = e;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
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
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("品種名",
                          style: TextStyle(
                            fontSize: 20.0,
                          ),
                        ),
                        Checkbox(
                          activeColor: Colors.blue,
//                          title: Text('わからない',
//                            style: TextStyle(
//                              fontSize: 20.0,
//                            ),
//                          ),
//                          controlAffinity: ListTileControlAffinity.leading,
                          value: _flag,
                          onChanged: _handleCheckbox,
                        ),
                      ],
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
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("発見場所",
                          style: TextStyle(
                            fontSize: 20.0,
                          ),
                        ),
                        OutlineButton(
                          onPressed: getImageFromGallery,   //ギャラリーから画像を取得
                          borderSide: BorderSide(color: Colors.black),
                          child: Text(
                            'GPS',
                            style: TextStyle(
                              color:Colors.black,
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                      ],
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

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("カテゴリー",
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                    DropdownButton(
                      value: _selectedLocation,
                      onChanged: (newValue) {
                        setState(() {
                          _selectedLocation = newValue;
                        });
                      },
                      items: _locationMap.entries.map((entry) {
                        return DropdownMenuItem(
                          child: Text(entry.value),
                          value: entry.key,
                        );
                      }).toList(),
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

                Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("写真",
                          style: TextStyle(
                            fontSize: 20.0,
                          ),
                        ),

                        OutlineButton(
                          onPressed: getImageFromGallery,   //ギャラリーから画像を取得
                          borderSide: BorderSide(color: Colors.black),
                          child: Text(
                            'ライブラリ',
                            style: TextStyle(
                              color:Colors.black,
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                      ],
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          width: 300,
                          child: _image == null
                              ? Text('No image selected.')
                              : Image.file(_image)
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
                      maxLines: 10,
                    ),

                  ],
                ),

                Center(
                  child: OutlineButton(
                    onPressed: null,
                    borderSide: BorderSide(color: Colors.black),
                    child: Text(
                      '投稿',
                      style: TextStyle(
                        color:Colors.black,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
