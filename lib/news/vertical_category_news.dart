import 'package:flutter/material.dart';
import 'package:trakya_news/constant/color_constant.dart';
import 'package:trakya_news/home/viewModel/home_view_model.dart';

import 'news_details.dart';

class VerticalCategoryNews extends StatelessWidget {
  var title;
  var categoryUrl;

  VerticalCategoryNews(
      {Key? key, required this.title, required this.categoryUrl})
      : super(key: key);

  HomeViewModel homeVM = HomeViewModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.blackForGrad,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: ColorConstant.blackForGrad,
        title: Text(
          title,
          style: TextStyle(
              color: Color.fromARGB(255, 255, 255, 255),
              fontSize: 22,
              fontWeight: FontWeight.normal),
        ),
      ),
      body: FutureBuilder(
        future: homeVM.fetchNewsByCategory(categoryUrl),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data != false) {
              return Container(
                padding: EdgeInsets.all(5),
                child: ListView.builder(
                    itemCount:
                        snapshot.data.length > 40 ? 30 : snapshot.data.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
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
                        child: Container(
                          padding: EdgeInsets.only(
                              left: 20, right: 20, bottom: 10, top: 10),
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(10),
                                ),
                                child: Image.network(snapshot.data[index][2]),
                              ),
                              Container(
                                margin:
                                    const EdgeInsets.only(top: 10, left: 20),
                                alignment: Alignment.bottomLeft,
                                child: Text(
                                  snapshot.data[index][1],
                                  style: TextStyle(
                                      inherit: true,
                                      fontSize: 30,
                                      color: ColorConstant.white,
                                      shadows: [
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
                              )
                            ],
                          ),
                        ),
                      );
                    }),
              );
            } else {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Kayıtlı Haber Bildiriminiz Bulunmamaktadır. Bildirimler Menüsünden Bildirim Ekleyebilirsiniz.",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                ),
              );
            }
          } else {
            return Text("LOADING...");
          }
        },
      ),
    );
  }
}
