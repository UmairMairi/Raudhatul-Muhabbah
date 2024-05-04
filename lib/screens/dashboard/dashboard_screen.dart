import 'package:circular_bottom_navigation/circular_bottom_navigation.dart';
import 'package:circular_bottom_navigation/tab_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:raudhatul_muhabbah/cotrollers/dashboard_controller.dart';
import 'package:raudhatul_muhabbah/extentions/string_extentions.dart';
import 'package:raudhatul_muhabbah/screens/about_screen.dart';
import 'package:raudhatul_muhabbah/screens/daily_benefits_screen.dart';
import 'package:raudhatul_muhabbah/screens/dashboard/history_screen.dart';
import 'package:raudhatul_muhabbah/screens/dashboard/home_screen.dart';
import 'package:raudhatul_muhabbah/screens/dashboard/profile_screen.dart';
import 'package:raudhatul_muhabbah/screens/dashboard/tasbih_screen.dart';
import 'package:raudhatul_muhabbah/screens/login_screen.dart';
import 'package:raudhatul_muhabbah/utils/PrefUtils.dart';
import 'package:raudhatul_muhabbah/utils/assets_paths.dart';
import 'package:raudhatul_muhabbah/utils/colors.dart';
import 'package:raudhatul_muhabbah/utils/my_styles.dart';
import 'package:raudhatul_muhabbah/utils/widget_functions.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  static const String tag = "/dashboard_screen";

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  late List<Widget> list;
  late List<TabItem> _tabs;
  var index = 1;
  late CircularBottomNavigationController _navigationController;
  var controller = Get.find<DashboardController>();

  @override
  void initState() {
    super.initState();
    list = [
      const HistoryScreen(),
      const HomeScreen(),
      ProfileScreen(currentIndex: (val) {
        index = val;
        _navigationController.value = val;
      }),
      const AboutScreen(),
      const TasbihScreen(),
      const DailyBenefitsScreen(),
    ];
    _tabs = List.of([
      TabItem(Icons.history, "History", MyColors.whiteColor, labelStyle: MyTextStyle.medium.copyWith(fontSize:18,color: MyColors.whiteColor),),
      TabItem(Icons.home_outlined, "Home", MyColors.whiteColor, labelStyle: MyTextStyle.medium.copyWith(fontSize:18,color: MyColors.whiteColor)),
      TabItem(Icons.account_circle_outlined, "Profile", MyColors.whiteColor, labelStyle: MyTextStyle.medium.copyWith(fontSize:18,color: MyColors.whiteColor)),
    ]);

    _navigationController = CircularBottomNavigationController(index);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var width = size.width;
    var height = size.height;
    if (height < width) {
      width = height;
      height = width;
    }

    return Scaffold(
        key: _scaffoldKey,
        extendBodyBehindAppBar: false,
        endDrawer: Drawer(
          backgroundColor: MyColors.colorPrimaryDark,
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 40),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal:10.0),
                      child: Row(
                        children: [
                          Image.asset(
                            Images.appLogo2,
                            color: MyColors.whiteColor,
                            height: 100,
                          ),
                          const Spacer(),
                          GestureDetector(
                            onTap: (){
                              _scaffoldKey.currentState?.closeEndDrawer();
                            },
                            child: Container(
                                child: SvgPicture.asset(
                                  Images.iconClose,
                                  height: 40,
                                  width: 40,
                                )),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Divider(
                      color: MyColors.whiteColor,
                      height: 1,
                    ),
                    ListTile(
                      leading: SvgPicture.asset(Images.iconHomeWhite),
                      title: Text(
                        'Home',
                        style: MyTextStyle.subTitle
                            .copyWith(color: MyColors.whiteColor),
                      ),
                      onTap: () {
                        setState(() {
                          index = 1;
                        });
                        _scaffoldKey.currentState?.closeEndDrawer();

                      },
                    ),
                    ListTile(
                      leading: SvgPicture.asset(Images.iconAbout),
                      title: Text(
                        'About',
                        style: MyTextStyle.subTitle
                            .copyWith(color: MyColors.whiteColor),
                      ),
                      onTap: () {
                        setState(() {
                          index = 3;
                        });
                        _scaffoldKey.currentState?.closeEndDrawer();
                      },
                    ),
                    ListTile(
                      leading: SvgPicture.asset(Images.iconTasbih),
                      title: Text(
                        'Tasbih',
                        style: MyTextStyle.subTitle
                            .copyWith(color: MyColors.whiteColor),
                      ),
                      onTap: () {
                        setState(() {
                          index = 4;
                        });
                        _scaffoldKey.currentState?.closeEndDrawer();
                      },
                    ),
                    ListTile(
                      leading: const Icon(
                        Icons.account_circle_outlined,
                        color: Colors.white,
                      ),
                      title: Text(
                        'Profile',
                        style: MyTextStyle.subTitle
                            .copyWith(color: MyColors.whiteColor),
                      ),
                      onTap: () {
                        setState(() {
                          index = 2;
                        });
                        _scaffoldKey.currentState?.closeEndDrawer();
                      },
                    ),
                    ListTile(
                      leading: const Icon(
                        Icons.history,
                        color: Colors.white,
                      ),
                      title: Text(
                        'History',
                        style: MyTextStyle.subTitle
                            .copyWith(color: MyColors.whiteColor),
                      ),
                      onTap: () {
                        setState(() {
                          index = 0;
                        });
                        _scaffoldKey.currentState?.closeEndDrawer();
                      },
                    ),
                    ListTile(
                      leading: const Icon(
                        Icons.history,
                        color: Colors.white,
                      ),
                      title: Text(
                        'Daily Benefits',
                        style: MyTextStyle.subTitle
                            .copyWith(color: MyColors.whiteColor),
                      ),
                      onTap: () {
                        setState(() {
                          index = 5;
                        });
                        _scaffoldKey.currentState?.closeEndDrawer();
                      },
                    ),
                    const Divider(
                      color: MyColors.whiteColor,
                      height: 1,
                    ),
                    ListTile(
                      leading: SvgPicture.asset(Images.iconLogout),
                      title: Text(
                        'Logout',
                        style: MyTextStyle.subTitle
                            .copyWith(color: MyColors.whiteColor),
                      ),
                      onTap: () {
                        MyPrefUtils.clearCaches()
                            .then((value) => Get.offAllNamed(LoginScreen.tag));
                        _scaffoldKey.currentState?.closeEndDrawer();
                      },
                    ),
                    const Divider(
                      color: MyColors.whiteColor,
                      height: 1,
                    ),
                  ],
                ),
                const Spacer(),
                Row(
                  children: [
                    InkWell(
                      splashColor: Colors.grey,
                      onTap: () {
                        "https://www.facebook.com".launch();
                      },
                      child: Container(
                        height: 50.0,
                        width: 50.0,
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: MyColors.whiteColor,
                            ),
                            borderRadius: BorderRadius.circular(5.0)),
                        child: SvgPicture.asset(
                          Images.iconFacebook,
                        ),
                      ),
                    ),
                    const Spacer(),
                    InkWell(
                      splashColor: Colors.grey,
                      onTap: () {
                        "https://www.tiktok.com".launch();
                      },
                      child: Container(
                        height: 50.0,
                        width: 50.0,
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: MyColors.whiteColor,
                            ),
                            borderRadius: BorderRadius.circular(5.0)),
                        child: SvgPicture.asset(
                          Images.iconTikTok,
                        ),
                      ),
                    ),
                    const Spacer(),
                    InkWell(
                      splashColor: Colors.grey,
                      onTap: () {
                        "https://www.instagram.com".launch();
                      },
                      child: Container(
                        height: 50.0,
                        width: 50.0,
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: MyColors.whiteColor,
                            ),
                            borderRadius: BorderRadius.circular(5.0)),
                        child: SvgPicture.asset(
                          Images.iconInsta,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        appBar: WidgetFunction.awnAppBar(
          leading: Container(
            padding: const EdgeInsets.all(5.0),
            margin: const EdgeInsets.only(left:10.0),
            child: Image.asset(Images.appLogo2,),
          ),
          backgroundColor: Colors.transparent,
          actions: [
            InkWell(
              onTap: () {
                // _scaffoldKey.currentState?.openDrawer();
                _scaffoldKey.currentState!.openEndDrawer();
              },
              child: Container(
                  padding: const EdgeInsets.all(10.0),
                  child: SvgPicture.asset(
                    Images.iconDrawer,
                    height: 30.0,
                    width: 30.0,
                  )),
            ),
           const SizedBox(width: 5,)
          ],
        ),
        backgroundColor: MyColors.backgroundColor,
        body: Column(
          children: [
            const Divider(),
            Expanded(child: list[index]),
          ],
        ),
        bottomNavigationBar: CircularBottomNavigation(
          barHeight:80,
          _tabs,
          controller: _navigationController,
          barBackgroundColor: MyColors.colorPrimary,
          normalIconColor: MyColors.whiteColor,
          selectedIconColor: MyColors.colorPrimary,
          circleStrokeWidth: 2,
          circleSize: 70,
          selectedCallback: (int? selectedPos) {
            switch (selectedPos) {
              case 0:
                {
                  setState(() {
                    index = 0;
                    _navigationController.value = 0;
                  });
                }
                break;
              case 1:
                {
                  setState(() {
                    index = 1;
                    _navigationController.value = 1;
                  });
                }
                break;
              case 2:
                {
                  setState(() {
                    index = 2;
                    _navigationController.value = 2;
                  });
                }
                break;
            }
          },
        )
        // bottomNavigationBar: BottomAppBar(
        //   padding: EdgeInsets.zero,
        //   clipBehavior: Clip.antiAliasWithSaveLayer,
        //   notchMargin: 5.0,
        //   elevation: 5,
        //   height: 60.0,
        //   color: MyColors.colorPrimary,
        //   surfaceTintColor: MyColors.colorPrimary,
        //   child: Padding(
        //     padding: const EdgeInsets.symmetric(horizontal: 20.0),
        //     child: Row(
        //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //       children: <Widget>[
        //         IconButton(
        //           icon: const Padding(
        //             padding: EdgeInsets.all(5.0),
        //             child: Icon(
        //               Icons.history,
        //               color: Colors.white,
        //             ),
        //           ),
        //           onPressed: () {
        //             setState(() {
        //               index = 0;
        //             });
        //           },
        //         ),
        //         Container(),
        //         Container(),
        //         Container(),
        //         IconButton(
        //           icon: const Padding(
        //             padding: EdgeInsets.all(5.0),
        //             child: Icon(
        //               Icons.account_circle_outlined,
        //               color: Colors.white,
        //             ),
        //           ),
        //           onPressed: () {
        //             setState(() {
        //               index = 2;
        //             });
        //           },
        //         ),
        //       ],
        //     ),
        //   ),
        // ),
        // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        // floatingActionButton: Container(
        //   decoration: const BoxDecoration(
        //     shape: BoxShape.circle,
        //     color: MyColors.colorPrimary,
        //   ),
        //   child: Padding(
        //     padding: const EdgeInsets.all(5.0),
        //     child: FloatingActionButton(
        //       onPressed: () async {
        //         setState(() {
        //           index = 1;
        //         });
        //       },
        //       isExtended: true,
        //       shape: const CircleBorder(),
        //       backgroundColor: MyColors.whiteColor,
        //       child: Column(
        //         crossAxisAlignment: CrossAxisAlignment.center,
        //         mainAxisAlignment: MainAxisAlignment.center,
        //         children: [
        //           SvgPicture.asset(
        //             Images.iconHome,
        //
        //             height: 20.0,
        //             width: 20.0,
        //             color: MyColors.colorPrimary,
        //           ),
        //           const Flexible(
        //             child: FittedBox(
        //               child: Text(
        //                 "Home",
        //                 style: TextStyle(color: MyColors.colorPrimary),
        //               ),
        //             ),
        //           ),
        //         ],
        //       ),
        //     ),
        //   ),
        // ),
        );
  }
}
