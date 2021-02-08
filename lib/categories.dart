import 'package:fashion_demo/model.dart';
import 'package:fashion_demo/poloshirts.dart';
import 'package:fashion_demo/shirts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class Categories extends StatefulWidget {
  Categories({Key key}) : super(key: key);

  @override
  _CategoriesState createState() => _CategoriesState();
}

int selectedindex;
Color inactivecolor = Color(0xffEBE7D0), activecolor = Colors.yellow;

class _CategoriesState extends State<Categories> {
  Widget _buildCategory(
      String category, Color _color, double height, String image) {
    return Card(
      elevation: 3,
      child: Container(
          decoration: BoxDecoration(
              color: _color,
              borderRadius: BorderRadius.all(Radius.circular(0))),
          child: Column(
            children: [
              SizedBox(height: 10),
              Image.network(
                image,
              ),
              SizedBox(height: height),
              Text(category,
                  style: GoogleFonts.sourceSansPro(
                      fontSize: 16, fontWeight: FontWeight.bold))
            ],
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff121110),
        appBar: AppBar(
            automaticallyImplyLeading: false,
            centerTitle: true,
            toolbarHeight: 70,
            elevation: 0,
            backgroundColor: Color(0xff121110),
            title: Padding(
              // Color(0xff444242)
              padding: const EdgeInsets.only(top: 15, bottom: 0),
              child: Text('Categories',
                  style: GoogleFonts.doHyeon(color: Colors.white)),
            )),
        body: Padding(
          padding: EdgeInsets.only(left: 5, right: 5),
          child: Stack(
            children: [
              GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, crossAxisSpacing: 1, mainAxisSpacing: 1),
                itemCount: 10,
                itemBuilder: (context, index) {
                  Widget widget;

                  switch (index) {
                    case 0:
                      widget = GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedindex = index;
                          });

                          pushNewScreen(context,
                              screen: PoloShirts(), withNavBar: false);
                        },
                        child: _buildCategory(
                            'Polo-Shirts',
                            selectedindex == index
                                ? activecolor
                                : inactivecolor,
                            30,
                            'https://firebasestorage.googleapis.com/v0/b/fashion-demo-app.appspot.com/o/polo-shirt.png?alt=media&token=5299d363-81ea-4ace-8c96-b31722c7c08f'),
                      );
                      break;

                    case 1:
                      widget = _buildCategory(
                          'T-Shirts',
                          selectedindex == index ? activecolor : inactivecolor,
                          30,
                          'https://firebasestorage.googleapis.com/v0/b/fashion-demo-app.appspot.com/o/tshirt.png?alt=media&token=1ef65ea2-8033-429f-aa1a-fdc10c1b24d9');
                      break;

                    case 2:
                      widget = widget = GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedindex = index;
                          });

                          pushNewScreen(context,
                              screen: Shirts(), withNavBar: false);
                        },
                        child: _buildCategory(
                            'Shirts',
                            selectedindex == index
                                ? activecolor
                                : inactivecolor,
                            30,
                            'https://firebasestorage.googleapis.com/v0/b/fashion-demo-app.appspot.com/o/shirts.png?alt=media&token=5bf8e981-e848-4cf6-a2d0-ecc73d1c6722'),
                      );
                      break;

                    case 3:
                      widget = _buildCategory(
                          'Jackets',
                          selectedindex == index ? activecolor : inactivecolor,
                          30,
                          'https://firebasestorage.googleapis.com/v0/b/fashion-demo-app.appspot.com/o/jacket.png?alt=media&token=95acbc9e-4bbf-4d05-8844-788864097b43');
                      break;
                    case 4:
                      widget = _buildCategory(
                          'Pants',
                          selectedindex == index ? activecolor : inactivecolor,
                          30,
                          'https://firebasestorage.googleapis.com/v0/b/fashion-demo-app.appspot.com/o/jeans.png?alt=media&token=8b3940c1-b75b-4328-92e0-626e62c7d94e');
                      break;
                    case 5:
                      widget = _buildCategory(
                          'Shorts',
                          selectedindex == index ? activecolor : inactivecolor,
                          30,
                          'https://firebasestorage.googleapis.com/v0/b/fashion-demo-app.appspot.com/o/pants.png?alt=media&token=8f7db732-1bbd-4b50-9e51-efbdcc9a16f7');
                      break;

                    case 6:
                      widget = _buildCategory(
                          'Accesories',
                          index == selectedindex ? activecolor : inactivecolor,
                          30,
                          'https://firebasestorage.googleapis.com/v0/b/fashion-demo-app.appspot.com/o/watch.png?alt=media&token=7ee5498a-0219-42c4-9f5f-977b299c70fb');
                      break;

                    case 7:
                      widget = _buildCategory(
                          'Footwares',
                          selectedindex == index ? activecolor : inactivecolor,
                          30,
                          'https://firebasestorage.googleapis.com/v0/b/fashion-demo-app.appspot.com/o/shoes.png?alt=media&token=3b590069-d947-4a7f-b169-030bda635c58');
                      break;
                    case 8:
                      widget = GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedindex = index;
                          });

                          pushNewScreen(context,
                              screen: Model(), withNavBar: false);
                        },
                        child: _buildCategory(
                            'Shop by Look',
                            selectedindex == index
                                ? activecolor
                                : inactivecolor,
                            45,
                            'https://firebasestorage.googleapis.com/v0/b/fashion-demo-app.appspot.com/o/icons8-portrait-mode-male-50.png?alt=media&token=39249f26-6d05-4b73-b4cf-0165d38ed756'),
                      );
                      break;
                  }
                  return GestureDetector(
                    child: widget,
                    onTap: () {
                      setState(() {
                        selectedindex = index;
                      });
                    },
                  );
                },
              ),
              Positioned(
                top: 420,
                left: 10,
                child: Row(
                  children: [
                    Text('Collections',
                        style: GoogleFonts.doHyeon(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.normal)),
                    SizedBox(width: 250),
                    /* */

                    Icon(Icons.chevron_right, color: Colors.white)
                  ],
                ),
              ),
              Align(
                alignment: Alignment(0.5, 0.93),
                child: Container(
                    height: 160,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 8.0, right: 10),
                          child: Stack(
                            children: [
                              Image.network(
                                  index == 0
                                      ? 'https://th.bing.com/th/id/OIP.EoFfZ5w2rVrv38v4qt7YYAHaE8?w=265&h=180&c=7&o=5&pid=1.7'
                                      : index == 1
                                          ? 'https://th.bing.com/th/id/OIP.L9lCxLLJ-mW9IjY94dhBIQHaE8?w=282&h=188&c=7&o=5&pid=1.7'
                                          : index == 2
                                              ? 'https://th.bing.com/th/id/OIP.W_9ROQWvk_0bDJfGNkpRYAHaE8?pid=Api&rs=1'
                                              : index == 3
                                                  ? 'https://www.outfittrends.com/wp-content/uploads/2015/02/Mens-fashion-trends-2014.jpg'
                                                  : 'https://media.gq.com/photos/5b1fefeda251bf0cb3c2450f/master/w_1280%2Cc_limit/2018-06_GQ_Best-Stuff-Backpacks-want-les-essentiels_3x2.jpg',
                                  width: 300,
                                  height: 175,
                                  fit: BoxFit.cover),
                              Positioned(
                                left: 5,
                                bottom: 0,
                                child: FlatButton(
                                  onPressed: () {},
                                  color: Colors.white.withOpacity(0.8),
                                  child: Text(
                                      index == 0
                                          ? 'Nail office style'
                                          : index == 1
                                              ? 'Sports Utility Wear'
                                              : index == 2
                                                  ? 'Best Sneakers Brands'
                                                  : index == 3
                                                      ? 'Casual street outfits'
                                                      : 'Work Backpucks',
                                      style: GoogleFonts.dekko(
                                          color: Colors.black54,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    )),
              ),
            ],
          ),
        ));
  }
}
