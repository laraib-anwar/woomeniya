import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/components/coustom_bottom_nav_bar.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/enums.dart';
import 'package:shop_app/providers/app_provider.dart';
import 'package:shop_app/providers/category_view_model.dart';
import 'package:shop_app/screens/feedback/feedback.dart';
import 'package:shop_app/screens/home/components_women/body_women.dart';
import 'package:shop_app/screens/sign_in_phone/sign_in_phone_screen.dart';

import 'components/body.dart';
import 'components/home_header.dart';
import 'components_accessories/body_accessories.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = "/home";

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  TabController tabController;
  List<Tab> tabList = List();

  @override
  void initState() {
    AppProvider appProvider = Provider.of<AppProvider>(context, listen: false);
    if (appProvider.categories == null) {
      appProvider.loadCategories().then((value) {
        tabList.addAll(
          appProvider.categories
              .map(
                (category) => Tab(
                  text: category.name,
                ),
              )
              .toList(),
        );
        tabController = new TabController(vsync: this, length: tabList.length);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        flexibleSpace: HomeHeader(),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: kPrimaryColor,
              ),
              child: Row(children: [
                Image(
                    image: AssetImage("assets/images/woomeniya_splash.png"),
                    height: 400),
              ]),
            ),
            ListTile(
              title: const Text('Refer and earn',
                  style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w400)),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: const Text('About',
                  style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w400)),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: const Text('Feedback',
                  style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w400)),
              onTap: () {
                Navigator.pushNamed(context, FeedBackScreen.routeName);
              },
            ),
            ListTile(
              title: const Text('Logout',
                  style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w400)),
              onTap: () {
                Navigator.pushNamed(context, SignInPhoneScreen.routeName);
              },
            ),
          ],
        ),
      ),
      body: Consumer<AppProvider>(
        builder: (context, value, child) => value.categories != null
            ? Column(
                children: [
                  Container(
                    color: Colors.transparent,
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 4),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xfffbebd6),
                        borderRadius: BorderRadius.circular(
                          10,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: new TabBar(
                          labelColor: Colors.black,
                          labelStyle: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w500),
                          labelPadding: EdgeInsets.symmetric(horizontal: 8),
                          unselectedLabelColor: Color(0xffdda868),
                          unselectedLabelStyle: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500),
                          controller: tabController,
                          tabs: tabList,
                          indicatorColor: Theme.of(context).primaryColor,
                          indicatorSize: TabBarIndicatorSize.tab,
                          indicator: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              10.0,
                            ),
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: tabController,
                      children: value.categories
                          .map(
                            (category) => ChangeNotifierProvider.value(
                              value: CategoryViewModel(
                                  value.categoryWiseBanners[category.id]
                                      ?.where((banner) =>
                                          banner.displayLocation == 0)
                                      ?.toList(),
                                  value.categoryWiseBanners[category.id]
                                      ?.where((banner) =>
                                          banner.displayLocation == 1)
                                      ?.toList(),
                                  value.categoryWiseDeals[category.id],
                                  value.categoryWiseTopBrands[category.id]),
                              child: Body(
                                categoryId: category.id,
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ],
              )
            : Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
      ),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home),
    ));
  }
}
