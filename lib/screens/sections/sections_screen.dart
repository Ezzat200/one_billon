import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_billon/generated/l10n.dart';
import 'package:one_billon/screens/layout/cubit/cubit.dart';
import 'package:one_billon/screens/layout/cubit/states.dart';
import 'package:one_billon/screens/widgets/custom_drawer.dart';
import 'package:one_billon/shared/color.dart';

class SectionsScreen extends StatelessWidget {
  const SectionsScreen({super.key, this.image});
  final String? image;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OneBillonCubit, OneBillonStates>(
      builder: (context, state) {
        final cubit = OneBillonCubit.get(context);
        List<String> department = [
          'Section No. 1',
          'Section No. 2',
          'Section No. 3',
          'Section No. 4',
        ];

        return Scaffold(
          body: SingleChildScrollView(
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 150, left: 27, right: 27),
                  child: Column(
                    children: [
                      if (cubit.blogs != null)
                        GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: department.length,
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 3 / 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                          ),
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                   OneBillonCubit.get(context).openServiceDetails(
                                    context, cubit.services![index]);
                              },
                              child: Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  Image.asset('assets/images/sec.png'),
                                  Positioned(
                                    top: -10, // اجعلها قريبة من الحافة العلوية
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
                                      department[index],
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
                    ],
                  ),
                ),
                // Header
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
                padding: const EdgeInsets.symmetric(horizontal: 27, vertical: 10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(onTap: () {
                          Navigator.pop(context);
                        },
                          child: Image.asset('assets/images/logo.png', height: 33, width: 50)),
                        Row(
                          children: [
                                CustomDrawer(),
                            const SizedBox(width: 10),
                           
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        
                // Search Box
                Positioned(
                  top: 110,
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
                      child: Row(
                        children: [
                          Image.asset('assets/images/search.png'),
                          const SizedBox(width: 10),
                          Text(
                            S.of(context).search,
                            style: const TextStyle(
                              color: Color(0xffE6E6E6),
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
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
