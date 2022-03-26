import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shop_app/models/Banner.dart';

import '../../../size_config.dart';

class SmallBanners extends StatelessWidget {
  final List<DisplayBanner> banners;
  const SmallBanners({Key key, @required this.banners}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return banners != null
        ? ListView.builder(
            itemCount: banners.length,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 2.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: getProportionateScreenWidth(80),
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                  child: CachedNetworkImage(
                    imageUrl: banners[index].imageUrl,
                    fit: BoxFit.cover,
                    // placeholder: (BuildContext context, String url) =>
                    //     Container(
                    //   color: Theme.of(context).primaryColor,
                    //   child: Center(
                    //     child: Container(
                    //         width: MediaQuery.of(context).size.width * 0.2,
                    //         child: Image.asset('assets/images/logo.png')),
                    //   ),
                    // ),
                  ),
                ),
              ),
            ),
          )
        : Container(
            width: MediaQuery.of(context).size.width,
            height: getProportionateScreenWidth(80),
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
  }
}
