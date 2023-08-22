import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_wallpaper_manager/flutter_wallpaper_manager.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import '../../modals/quote_database.dart';
import '../../utils/attributes.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_extend/share_extend.dart';


class Edit_page extends StatefulWidget {
  const Edit_page({Key? key}) : super(key: key);

  @override
  State<Edit_page> createState() => _Edit_pageState();
}

class _Edit_pageState extends State<Edit_page> {
  ScreenshotController screenshotController = ScreenshotController();
  final GlobalKey repaintBoundaryKey = GlobalKey();

  List<String> imageAssets = [
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

  List<String?> googleFonts = [
    GoogleFonts.roboto().fontFamily,
    GoogleFonts.lato().fontFamily,
    GoogleFonts.openSans().fontFamily,
    GoogleFonts.montserrat().fontFamily,
    GoogleFonts.quicksand().fontFamily,
  ];

  int currentImageIndex = 0;
  int currentFontIndex = 0;

  // void saveContainerAsImage() async {
  //   RenderRepaintBoundary boundary =
  //   repaintBoundaryKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
  //   ui.Image image = await boundary.toImage();
  //   ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
  //   Uint8List pngBytes = byteData!.buffer.asUint8List();
  //
  //   dynamic result = await ImageGallerySaver.saveImage(pngBytes);
  //   bool success = result is bool && result;
  //   String message = success ? "Failed to save image" : "Image  save Successfully";
  //   Get.snackbar("Image Save Status", message,snackPosition: SnackPosition.BOTTOM);
  // }





  @override
  Widget build(BuildContext context) {
    final quote = Get.arguments as String;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        title: const Text(
          'Edit Image',style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xff302d4c),
      ),
      body: FutureBuilder<List<QuotesDatabaseModel>?>(
        future: getAllQuotes!,
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
              return Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  children: [
                    Expanded(
                      flex: 7,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            currentImageIndex =
                                (currentImageIndex + 1) % imageAssets.length;
                          });
                        },
                        child: Screenshot(
                          controller: screenshotController,
                          child: Container(
                            height: Get.height * 0.7,
                            width: Get.width,
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              color: Colors.grey,
                              border: Border.all(color: Colors.white),
                              borderRadius: BorderRadius.circular(50),
                              image: DecorationImage(
                                image:
                                AssetImage(imageAssets[currentImageIndex]),
                                fit: BoxFit.cover,

                              ),
                            ),
                            child: Column(
                              children: [
                                Expanded(
                                  flex: 7,
                                  child: Padding(
                                    padding: const EdgeInsets.all(20),
                                    child: Center(
                                      child: Text(
                                        quote,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 27,
                                          height: 1.5,
                                          fontFamily:
                                          googleFonts[currentFontIndex],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Get.height * 0.05,
                    ),
                    Expanded(
                      child: Container(
                        height: Get.height * 0.05,
                        width: Get.width,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color(0xff302d4c),
                          ),
                          color: Color(0xffc8c2ea),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  currentImageIndex = (currentImageIndex + 1) %
                                      imageAssets.length;
                                });
                              },
                              child: const Icon(
                                Icons.photo,
                                color: Colors.black,
                                size: 30,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  currentFontIndex = (currentFontIndex + 1) %
                                      googleFonts.length;
                                });
                              },
                              child: const Icon(
                                Icons.text_format_outlined,
                                color: Colors.black,
                                size: 30,
                              ),
                            ),
                            GestureDetector(
                              onTap: () async{
                                Uint8List? capturedImage = await screenshotController.capture();

                                if (capturedImage != null) {
                                  await ImageGallerySaver.saveImage(capturedImage);
                                  Get.snackbar(
                                    'Success',
                                    'Image saved successfully',
                                    snackPosition: SnackPosition.BOTTOM,
                                  );
                                } else {
                                  Get.snackbar(
                                    'Error',
                                    'Failed to save image',
                                    snackPosition: SnackPosition.BOTTOM,
                                  );
                                }
                              },
                              child: Icon(
                                Icons.save_alt,
                                color: Colors.black,
                                size: 30,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Clipboard.setData(ClipboardData(text: quote))
                                    .then(
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
                              child: const Icon(
                                Icons.copy,
                                color: Colors.black,
                                size: 30,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                //share.share(quote);
                                ShareExtend.share(quote, quote);
                              },
                              child: const Icon(
                                Icons.share,
                                color: Colors.black,
                                size: 30,
                              ),
                            ),
                            GestureDetector(
                              onTap: () async{
                                Uint8List? imageBytes = await screenshotController.capture();

                                Directory tempDir = await getTemporaryDirectory();
                                String tempPath = tempDir.path;
                                String imagePath = '$tempPath/wallpaper.png';
                                File file = File(imagePath);
                                await file.writeAsBytes(imageBytes!);

                                WallpaperManager.setWallpaperFromFile(
                                    imagePath, WallpaperManager.HOME_SCREEN);
                                WallpaperManager.setWallpaperFromFile(
                                    imagePath, WallpaperManager.LOCK_SCREEN);
                                WallpaperManager.setWallpaperFromFile(
                                    imagePath, WallpaperManager.BOTH_SCREEN);
                                Get.snackbar("Wallpaper", "Successfully Wallpaper apply",
                                    snackPosition: SnackPosition.BOTTOM,
                                    backgroundColor: Colors.grey.withOpacity(0.5),
                                    duration: const Duration(seconds: 3),
                                    animationDuration: const Duration(seconds: 1));
                              },
                              child: const Icon(
                                Icons.wallpaper,
                                color: Colors.black,
                                size: 30,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
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
