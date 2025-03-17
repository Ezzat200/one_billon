
import 'package:flutter/material.dart';
import 'package:one_billon/screens/blog/blog_screen.dart';
import 'package:one_billon/screens/profile/profile_screen.dart';
import 'package:one_billon/screens/services/services_screen.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector
    (
       onTap: () {
        showModalBottomSheet(
          backgroundColor: Color(0xff073455A6).withOpacity(.65),
          context: context,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          builder: (context) => Container(
           
            padding: EdgeInsets.all(16),
            height: 500, 
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset('assets/images/logo.png',height: 23,),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Image.asset('assets/images/close.png'))
                  ],
                ),
                SizedBox(height: 20,),
                   GestureDetector(
                    onTap: () {
                         Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return ServicesScreen();
                      },));
                    
                    },
                     child: Container(
                      height: 40,
                      decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(8),
                      color: Color(0xff007EDB),
                      ),
                      width: double.infinity,
                      child: Center(child: Text('Home',style: TextStyle(color: Color(0xffFFFFFF),fontWeight: FontWeight.w700,fontSize: 20),))),
                   ),
                  
                SizedBox(height: 35,),
                   GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return ServicesScreen();
                      },));
                    },
                    child: Text('Services',style: TextStyle(color: Color(0xffFFFFFF),fontWeight: FontWeight.w700,fontSize: 20),)),
                SizedBox(height: 35,),
    
                 GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return BlogScreen();
                      },));
                    },
                    child: Text('Blog',style: TextStyle(color: Color(0xffFFFFFF),fontWeight: FontWeight.w700,fontSize: 20),)),
                SizedBox(height: 35,),
    
                   
    
    
              GestureDetector(
                    // onTap: () {
                    //   Navigator.push(context, MaterialPageRoute(builder: (context) {
                    //     return ProfileScreen();
                    //   },));
                    // },
                    child: Text('Services',style: TextStyle(color: Color(0xffFFFFFF),fontWeight: FontWeight.w700,fontSize: 20),)),
                SizedBox(height: 35,),
    
                   Text('Sign Out',style: TextStyle(color: Color(0xffFF8D00),fontWeight: FontWeight.w700,fontSize: 20),),
    
                
              ],
            ),
          ),
        );
      },
      child: Image.asset('assets/images/drwer.png'));
  }
}
