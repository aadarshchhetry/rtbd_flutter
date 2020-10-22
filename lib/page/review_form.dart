import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ReviewForm extends StatefulWidget {
  const ReviewForm({Key key}) : super(key: key);

  @override
  _ReviewFormState createState() => _ReviewFormState();
}

class _ReviewFormState extends State<ReviewForm> {
  TextEditingController _reviewController;
  TextEditingController _nameController;
  double ratingScore;
  DatabaseReference _ref;
  @override
  void initState() {
    _reviewController = TextEditingController();
    _nameController = TextEditingController();
    _ref = FirebaseDatabase.instance.reference().child("data");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(30),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RatingBar(
                onRatingUpdate: (rate) {
                  ratingScore = rate;
                },
                initialRating: 1,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
              ),
              TextFormField(
                decoration: InputDecoration(hintText: "Leave a review"),
                controller: _reviewController,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: "Your Name",
                  ),
                  controller: _nameController,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              RaisedButton(
                color: Colors.cyan,
                onPressed: () {
                  saveReview();
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Submit",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                        fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void saveReview() {
    String review = _reviewController.text;
    String name = _nameController.text;
    Map<String, dynamic> sendReview = {
      'User Name': name,
      'review': review,
      'rating': ratingScore,
    };
    _ref.push().set(sendReview).then((value) {
      Navigator.pop(context);
    });
  }
}
