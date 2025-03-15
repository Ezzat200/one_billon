import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_billon/generated/l10n.dart';
import 'package:one_billon/models/blog_model.dart';
import 'package:one_billon/screens/layout/cubit/cubit.dart';
import 'package:one_billon/screens/layout/cubit/states.dart';
import 'package:one_billon/shared/color.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer/shimmer.dart';

class CustomBlog extends StatelessWidget {
  const CustomBlog({
    super.key,
    this.blogModel,
  });

  final BlogModel? blogModel;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OneBillonCubit, OneBillonStates>(
      listener: (context, state) {},
      builder: (context, state) {
        final cubit = OneBillonCubit.get(context);

        return Container(
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xffD9D9D9)),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: CachedNetworkImage(
                    imageUrl: blogModel!.img,
                    height: 85,
                    width: 100,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        height: 85,
                        width: 100,
                        color: Colors.grey[300],
                      ),
                    ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.broken_image),
                  ),
                ),
                const SizedBox(width: 10),
                SizedBox(
                  width: 170,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        cubit.languageCode == 'en'
                            ? blogModel!.titleEn
                            : blogModel!.titleAr,
                        style: const TextStyle(
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
                            S.of(context).moreDetails,
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
      },
    );
  }
}
