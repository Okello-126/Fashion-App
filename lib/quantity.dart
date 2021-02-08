import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Quantity extends StatefulWidget {
  Quantity({Key key}) : super(key: key);

  @override
  _QuantityState createState() => _QuantityState();
}

String size = 'nothing';

class _QuantityState extends State<Quantity> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        width: 300,
        height: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text('Select size',
                style: GoogleFonts.dekko(
                    color: Colors.black87,
                    fontSize: 22,
                    fontWeight: FontWeight.normal)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FlatButton(
                  color: Colors.black,
                  onPressed: () {
                    setState(() {
                      size = 'Small';
                    });
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => this.widget));
                  },
                  child: Text('S',
                      style: GoogleFonts.dekko(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.normal)),
                ),
                FlatButton(
                  color: Colors.black,
                  onPressed: () {
                    setState(() {
                      size = 'Medium';
                    });
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => this.widget));
                  },
                  child: Text('M',
                      style: GoogleFonts.dekko(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.normal)),
                ),
                FlatButton(
                  color: Colors.black,
                  onPressed: () {
                    setState(() {
                      size = 'Large';
                    });
                
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => this.widget));
                  },
                  child: Text('L',
                      style: GoogleFonts.dekko(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.normal)),
                )
              ],
            ),
          ],
        ));
  }
}
