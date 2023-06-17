import "package:flutter/material.dart";
import 'package:trakya_news/constant/url_constant.dart';
import 'package:trakya_news/home/viewModel/home_view_model.dart';

import '../../news/news_details.dart';

class HorizontalNewsByCategory extends StatelessWidget {
  var categoryUrl;

  var title;

  HorizontalNewsByCategory(
      {Key? key, required this.title, required this.categoryUrl})
      : super(key: key);

  HomeViewModel homeVM = HomeViewModel();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: homeVM.fetchNewsByCategory(categoryUrl),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return Container(
            padding: const EdgeInsets.all(10),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                margin: EdgeInsets.only(left: 5),
                child: Text(
                  title,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.normal),
                ),
              ),
              SizedBox(
                height: 200,
                child: ListView.builder(
                    itemCount:
                        snapshot.data.length > 20 ? 20 : snapshot.data.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
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
                        child: SizedBox(
                          width: 200,
                          child: Column(children: [
                            Container(
                              margin: EdgeInsets.all(5),
                              child: ClipRRect(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(10),
                                ),
                                child: Container(
                                  height: 120,
                                  width: 200,
                                  child: Image.network(
                                    snapshot.data[index][2],
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Flexible(
                              child: Container(
                                alignment: Alignment.topCenter,
                                child: Text(
                                  snapshot.data[index][1],
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            )
                          ]),
                        ),
                      );
                    }),
              )
            ]),
          );
        } else {
          return Text("LOADING...");
        }
      },
    );
  }
}
