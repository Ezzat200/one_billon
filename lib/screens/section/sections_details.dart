import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_billon/generated/l10n.dart';
import 'package:one_billon/models/service_model.dart';
import 'package:one_billon/screens/layout/cubit/cubit.dart';
import 'package:one_billon/screens/layout/cubit/states.dart';
import 'package:one_billon/screens/widgets/custom_card.dart';
import 'package:one_billon/screens/widgets/custom_drawer.dart';
import 'package:one_billon/shared/color.dart';

class ServiceSection extends StatelessWidget {
  const ServiceSection({super.key, this.image, this.title, this.section});

  final String? image;
  final String? title;
  final String? section;

  @override
  Widget build(BuildContext context) {
    var cubit = OneBillonCubit.get(context);

  
    List<ServiceModel> filteredServices = cubit.services
            ?.where((service) => service.section == section)
            .toList() ??
        [];

    return BlocConsumer<OneBillonCubit, OneBillonStates>(
      builder: (context, state) {
        return Scaffold(
          body: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 100),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 27, vertical: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        S.of(context).services,
                        style: const TextStyle(
                            color: Color(0xff414141),
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(height: 20),
                      Expanded(
                        child: filteredServices.isEmpty
                            ? const Center(
                                child: Text(
                                  "No services available for this section",
                                  style: TextStyle(fontSize: 16),
                                ),
                              )
                            : GridView.builder(
                                itemCount: filteredServices.length,
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
                                      cubit.openServiceDetails(
                                          context, filteredServices[index]);
                                    },
                                    child: CustomCard(
                                      title: filteredServices[index].nameEn,
                                      imagePath: filteredServices[index].img,
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset('assets/images/logo.png',
                                height: 33, width: 50),
                            Row(
                              children: [
                                CustomDrawer(),
                                const SizedBox(width: 10),
                                Image.asset('assets/images/notification.png'),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
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
                              fontWeight: FontWeight.w400),
                        ),
                      ],
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