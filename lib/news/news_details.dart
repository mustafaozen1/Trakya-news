import 'package:flutter/material.dart';
import 'package:trakya_news/constant/color_constant.dart';

class NewsDetails extends StatefulWidget {
  final String title,
      imageUrl,
      originalText,
      luhnText,
      lexrankText,
      lsaText,
      textrankText,
      gisoText,
      ortayolText,
      allInOneText,
      category,
      date;

  NewsDetails({
    Key? key,
    required this.title,
    required this.imageUrl,
    required this.originalText,
    required this.luhnText,
    required this.lexrankText,
    required this.lsaText,
    required this.textrankText,
    required this.gisoText,
    required this.ortayolText,
    required this.allInOneText,
    required this.category,
    required this.date,
  }) : super(key: key);

  @override
  State<NewsDetails> createState() => _NewsDetailsState();
}

class _NewsDetailsState extends State<NewsDetails> {
  List<String> textList = [
    "Orjinal Metin",
    "Luhn Özeti",
    "Lexrank Özeti",
    "LSA Özeti",
    "TextRank Özeti",
    "Giso Özeti",
    "OrtaYol Özeti",
    "All In One Özeti"
  ];
  String dropdownValue = "assssdas";
  String _selectedItem = "Luhn Özeti";

  List<String> _dropdownItems = [
    "Orjinal Metin",
    "Luhn Özeti",
    "Lexrank Özeti",
    "LSA Özeti",
    "TextRank Özeti",
    "Giso Özeti",
    "OrtaYol Özeti"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Color.fromARGB(255, 255, 254, 254),
      body: ListView(
        children: [
          Container(
            decoration: BoxDecoration(color: Colors.amber),
            height: 250,
            child: Stack(
              children: [
                Stack(alignment: Alignment.center, children: <Widget>[
                  Container(
                    height: 250,
                    child: Image.network(
                      widget.imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 235),
                    height: 30.0,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        gradient: LinearGradient(
                            begin: FractionalOffset.topCenter,
                            end: FractionalOffset.bottomCenter,
                            colors: [
                              const Color.fromARGB(255, 45, 45, 45)
                                  .withOpacity(0.0),
                              const Color.fromARGB(255, 50, 50, 50),
                            ],
                            stops: const [
                              0.0,
                              1.0
                            ])),
                  ),
                  Center(
                    child: Container(
                      margin: EdgeInsets.only(left: 80, top: 160),
                      height: 50,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              bottomLeft: Radius.circular(20)),
                          color: Color.fromARGB(255, 144, 17, 8)),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.calendar_month,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Center(
                              child: Text(
                            widget.date,
                            style: TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontWeight: FontWeight.normal,
                            ),
                          )),
                          const SizedBox(
                            width: 15,
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 20),
                            child: Center(
                              child: Text(
                                widget.category.toUpperCase(),
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.normal),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ]),
              ],
            ),
          ),
          Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                  color: Color.fromARGB(255, 144, 17, 8)),
              margin: const EdgeInsets.only(right: 15, top: 0),
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 8),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    "${widget.title.toUpperCase()}",
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: 200,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomLeft: Radius.circular(20)),
                    color: Color.fromARGB(255, 144, 17, 8)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    DropdownButton<String>(
                      icon: Icon(Icons.arrow_drop_down_outlined),
                      dropdownColor: Color.fromARGB(255, 144, 17, 8),
                      value: _selectedItem,
                      items: _dropdownItems.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: TextStyle(
                                fontSize: 25,
                                color: Color.fromARGB(255, 255, 255, 255)),
                          ),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedItem = newValue!;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
          _textVisibility(
              textType: "Orjinal Metin", contentsText: widget.originalText),
          _textVisibility(
              textType: "Luhn Özeti", contentsText: widget.luhnText),
          _textVisibility(
              textType: "Lexrank Özeti", contentsText: widget.lexrankText),
          _textVisibility(textType: "LSA Özeti", contentsText: widget.lsaText),
          _textVisibility(
              textType: "TextRank Özeti", contentsText: widget.textrankText),
          _textVisibility(
              textType: "Giso Özeti", contentsText: widget.gisoText),
          _textVisibility(
              textType: "OrtaYol Özeti", contentsText: widget.ortayolText),
          _textVisibility(
              textType: "All In One Özeti", contentsText: widget.allInOneText),
        ],
      ),
    );
  }

  Visibility _textVisibility({textType, contentsText}) {
    return Visibility(
      visible: _selectedItem == textType,
      child: Container(
        margin: const EdgeInsets.all(20),
        child: Text(
          contentsText,
          style: TextStyle(
              fontSize: 23,
              color: Color.fromARGB(255, 0, 0, 0),
              fontWeight: FontWeight.normal),
        ),
      ),
    );
  }
}
