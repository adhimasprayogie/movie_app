import 'package:flutter/material.dart';

class CustomGridView extends StatefulWidget {
  @override
  _CustomGridViewState createState() => _CustomGridViewState();
}

class _CustomGridViewState extends State<CustomGridView> {
  List<Container> listMovie = new List();

  var daftarMovie = [
    {"nama": "Movie 1", "gambar": "movie1.jpeg"},
    {"nama": "Movie 2", "gambar": "movie2.jpeg"},
    {"nama": "Movie 3", "gambar": "movie3.jpeg"},
    {"nama": "Movie 4", "gambar": "movie4.jpeg"},
    {"nama": "Movie 5", "gambar": "movie5.jpeg"},
    {"nama": "Movie 6", "gambar": "movie6.jpeg"},
    {"nama": "Movie 7", "gambar": "movie7.jpeg"},
    {"nama": "Movie 8", "gambar": "movie8.jpeg"},
    {"nama": "Movie 9", "gambar": "movie9.jpeg"},
    {"nama": "Movie 10", "gambar": "movie10.jpeg"},
    {"nama": "Movie 11", "gambar": "movie11.jpeg"},
  ];

  _buatDataList() async {
    for (var i = 0; i < daftarMovie.length; i++) {
      final warnanya = daftarMovie[i];
      final String gambar = warnanya["gambar"];

      listMovie.add(new Container(
        padding: new EdgeInsets.all(20.0),
        child: new Card(
          child: new InkWell(
            onTap: () {
              Navigator.of(context).push(new MaterialPageRoute(
                  builder: (context) => DetailGridView(
                        nama: warnanya['nama'],
                        gambar: gambar,
                      )));
            },
            child: new Column(
              children: <Widget>[
                new Padding(
                  padding: new EdgeInsets.all(10.0),
                ),
                new Hero(
                  tag: warnanya['nama'],
                  child: new Image.asset("assets/img/$gambar",
                      height: 100.0, width: 100.0, fit: BoxFit.cover),
                ),
                new Padding(
                  padding: new EdgeInsets.all(10.0),
                ),
                new Text(
                  warnanya['nama'],
                  style: new TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18.0),
                ),
              ],
            ),
          ),
        ),
      ));
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    _buatDataList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Movie Apps'),
        backgroundColor: Colors.green,
      ),
      resizeToAvoidBottomPadding: false,
      body: new Container(
        child: GridView.count(
          childAspectRatio: (itemWidth / itemHeight),
          controller: new ScrollController(keepScrollOffset: false),
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          crossAxisCount: 2,
          children: listMovie,
        ),
      ),
    );
  }
}

class DetailGridView extends StatelessWidget {
  DetailGridView({this.nama, this.gambar});

  final String nama;
  final String gambar;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: ListView(
        children: <Widget>[
          new Container(
            height: 300.0,
            child: new Hero(
              tag: nama,
              child: new Material(
                child: new InkWell(
                  child: new Image.asset(
                    "assets/img/$gambar",
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ),
          new BagianNama(
            nama: nama,
          ),
          new BagianIcon(),
          new BagianKeterangan(),
        ],
      ),
    );
  }
}

class BagianNama extends StatelessWidget {
  BagianNama({this.nama});
  final String nama;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      padding: EdgeInsets.all(10.0),
      child: new Row(
        children: <Widget>[
          new Expanded(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text(
                  nama,
                  style: new TextStyle(fontSize: 20.0, color: Colors.green),
                ),
                new Text(
                  "$nama\@gmail.com",
                  style: new TextStyle(fontSize: 17.0, color: Colors.grey),
                )
              ],
            ),
          ),
          new Row(
            children: <Widget>[
              new Icon(
                Icons.star,
                size: 30.0,
                color: Colors.red,
              ),
              new Text(
                "12",
                style: new TextStyle(fontSize: 18.0),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class BagianIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.all(10.0),
      child: new Row(
        children: <Widget>[
          new IconText(
            iconData: Icons.call,
            text: "Call",
          ),
          new IconText(
            iconData: Icons.message,
            text: "Message",
          ),
          new IconText(
            iconData: Icons.photo,
            text: "Photo",
          ),
        ],
      ),
    );
  }
}

class IconText extends StatelessWidget {
  IconText({this.iconData, this.text});

  final IconData iconData;
  final String text;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Expanded(
      child: new Column(
        children: <Widget>[
          new Icon(
            iconData,
            size: 20.0,
            color: Colors.green,
          ),
          new Text(
            text,
            style: new TextStyle(fontSize: 12.0, color: Colors.green),
          )
        ],
      ),
    );
  }
}

class BagianKeterangan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //TODO: implement build
    return new Container(
      padding: EdgeInsets.all(10.0),
      child: new Card(
          child: new Padding(
        padding: const EdgeInsets.all(10.0),
        child: new Text(
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
          style: new TextStyle(fontSize: 14.0),
          textAlign: TextAlign.justify,
        ),
      )),
    );
  }
}
