import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});

  // تحويل الحالة من رقم إلى نص
  String getStatusText(int status) {
    switch (status) {
      case 0:
        return 'قيد المراجعة';
      case 1:
        return 'تم القبول';
      case 2:
        return 'مرفوض';
      case 3:
        return 'مكتمل';
      default:
        return 'غير معروف';
    }
  }

  // اللون المناسب لكل حالة
  Color getStatusColor(int status) {
    switch (status) {
      case 0:
        return Colors.orange;
      case 1:
        return Colors.green;
      case 2:
        return Colors.red;
      case 3:
        return Colors.blueGrey;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    final User? user = FirebaseAuth.instance.currentUser;
    final String? userEmail = user?.email;

    if (userEmail == null) {
      return Scaffold(
        appBar: AppBar(title: Text('طلباتي')),
        body: Center(child: Text('يرجى تسجيل الدخول لعرض الطلبات')),
      );
    }

    final ordersStream = FirebaseFirestore.instance
        .collection('orders')
        .where('email', isEqualTo: userEmail)
        .snapshots();

    return Scaffold(
      body: Stack(
        children: [
          // الجزء العلوي (الهيدر)
          Container(
            height: 100,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xff007EDB), Color(0xff004375)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: SafeArea(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 27, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Image.asset('assets/images/arrow.png',
                          height: 33, width: 50),
                    ),
                    Image.asset('assets/images/logo.png',
                        height: 33, width: 50),
                  ],
                ),
              ),
            ),
          ),

          // صندوق البحث

          // المحتوى (الطلبات)
          Padding(
            padding: const EdgeInsets.only(left: 27, right: 27, top: 100),
            child: StreamBuilder<QuerySnapshot>(
              stream: ordersStream,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }

                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return Center(
                    child: Text('لا توجد طلبات حالياً'),
                  );
                }

                final orders = snapshot.data!.docs;

                return ListView.builder(
                  itemCount: orders.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final order = orders[index];
                    final data = order.data() as Map<String, dynamic>?;

                    final name = data?['name'] ?? 'غير معروف';
                    final service = data?['service'] ?? 'غير محدد';
                    final phone = data?['phone'] ?? 'غير متوفر';
                    final timestamp = data?['timestamp'];
                    final dateTime = timestamp != null
                        ? (timestamp as Timestamp).toDate()
                        : DateTime.now();
                    final int status = data?['status'] ?? 0;

                    return Card(
                      margin: EdgeInsets.only(bottom: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      elevation: 4,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Color(0xff007EDB), Color(0xff004375)],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                          borderRadius: BorderRadius.circular(
                              15), // نفس الـ borderRadius للـ Card
                        ),
                        child: ListTile(
                          title: Text('الخدمة: $service',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20)),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 5),
                              Text('الاسم: $name',
                                  style: TextStyle(color: Colors.white)),
                              Text('الهاتف: $phone',
                                  style: TextStyle(color: Colors.white)),
                              // Text('التاريخ: ${dateTime.toLocal()}', style: TextStyle(color: Colors.white)),
                              SizedBox(height: 8),
                              Row(
                                children: [
                                  Text(
                                    'الحالة: ',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  Text(
                                    getStatusText(status),
                                    style: TextStyle(
                                      color: getStatusColor(status),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
