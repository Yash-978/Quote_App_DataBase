/*
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_navigation_bar/responsive_navigation_bar.dart';

import '../../Utils/global.dart';
import 'HomeScreen.dart';
import 'ProfileScreen.dart';

final List<Widget> pages = [];

class QuotePage extends StatelessWidget {
  const QuotePage({super.key});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      bottomNavigationBar: Obx(
        () => ResponsiveNavigationBar(
          selectedIndex: quoteController.selectedPage.value,
          onTabChange: (index) {
            if (index == 0 || index == 1) {
              // Show modal bottom sheet for first two tabs
              showModalBottomSheet(
                  context: context,
                  builder: (
                    BuildContext modalContext,
                  ) {
                    double screenHeight =
                        MediaQuery.of(modalContext).size.height;
                    double screenWidth = MediaQuery.of(modalContext).size.width;

                    return _buildModalBottomSheetContent(
                      modalContext,
                      screenHeight,
                      screenWidth,
                      index == 0 ? 'Tab 1 Content' : 'Tab 2 Content',
                    );
                  }).then((_) {
                // Keep the selected index on the button after the modal is dismissed
                quoteController.changeTab(index); // Keeps tab highlighted
              });
            } else if (index == 2) {
              // Navigate to the Profile screen (index 2)
              quoteController.changeTab(index);
            }
          },
          // showActiveButtonText: false,
          textStyle: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          navigationBarButtons: const <NavigationBarButton>[
            NavigationBarButton(
              text: 'Tab 1',
              icon: Icons.people,
              backgroundGradient: LinearGradient(
                colors: [Colors.yellow, Colors.green, Colors.blue],
              ),
            ),
            NavigationBarButton(
              text: 'Tab 2',
              icon: Icons.star,
              backgroundGradient: LinearGradient(
                colors: [Colors.cyan, Colors.teal],
              ),
            ),
            NavigationBarButton(
              text: 'Profile',
              icon: Icons.settings,
              backgroundGradient: LinearGradient(
                colors: [Colors.green, Colors.yellow],
              ),
            ),
          ],
        ),
      ),
      body: Obx(
        () {
          if (quoteController.selectedPage.value == 2) {
            return ProfilePage();
          }
          // Return an empty container or any default screen if not Profile
          return Container(
            color: Colors.white,
            child: Center(child: Text('Home')),
          );
        },
      ),
    );
  }

  Widget _buildModalBottomSheetContent(
      BuildContext context, double height, double width, String content) {
    return Container(
      height: height * 0.800,
      width: width * 0.95,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: height * 0.022,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12, right: 12),
              child: Row(
                children: [
                  Text(
                    'Themes',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  Text(
                    'View All',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 25,
                    color: Colors.white,
                  )
                ],
              ),
            ),
            SizedBox(
              height: height * 0.30,
              width: width * 0.99 + 10,
              child: ListView.builder(
                itemCount: Minimalist_ImagesList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      // Handle state change
                      selectbg = Minimalist_ImagesList[index];
                    },
                    child: Container(
                      margin: EdgeInsets.all(5),
                      height: height * 0.30,
                      width: width * 0.4,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(Minimalist_ImagesList[index]),
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12, right: 12),
              child: Row(
                children: [
                  Text(
                    'Minimalist',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  Text(
                    'View All',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 25,
                    color: Colors.white,
                  )
                ],
              ),
            ),
            SizedBox(
              height: height * 0.30,
              width: width * 0.99 + 10,
              child: ListView.builder(
                itemCount: Gradient_ImageList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      // Handle state change
                      selectbg = Gradient_ImageList[index];
                    },
                    child: Container(
                      margin: EdgeInsets.all(5),
                      height: height * 0.30,
                      width: width * 0.4,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(Gradient_ImageList[index]),
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12, right: 12),
              child: Row(
                children: [
                  Text(
                    'Luxury',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  Text(
                    'View All',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 25,
                    color: Colors.white,
                  )
                ],
              ),
            ),
            SizedBox(
              height: height * 0.30,
              width: width * 0.99 + 10,
              child: ListView.builder(
                itemCount: Luxury_ImageList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      // Handle state change
                      selectbg = Luxury_ImageList[index];
                    },
                    child: Container(
                      margin: EdgeInsets.all(5),
                      height: height * 0.30,
                      width: width * 0.4,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(Luxury_ImageList[index]),
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
*/
import 'dart:io';
import 'dart:typed_data';

import 'package:concentric_transition/concentric_transition.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:responsive_navigation_bar/responsive_navigation_bar.dart';

import '../../Utils/global.dart';
import '../Component/bottomSheets.dart';
import 'FavoriteScreen.dart';
import 'HomeScreen.dart';
import 'ProfileScreen.dart';
import 'dart:ui' as ui;
import 'package:share_extend/share_extend.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';

final List<Widget> pages = [];

class QuotePage extends StatelessWidget {
  // final String category;

