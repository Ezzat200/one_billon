import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_billon/generated/l10n.dart';
import 'package:one_billon/screens/layout/cubit/cubit.dart';
import 'package:one_billon/screens/layout/cubit/states.dart';
import 'package:one_billon/screens/search/search_screen.dart';
import 'package:one_billon/screens/widgets/custom_card.dart';
import 'package:one_billon/screens/widgets/custom_drawer.dart';
import 'package:one_billon/shared/color.dart';

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key, this.image, this.title});
  final String? image;
  final String? title;

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
      'Management and Organization',
      'Advertising and Publicity',
      'Information Technology',
      'Creative Design',
      'Media Production',
      'Our Advertising Solutions',
      'Advertising Campaigns'
    ];

  

    return BlocConsumer<OneBillonCubit, OneBillonStates>(
      builder: (context, state) {
          var cubit = OneBillonCubit.get(context);
        return Scaffold(
          body: Stack(
            children: [
              // المحتوى الأساسي للصفحة
              Padding(
                padding:
                    const EdgeInsets.only(top: 100), // تترك مساحة للـ AppBar
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 27, vertical: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       Text(
                          S.of(context).services,
                        style: TextStyle(
                            color: Color(0xff414141),
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(height: 20),
                      Expanded(
                        child: GridView.builder(
                          itemCount: cubit.services?.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            childAspectRatio: 1.5,
                          ),
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                OneBillonCubit.get(context).openServiceDetails(
                                    context, cubit.services![index]);
                              },
                              child: CustomCard(
                                isSec: false,
                                price: cubit.services![index].price.toString(),
                                title: cubit.languageCode == "ar" ? cubit.services![index].nameAr : cubit.services![index].nameEn ,
                                imagePath: cubit.services![index].img,
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Container(
                height: 140,
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
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset('assets/images/logo.png',
                                height: 33, width: 50),
                            Row(
                              children: [

                              //  CustomDrawer(),
                              //   const SizedBox(width: 10),
                              //   Image.asset('assets/images/notification.png'),

                                CustomDrawer()
                                // const SizedBox(width: 10),
                                // Image.asset('assets/images/notification.png'),

                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              // صندوق البحث الذي يمتد جزئياً إلى الصفحة
              Positioned(
                top: 110, // نصفه داخل الـ AppBar والنصف الآخر في الصفحة
                left: 27,
                right: 27,
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => SearchPage()),
                    );
                  },
                  child: Container(
                    height: 42,
                    decoration: BoxDecoration(
                      color: ColorManager.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 5,
                          offset: const Offset(0, 2),
                        )
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Image.asset('assets/images/search.png'),
                          const SizedBox(width: 10),
                           Text(
                            S.of(context).search,
                            style: TextStyle(
                                color: Color(0xffE6E6E6),
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
      listener: (context, state) {},
    );
  }
}
