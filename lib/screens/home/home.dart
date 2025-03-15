import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_billon/generated/l10n.dart';
import 'package:one_billon/screens/blog/blog_details.dart';
import 'package:one_billon/screens/layout/cubit/cubit.dart';
import 'package:one_billon/screens/layout/cubit/states.dart';
import 'package:one_billon/screens/search/search_screen.dart';
import 'package:one_billon/screens/services/services_screen.dart';
import 'package:one_billon/screens/widgets/custom_blog.dart';
import 'package:one_billon/screens/widgets/custom_card.dart';
import 'package:one_billon/screens/widgets/custom_drawer.dart';
import 'package:one_billon/shared/color.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> images = [
      'assets/images/numberMarket.png',
      'assets/images/image_two.png',
      'assets/images/image_three.png',
      'assets/images/image_four.png',
      'assets/images/image_five.png',
      'assets/images/image_six.png',
      'assets/images/image_7.png',
      'assets/images/image_8.png',
    ];

    List<String> titles = [
      'Digital Marketing',
      ' Management and Organization',
      'Advertising and Publicity',
      'Information Technology Solutions',
      'Creative Design',
      'Media Production',
      'Our Advertising Solutions',
      'Advertising Campaigns'
    ];

    

    return BlocConsumer<OneBillonCubit, OneBillonStates>(
      builder: (context, state) {
        final cubit = OneBillonCubit.get(context);
        return Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  // height: 250,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xff007EDB),
                        Color(0xff004375),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 27, vertical: 30),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [

                              // Column(
                              //   crossAxisAlignment: CrossAxisAlignment.start,
                              //   children: [
                              //     Text(
                              //       'Welcome Mohamed',
                              //       style: TextStyle(
                              //         color: ColorManager.navbarIconColor,
                              //         fontSize: 18,
                              //       ),
                              //     ),
                              //     const Text(
                              //       'How Are You?',
                              //       style: TextStyle(
                              //         color: Color(0xffD9D9D9),
                              //         fontSize: 16,
                              //       ),
                              //     ),
                              //   ],
                              // ),
                               Image.asset('assets/images/logo.png',
                            height: 33, width: 50),
                              
                              Row(
                                children: [
                                  Image.asset('assets/images/drwer.png'),
                                  const SizedBox(width: 10),
                                  Image.asset('assets/images/notification.png'),
                                ],
                              ),

                              CustomDrawer(),
                              const SizedBox(width: 10),
                              Image.asset('assets/images/notification.png'),

                            ],
                          ),
                          const SizedBox(height: 10),

                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (_) => SearchPage()),
                              );
                            },
                            child: Container(
                              height: 42,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: ColorManager.white,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Row(children: [
                                    Image.asset('assets/images/search.png'),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      S.of(context).search,
                                      style: TextStyle(
                                          color: Color(0xffE6E6E6),
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400),
                                    )
                                  ]),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),

                        
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 27),
                    child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              S.of(context).services,
                              style: TextStyle(
                                  color: Color(0xff414141),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            ),
                            InkWell(
                              onTap: () {
                                cubit.changeBottomNavBar(1);
                              },
                              child: Text(
                                S.of(context).viewAll,
                                style: TextStyle(
                                    color: Color(0xff959595),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ],
                        ),
                  ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: GridView.builder(
                    itemCount: images.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 1.7,

                    ),
                    itemBuilder: (context, index) {
                      return CustomCard(
                        title: cubit.languageCode == 'en'
                            ? cubit.services![index].nameEn
                            : cubit.services![index].nameAr,
                        imagePath: images[index],
                      );
                    },
                  ),
                ),
              
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 27),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            S.of(context).blogs,
                            style: TextStyle(
                                color: Color(0xff414141),
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                          InkWell(
                            onTap: () {
                              cubit.changeBottomNavBar(2);
                            },
                            child: Text(
                              S.of(context).viewAll,
                              style: TextStyle(
                                  color: Color(0xff959595),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ],
                      ),

                      ListView.separated(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: cubit.blogs!.length,
                        separatorBuilder: (context, index) {
                          return const SizedBox(height: 20);
                        },
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => BlogDetails(
                                            blogModel: cubit.blogs?[index],
                                          )));
                            },
                            child: CustomBlog(
                              blogModel: cubit.blogs?[index],
                            ),
                          );
                        },
                      ),

                      // CustomBlog(),
                      // const SizedBox(height: 20),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
      listener: (context, state) {},
    );
  }
}