  const QuotePage({
    super.key,
    // required this.category
  });

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      bottomNavigationBar: Obx(
        () => ResponsiveNavigationBar(
          backgroundColor: Colors.black,
          selectedIndex: quoteController.selectedPage.value,
          showActiveButtonText: true,
          onTabChange: (index) {
            if (index == 0) {
              // Show modal bottom sheet for first two tabs
              showModalBottomSheet(
                  backgroundColor: Colors.black12,
                  context: context,
                  builder: (
                    BuildContext modalContext,
                  ) {
                    double screenHeight =
                        MediaQuery.of(modalContext).size.height;
                    double screenWidth = MediaQuery.of(modalContext).size.width;
                    return themeBottomSheet(
                      modalContext,
                      screenHeight,
                      screenWidth,
                      index == 0 ? 'Tab 1 Content' : 'Tab 2 Content',
                    );
                  }).then((_) {
                // Keep the selected index on the button after the modal is dismissed
                quoteController.changeTab(index); // Keeps tab highlighted
              });
            } else if (index == 1) {
              showModalBottomSheet(
                  backgroundColor: Colors.black12,
                  context: context,
                  builder: (
                    BuildContext modalContext,
                  ) {
                    double screenHeight =
                        MediaQuery.of(modalContext).size.height;
                    double screenWidth = MediaQuery.of(modalContext).size.width;
                    return textBottomSheet(
                      modalContext,
                      screenHeight,
                      screenWidth,
                      index == 2 ? 'Tab 1 Content' : 'Tab 2 Content',
                    );
                  }).then((_) {
                // Keep the selected index on the button after the modal is dismissed
                quoteController.changeTab(index); // Keeps tab highlighted
              });
            } else if (index == 2) {
              // Navigate to the Profile screen (index 2)
              quoteController.changeTab(index);
            }
          },
          // showActiveButtonText: false,
          textStyle: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          navigationBarButtons: const <NavigationBarButton>[
            NavigationBarButton(
              text: 'Home',
              icon: Icons.home_outlined,
              backgroundGradient: LinearGradient(
                colors: [Colors.yellow, Colors.green, Colors.blue],
              ),
            ),
            NavigationBarButton(
              text: 'Themes',
              icon: Icons.star,
              backgroundGradient: LinearGradient(
                colors: [Colors.cyan, Colors.teal],
              ),
            ),
            NavigationBarButton(
              text: 'Profile',
              icon: Icons.settings,
              backgroundGradient: LinearGradient(
                colors: [Colors.green, Colors.yellow],
              ),
            ),
          ],
        ),
      ),
      body: Obx(
        () {
          if (quoteController.selectedPage.value == 2) {
            return ProfilePage();
          }
          // Return an empty container or any default screen if not Profile
          return RepaintBoundary(
            key: quoteController.imgKey,
            child: Container(
                height: h * 0.990 + 40,
                width: w * 0.990 + 60,
                decoration: BoxDecoration(
                  color: Colors.cyan,
                  image: DecorationImage(
                      image: AssetImage(selectbg), fit: BoxFit.cover),
                ),
                child: PageView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: quoteController.quotes.length,
                  itemBuilder: (context, index) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              icon: Icon(
                                Icons.category,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                // Navigate to Category Screen
                                Get.to(HomePage()); // Implement CategoryScreen
                              },
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.favorite,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                // Navigate to Favorite Screen
                                Get.to(
                                    FavoritePage()); // Implement FavoriteScreen
                              },
                            ),
                          ],
                        ),
                        ListTile(
                          title: SelectableText(
                            "${quoteController.quotes[index].quote}",
                            textAlign: TextAlign.center,
                            maxLines: 5,
                            style: TextStyle(
                                color: selectTextColor,
                                fontSize: textSizeSlider,
                                fontWeight: FontWeight.w500),
                          ),
                          subtitle: SelectableText(
                            " ${quoteController.quotes[index].author}",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: selectTextColor,
                                fontSize: 30,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 40),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                onPressed: () async {
                                  RenderRepaintBoundary imgboundary =
                                      quoteController.imgKey.currentContext!
                                              .findRenderObject()
                                          as RenderRepaintBoundary;
                                  ui.Image image = await imgboundary.toImage();
                                  ByteData? imgbyteData =
                                      await image.toByteData(
                                          format: ui.ImageByteFormat.png);
                                  Uint8List img =
                                      imgbyteData!.buffer.asUint8List();
                                  ImageGallerySaver.saveImage(img);
                                },
                                icon: Icon(
                                  Icons.file_download_outlined,
                                  color: Colors.white,
                                  size: 35,
                                ),
                              ),
                              IconButton(
                                onPressed: () async {
                                  final path =
                                      await getApplicationDocumentsDirectory();

                                  RenderRepaintBoundary imgboundary =
                                      quoteController.imgKey.currentContext!
                                              .findRenderObject()
                                          as RenderRepaintBoundary;

                                  ui.Image image = await imgboundary.toImage();

                                  ByteData? imgbyteData =
                                      await image.toByteData(
                                          format: ui.ImageByteFormat.png);

                                  Uint8List img =
                                      imgbyteData!.buffer.asUint8List();

                                  File file = File('${path.path}/img.png');

                                  file.writeAsBytes(img);

                                  ShareExtend.share(file.path, "IMG");
                                },
                                icon: Icon(
                                  Icons.share,
                                  color: Colors.white,
                                  size: 35,
                                ),
                              ),
                              IconButton(
                                  onPressed: () {
                                    quoteController.likedQuotes(
                                        quoteController.quotes[index]);
                                  },
                                  icon: Icon(
                                    size: 35,
                                    quoteController.quotes[index].like == "1"
                                        ? Icons.favorite
                                        : Icons.favorite_border_outlined,
                                    color: quoteController.quotes[index].like ==
                                            "1"
                                        ? Colors.red
                                        : Colors.white,
                                  )),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                )),
          );
        },
      ),
    );
  }
}
