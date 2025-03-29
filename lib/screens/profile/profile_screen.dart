import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:one_billon/generated/l10n.dart';
import 'package:one_billon/screens/profile/profile_details.dart';
import 'package:one_billon/screens/widgets/custom_button.dart';
import 'package:one_billon/screens/widgets/custom_text_field.dart';
import 'package:one_billon/screens/widgets/poup.dart';

class ProfileScreen extends StatefulWidget {
  final String? name;
  final String? email;
  final String? phone;
  final String? imageUrl;

  ProfileScreen({
    this.name,
    this.email,
    this.phone,
    this.imageUrl,
  });

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  File? _image;
  String imageUrl = "";
  bool isLoading = true;
  bool isLoggedIn = true;

  @override
  void initState() {
    super.initState();
    // _nameController.text = widget.name!;
    // _emailController.text = widget.email!;
    // _phoneController.text = widget.phone!;
    // imageUrl = widget.imageUrl!;
     _fetchUserData();
  }

  Future<void> _fetchUserData() async {
  final user = FirebaseAuth.instance.currentUser;

  if (user == null) {
    print('🚫 المستخدم غير مسجل الدخول');
    setState(() {
      isLoggedIn = false;
      isLoading = false;
    });
    return;
  }

  String uid = user.uid;

  try {
    DocumentSnapshot userDoc =
        await FirebaseFirestore.instance.collection('users').doc(uid).get();

    if (userDoc.exists) {
      Map<String, dynamic> data = userDoc.data() as Map<String, dynamic>;

      setState(() {
        _nameController.text = data['name'] ?? '';
        _emailController.text = data['email'] ?? '';
        _phoneController.text = data['phone'] ?? '';
        imageUrl = data['imageUrl'] ?? '';
        isLoading = false;
      });
    } else {
      setState(() {
        isLoading = false;
      });
    }
  } catch (e) {
    print('❌ خطأ في جلب البيانات: $e');
    setState(() {
      isLoading = false;
    });
  }
}



  Future<void> _pickImage() async {
    try {
      final pickedFile = await ImagePicker().pickImage(
        source: ImageSource.gallery, // ✅ اختيار الصورة من المعرض
        maxWidth: 600,
        imageQuality: 80,
      );

      if (pickedFile != null) {
        setState(() {
          _image = File(pickedFile.path);
        });

        print("تم اختيار الصورة: ${_image!.path}"); // ✅ طباعة المسار

        await _uploadImage();
      }
    } catch (e) {
      print("خطأ أثناء اختيار الصورة: $e");
    }
  }

  Future<void> _uploadImage() async {
    if (_image == null) return; // ✅ التأكد من وجود صورة قبل الرفع
    String uid = FirebaseAuth.instance.currentUser!.uid;

    try {
      print("جاري رفع الصورة...");

      UploadTask uploadTask = FirebaseStorage.instance
          .ref('profile_images/$uid.jpg')
          .putFile(_image!);
      TaskSnapshot snapshot =
          await uploadTask.whenComplete(() => print("تم الرفع بنجاح"));

      String newImageUrl = await snapshot.ref.getDownloadURL();
      print("تم الحصول على رابط الصورة: $newImageUrl");

      await FirebaseFirestore.instance.collection('users').doc(uid).update({
        'imageUrl': newImageUrl,
      });

      setState(() {
        imageUrl = newImageUrl;
      });

      print("تم تحديث الصورة بنجاح");
    } catch (e) {
      print("خطأ أثناء رفع الصورة: $e");
    }
  }

  Future<void> _updateProfile() async {
    String uid = FirebaseAuth.instance.currentUser!.uid;

    await FirebaseFirestore.instance.collection('users').doc(uid).update({
      'name': _nameController.text,
      'email': _emailController.text,
      'phone': _phoneController.text,
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          content: Text(S.of(context).The_data_has_been_successfully_updated)),
    );

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => ProfileDetails()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : isLoggedIn ?
          
           SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Image.asset('assets/images/background.png',
                          width: double.infinity, fit: BoxFit.cover),
                      // Positioned(
                      //   top: 50,
                      //   left: 20,
                      //   child: InkWell(
                      //     onTap: () {
                      //       // Navigator.pop(context);
                      //     },
                      //     child: Image.asset('assets/images/arrow.png'),
                      //   ),
                      // ),
                      Positioned(
                        top: 50,
                        left: MediaQuery.of(context).size.width / 2 - 50,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            CircleAvatar(
                              radius: 50,
                              backgroundImage: _image != null
                                  ? FileImage(_image!)
                                  : (imageUrl.isNotEmpty
                                          ? NetworkImage(imageUrl)
                                          : AssetImage(
                                              'assets/images/profileimage.png'))
                                      as ImageProvider,
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: IconButton(
                                icon: Icon(Icons.camera_alt,
                                    color: Colors.blue, size: 30),
                                onPressed: _pickImage,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 27, vertical: 40),
                    child: Column(
                      children: [
                        CustomTextField(
                            fieldName: S.of(context).username,
                            controller: _nameController,
                            validator: (p0) {}),
                        SizedBox(height: 15),
                        CustomTextField(
                            fieldName: S.of(context).email,
                            controller: _emailController,
                            validator: (p0) {}),
                        SizedBox(height: 15),
                        CustomTextField(
                            fieldName: S.of(context).phone,
                            controller: _phoneController,
                            validator: (p0) {}),
                        SizedBox(height: 20),
                        CustomButton(
                            text: S.of(context).save_data,
                            onTap: _updateProfile),
                      ],
                    ),
                  ),
                ],
              ),
            ) : DialogBody(),
    );
  }
}
