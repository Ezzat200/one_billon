import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_billon/screens/blog/blog_details.dart';
import 'package:one_billon/screens/layout/cubit/cubit.dart';
import 'package:one_billon/screens/layout/cubit/states.dart';
import 'package:one_billon/screens/widgets/custom_blog.dart';
import 'package:one_billon/screens/widgets/custom_button.dart';
import 'package:one_billon/screens/widgets/custom_drawer.dart';
import 'package:one_billon/screens/widgets/custom_text.dart';
import 'package:one_billon/screens/widgets/custom_text_field.dart';
import 'package:one_billon/shared/color.dart';

class BlogScreen extends StatelessWidget {
  const BlogScreen({super.key,  this.image,  });
final String ?image;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OneBillonCubit, OneBillonStates>(builder: (context, state) {
      final cubit = OneBillonCubit.get(context);

      return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
        children: [
          
         Padding(
           padding: const EdgeInsets.only(top: 150,left: 27,right: 27),
           child: Column(
             children: [
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: cubit.blogs?.length,
              itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  BlogDetails(blogModel: cubit.blogs?[index],))
                      );
                  },
                  child: CustomBlog(blogModel: cubit.blogs?[index],)),
              );
            },)
             ],
           )
        
         )
        ,
        
        
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
                    const Text(
                      "Search...",
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
        ],
              ),
      ));
  
  
    }, listener: (context, state) {
      
    },);
  }
}
