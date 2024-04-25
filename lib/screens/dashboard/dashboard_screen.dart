import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:raudhatul_muhabbah/screens/dashboard/history_screen.dart';
import 'package:raudhatul_muhabbah/screens/dashboard/profile_screen.dart';
import 'package:raudhatul_muhabbah/utils/assets_paths.dart';
import 'package:raudhatul_muhabbah/utils/colors.dart';
import 'package:raudhatul_muhabbah/utils/widget_functions.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  static const String tag = "/dashboard_screen";

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  late List<Widget> list;
  var index = 0;
  @override
  void initState() {
    super.initState();
    list = [
      const HistoryScreen(),
      const ProfileScreen(),
    ];
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
      extendBodyBehindAppBar: false,
      appBar: WidgetFunction.awnAppBar(
        leading: Image.asset(Images.appLogo),
        backgroundColor: Colors.transparent,
        actions: [
          Container(
              padding: const EdgeInsets.all(10.0),
              child: SvgPicture.asset(
                Images.iconDrawer,
                height: 30.0,
                width: 30.0,
              ))
        ],
      ),
      backgroundColor: MyColors.backgroundColor,
      body: list[index],
      bottomNavigationBar: BottomAppBar(
        padding: EdgeInsets.zero,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        notchMargin: 5.0,
        elevation: 5,
        height: 60.0,
        color: MyColors.colorPrimary,
        surfaceTintColor: MyColors.colorPrimary,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                icon: const Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Icon(
                    Icons.history,
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  setState(() {
                    index = 0;
                  });
                },
              ),
              Container(),
              Container(),
              Container(),
              IconButton(
                icon: const Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Icon(
                    Icons.account_circle_outlined,
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  setState(() {
                    index = 1;
                  });
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: MyColors.colorPrimary,
        ),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: FloatingActionButton(
            onPressed: () async {},
            isExtended: true,
            shape: const CircleBorder(),
            backgroundColor: MyColors.whiteColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  Images.iconHome,

                  height: 20.0,
                  width: 20.0,
                  color: MyColors.colorPrimary,
                ),
                const Flexible(
                  child: FittedBox(
                    child: Text(
                      "Home",
                      style: TextStyle(color: MyColors.colorPrimary),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
