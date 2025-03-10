import 'package:flutter/material.dart';
import 'package:one_billon/screens/widgets/custom_text.dart';
import 'package:one_billon/shared/color.dart';

class ServiceDetails extends StatelessWidget {
  const ServiceDetails({super.key,  this.image,  this.title});
final String ?image;
final String ?title;
  @override
  Widget build(BuildContext context) {
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
                               Image.asset('assets/images/arrow.png',height: 33,width: 50,)
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
               )  ))],
        ),
        SizedBox(height: 50,),
       Padding(
  padding: const EdgeInsets.symmetric(horizontal: 27),
  child: Container(

    width: double.infinity,
    decoration: BoxDecoration(
      // border: Border.all(color: Color(0xffE6E6E6)),
      borderRadius: BorderRadius.circular(8),
      border: Border(
        bottom: BorderSide(color: ColorManager.primary  , width: 5), // Border السفلي
      ),
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
      child: Column(
        children: [
          Image.asset(
            image!,
            height: 40,
            fit: BoxFit.contain,
          ),
          SizedBox(height: 20),
          Text(
           title!,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Color(0xff424C57),
            ),
          ),
          SizedBox(height: 20),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Image.asset('assets/images/dot.png'),
              ),
              SizedBox(width: 10),
              CustomText(
                text:
                    "We are a leading company in exhibition and conference management, as well as the entertainment events industry. We integrate creativity with advanced technological innovation, including artificial intelligence applications, to create exceptional experiences that deliver real value to our clients.",
              ),
              
            ],
          ),

           SizedBox(height: 20),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Image.asset('assets/images/dot.png'),
              ),
              SizedBox(width: 10),
              CustomText(
                text:
                    "We are a leading company in exhibition and conference management, as well as the entertainment events industry. We integrate creativity with advanced technological innovation, including artificial intelligence applications, to create exceptional experiences that deliver real value to our clients.",
              ),
              
            ],
          ),
           SizedBox(height: 20),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Image.asset('assets/images/dot.png'),
              ),
              SizedBox(width: 10),
              CustomText(
                text:
                    "We are a leading company in exhibition and conference management, as well as the entertainment events ",
              ),
              
            ],
          ),
        ],
      ),
    ),
  )),
  SizedBox(height: 30,)
                ]
                ),
    ));
  }
}
