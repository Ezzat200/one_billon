import 'package:flutter/material.dart';
import 'package:one_billon/screens/layout/cubit/cubit.dart';
import 'package:one_billon/screens/services/service_details.dart';
import 'package:one_billon/shared/color.dart';

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key,  this.image,  this.title});
final String? image;
final String ?title;
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

List<String>titles=[
  'Digital Marketing',
  ' Management and Organization',
  'Advertising and Publicity',
  'Information Technology Solutions',
  'Creative Design',
  'Media Production',
  'Our Advertising Solutions',
  'Advertising Campaigns'
];
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                 Container(
                  height: 160, 
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
                      padding: const EdgeInsets.only(left: 27,right: 27,top: 30),
                      child: Column(
                        children: [
                        
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                 Image.asset('assets/images/logo.png',height: 33,width: 50,)
                                ],
                              ),
                              Row(
                                children: [
                                  Image.asset('assets/images/drwer.png'),
                                  const SizedBox(width: 10),
                                  Image.asset('assets/images/notification.png'),
                                ],
                              ),
                            ],
                          ),
                    
                        
                         
                           Transform.translate(
                  offset: const Offset(0, 50), 
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
                                child: Row(children:[ Image.asset('assets/images/search.png'),
                                SizedBox(width: 10,),
                                Text("Search...",style: TextStyle(color: Color(0xffE6E6E6),fontSize: 14,fontWeight: FontWeight.w400),)]),
                              ),
                            ),
                          ), 
                  ),
              ],
            ),
                  ),
                )
                )
                ]
                ),
                SizedBox(height: 30,),
                 Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 27),
                   child: Column(
                     children: [
                       Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Services",style: TextStyle(color: Color(0xff414141),fontSize: 16,fontWeight: FontWeight.w500))),
                        GridView.builder(
                itemCount: images.length, 
                shrinkWrap: true, // ✅ يجعل الـ GridView يأخذ حجمه فقط
                physics: const NeverScrollableScrollPhysics(), // ✅ يمنع التمرير داخل GridView
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10, 
                  mainAxisSpacing: 10, 
                  childAspectRatio: 1.9, 
                ),
                itemBuilder: (context, index) {
                  return GestureDetector(
       onTap: () {
          OneBillonCubit.get(context).openServiceDetails(context,titles[index],images[index]);
       },
                    child: CustomCard(
                      title: titles[index],
                      imagePath: images[index],
                    ),
                  );
                },
              ),
                     ],
                   ),
                 )

          ],
        )));
  }
}


class CustomCard extends StatelessWidget {
  final String title;
  final String imagePath;

  const CustomCard({super.key, required this.title, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(

decoration: BoxDecoration(
  borderRadius: BorderRadius.circular(8),
  border: Border.all(color: Color(0xffD9D9D9)),
  color: Color(0xffFFFFFF)
),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center, // توسيط المحتوى
        children: [
          Image.asset(
            imagePath,
            height: 60, // حجم الصورة داخل البطاقة
          ),
          const SizedBox(height: 5),
          Text(
            title,
            style: const TextStyle(
              color: Color(0xff414141),
              fontSize: 10,
              fontWeight: FontWeight.w400,
      
            ),
          ),
        ],
      ),
    );
  }
}
