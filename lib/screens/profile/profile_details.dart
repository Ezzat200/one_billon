import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:one_billon/generated/l10n.dart';
import 'package:one_billon/screens/profile/profile_screen.dart';
import 'package:one_billon/screens/widgets/custom_drawer.dart';
import 'package:one_billon/screens/widgets/custom_profile.dart';
import 'package:one_billon/shared/color.dart';

class ProfileDetails extends StatelessWidget {
  Future<Map<String, dynamic>> _getUserData() async {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    DocumentSnapshot userDoc =
        await FirebaseFirestore.instance.collection('users').doc(uid).get();

    if (userDoc.exists) {
      return userDoc.data() as Map<String, dynamic>;
    } else {
      return {};
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<Map<String, dynamic>>(
        future: _getUserData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError || !snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("Failed to load data"));
          }

          // البيانات المسترجعة من Firestore
          final userData = snapshot.data!;
          String name = userData['name'] ?? 'No Name';
          String email = userData['email'] ?? 'No Email';
          String phone = userData['phone'] ?? 'No Phone';
          String imageUrl = userData['imageUrl'] ?? '';

          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Image.asset('assets/images/logo.png', height: 33, width: 50),
                          ),
                          Row(
                            children: [
                              CustomDrawer(),
                              const SizedBox(width: 10),
                              Image.asset('assets/images/notification.png'),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Center(
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 60,
                        backgroundImage: imageUrl.isNotEmpty
                            ? NetworkImage(imageUrl)
                            : const AssetImage('assets/images/profileimage.png') as ImageProvider,
                      ),
                      const SizedBox(height: 20),
                      Text(name,
                          style: const TextStyle(
                              color: Color(0xff007EDB),
                              fontWeight: FontWeight.w700,
                              fontSize: 18)),
                      const SizedBox(height: 10),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProfileScreen(
                                name: name,
                                email: email,
                                phone: phone,
                                imageUrl: imageUrl,
                              ),
                            ),
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                             Text( S.of(context).Edit_data,
                                style: TextStyle(
                                    color: Color(0xff959595),
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14)),
                            const SizedBox(width: 10),
                            Image.asset('assets/images/editData.png'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 27, vertical: 20),
                  child: Column(
                    children: [
                      CustomProfile(
                          imageprofile: 'assets/images/person.png',
                          dataName:  S.of(context).username,
                          dataDesc: name),
                      const SizedBox(height: 22),
                      CustomProfile(
                          imageprofile: 'assets/images/email.png',
                          dataName: S.of(context).email,
                          dataDesc: email),
                      const SizedBox(height: 22),
                      CustomProfile(
                          imageprofile: 'assets/images/phone.png',
                          dataName: S.of(context).phone,
                          dataDesc: phone),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
