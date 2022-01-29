import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';

import 'router_service.dart';
import '../models/Product.dart';

class DynamicLinkService {
  final RouterService _routerService = RouterService();

  Future handleDynamicLinks() async {
    final PendingDynamicLinkData data =
        await FirebaseDynamicLinks.instance.getInitialLink();
    _handleDeepLink(data);
    FirebaseDynamicLinks.instance.onLink(
        onSuccess: (PendingDynamicLinkData data) async {
      _handleDeepLink(data);
    }, onError: (OnLinkErrorException e) async {
      print('Link failed: ${e.message}');
    });
  }

  void _handleDeepLink(PendingDynamicLinkData data) {
    final Uri deeplink = data?.link;
    if (deeplink != null) {
      print('deeplink $deeplink');
      print(deeplink.pathSegments.toString());
      final String route = '/${deeplink.pathSegments.first}';
      print(route);
      print(deeplink.queryParameters);
      _routerService.navigationKey.currentState.pushReplacementNamed(route,
          arguments: {
            deeplink.queryParameters['key']:
                int.parse(deeplink.queryParameters['value'])
          });
    }
  }

  Future<String> createProductLink(Product product) async {
    final DynamicLinkParameters parameters = DynamicLinkParameters(
      uriPrefix: 'https://app.zifresh.in',
      link: Uri.parse(
          'https://zifresh.in/product?key=productId&value=${product.id}'),
      androidParameters: AndroidParameters(
        packageName: 'com.zifresh',
      ),
      googleAnalyticsParameters: GoogleAnalyticsParameters(
        campaign: 'example-promo',
        medium: 'social',
        source: 'orkut',
      ),
      socialMetaTagParameters: SocialMetaTagParameters(
        title: product.name,
        imageUrl: Uri.parse(product.imageUrls.first),
      ),
    );

    final Uri dynamicUrl = await parameters.buildUrl();

    return dynamicUrl.toString();
  }
}
