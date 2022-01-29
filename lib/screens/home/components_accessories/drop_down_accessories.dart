import 'package:flutter/material.dart';

class DropDown extends StatefulWidget {
  @override
  _DropDownState createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  String dropdownvalue = 'Choose';

  var items = [
    'Top Wear',
    'Bottom Wear',
    'Ethnic Wear',
    'Accessories',
    'Footwear',
    'Health Gear'
    'Printed T shirts for men'
  ];

  @override
  Widget build(BuildContext context) {
    return  Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DropdownButton(
                onChanged: (String value) {},
                value: dropdownvalue,
                icon: Icon(Icons.keyboard_arrow_down),
                items: items.map((String items) {
                  return DropdownMenuItem(value: items, child: Text(items));
                }).toList(),
                // onChanged: (String newValue) {
                //   setState(() {
                //     dropdownvalue = newValue;
                //   });
                // },
              ),
            ],
          ),
        ),
      
    );
  }
}
