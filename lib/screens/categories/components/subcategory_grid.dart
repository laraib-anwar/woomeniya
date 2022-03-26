import 'package:flutter/material.dart';
import 'package:shop_app/screens/categories/components/grid_item.dart';
import 'package:shop_app/models/Category.dart';

class SubcategoryGrid extends StatelessWidget {
  final Category category;
  SubcategoryGrid({Key key, this.category}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.66,
      height: double.infinity,
      child: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: category.subCategories.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemBuilder: (context, i) =>
                  GridItem(subcategory: category.subCategories[i]),
            ),
          ),
        ),
      ),
    );
  }
}
