import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Container(
            child: Image.network(
              'http://cvresumetemplate.com/maha-personal-cv-resume-html-template/assets/images/ab-img.png'
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('About me'),
                Text('Hello, I’m a Patrick, web-developer based on Paris. I have rich experience in web site design & building and customization. Also I am good at'),
              ],
            ),
          ),
        )
      ],
    );
  }
}
