import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:ix_task/presentation/resource/color_manager.dart';

import 'package:ix_task/presentation/resource/values_manager.dart';

class ShimmerLoading extends StatelessWidget {
  const ShimmerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 4,
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: ColorManager.lightGrey,
          highlightColor: ColorManager.background,
          child: Padding(
            padding: const EdgeInsets.all(AppPadding.p16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: AppSize.s50,
                  height: AppSize.s50,
                  decoration: const BoxDecoration(
                    color: ColorManager.surface,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: AppSize.s16),
                // Text placeholder
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity,
                        height: AppSize.s12,
                        color: ColorManager.surface,
                      ),
                      const SizedBox(height: AppPadding.p8),
                      Container(
                        width: double.infinity,
                        height: AppSize.s12,
                        color: ColorManager.surface,
                      ),
                      const SizedBox(height: AppPadding.p8),
                      Container(
                        width: AppSize.s100,
                        height: AppSize.s12,
                        color: ColorManager.surface,
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