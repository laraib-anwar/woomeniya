import 'package:flutter/material.dart';
import 'package:shop_app/models/Category.dart';
import 'package:shop_app/screens/categories/components/categories_left_panel.dart';
import 'package:shop_app/screens/categories/components/grid_item.dart';
import 'package:shop_app/screens/categories/components/subcategory_grid.dart';

class Body extends StatefulWidget {
  final List<Category> categories;
  Body({Key key, this.categories}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: MediaQuery.of(context).size.height,
        child: Row(
          children: [
            CategoriesLeftPanel(
                categories: widget.categories,
                selectedIndex: _selectedIndex,
                onTap: onTap),
            SubcategoryGrid(category: widget.categories[_selectedIndex])
          ],
        ),
      ),
    );
  }

  void onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
