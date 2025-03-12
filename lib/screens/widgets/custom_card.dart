
import 'package:flutter/material.dart';

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
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                color: Color(0xff414141),
                fontSize: 10,
                fontWeight: FontWeight.w400,
                  overflow: TextOverflow.visible,
                  
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
