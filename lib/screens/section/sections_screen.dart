import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_billon/generated/l10n.dart';

import 'package:one_billon/screens/layout/cubit/cubit.dart';
import 'package:one_billon/screens/layout/cubit/states.dart';
import 'package:one_billon/screens/search/search_screen.dart';
import 'package:one_billon/screens/section/sections_details.dart';
import 'package:one_billon/screens/widgets/custom_drawer.dart';
import 'package:one_billon/shared/color.dart';

class SectionsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OneBillonCubit()..getServiceSections(),
      child: BlocBuilder<OneBillonCubit, OneBillonStates>(
        builder: (context, state) {
          var cubit = OneBillonCubit.get(context);
          var sections = cubit.serviceSections;

          return Scaffold(
            body: sections == null
                ? Center(child: CircularProgressIndicator())
                : Stack(
                    children: [
                      // المحتوى الأساسي للصفحة
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 100), // تترك مساحة للـ AppBar
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 27, vertical: 30),
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
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2, // عدد الأعمدة في الشبكة
                                    crossAxisSpacing: 10, // المسافة بين الأعمدة
                                    mainAxisSpacing: 10, // المسافة بين الصفوف
                                    childAspectRatio:
                                        1.5, // نسبة العرض إلى الارتفاع لكل عنصر
                                  ),
                                  itemCount: sections.length,
                                  itemBuilder: (context, index) {
                                    final section = sections[index];

                                    return GestureDetector(
                                      onTap: () {
                                        // يمكن إضافة نافذة التفاصيل هنا
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                ServiceSection(
                                                    section: section.name),
                                          ),
                                        );
                                      },
                                      child: Stack(
                                        clipBehavior: Clip.none,
                                        children: [
                                          Image.asset('assets/images/sec.png'),
                                          Positioned(
                                            top:
                                                -10, // اجعلها قريبة من الحافة العلوية
                                            left: 0,
                                            right: 0,
                                            child: Align(
                                              alignment: Alignment.topCenter,
                                              child: Image.asset(
                                                'assets/images/departmentcircle.png',
                                                fit: BoxFit.contain,
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            top: 40,
                                            left: 15,
                                            right: 15,
                                            child: Text(
                                              cubit.languageCode == 'en'
                                                  ? section.name
                                                  : section.nameAr,
                                              textAlign: TextAlign.center,
                                              style: const TextStyle(
                                                color: Color(0xff414141),
                                                fontWeight: FontWeight.w400,
                                                fontSize: 12,
                                              ),
                                            ),
                                          ),
                                        ],
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
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Image.asset('assets/images/logo.png',
                                        height: 33, width: 50),
                                    Row(
                                      children: [
                                        CustomDrawer(),
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
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => SearchPage()),
                                );
                              },
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
      ),
    );
  }
}
