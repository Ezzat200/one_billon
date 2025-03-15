
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
          
          Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: Image.asset(
              imagePath,
              height: 35, // حجم الصورة داخل البطاقة
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 5),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: Text(
                title,
                style: const TextStyle(
                  color: Color(0xff414141),
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                    overflow: TextOverflow.visible,
                    
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
