import 'package:flutter/material.dart';
import 'package:one_billon/screens/widgets/custom_content_text_blog.dart';
import 'package:one_billon/screens/widgets/custom_introduction_text_blog.dart';
import 'package:one_billon/screens/widgets/custom_text.dart';
import 'package:one_billon/shared/color.dart';

class BlogDetails extends StatelessWidget {
  const BlogDetails({super.key,  this.image});
final String ?image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Stack(
          children: [
            
           Padding(
             padding:  EdgeInsets.only(top: 170,left: 27,right: 27),
             child: Column(
               children: [
    ClipRRect(
  borderRadius: BorderRadius.circular(8), 
  child: Image.asset(
    image!,
    height: 126,
    fit: BoxFit.cover,
    width: double.infinity,
  ),
),
SizedBox(height: 5,),
Row(
  children: [
    Image.asset('assets/images/calender.png',height: 15,width: 15,fit: BoxFit.cover,),
    Text(' 8 december 2024',style: TextStyle(color: Color(0xff007EDB),fontSize: 12,fontWeight: FontWeight.w400),),

  ],
),
SizedBox(height: 10,),
  Text(
                   'Artificial Intelligence in Marketing: The Future of Advertising in Saudi Arabia',
                   style: TextStyle(
                     color: Color(0xff414141),
                     fontSize: 14,
                     fontWeight: FontWeight.w500,
                      
                   ),
                   softWrap: true,
                   overflow: TextOverflow.visible, 
                 ),
                CustomIntoductionTextBlog(
                  introName: 'Introduction',
                ),
                CustomContentTextBlog(
                  contentString: 'Are You Ready for the Future of Advertising?How can artificial intelligence in marketing revolutionize the Saudi market? In an era of speed and advanced technology, AI in marketing has become the key to successful advertising campaigns.In this article, we will explore how AI analyzes consumer behavior and enhances ad targeting in Saudi Arabia. Together, we will uncover the secrets of this technology that adds power and effectiveness to advertising.',
                ),
                SizedBox(height: 15,),
                 CustomIntoductionTextBlog(
                  introName: 'The Topic',
                ),
                SizedBox(height: 5,),

                Text(
                   'First: The Concept of Artificial Intelligence in Marketing',
                   style: TextStyle(
                     color: Color(0xff414141),
                     fontSize: 12,
                     fontWeight: FontWeight.w400,
                      
                   ),
                   softWrap: true,
                   overflow: TextOverflow.visible, 
                 ),
                SizedBox(height: 5,),

                CustomContentTextBlog(
                  contentString: 'Artificial Intelligence in Marketing is not just a passing term; it is a sophisticated system that combines data analysis and machine learning to accurately understand consumer behavior. By collecting vast amounts of customer data, AI in marketing can predict market trends and precisely target advertisements to the right audience.',
                ),
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
                            child: Image.asset('assets/images/arrow.png', height: 33, width: 50)),
                          Row(
                            children: [
                              Image.asset('assets/images/drwer.png'),
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
        ),
    );
  }
}

