import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashion_demo/categories.dart';
import 'package:fashion_demo/modeldetails.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class Model extends StatefulWidget {
  Model({Key key}) : super(key: key);

  @override
  _ModelState createState() => _ModelState();
}

int _index = 173637;
int specie;

class _ModelState extends State<Model> {
  int getQuantity() {
    DocumentReference documentReference = FirebaseFirestore.instance
        .collection('orders')
        .doc('JLvX5PBy1OVyOculNK7P');

    documentReference.get().then((snapshot) {
      setState(() {
        specie = snapshot.data()['quantity'];
      });
    });
    return specie;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
            automaticallyImplyLeading: true,

      
          title: Text('Shop by Look',
              style: GoogleFonts.sourceSansPro(
                  fontSize: 16, fontWeight: FontWeight.bold)),
          actions: [
            Icon(Icons.shopping_basket_outlined),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(getQuantity().toString(),
                      style: GoogleFonts.sourceSansPro(
                          fontSize: 18, fontWeight: FontWeight.bold)),
                ),
              ],
            )
          ],
        ),
        body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('models').snapshots(),
          builder: (context, snapshot) {
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.data.docs.length,
              itemBuilder: (context, index) {
                DocumentSnapshot model = snapshot.data.docs[index];
                return Stack(
                  children: [
                    Image.network(model['image'],
                        height: 750, width: 412, fit: BoxFit.fill),
                    Visibility(
                      visible: index == _index ? false : true,
                      child: Positioned(
                        bottom: 10,
                        child: Container(
                          width: 411,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              FlatButton(
                                onPressed: () {
                                  setState(() {
                                    _index = index;
                                  });
                                },
                                color: Color(0xffE4E5E8),
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 3.5),
                                  child: Text('CUSTOMIZE & ADD TO CART',
                                      style: GoogleFonts.doHyeon(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Visibility(
                      visible: index == _index ? true : false,
                      child: Positioned(
                          bottom: 10,
                          child: Container(
                              width: 412,
                              height: 100,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: 4,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: FlatButton(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      onPressed: () {
                                        pushNewScreen(context,
                                            screen: ModelDetails(),
                                            withNavBar: false);
                                      },
                                      color: Colors.white,
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 20),
                                        child: Column(
                                          children: [
                                            Image.network(
                                                index == 0
                                                    ? 'https://images-na.ssl-images-amazon.com/images/I/51Sh4P6iyBL._SX38_SY50_CR,0,0,38,50_.jpg'
                                                    : index == 1
                                                        ? 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRKc_D46QtZAEQIqAKCj8GNI3HcNBc-2AoI-w&usqp=CAU'
                                                        : index == 3
                                                            ? 'https://slimages.macys.com/is/image/MCY/products/2/optimized/8271952_fpx.tif'
                                                            : 'https://images-na.ssl-images-amazon.com/images/I/61zejSfKTmL._AC_UX522_.jpg',
                                                height: 50),
                                            Text(
                                                index == 0
                                                    ? 'Coat'
                                                    : index == 1
                                                        ? 'Jeans'
                                                        : index == 2
                                                            ? 'Watch'
                                                            : 'Shoes',
                                                style: GoogleFonts.dekko(
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ))),
                    ),
                    Visibility(
                        visible: index == _index ? true : false,
                        child: Positioned(
                            bottom: 120,
                            right: 10,
                            child: FlatButton(
                                onPressed: () {
                                  setState(() {
                                    _index = 283364;
                                  });
                                  print(specie);
                                },
                                color: Colors.black,
                                child: Icon(Icons.clear_all_rounded,
                                    color: Colors.white))))
                  ],
                );
              },
            );
          },
        ));
  }
}
