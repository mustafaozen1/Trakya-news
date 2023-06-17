import "package:flutter/material.dart";
import 'package:carousel_slider/carousel_slider.dart';
import 'package:trakya_news/constant/url_constant.dart';
import 'package:trakya_news/home/viewModel/home_view_model.dart';
import 'package:trakya_news/news/news_details.dart';

import '../../constant/color_constant.dart';

class BreakingNews extends StatelessWidget {
  BreakingNews({
    Key? key,
  }) : super(key: key);

  HomeViewModel HomeVM = HomeViewModel();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: HomeVM.fetchNewsByCategory(UrlConstant.breakingNews),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          padding: const EdgeInsets.all(10),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            if (snapshot.hasData)
              SizedBox(
                child: CarouselSlider.builder(
                    options: CarouselOptions(
                      enableInfiniteScroll: true,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 5),
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      pauseAutoPlayOnTouch: true,
                      viewportFraction: 0.8,
                      enlargeCenterPage: true,
                    ),
                    itemCount: 5,
                    itemBuilder: (context, index, realIndex) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => NewsDetails(
                                        title: snapshot.data[index][1],
                                        imageUrl: snapshot.data[index][2],
                                        originalText: snapshot.data[index][3],
                                        luhnText: snapshot.data[index][4],
                                        lexrankText: snapshot.data[index][5],
                                        lsaText: snapshot.data[index][6],
                                        textrankText: snapshot.data[index][7],
                                        gisoText: snapshot.data[index][8],
                                        ortayolText: snapshot.data[index][9],
                                        allInOneText: snapshot.data[index][10],
                                        date: snapshot.data[index][11],
                                        category: snapshot.data[index][14],
                                      )));
                        },
                        child: Stack(alignment: Alignment.center, children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(10),
                            ),
                            child: Image.network(snapshot.data[index][2]),
                          ),
                          Container(
                            // decoration: BoxDecoration(color: Colors.amber),
                            child: Container(
                              alignment: Alignment.bottomLeft,
                              margin: EdgeInsets.only(bottom: 25, left: 10),
                              child: Text(
                                snapshot.data[index][1],
                                style: TextStyle(
                                    inherit: true,
                                    fontSize: 25,
                                    color: ColorConstant.white,
                                    shadows: const [
                                      Shadow(
                                          // bottomLeft
                                          offset: Offset(-1.5, -1.5),
                                          color: Colors.black),
                                      Shadow(
                                          // bottomRight
                                          offset: Offset(1.5, -1.5),
                                          color: Colors.black),
                                      Shadow(
                                          // topRight
                                          offset: Offset(1.5, 1.5),
                                          color: Colors.black),
                                      Shadow(
                                          // topLeft
                                          offset: Offset(-1.5, 1.5),
                                          color: Colors.black),
                                    ],
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          )
                        ]),
                      );
                    }),
              )
            else
              Text("LOADING...")
          ]),
        );
      },
    );
  }
}
