import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import '../../contoller/qoute_controller.dart';
import '../../contoller/qoutestitle_controller.dart';
import '../../contoller/theme_controller.dart';
import '../../modals/categorymodel.dart';
import '../../utils/attributes.dart';
import '../../utils/dbhelper.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<List<CategoryDatabaseModel>>? getalldata;
  LocalJsonController localjsoncontroller = Get.put(LocalJsonController());
  ThemeController _themeController = Get.put(ThemeController());

  final List<Color> ColorList = [
    Colors.cyan,
    Colors.pink,
    Colors.deepPurple,
    Colors.red,
    Colors.yellow,
    Colors.green,
    Colors.blueAccent,
    Colors.orange,
    Colors.brown,
    Colors.indigo,
    Colors.teal,
    Colors.purple,
    Colors.yellowAccent,
    Colors.pinkAccent,
    Colors.blueGrey,
    Colors.tealAccent,
    Colors.lightGreenAccent,
    Colors.deepPurpleAccent
  ];

  List<String> imagePaths = [
    "assets/images/Motivation.png",
    "assets/images/Inspirational.png",
    "assets/images/Love.png",
    "assets/images/Friendship.png",
    "assets/images/Success.png",
    "assets/images/Happiness.png",
    "assets/images/Wisdom.png",
    "assets/images/Funny.png",
    "assets/images/Life.png",
    "assets/images/Strength.png",
    "assets/images/Hope.png",
    "assets/images/Faith.png",
    "assets/images/Family.png",
    "assets/images/Dream.png",
    "assets/images/Education.png",
    "assets/images/Time.png",
    "assets/images/Leadership.png",
    "assets/images/Change.png",
    "assets/images/Positive.png",
    "assets/images/Encouraging.png",
    "assets/images/Determination.png",
    "assets/images/Confidence.png",
    "assets/images/Self-Love.png",
    "assets/images/Growth.png",
    "assets/images/Patience.png",
    "assets/images/Heartbreak.png",
    "assets/images/Self-care.png",
    "assets/images/Mindset.png",
    "assets/images/Creativity.png",
  ];

  @override
  void initState() {
    super.initState();
    getalldata = DBHelper.dbHelper.fatchAllCategory();
  }

  TitleController titleController = Get.put(TitleController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              decoration: const BoxDecoration(
                color: Color(0xff302d4c),
              ),
              accountName: const Text('Bhumika Vadhavana'),
              accountEmail: const Text('bhumikavadhavna@gmail.com'),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.grey.shade200,
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                // Handle drawer item tap for Home
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                // Handle drawer item tap for Settings
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Profile'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () {
                Get.toNamed("/");
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.menu,
            color: Colors.white,
          ),
          onPressed: () {
            if (scaffoldKey.currentState!.isDrawerOpen) {
              scaffoldKey.currentState!.closeDrawer();
            } else {
              scaffoldKey.currentState!.openDrawer();
            }
          },
        ),
        title: const Text(
          "GoodDay",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Color(0xff302d4c),
        actions: [
          IconButton(
            onPressed: () {
              (Get.isDarkMode)
                  ? Get.changeTheme(ThemeData.light(useMaterial3: true))
                  : Get.changeTheme(ThemeData.dark(useMaterial3: true));
            },
            icon: const Icon(
              Icons.sunny_snowing,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () {
              Get.toNamed("/FvtScreen");
            },
            icon: const Icon(
              Icons.favorite,
              color: Colors.white,
            ),
          ),
        ],
        // centerTitle: true,
      ),
      body: FutureBuilder(
        future: getalldata,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("ERROR : ${snapshot.error}"),
            );
          } else if (snapshot.hasData) {
            List<CategoryDatabaseModel>? data = snapshot.data;
            if (data == null || data.isEmpty) {
              return const Center(
                child: Text("NO DATA AVAILABLE"),
              );
            } else {
              return Padding(
                padding: const EdgeInsets.all(14),
                child: GridView.builder(
                  itemCount: data.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 5,
                  ),
                  itemBuilder: (context, index) {
                    return AnimationConfiguration.staggeredGrid(
                      columnCount: data.length,
                      position: index,
                      duration: const Duration(seconds: 4),
                      child: SlideAnimation(
                        verticalOffset: 50.0,
                        child: FadeInAnimation(
                          child: GestureDetector(
                            onTap: () {
                              titleController
                                  .setCategoryName(data[index].category_name);
                              getAllQuotes = DBHelper.dbHelper
                                  .fatchAllQuotes(id: data[index].id);
                              Get.toNamed("/second");
                            },
                            child: Column(
                              children: [
                                Container(
                                  height: 130,
                                  width: 200,
                                  decoration: BoxDecoration(
                                    color: ColorList[index % ColorList.length]
                                        .withOpacity(0.40),
                                    shape: BoxShape.rectangle,
                                    border: Border.all(
                                      color: ColorList[index % ColorList.length]
                                          .withOpacity(0.40),
                                      width: 7,
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Image.asset(
                                    imagePaths[index % imagePaths.length],
                                    scale: 9,
                                  ),
                                ),
                                SizedBox(
                                  height: Get.height * 0.012,
                                ),
                                Text(
                                  data[index].category_name,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
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
