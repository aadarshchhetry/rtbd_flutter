import 'dart:math';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class ViewReview extends StatefulWidget {
  const ViewReview({Key key}) : super(key: key);

  @override
  _ViewReviewState createState() => _ViewReviewState();
}

class _ViewReviewState extends State<ViewReview> {
  List colors = [
    Colors.deepOrange,
    Colors.green,
    Colors.blue,
    Colors.pink,
    Colors.purple
  ];
  Random random = new Random();
  int i = 0;

  Query _ref;
  @override
  void initState() {
    super.initState();
    _ref = FirebaseDatabase.instance.reference().child("data");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        child: FirebaseAnimatedList(
          query: _ref,
          itemBuilder: (BuildContext context, DataSnapshot snapshot,
              Animation<double> animation, int index) {
            Map review = snapshot.value;
            print(review);
            i = random.nextInt(5);
            return Center(
              child: ListTile(
                leading: CircleAvatar(
                    child: Text(
                      review['User Name'][0],
                      style: TextStyle(color: Colors.white),
                    ),
                    backgroundColor: colors[i]),
                title: Text(review['User Name']),
                subtitle: Text(review['review']),
                trailing: Text(review['rating'].toString()),
              ),
            );
          },
        ),
      ),
    );
  }
}
