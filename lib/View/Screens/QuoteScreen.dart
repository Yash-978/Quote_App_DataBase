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
