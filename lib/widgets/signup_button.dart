import 'package:flutter/material.dart';

class SignupButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Container(
              padding: EdgeInsets.only(top: 3, left: 3),
              margin: EdgeInsets.only(left:40,right:40),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                border: Border(
                  bottom: BorderSide(color: Colors.black),
                  top: BorderSide(color: Colors.black),
                  left: BorderSide(color: Colors.black),
                  right: BorderSide(color: Colors.black),
                )
              ),
              child: MaterialButton(
                minWidth: double.infinity,
                height: 60,
                onPressed: (){},
                color: Colors.greenAccent,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50)
                ),
                child: Text('Select Societies', style: TextStyle(
                  fontWeight: FontWeight.w600, 
                  fontSize: 18
                ),),
              ),
            );
  }
}