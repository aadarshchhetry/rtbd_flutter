import 'package:flutter/material.dart';
import 'package:rtbd/page/review_form.dart';
import 'package:rtbd/page/viewlist.dart';

main(List<String> args) {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/': (context) => HomePage(),
      '/view': (context) => ViewReview(),
      '/push': (context) => ReviewForm(),
    },
  ));
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                color: Colors.cyan,
                onPressed: () {
                  Navigator.pushNamed(context, '/push');
                },
                child: Text(
                  "Leave Review",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                      fontSize: 16),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              FlatButton(
                child: Text("View All Review"),
                onPressed: () {
                  Navigator.pushNamed(context, '/view');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
