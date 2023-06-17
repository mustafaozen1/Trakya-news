import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:trakya_news/constant/color_constant.dart';
import 'package:trakya_news/constant/url_constant.dart';
import 'package:trakya_news/drawer.dart';
import 'package:trakya_news/home/view/breaking_news.dart';
import 'package:trakya_news/home/view/horizontal_news_by_category.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);

  List<Widget> carouselImages = [
    Image.asset("assets/images/haber1.jpg"),
    Image.asset("assets/images/haber2.jpg"),
    Image.asset("assets/images/haber3.jpg"),
    Image.asset("assets/images/haber4.jpg"),
    Image.asset("assets/images/haber6.jpg")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: NavigationDrawer(),
        appBar: AppBar(
          backgroundColor: ColorConstant.blackForGrad,
          centerTitle: true,
          title: Text(
            "Trakya News",
          ),
        ),
        backgroundColor: ColorConstant.blackForGrad,
        body: ListView(
          children: [
            BreakingNews(),
            // HorizontalNewsByCategory(
            //   title: "EKONOMİ",
            //   categoryUrl: UrlConstant.economyNews,
            // ),
            // HorizontalNewsByCategory(
            //     title: "SPOR", categoryUrl: UrlConstant.sportNews),
            HorizontalNewsByCategory(
                title: "DÜNYA", categoryUrl: UrlConstant.worldNews),
            HorizontalNewsByCategory(
                title: "MAGAZİN", categoryUrl: UrlConstant.magazineNews),
            HorizontalNewsByCategory(
                title: "TEKNOLOJİ", categoryUrl: UrlConstant.technologyNews),
            HorizontalNewsByCategory(
                title: "HAYAT", categoryUrl: UrlConstant.lifeNews),
          ],
        ));
  }

  Column _economicNews() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: Get.width,
          // decoration: BoxDecoration(color: Colors.grey.shade300),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "EKONOMİ",
              style: TextStyle(color: Colors.white, fontSize: 40),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          height: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20)),
                width: 150,
                height: 150,
                child: Column(
                  children: [
                    // Text("AKHSDGBAJKHSGDIASDA"),
                    ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset("assets/images/haber1.jpg"))
                  ],
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Container(
                width: 150,
                height: 150,
                child: Column(
                  children: [
                    // Text("AKHSDGBAJKHSGDIASDA"),
                    ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset("assets/images/haber2.jpg"))
                  ],
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Container(
                width: 150,
                height: 150,
                child: Column(
                  children: [
                    // Text("AKHSDGBAJKHSGDIASDA"),
                    ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset("assets/images/haber3.jpg"))
                  ],
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Container(
                width: 150,
                height: 150,
                child: Column(
                  children: [
                    // Text("AKHSDGBAJKHSGDIASDA"),
                    ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset("assets/images/haber4.jpg"))
                  ],
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Container(
                width: 150,
                height: 150,
                child: Column(
                  children: [
                    // Text("AKHSDGBAJKHSGDIASDA"),
                    ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset("assets/images/haber6.jpg"))
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  Column _sportNews() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: Get.width,
          // decoration: BoxDecoration(color: Colors.grey.shade300),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "SPOR",
              style: TextStyle(color: Colors.white, fontSize: 40),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          height: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              Container(
                width: 150,
                height: 150,
                child: Column(
                  children: [
                    // Text("AKHSDGBAJKHSGDIASDA"),
                    ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset("assets/images/haber1.jpg"))
                  ],
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Container(
                width: 150,
                height: 150,
                child: Column(
                  children: [
                    // Text("AKHSDGBAJKHSGDIASDA"),
                    ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset("assets/images/haber2.jpg"))
                  ],
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Container(
                width: 150,
                height: 150,
                child: Column(
                  children: [
                    // Text("AKHSDGBAJKHSGDIASDA"),
                    ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset("assets/images/haber3.jpg"))
                  ],
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Container(
                width: 150,
                height: 150,
                child: Column(
                  children: [
                    // Text("AKHSDGBAJKHSGDIASDA"),
                    ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset("assets/images/haber4.jpg"))
                  ],
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Container(
                width: 150,
                height: 150,
                child: Column(
                  children: [
                    // Text("AKHSDGBAJKHSGDIASDA"),
                    ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset("assets/images/haber6.jpg"))
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  Container _carouselSlider() {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
      padding: const EdgeInsets.all(10),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        if (2 < 1)
          Text("Loading...")
        else
          Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(30)),
              child: CarouselSlider(
                  items: carouselImages,
                  options: CarouselOptions(
                    height: 350,
                    aspectRatio: 16 / 9,
                    viewportFraction: 0.7,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 3),
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    enlargeFactor: 0.3,

                    // onPageChanged: callbackFunction,
                    scrollDirection: Axis.horizontal,
                  )))
      ]),
    );
  }
}
