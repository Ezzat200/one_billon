import 'package:flutter/material.dart';
import 'package:one_billon/models/service_model.dart';
import 'package:one_billon/screens/layout/cubit/cubit.dart';
import 'package:one_billon/screens/layout/cubit/states.dart';
import 'package:one_billon/screens/services/service_details.dart';
import 'package:one_billon/shared/color.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  List<ServiceModel> filteredBlogs = [];

  @override
  void initState() {
    super.initState();
    final cubit = OneBillonCubit.get(context);
    filteredBlogs = cubit.services!; // نعرض الكل في البداية
  }

  void _filterItems(String query) {
    final cubit = OneBillonCubit.get(context);
    setState(() {
      filteredBlogs = cubit.services
          !.where((item) =>
              item.nameAr.toLowerCase().contains(query.toLowerCase()) ||
              item.nameEn.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OneBillonCubit, OneBillonStates>(
      listener: (context, state) {},
      builder: (context, state) {
        final cubit = OneBillonCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            leading: InkWell(
              onTap: () => Navigator.pop(context),
              child: Icon(Icons.arrow_back, color: ColorManager.navbarIconColor),
            ),
            title: Text("Search", style: TextStyle(color: ColorManager.navbarIconColor)),
            backgroundColor: const Color(0xFF007EDB),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // 🔍 Search Field
                TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: 'Search...',
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onChanged: _filterItems,
                ),
                SizedBox(height: 20),

                // 📋 List of Results
                Expanded(
                  child: filteredBlogs.isNotEmpty
                      ? ListView.builder(
                          itemCount: filteredBlogs.length,
                          itemBuilder: (context, index) {
                            final service = filteredBlogs[index];
                            return InkWell(
                               onTap: () {
                            // OneBillonCubit.get(context).openServiceDetails(
                            //     context, titles[index], images[index]);
                            Navigator.push(context, MaterialPageRoute(builder: (context) => ServiceDetails(serviceModel: service,),));
                          },
                              child: ListTile(
                                title: Text(cubit.languageCode == 'en'
                                    ? service.nameEn
                                    : service.nameAr),
                                // subtitle: Text(service.),
                              ),
                            );
                          },
                        )
                      : Center(child: Text("No results found")),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
