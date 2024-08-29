import 'package:flutter/material.dart';
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Profile',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 25),
          ),
        ),
        body: Column(
          children: [
            Container(
              height: h * 0.12,
              width: w * 0.90 + 6,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Color(0xffA395ED),
                        Color(0xff8B77E8),
                        Color(0xff735CE3),
                        Color(0xff9852EF),
                      ]),
                  borderRadius: BorderRadius.circular(15),
                  color: Color(0xff7256E2)),
              child: Row(
                children: [
                  SizedBox(
                    width: w * 0.020,
                  ),
                  Container(
                    height: h * 0.3,
                    width: w * 0.099 + 10,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 0.3)),
                    child: Icon(
                      Icons.diamond_rounded,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: w * 0.01,
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                            text:
                            ' Unlock All \n\n Access all categories, quotes,\n themes and remove ads!'),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: w * 0.020,
                  ),
                  Container(
                      height: h * 0.050,
                      width: w * 0.22,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          border: Border.all(color: Colors.white, width: 0.3)),
                      child: Text(
                        'Unlock',
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 17),
                      )),
                ],
              ),
            ),
            Center(
              child: SizedBox(
                width: w * 0.99,
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 14),
                        child: Text(
                          'Settings',
                          style: TextStyle(
                              color: Colors.black54,
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    Profile_buildListTile(h, w,
                        ProfileText: 'Edit Profile',
                        ProfileIcon_leading: Icons.person_outline_rounded,
                        ProfileIcon_trailing: Icons.arrow_forward_ios_rounded),
                    ListTile(
                      title: Text(
                        'Notifications',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      leading: Container(
                        height: h * 0.2,
                        width: w * 0.099 + 5,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.black12)),
                        child: Icon(
                          Icons.notifications_none_rounded,
                          size: 30,
                        ),
                      ),
                      // trailing:
                      // Switch(
                      //   value: notification,
                      //   onChanged: (value) {
                      //     setState(() {
                      //       notification = value;
                      //     });
                      //   },
                      // ),
                    ),
                    Profile_buildListTile(h, w,
                        ProfileText: 'Widgets',
                        ProfileIcon_leading: Icons.tv,
                        ProfileIcon_trailing: Icons.arrow_forward_ios_rounded),
                    ListTile(
                      title: Text(
                        'Dark Theme',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      leading: Container(
                        height: h * 0.2,
                        width: w * 0.099 + 5,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.black12)),
                        child: Icon(
                          Icons.dark_mode_outlined,
                          size: 30,
                        ),
                      ),
                      // trailing: Switch(
                      //   value: darkTheme,
                      //   onChanged: (value) {
                      //     setState(() {
                      //       darkTheme = value;
                      //     });
                      //   },
                      // ),
                    ),
                    Profile_buildListTile(h, w,
                        ProfileText: 'Language',
                        ProfileIcon_leading: Icons.language_outlined,
                        ProfileIcon_trailing: Icons.arrow_forward_ios_rounded),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 14),
                        child: Text(
                          'Your Affirmations',
                          style: TextStyle(
                              color: Colors.black54,
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    Profile_buildListTile(h, w,
                        ProfileText: 'Favourite Affirmations',
                        ProfileIcon_leading: Icons.bookmark_border_rounded,
                        ProfileIcon_trailing: Icons.arrow_forward_ios_rounded),
                    Profile_buildListTile(h, w,
                        ProfileText: 'Past Affirmations',
                        ProfileIcon_leading: Icons.history,
                        ProfileIcon_trailing: Icons.arrow_forward_ios_rounded),
                    Profile_buildListTile(h, w,
                        ProfileText: 'Search Affirmations',
                        ProfileIcon_leading: Icons.history,
                        ProfileIcon_trailing: Icons.arrow_forward_ios_rounded),
                    Profile_buildListTile(h, w,
                        ProfileText: 'Your Affirmations',
                        ProfileIcon_leading: Icons.history,
                        ProfileIcon_trailing: Icons.arrow_forward_ios_rounded),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  ListTile Profile_buildListTile(double h, double w,
      {required ProfileText,
        required ProfileIcon_leading,
        required ProfileIcon_trailing}) {
    return ListTile(
      title: Text(
        ProfileText,
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),
      leading: Container(
        height: h * 0.2,
        width: w * 0.099 + 5,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            shape: BoxShape.circle, border: Border.all(color: Colors.black12)),
        child: Icon(
          ProfileIcon_leading,
          size: 30,
        ),
      ),
      trailing: Icon(
        ProfileIcon_trailing,
        color: Colors.black,
      ),
    );
  }
}
