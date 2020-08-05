import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SocietyTile extends StatefulWidget {
   SocietyTile({
    this.img,this.subtitle,this.title,this.id
  });
 
  final String title;
  final String img;
  final String subtitle;
  final int id;

 
  @override
  _SocietyTileState createState() => _SocietyTileState();
}

class _SocietyTileState extends State<SocietyTile> {
  int _counter = 1;

  int _color = 0xff453658;
  int _textColor = 0xFFE0E0E0;


  void _colorChange(int id) async{
    print(_counter);
    final prefs = await SharedPreferences.getInstance();
    _counter += 1;

    if(_counter%2 == 0){
      //selected    
      setState(() {
        _color=0xFF69F0AE;
        _textColor =0xFF616161;  
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
                child: FlatButton(
                    child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.black,
                        backgroundImage: NetworkImage(
                          widget.img,
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
                      Text(
                        widget.subtitle,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.openSans(
                            textStyle: TextStyle(
                                color: Color(_textColor),
                                fontSize: 10,
                                fontWeight: FontWeight.w600)),
                        
                      ),
                      
                    ],
                  ),
                  onPressed: (){
                    _colorChange(widget.id);
                  },
   
                ),
              );
   
  }
}