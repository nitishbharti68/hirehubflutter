import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hirehub/views/common/app_bar.dart';
import 'package:hirehub/views/common/drawer/drawer_widget.dart';
import 'package:hirehub/views/common/heading_widget.dart';
import 'package:hirehub/views/common/search.dart';
import 'package:hirehub/views/screens/jobs/job_list_page.dart';
import 'package:hirehub/views/screens/jobs/widgets/recent_list.dart';
import 'package:hirehub/views/screens/search/search_page.dart';
import '../../../constants/app_constants.dart';
import '../../common/app_style.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../auth/login_page.dart';
import '../jobs/widgets/popularJobs.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String imageUrl =
      'https://imgv3.fotor.com/images/blog-cover-image/10-profile-picture-ideas-to-make-you-stand-out.jpg';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.h),
        child: CustomAppBar(
          actions: [
            Padding(
              padding: EdgeInsets.all(12.0.h),
              child: GestureDetector(
                onTap: () {
                  // Get.to(() => const ProfilePage(drawer: false));
                  Get.to(() => const LoginPage());
                },
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(50),
                  ),
                  child: CachedNetworkImage(
                    imageUrl: imageUrl,
                    height: 30.w,
                    width: 30.w,
                    fit: BoxFit.cover,
                    colorBlendMode: BlendMode.luminosity,
                  ),
                ),
              ),
            ),
          ],
          child: Padding(
            padding: EdgeInsets.all(12.0.h),
            child: DrawerWidget(color: Color(kLight.value)),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Search \n Find & Apply ',
                  style: appStyle(
                    30,
                    Color(kDark.value),
                    FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                SearchWidget(onTap: (){
                  Get.to(()=> const SearchPage());
                },),
                SizedBox(height: 30.h),
                HeadingWidget(
                  text: 'Popular Jobs',
                  onTap: () {
                    Get.to(() => const JobListPage());
                  },
                ),
                SizedBox(height: 15.h),
                ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(12.w)),
                    child: const PopularJobs()),
                SizedBox(height: 15.h),
                HeadingWidget(
                  text: 'Recently  Posted Jobs',
                  onTap: () {
                    Get.to(() => const JobListPage());
                  },
                ),
                SizedBox(height: 15.h),
                const RecentJobs(),
              ],
            ),
          ),
        ),
      ),
    );
    ;
  }
}
