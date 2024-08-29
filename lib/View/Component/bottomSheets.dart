import 'package:flutter/material.dart';

import '../../Utils/global.dart';
import '../Screens/HomeScreen.dart';

Widget themeBottomSheet(
    BuildContext context, double height, double width, String content) {
  return Container(
    height: height * 0.800,
    width: width * 0.95,
    decoration: BoxDecoration(color: Colors.black12),
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
                    quoteController.selectBackgroundImage;
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

Widget textBottomSheet(
    BuildContext context, double h, double w, String content) {
  return Container(
    height: h * 0.800,
    width: w * 0.95,
    // decoration: BoxDecoration(
    //   color: Colors.black12
    // ),
    child: Column(
      children: [
        SizedBox(
          height: h * 0.02,
        ),
        Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Icon(
                Icons.text_increase_rounded,
                color: Colors.white,
                size: 30,
              ),
            )),
        StatefulBuilder(
          builder: (context, setState) => Slider(
            max: 100,
            divisions: 10,
            label: textSizeSlider.round().toString(),
            inactiveColor: Colors.black87,
            activeColor: Colors.white,
            value: textSizeSlider,
            onChanged: (value) {
              setState(() {
                textSizeSlider = value;
                print(textSizeSlider);
              });
            },
          ),
        ),
        Row(
          children: [
            Container(
                height: h * 0.060,
                width: w * 0.23,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    // borderRadius: BorderRadius.circular(20),
                    color: Colors.black54,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 0.3)),
                child: Icon(
                  Icons.text_fields_rounded,
                  color: Colors.white,
                  size: 30,
                )),
            Container(
                height: h * 0.060,
                width: w * 0.23,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    // borderRadius: BorderRadius.circular(20),
                    color: Colors.black54,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 0.3)),
                child: Icon(
                  Icons.color_lens_outlined,
                  color: Colors.white,
                  size: 30,
                )),
            Container(
                height: h * 0.060,
                width: w * 0.23,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    // borderRadius: BorderRadius.circular(20),
                    color: Colors.black54,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 0.3)),
                child: Icon(
                  Icons.text_increase_rounded,
                  color: Colors.white,
                  size: 30,
                )),
            Container(
              height: h * 0.060,
              width: w * 0.23,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  // borderRadius: BorderRadius.circular(20),
                  color: Colors.black54,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 0.3)),
              child: Icon(
                Icons.check,
                color: Colors.white,
                size: 30,
              ),
            ),
          ],
        ),
        SizedBox(
          height: h * 0.20,
          width: w * 0.99 + 10,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: TextColorList.length,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {},
              child: Container(
                margin: EdgeInsets.all(8),
                height: h * 0.0170,
                width: w * 0.170,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    // borderRadius: BorderRadius.circular(20),
                    color: TextColorList[index],
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 0.3)),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
