import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:mduapp/models/story_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';

class SortWidget extends StatefulWidget {
  
  @override
  _SortWidgetState createState() => _SortWidgetState();
}

class _SortWidgetState extends State<SortWidget> {
  final GlobalKey<FormBuilderState> _form = GlobalKey<FormBuilderState>();
  Map<String,dynamic> data;
  var _isLoading = false;
  var genderOptions = ['Male', 'Female',];
  var deptOptions =  [
    'Botany','Biochemistry','Biotechnology',
    'Bionformatics',
    'Medical Biotechnology',
    'Chemistry',
    'Commerce',
    'Computer Science',
    'Defence & Strategic Studies',
    'Economics',
    'Education',
    'UIET',
    'English & Foreign Languages',
    'Environment Sciences',
    'Food Technology',
    'Genetics',
    'Geography',
    'Hindi',
    'History',
    'IHTM',
    'IMSAR',
    'Journalism',
    'Law',
    'Library Science',
    'Mathematics',
    'Microbiology',
    'Music',
    'Physical Education',
    'Pharmaceutical Sciences',
    'Physics',
    'Political Science',
    'Psychology',
    'Public Administrations',
    'Sanskrit',
    'Sociology',
    'Statistics',
    'Visual Arts',
    'Zoology',
  ];



  @override
  Widget build(BuildContext context) {
      final story = Provider.of<StoryModel>(context,listen:false);
      return Scaffold(
          body: FormBuilder(
              key: _form,
              child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              width: double.infinity,
              child: Column(
                children: <Widget>[
                  SizedBox(height: 50,),
                  Center(
                    child: Text('Sort The Stories',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                      color: Colors.black
                    ),),
                  ),
                  Column(
                    children: <Widget>[
                      SizedBox(height: 50,),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("Sort By Gender", style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Colors.black87
                            ),),
                            SizedBox(height: 10,),
                            FormBuilderDropdown(
                              attribute: 'gender',
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey[400])
                                ),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey[400])
                                ),
                              ),
                              hint: Text(''),
                              items: genderOptions
                                  .map((gender) => DropdownMenuItem(
                                        value: gender,
                                        child: Text('$gender'),
                                      ))
                                  .toList(),
                              // isExpanded: false,
                              allowClear: true,
                            ),
                            SizedBox(height: 30,),
                          ],
                        ),
                      ),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("Sort By Department", style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Colors.black87
                            ),),
                            SizedBox(height: 10,),
                            FormBuilderDropdown(
                              attribute: 'dept',
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey[400])
                                ),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey[400])
                                ),
                              ),
                              hint: Text(''),
                              items: deptOptions
                                  .map((dept) => DropdownMenuItem(
                                        value: dept,
                                        child: Text('$dept'),
                                      ))
                                  .toList(),
                              // isExpanded: false,

                              allowClear: true,
                            ),
                            SizedBox(height: 30,),
                          ],
                        ),
                      ),
                      
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.5,
                        padding: EdgeInsets.only(top: 3, left: 3),
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
                          height: 40,
                          onPressed:(){
                             _form.currentState.save();
                            data = _form.currentState.value;
                            print(data);
                            story.sortedStories(data['gender'].toString(), data['dept'].toString());
                            Navigator.pop(context);
                          },
                          color: Colors.greenAccent,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)
                          ),
                          child: Text("Sort Stories", style: TextStyle(
                            fontWeight: FontWeight.w600, 
                            fontSize: 18
                          ),),
                        ),
                      ),
                      SizedBox(height: 20,),
                      FlatButton(
                          onPressed: () {
                             Navigator.pop(context);
                          },
                          child: Text("Cancel", style: TextStyle(
                            fontWeight: FontWeight.w600, 
                            fontSize: 18,
                            color: Colors.redAccent
                          ),),
                        ),
                                 
                     ],
                  ),
                ],
              ),
            ),
          ),


      );
  }
}

