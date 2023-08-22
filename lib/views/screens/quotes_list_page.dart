import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:share_extend/share_extend.dart';
import '../../contoller/favourite_controller.dart';
import '../../contoller/get_quote_controller.dart';
import '../../contoller/qoutestitle_controller.dart';
import '../../modals/quote_database.dart';
import '../../utils/attributes.dart';
import '../../utils/dbhelper.dart';

class second_page extends StatefulWidget {
  const second_page({super.key});

  @override
  State<second_page> createState() => _second_pageState();
}

class _second_pageState extends State<second_page> {
  List<String> imageAssets = [
    "assets/bgimages/q1.jpg",
    "assets/bgimages/q2.jpg",
    "assets/bgimages/q3.jpg",
    "assets/bgimages/g4.jpg",
    "assets/bgimages/1.jpeg",
    "assets/bgimages/2.jpeg",
    "assets/bgimages/3.jpeg",
    "assets/bgimages/4.jpeg",
    "assets/bgimages/5.jpeg",
    "assets/bgimages/6.jpeg",
    "assets/bgimages/7.jpeg",
    "assets/bgimages/8.jpeg",
    "assets/bgimages/9.jpeg",
    "assets/bgimages/10.jpeg",

  ];

  TitleController titleController = Get.find<TitleController>();
  final FavoriteController favoriteController = Get.put(FavoriteController());
  GetQuotesController getQuotesController = Get.put(GetQuotesController());

  @override
  void initState() {
    super.initState();
    getQuotesController.getQuotesList(
        allQuotes: DBHelper.dbHelper.fatchAllQuotes(id: 0));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_ios,color: Colors.white,),
        ),
        title: Obx(() => Text(titleController.categoryName.value,style: TextStyle(color: Colors.white),)),
        centerTitle: true,
        backgroundColor: Color(0xff302d4c),
      ),
      body: FutureBuilder(
        future: getAllQuotes,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("ERROR : ${snapshot.error}"),
            );
          } else if (snapshot.hasData) {
            List<QuotesDatabaseModel>? data = snapshot.data;
            if (data == null || data.isEmpty) {
              return const Center(
                child: Text("NO DATA AVAILABLE"),
              );
            } else {
              return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  final quote = data[index].quotes;
                  final isFavorite = favoriteController.isFavorite(quote);
                  return Padding(
                    padding: const EdgeInsets.all(16),
                    child: Container(
                      height: Get.height * 0.6,
                      width: Get.width,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(30),
                        image: DecorationImage(
                          image: AssetImage(
                              imageAssets[index % imageAssets.length]),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 6,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(left: 16, right: 16),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "“",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 80),
                                        ),
                                      ]),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    right: 50,
                                    left: 50,
                                  ),
                                  child: Text(
                                    data[index].quotes,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(left: 16, right: 16),
                                  child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          "”",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 80),
                                        )
                                      ]),
                                ),
                                SizedBox(
                                  height: Get.height * 0.02,
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: Colors.black),
                                borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(20),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        if (data[index].favorite == 0) {
                                          DBHelper.dbHelper.updateQuote(
                                              favorite: 1,
                                              quote: data[index].quotes);
                                          QuotesDatabaseModel
                                              quotesDataBaseModel =
                                              QuotesDatabaseModel(
                                            id: data[index].id,
                                            quotes: data[index].quotes,
                                            author: data[index].author,
                                            favorite: data[index].favorite,
                                          );
                                          DBHelper.dbHelper.insertFavorite(
                                              data: quotesDataBaseModel);
                                        } else {
                                          DBHelper.dbHelper.updateSecondQuote(
                                              favorite: 0,
                                              quote: data[index].quotes);
                                          DBHelper.dbHelper.deleteFavorite(
                                              quote: data[index].quotes);
                                        }
                                        getQuotesController.getQuotesList(
                                          allQuotes: DBHelper.dbHelper
                                              .fatchAllQuotes(
                                                  id: data[index].id!),
                                        );
                                        print(data[index].id);
                                        favoriteController
                                            .toggleFavorite(quote);
                                      });
                                    },
                                    child: Row(
                                      children: [
                                        Icon(
                                          (isFavorite)
                                              ? CupertinoIcons.heart_solid
                                              : CupertinoIcons.heart,
                                          color: isFavorite
                                              ? Colors.red
                                              : Colors.black,
                                        ),
                                        SizedBox(
                                          width: Get.width * 0.01,
                                        ),
                                        Text(
                                          "Like",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: isFavorite
                                                ? Colors.red
                                                : Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Get.toNamed(
                                        "/edit",
                                        arguments: data[index].quotes,
                                      );
                                    },
                                    child: Row(
                                      children: [
                                        const Icon(
                                          Icons.edit,
                                          color: Colors.black,
                                        ),
                                        SizedBox(
                                          width: Get.width * 0.01,
                                        ),
                                        const Text(
                                          "Edit",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Clipboard.setData(
                                        ClipboardData(
                                          text: data[index].quotes,
                                        ),
                                      ).then(
                                        (value) => Get.snackbar(
                                          "Quotes",
                                          "Copy  Clipboard",
                                          snackPosition: SnackPosition.BOTTOM,
                                          backgroundColor:
                                              Colors.white.withOpacity(0.6),
                                          padding: const EdgeInsets.all(
                                            10,
                                          ),
                                        ),
                                      );
                                    },
                                    child: Row(
                                      children: [
                                        const Icon(
                                          Icons.copy,
                                          color: Colors.black,
                                        ),
                                        SizedBox(
                                          width: Get.width * 0.01,
                                        ),
                                        const Text(
                                          "Copy",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      ShareExtend.share(
                                          data[index].quotes, quote);
                                    },
                                    child: Row(
                                      children: [
                                        const Icon(
                                          Icons.share,
                                          color: Colors.black,
                                        ),
                                        SizedBox(
                                          width: Get.width * 0.01,
                                        ),
                                        const Text(
                                          "Share",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
