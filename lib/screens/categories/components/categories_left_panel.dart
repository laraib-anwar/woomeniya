import 'package:flutter/material.dart';
import 'package:shop_app/models/Category.dart';

class CategoriesLeftPanel extends StatelessWidget {
  final List<Category> categories;
  final int selectedIndex;
  final Function(int index) onTap;
  CategoriesLeftPanel(
      {Key key, this.categories, this.selectedIndex, this.onTap})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.33,
      height: double.infinity,
      color: Colors.grey[300],
      child: Padding(
        padding: EdgeInsets.only(top: 8.0),
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: categories.length,
          itemBuilder: (BuildContext context, int index) => InkWell(
            onTap: () {
              onTap(index);
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
              color: selectedIndex == index ? Colors.white : Colors.grey[300],
              child: Text(
                categories[index].name,
                style: TextStyle(
                  color:
                      selectedIndex == index ? Colors.grey[800] : Colors.black,
                  fontSize: selectedIndex == index ? 14 : 13,
                  fontWeight: selectedIndex == index
                      ? FontWeight.w900
                      : FontWeight.w400,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
