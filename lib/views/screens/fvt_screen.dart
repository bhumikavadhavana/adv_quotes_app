import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../contoller/favourite_controller.dart';
import '../../contoller/get_quote_controller.dart';
import '../../modals/database_fvt_model.dart';
import '../../utils/dbhelper.dart';

class FvtScreen extends StatefulWidget {
  const FvtScreen({super.key});

  @override
  State<FvtScreen> createState() => _FvtScreenState();
}

class _FvtScreenState extends State<FvtScreen> {
  Future<List<FavoriteDataBaseModel>>? getAllFavorite;

  GetQuotesController getQuotesController = Get.put(GetQuotesController());
  FavoriteController favoriteController = Get.put(FavoriteController());

  @override
  void initState() {
    super.initState();
    getAllFavorite = DBHelper.dbHelper.fatchAllFavorite();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: AppBar(
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back,color: Colors.white,),
          ),
          title: const Text("favourite",style: TextStyle(color: Colors.white),),
          centerTitle: true,
          backgroundColor: Color(0xff0302d4c),
        ),
      ),
      body: FutureBuilder(
        future: getAllFavorite,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("ERROR : ${snapshot.error}"),
            );
          } else if (snapshot.hasData) {
            List<FavoriteDataBaseModel>? data = snapshot.data;
            if (data == null || data.isEmpty) {
              return Container(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "No favourite quotes!",
                        style: GoogleFonts.cabin(
                          textStyle: TextStyle(
                            fontSize: Get.height * 0.03,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return Padding(
                padding: const EdgeInsets.all(12),
                child: ListView.separated(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(data[index].quotes,
                                style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                  ),
                                )),
                            SizedBox(
                              height: Get.height * 0.01,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    data[index].author,
                                    style: GoogleFonts.poppins(
                                      textStyle: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        favoriteController
                                            .toggleFavorite(data[index].quotes);
                                        DBHelper.dbHelper.updateSecondQuote(
                                          favorite:
                                              favoriteController.isFavorite(
                                                      data[index].quotes)
                                                  ? 1
                                                  : 0,
                                          quote: data[index].quotes,
                                        );
                                        DBHelper.dbHelper.deleteFavorite(
                                            quote: data[index].quotes);
                                        getQuotesController.getQuotesList(
                                            allQuotes: DBHelper.dbHelper
                                                .fatchAllQuotes(
                                                    id: data[index].id!));
                                      });
                                    },
                                    icon: Obx(
                                      () => Icon((favoriteController
                                          .isFavorite(data[index].quotes))
                                        ?CupertinoIcons.heart
                                      :CupertinoIcons.heart_solid,
                                        color: favoriteController
                                                .isFavorite(data[index].quotes)
                                            ? Colors.black
                                            : Colors.red,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, _) => const Divider(),
                ),
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
