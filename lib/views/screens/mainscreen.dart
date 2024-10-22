import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:hirehub/controllers/zoom_provider.dart';
import 'package:hirehub/views/common/drawer/drawerScreen.dart';
import 'package:hirehub/views/common/exports.dart';
import 'package:hirehub/views/common/reusable_text.dart';
import 'package:hirehub/views/screens/applications/applied_jobs.dart';
import 'package:hirehub/views/screens/auth/profile_page.dart';
import 'package:hirehub/views/screens/bookmark/bookmarks_page.dart';
import 'package:hirehub/views/screens/chat/chat_list.dart';
import 'package:hirehub/views/screens/home/homepage.dart';
import 'package:provider/provider.dart';

class Mainscreen extends StatefulWidget {
  const Mainscreen({super.key});

  @override
  State<Mainscreen> createState() => _MainscreenState();
}

class _MainscreenState extends State<Mainscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Consumer<ZoomNotifier>(builder: (context, zoomNotifier, child) {
      return ZoomDrawer(
          menuScreen: DrawerScreen(
            indexSetter: (index) {
              zoomNotifier.currentIndex = index;
            },
          ),
          borderRadius: 30,
          menuBackgroundColor: Color(kLightBlue.value),
          angle: 0.0,
          slideWidth: 230,
          mainScreen: CurrentScreen());
    }));
  }

  Widget CurrentScreen() {
    var zoomNotifier = Provider.of<ZoomNotifier>(context);
    switch (zoomNotifier.currentIndex) {
      case 0:
        return const HomePage();
      case 1:
        return const ChatList();
      case 2:
        return const BookMarksPage();
      case 3:
        return const AppliedJobs();
      case 4:
        return const ProfilePage(
          drawer: false,
        );
      default:
        return const HomePage();
    }
  }
}
