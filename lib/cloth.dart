import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Cloth extends StatefulWidget {
  final List imagelist;
  final String price;
  Cloth(this.imagelist, this.price);

  @override
  _ClothState createState() => _ClothState();
}

int _index = 0;

class _ClothState extends State<Cloth> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        setState(() {
          _index = 0;
        });
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          actions: [
            Icon(Icons.bookmark_border),
            SizedBox(
              width: 15,
            ),
            Icon(Icons.share,size:22),
            SizedBox(
              width: 15,
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Card(
                    child: Container(
                        padding: EdgeInsets.only(top: 60, bottom: 20),
                        height: 355,
                        width: 411,
                        child: Image.network(
                            _index == 0
                                ? widget.imagelist[0]
                                : _index == 1
                                    ? widget.imagelist[1]
                                    : _index == 2
                                        ? widget.imagelist[2]
                                        : widget.imagelist[3],
                            height: 400)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('DOUBLJU MEN\'S SHORT SLEEVE POLO T-SHIRT',
                        style: GoogleFonts.sourceSansPro(
                            color: Color(0xff444242),
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Container(
                width: 411,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Text('Colors :',
                          style: GoogleFonts.sourceSansPro(
                              color: Colors.black,
                              fontSize: 22,
                              fontWeight: FontWeight.bold)),
                    ),
                    SizedBox(
                        height: 80,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 4,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12),
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    _index = index;
                                  });
                                },
                                child: Card(
                                  elevation: _index == index ? 3 : 0,
                                  child: Padding(
                                    padding: EdgeInsets.all(20),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              width: 0, color: Colors.green),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(50)),
                                          color: index == 0
                                              ? Color(0xffe34507)
                                              : index == 1
                                                  ? Color(0xffedce0c)
                                                  : index == 2
                                                      ? Color(0xffa7a5ac)
                                                      : Color(0xff851634)),
                                      width: 30,
                                      height: 30,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ))
                  ],
                ),
              ),
              SizedBox(height: 30),
              Row(
                children: [
                  SizedBox(width: 20),
                  Container(
                    width: 150,
                    height: 60,
                    decoration: BoxDecoration(
                        color: Colors.yellow[100],
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: ExpansionTile(
                      tilePadding: EdgeInsets.only(right: 10),
                      title: Text(''),
                      leading: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text('Size ',
                            style: GoogleFonts.dekko(
                                color: Colors.black,
                                fontSize: 22,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ),
                  SizedBox(width: 50),
                  Container(
                      height: 60,
                      width: 150,
                      decoration: BoxDecoration(
                          color: Colors.yellow[100],
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Text('Quantity :',
                                style: GoogleFonts.dekko(
                                    color: Colors.black,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold)),
                          ),
                          SizedBox(
                            height: 30,
                            width: 30,
                            child: TextFormField(
                              decoration: InputDecoration(
                                  hintText: '1',
                                  hintStyle: GoogleFonts.dekko(
                                      color: Colors.black,
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold),
                                  isDense: true,
                                  contentPadding:
                                      EdgeInsets.only(bottom: 2, left: 10)),
                            ),
                          ),
                        ],
                      ))
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 10),
                    child: Text('Price :',
                        style: GoogleFonts.dekko(
                            color: Colors.black,
                            fontSize: 22,
                            fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(width: 180),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 10),
                    child: Text('Tzs ' + widget.price,
                        style: GoogleFonts.dekko(
                            color: Colors.orange,
                            fontSize: 22,
                            fontWeight: FontWeight.bold)),
                  ),
                ],
              ),SizedBox(height: 10),
              Container(
                height: 60,
                width: 412,
                color: Colors.black54,
                child: Row(
                  children: [
                    Container(
                        width: 206,
                        height: 70,
                        color: Colors.blue,
                        padding: EdgeInsets.only(left: 20),
                        child: Row(
                          children: [
                            Image.network(
                                'https://firebasestorage.googleapis.com/v0/b/fashion-demo-app.appspot.com/o/icons8-add-basket-24.png?alt=media&token=c9ce66a4-f4fa-40a7-9f88-17377479ba5f'),
                            Padding(
                              padding: const EdgeInsets.only(left: 18.0),
                              child: Text('ADD TO BAG',
                                  style: GoogleFonts.sourceSansPro(
                                      color: Colors.black,
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ],
                        )),
                    Container(
                        width: 205,
                        height: 70,
                        color: Colors.yellow,
                        padding: EdgeInsets.only(left: 30),
                        child: Row(
                          children: [
                            Image.network(
                                'https://firebasestorage.googleapis.com/v0/b/fashion-demo-app.appspot.com/o/icons8-buy-30.png?alt=media&token=2998d073-9c3c-49a0-a5e8-9464af4fc649'),
                            Padding(
                              padding: const EdgeInsets.only(left: 18.0),
                              child: Text('BUY NOW',
                                  style: GoogleFonts.sourceSansPro(
                                      color: Colors.black,
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ],
                        ))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

/* 
 Card(
                        elevation: elevation,
                        child: Padding(
                          padding:  EdgeInsets.all(_padding),
                          child: Container(
                            decoration: BoxDecoration(
                                border:
                                    Border.all(width: 0, color: Colors.green),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50)),
                                color: Color(0xff2f463d)),
                            width: 30,
                            height: 30,
                          ),
                        ),
                      ), */
