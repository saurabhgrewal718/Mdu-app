import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SocietyTile extends StatefulWidget {
   SocietyTile({
    this.event,this.img,this.subtitle,this.title,this.id
  });


 
  final String title;
  final String img;
  final String subtitle;
  final String event;
  final int id;

 
  @override
  _SocietyTileState createState() => _SocietyTileState();
}

class _SocietyTileState extends State<SocietyTile> {
  int _counter = 1;

  int _color = 0xff453658;
  int _textColor = 0xFFFAFAFA;


  void _colorChange(int id) async{
    final prefs = await SharedPreferences.getInstance();
    _counter += 1;

    if(_counter%2 == 0){
      //selected    
      setState(() {
        _color=0xFF69F0AE;
        _textColor =0xFF212121;  
      });

      prefs.setString(widget.id.toString(), widget.title);

       
    }else{
      //not selected
      setState(() {
        _color=0xff453658;
        _textColor = 0xFFFAFAFA;
      });
      prefs.remove(widget.id.toString());
    }
    
   
  }
 

  @override
  Widget build(BuildContext context) {    
    return Container(
              // height: 100,
              decoration: BoxDecoration(
                  color: Color(_color), borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.network(
                      widget.img,
                      width: 70,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    widget.title,
                    style: GoogleFonts.openSans(
                        textStyle: TextStyle(
                            color: Color(_textColor),
                            fontSize: 16,
                            fontWeight: FontWeight.w600)),
                  ),
                  // SizedBox(
                  //   height: 8,
                  // ),
                  Text(
                    widget.subtitle,
                    style: GoogleFonts.openSans(
                        textStyle: TextStyle(
                            color: Color(_textColor),
                            fontSize: 10,
                            fontWeight: FontWeight.w600)),
                  ),
                  // SizedBox(
                  //   height: 5,
                  // ),
                  FlatButton(
                    child: Text(
                    widget.event,
                    style: GoogleFonts.openSans(
                        textStyle: TextStyle(
                            color: Color(_textColor),
                            fontSize: 11,
                            fontWeight: FontWeight.w600)),
                  ),
                  onPressed: (){
                    _colorChange(widget.id);
                  },
                    
                  )
                ],
              ),
            );
  }
}