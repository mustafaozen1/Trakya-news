import 'package:flutter/material.dart';
import 'package:trakya_news/calendar/calendar.dart';
import 'package:trakya_news/constant/url_constant.dart';
import 'package:trakya_news/helper/storage_helper.dart';
import 'package:trakya_news/login/view/login.dart';
import 'package:trakya_news/login/viewmodel/phone_login_view_model.dart';

import 'package:trakya_news/settings/view/settings_view.dart';

import 'constant/color_constant.dart';
import 'home/view/home_view.dart';
import 'news/vertical_category_news.dart';
import 'notifications/view/schedule_notification.dart';

class NavigationDrawer extends StatefulWidget {
  NavigationDrawer({
    Key? key,
  }) : super(key: key);

  @override
  State<NavigationDrawer> createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: ColorConstant.black,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 50,
                ),
                Text(
                  "Trakya News",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 45,
                      fontWeight: FontWeight.normal),
                ),
                // Text(
                //   "Mustafa",
                //   style: TextStyle(
                //       color: Colors.white,
                //       fontSize: 40,
                //       fontWeight: FontWeight.bold),
                // ),
              ],
            ),
          ),
          // const Divider(
          //   indent: 10,
          //   endIndent: 10,
          //   color: Colors.white,
          // ),

          const Divider(
            indent: 10,
            endIndent: 10,
            color: Colors.white,
          ),
          Container(
            decoration:
                BoxDecoration(color: Color.fromARGB(255, 205, 205, 205)),
            child: ListTile(
              title: const Text(
                "BİLDİRİMLER",
                style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 25,
                    fontWeight: FontWeight.normal),
              ),
              onTap: (() {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ScheduleNotificationView(
                              title: "BİLDİRİMLER",
                            )));
              }),
            ),
          ),

          Container(
            // decoration:
            //     BoxDecoration(color: Color.fromARGB(255, 205, 205, 205)),
            child: ListTile(
              title: const Text(
                "SİZİN SEÇTİKLERİNİZ",
                style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontSize: 25,
                    fontWeight: FontWeight.normal),
              ),
              onTap: (() async {
                var userId = await StorageHelper.instance.getId();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => VerticalCategoryNews(
                              title: "SİZİN SEÇTİKLERİNİZ",
                              categoryUrl: UrlConstant.checkAlarmNews + userId,
                            )));
              }),
            ),
          ),

          ListTile(
            title: const Text(
              "SON DAKİKA",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.normal),
            ),
            onTap: (() {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => VerticalCategoryNews(
                            title: "SON DAKİKA HABERLERİ",
                            categoryUrl: UrlConstant.breakingNews,
                          )));
            }),
          ),
          ListTile(
            title: const Text(
              "EKONOMİ",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.normal),
            ),
            onTap: (() {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => VerticalCategoryNews(
                            title: "EKONOMİ",
                            categoryUrl: UrlConstant.economyNews,
                          )));
            }),
          ),
          ListTile(
            title: const Text(
              "SPOR",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.normal),
            ),
            onTap: (() {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => VerticalCategoryNews(
                            title: "SPOR",
                            categoryUrl: UrlConstant.sportNews,
                          )));
              ;
            }),
          ),
          ListTile(
            title: const Text(
              "DÜNYA",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.normal),
            ),
            onTap: (() {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => VerticalCategoryNews(
                            title: "DÜNYA",
                            categoryUrl: UrlConstant.worldNews,
                          )));
            }),
          ),
          ListTile(
            title: const Text(
              "MAGAZİN",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.normal),
            ),
            onTap: (() {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => VerticalCategoryNews(
                            title: "MAGAZİN",
                            categoryUrl: UrlConstant.magazineNews,
                          )));
            }),
          ),
          ListTile(
            title: const Text(
              "TEKNOLOJİ",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.normal),
            ),
            onTap: (() {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => VerticalCategoryNews(
                            title: "TEKNOLOJİ",
                            categoryUrl: UrlConstant.technologyNews,
                          )));
            }),
          ),
          ListTile(
            title: const Text(
              "HAYAT",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.normal),
            ),
            onTap: (() {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => VerticalCategoryNews(
                            title: "HAYAT",
                            categoryUrl: UrlConstant.lifeNews,
                          )));
            }),
          ),

          ListTile(
            tileColor: Color.fromARGB(255, 138, 13, 5),
            title: const Text(
              "ÇIKIŞ YAP",
              style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontSize: 25,
                  fontWeight: FontWeight.normal),
            ),
            onTap: (() {
              StorageHelper.instance.deleteStorage();
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => PhoneLogin()));
            }),
          ),
        ],
      ),
    );
  }
}
