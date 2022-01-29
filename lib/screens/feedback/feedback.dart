import 'package:flutter/material.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/size_config.dart';

class FeedBackScreen extends StatefulWidget {
  @override
  _FeedBackScreenState createState() => _FeedBackScreenState();
  static String routeName = "/feedback";
}

class _FeedBackScreenState extends State<FeedBackScreen> {
  List<bool> isTypeSelected = [false, false, false, true, true];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 2.0,
        centerTitle: true,
        title: Text(
          "Feedback",
          style: TextStyle(color: kPrimaryColor, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: EdgeInsets.all(
              getProportionateScreenWidth(20.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  "Please select the type of the feedback",
                  style: TextStyle(
                    color: kPrimaryColor,
                  ),
                ),
                SizedBox(height: getProportionateScreenWidth(25.0)),
                GestureDetector(
                  child: buildCheckItem(
                      title: "Login trouble", isSelected: isTypeSelected[0]),
                  onTap: () {
                    setState(() {
                      isTypeSelected[0] = !isTypeSelected[0];
                    });
                  },
                ),
                GestureDetector(
                  child: buildCheckItem(
                      title: "Phone number related",
                      isSelected: isTypeSelected[1]),
                  onTap: () {
                    setState(() {
                      isTypeSelected[1] = !isTypeSelected[1];
                    });
                  },
                ),
                GestureDetector(
                  child: buildCheckItem(
                      title: "Personal profile", isSelected: isTypeSelected[2]),
                  onTap: () {
                    setState(() {
                      isTypeSelected[2] = !isTypeSelected[2];
                    });
                  },
                ),
                GestureDetector(
                  child: buildCheckItem(
                      title: "Other issues", isSelected: isTypeSelected[3]),
                  onTap: () {
                    setState(() {
                      isTypeSelected[3] = !isTypeSelected[3];
                    });
                  },
                ),
                GestureDetector(
                  child: buildCheckItem(
                      title: "Suggestions", isSelected: isTypeSelected[4]),
                  onTap: () {
                    setState(() {
                      isTypeSelected[4] = !isTypeSelected[4];
                    });
                  },
                ),
                SizedBox(
                  height: getProportionateScreenWidth(20.0),
                ),
                buildFeedbackForm(),
                SizedBox(
                  height: getProportionateScreenWidth(20.0),
                ),
                buildNumberField(),
                Spacer(),
                Row(
                  children: [
                    FlatButton(
                      onPressed: () {},
                      child: Text(
                        "SUBMIT",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      color: Color(0xFFE5E5E5),
                      padding: EdgeInsets.all(
                        getProportionateScreenWidth(16.0),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  buildNumberField() {
    return TextField(
      style: TextStyle(color: Colors.black),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(0.0),
        prefixIcon: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border(
                  right: BorderSide(
                    width: getProportionateScreenWidth(1.0),
                    color: Color(0xFFC5C5C5),
                  ),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: getProportionateScreenWidth(10.0),
                  ),
                  Text(
                    "+60",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFC5C5C5),
                    ),
                  ),
                  Icon(
                    Icons.arrow_drop_down,
                    color: kPrimaryColor,
                  ),
                  SizedBox(
                    width: getProportionateScreenWidth(10.0),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: getProportionateScreenWidth(10.0),
            ),
          ],
        ),
        hintStyle: TextStyle(
          fontSize: 14.0,
          color: Color(0xFFC5C5C5),
        ),
        hintText: "Phone Number",
        border: OutlineInputBorder(),
      ),
    );
  }

  buildFeedbackForm() {
    return Container(
      height: getProportionateScreenWidth(200.0),
      child: Stack(
        children: [
          TextField(
            maxLines: 10,
            decoration: InputDecoration(
              hintText: "Please briefly describe the issue",
              hintStyle: TextStyle(
                fontSize: 13.0,
                color: Color(0xFFC5C5C5),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xFFE5E5E5),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    width: getProportionateScreenWidth(1.0),
                    color: Color(0xFFA6A6A6),
                  ),
                ),
              ),
              padding: EdgeInsets.all(
                getProportionateScreenWidth(8.0),
              ),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFE5E5E5),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(
                        getProportionateScreenWidth(8.0),
                      ),
                      child: Icon(
                        Icons.add,
                        color: Color(0xFFA5A5A5),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: getProportionateScreenWidth(10.0),
                  ),
                  Text(
                    "Upload screenshot (optional)",
                    style: TextStyle(
                      color: Color(0xFFC5C5C5),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildCheckItem({String title, bool isSelected}) {
    return Container(
      padding: const EdgeInsets.all(6.0),
      child: Row(
        children: [
          Icon(
            isSelected ? Icons.check_circle : Icons.add_circle,
            color: isSelected ? Colors.blue : Colors.grey,
          ),
          SizedBox(
            width: getProportionateScreenWidth(10.0),
          ),
          Text(
            title,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: isSelected ? Colors.blue : Colors.grey),
          ),
        ],
      ),
    );
  }
}
