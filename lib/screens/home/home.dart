import 'package:flutter/material.dart';
import 'package:one_billon/shared/color.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
        
          Container(
            height: 250, 
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
                padding: const EdgeInsets.symmetric(horizontal: 27, vertical: 30),
                child: Column(
                  children: [
                  
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Welcome Mohamed',
                              style: TextStyle(
                                color: ColorManager.navbarIconColor,
                                fontSize: 18,
                              ),
                            ),
                            const Text(
                              'How Are You?',
                              style: TextStyle(
                                color: Color(0xffD9D9D9),
                                fontSize: 16,
                              ),
                            ),
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
                    const SizedBox(height: 40),
                  
                    Container(
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
                          child: Image.asset('assets/images/search.png'),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'View All',
                          style: TextStyle(
                            color: ColorManager.primary,
                            fontSize: 14,
                          ),
                        ),
                        const Text(
                          'Services',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),

        
          Expanded(
            child: Transform.translate(
              offset: const Offset(0, -50), 
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: GridView.builder(
                  itemCount: 8, 
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10, 
                    mainAxisSpacing: 10, 
                    childAspectRatio: 1.6, 
                  ),
                  itemBuilder: (context, index) {
                    return CustomCard(
                      title: 'Service ${index + 1}',
                      imagePath: 'assets/images/numberMarket.png',
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ✅ ويدجت مخصصة لبطاقة الخدمة
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
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // توسيط المحتوى
          children: [
            Image.asset(
              imagePath,
              height: 60, // حجم الصورة داخل البطاقة
            ),
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(
                color: Color(0xff414141),
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
