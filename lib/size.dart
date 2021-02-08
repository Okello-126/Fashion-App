import 'package:flutter/material.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:numberpicker/numberpicker.dart';

class OrderSize extends StatefulWidget {
  int _currentValue = 0, quantity = 0;
  OrderSize({Key key}) : super(key: key);

  @override
  _SizeState createState() => _SizeState();
}



class _SizeState extends State<OrderSize> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        width: 320,
        height: 190,
        child: Column(
          children: [
            Text('Select quantity',
                style: GoogleFonts.dekko(
                    color: Colors.black87,
                    fontSize: 22,
                    fontWeight: FontWeight.normal)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                NumberPicker.integer(
                    initialValue: widget._currentValue,
                    minValue: 0,
                    maxValue: 100,
                    textStyle: GoogleFonts.doHyeon(
                     
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                    onChanged: (newValue) =>
                        setState(() => widget._currentValue = newValue)),
                FlatButton(
                  color: Colors.blue,
                  onPressed: () {},
                  child: Text(widget._currentValue.toString(),
                      style: GoogleFonts.doHyeon(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.normal)),
                ),
                FlatButton(
                    color: Colors.black,
                    onPressed: () {
                      setState(() {
                        widget.quantity = widget._currentValue;
                      });
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => this.widget));
                    },
                    child: Icon(Entypo.check, color: Colors.white))
              ],
            ),
          ],
        ));
  }
}
