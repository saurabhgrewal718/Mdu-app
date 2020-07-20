import 'package:flutter/material.dart';

class ProfileInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: <Widget>[
          SizedBox(height:30),
          Container(
            margin: EdgeInsets.only(top: 3),
            child: CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage('https://image.freepik.com/free-vector/illustration-concept-with-people-peeping_23-2148387077.jpg'),
            ),
          ),
          SizedBox(height:20),
          Text(
            'Nicolas Adams',
            style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
          ),
          SizedBox(height:10),
          Text(
            'nicolasadams@gmail.com',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height:20),
        ],
      ),
    );
  }
}