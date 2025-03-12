
import 'package:flutter/material.dart';
import 'package:one_billon/shared/color.dart';

class CustomBlog extends StatelessWidget {
  const CustomBlog({
    super.key,  this.image,
  });
final String ?image;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xffD9D9D9)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start, // لضمان محاذاة النص بشكل صحيح
          children: [
            Container(
              height: 85,
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.transparent, width: 1),
                image:  DecorationImage(
                  image: AssetImage(image!),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 10),
            SizedBox(
              width: 170,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 Text(
                   'Artificial Intelligence in Marketing: The Future of Advertising in Saudi Arabia',
                   style: TextStyle(
                     color: Color(0xff414141),
                     fontSize: 12,
                     fontWeight: FontWeight.w500,
                     height: 1.8, 
                   ),
                   softWrap: true,
                   overflow: TextOverflow.visible, 
                 ),
     Stack(
      alignment: Alignment.center,
      children: [
        Text(
          'More Details',
          style: TextStyle(
            color: ColorManager.primary,
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
        ),
        Positioned(
          bottom: -1, 
          child: Container(
            width: 75,
            height: 2, 
            color: ColorManager.primary, 
          ),
        ),
      ],
    ),
    
                ],
              ),
            ),
              
          ],
        ),
      ),
    );
  }
}