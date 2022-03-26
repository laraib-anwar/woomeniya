import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/app_provider.dart';
import 'package:shop_app/providers/category_view_model.dart';
import 'package:shop_app/size_config.dart';

class DiscountBanner extends StatefulWidget {
  final int categoryId;
  const DiscountBanner({Key key, @required this.categoryId}) : super(key: key);

  @override
  _DiscountBannerState createState() => _DiscountBannerState();
}

class _DiscountBannerState extends State<DiscountBanner> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Consumer<CategoryViewModel>(
      builder: (context, model, child) => Container(
        child: model.carouselBanners != null
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CarouselSlider(
                    options: CarouselOptions(
                      height: 400.0,
                      autoPlay: true,
                      initialPage: 0,
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      autoPlayInterval: Duration(seconds: 2),
                      onPageChanged: (i, res) {
                        setState(() {
                          _current = i;
                        });
                      },
                    ),
                    items: model.carouselBanners
                        .map(
                          (banner) => Container(
                            margin: EdgeInsets.symmetric(horizontal: 2.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              // margin: EdgeInsets.symmetric(horizontal: 1.0),
                              // decoration: BoxDecoration(
                              //     color: Colors.green[50],
                              //     borderRadius: BorderRadius.circular(20)),

                              child: Image.network(
                                banner.imageUrl,
                                width: 400,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                  SizedBox(
                    height: getProportionateScreenWidth(20),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: model.carouselBanners
                        .asMap()
                        .entries
                        .map(
                          (entry) => Container(
                            width: getProportionateScreenWidth(5),
                            height: getProportionateScreenWidth(5),
                            margin: EdgeInsets.symmetric(
                                vertical: 5.0, horizontal: 2.0),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: _current == entry.key
                                  ? Colors.black
                                  : Colors.grey,
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ],
              )
            : Container(
                height: 400,
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
      ),
    );
  }
}
