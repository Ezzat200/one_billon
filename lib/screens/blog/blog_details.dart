import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:one_billon/generated/l10n.dart';
import 'package:one_billon/models/blog_model.dart';
import 'package:one_billon/screens/layout/cubit/cubit.dart';
import 'package:one_billon/screens/layout/cubit/states.dart';
import 'package:one_billon/screens/widgets/custom_content_text_blog.dart';
import 'package:one_billon/screens/widgets/custom_drawer.dart';
import 'package:one_billon/screens/widgets/custom_introduction_text_blog.dart';
import 'package:shimmer/shimmer.dart';

class BlogDetails extends StatelessWidget {
  const BlogDetails({super.key, this.blogModel});
  final BlogModel? blogModel;

  
  @override
  Widget build(BuildContext context) {
    final cubit = OneBillonCubit.get(context);
    return BlocConsumer<OneBillonCubit, OneBillonStates>(
      builder: (context, state) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Stack(
              children: [
                Padding(
                    padding: EdgeInsets.only(top: 170, left: 27, right: 27),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: CachedNetworkImage(
                            imageUrl: blogModel!.img,
                            height: 126,
                            width: double.infinity,
                            fit: BoxFit.cover,
                            placeholder: (context, url) => Shimmer.fromColors(
                              baseColor: Colors.grey.shade300,
                              highlightColor: Colors.grey.shade100,
                              child: Container(
                                height: 126,
                                width: double.infinity,
                                color: Colors.grey[300],
                              ),
                            ),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            SvgPicture.asset(
                              'assets/images/calendersvg.svg',
                              height: 22,
                              width: 22,
                              // Optional: to color the SVG
                            ),
                            SizedBox(width: 5),
                            Text(
                              blogModel!.date,
                              style: TextStyle(
                                  // color: Color(0xff007EDB),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          cubit.languageCode == 'en'
                              ? blogModel!.titleEn
                              : blogModel!.titleAr,
                          style: TextStyle(
                            color: Color(0xff414141),
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                          softWrap: true,
                          overflow: TextOverflow.visible,
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        CustomIntoductionTextBlog(
                          introName: S.of(context).introduction,
                        ),
                        CustomContentTextBlog(
                            contentString: cubit.languageCode == 'en'
                                ? blogModel!.detailsEn
                                : blogModel!.detailsAr),
                        SizedBox(
                          height: 15,
                        ),
                        // CustomIntoductionTextBlog(
                        //   introName: 'The Topic',
                        // ),
                        // SizedBox(
                        //   height: 5,
                        // ),
                        // Text(
                        //   'First: The Concept of Artificial Intelligence in Marketing',
                        //   style: TextStyle(
                        //     color: Color(0xff414141),
                        //     fontSize: 12,
                        //     fontWeight: FontWeight.w400,
                        //   ),
                        //   softWrap: true,
                        //   overflow: TextOverflow.visible,
                        // ),
                        // SizedBox(
                        //   height: 5,
                        // ),
                        // CustomContentTextBlog(
                        //   contentString:
                        //       'Artificial Intelligence in Marketing is not just a passing term; it is a sophisticated system that combines data analysis and machine learning to accurately understand consumer behavior. By collecting vast amounts of customer data, AI in marketing can predict market trends and precisely target advertisements to the right audience.',
                        // ),
                      ],
                    )),

                Container(
                  height: 100,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xff007EDB), Color(0xff004375)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 27, vertical: 10),
                      child: Column(
                        children: [
                          SizedBox(height: 5,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [

                              GestureDetector(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: cubit.languageCode == 'en'
                                  ? SvgPicture.asset(
                                      'assets/images/Group 45.svg')
                                  : SvgPicture.asset(
                                      'assets/images/Group 45 (1).svg'),),
                              // Row(
                              //   children: [
                              //     Image.asset('assets/images/drwer.png'),
                              //     const SizedBox(width: 10),
                              //     Image.asset('assets/images/notification.png'),
                              //   ],
                              // ),

                               CustomDrawer(),
                              // const SizedBox(width: 10),
                              // Image.asset('assets/images/notification.png'),

                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                // صندوق البحث الذي يمتد جزئياً إلى الصفحة
                // Positioned(
                //   top: 110, // نصفه داخل الـ AppBar والنصف الآخر في الصفحة
                //   left: 27,
                //   right: 27,
                //   child: Container(
                //     height: 42,
                //     decoration: BoxDecoration(
                //       color: ColorManager.white,
                //       borderRadius: BorderRadius.circular(8),
                //       boxShadow: [
                //         BoxShadow(
                //           color: Colors.black.withOpacity(0.1),
                //           blurRadius: 5,
                //           offset: const Offset(0, 2),
                //         )
                //       ],
                //     ),
                //     child: Padding(
                //       padding: const EdgeInsets.all(10),
                //       child: Row(
                //         children: [
                //           Image.asset('assets/images/search.png'),
                //           const SizedBox(width: 10),
                //           const Text(
                //             "Search...",
                //             style: TextStyle(
                //                 color: Color(0xffE6E6E6),
                //                 fontSize: 14,
                //                 fontWeight: FontWeight.w400),
                //           ),
                //         ],
                //       ),
                //     ),
                //   ),
                // ),
             
              ],
            ),
          ),
        );
      },
      listener: (context, state) {},
    );
  }
}
