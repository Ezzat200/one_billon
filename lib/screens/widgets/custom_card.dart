
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
            child: Image.network(
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



class CustomOrangeButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback onPressed;
  final Color color;

  const CustomOrangeButton({
    super.key,
    required this.text,
    required this.icon,
    required this.onPressed, required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor:  color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
             Icon(
              icon,
              color: Colors.white,
            ),
          const SizedBox(width: 10),
            Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            
           
          
          ],
        ),
      ),
    );
  }
}

