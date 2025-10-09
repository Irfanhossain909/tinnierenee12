import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:tinnierenee12/const/app_color.dart';
import 'package:tinnierenee12/utils/app_size.dart';

class AppShimmer extends StatelessWidget {
  const AppShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      containersColor: AppColor.black.withValues(alpha: 0.1),
      child: Padding(
        padding: EdgeInsets.only(top: AppSize.width(value: 12)),
        child: Container(
          decoration: BoxDecoration(
            color: AppColor.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColor.black.withValues(alpha: .1)),
          ),
          padding: EdgeInsets.all(AppSize.width(value: 8)),
          child: Row(
            spacing: AppSize.width(value: 16),
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Shimmer for circular image
              Expanded(
                flex: 1,
                child: Container(
                  width: AppSize.width(value: 46),
                  height: AppSize.width(value: 46),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              // Shimmer for text content
              Expanded(
                flex: 4,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  spacing: AppSize.width(value: 8),
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Shimmer for title
                    Container(
                      height: AppSize.width(value: 18),
                      width: double.infinity,
                      color: Colors.white,
                    ),
                    // Shimmer for certificate
                    Container(
                      height: AppSize.width(value: 12),
                      width: AppSize.width(value: 120),
                      color: Colors.white,
                    ),
                    // Shimmer for date row
                    Row(
                      spacing: AppSize.width(value: 4),
                      children: [
                        Container(
                          width: AppSize.width(value: 16),
                          height: AppSize.width(value: 16),
                          color: Colors.white,
                        ),
                        Container(
                          height: AppSize.width(value: 12),
                          width: AppSize.width(value: 100),
                          color: Colors.white,
                        ),
                      ],
                    ),
                    // Shimmer for time row
                    Row(
                      spacing: AppSize.width(value: 4),
                      children: [
                        Container(
                          width: AppSize.width(value: 16),
                          height: AppSize.width(value: 16),
                          color: Colors.white,
                        ),
                        Container(
                          height: AppSize.width(value: 12),
                          width: AppSize.width(value: 80),
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // Shimmer for right column
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: AppSize.width(value: 20),
                      height: AppSize.width(value: 20),
                      color: Colors.white,
                    ),
                    SizedBox(height: AppSize.size.height * 0.07),
                    Container(
                      height: AppSize.width(value: 14),
                      width: AppSize.width(value: 40),
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class StatisticsShimmer extends StatelessWidget {
  const StatisticsShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      containersColor: AppColor.black.withValues(alpha: 0.1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: AppSize.width(value: 4),
        children: [
          // Shimmer for "Statistics" title
          Container(
            height: AppSize.width(value: 18),
            width: AppSize.width(value: 100),
            color: Colors.white,
          ),
          SizedBox(height: AppSize.size.height * 0.001),
          // First row of shimmer cards
          Row(
            spacing: AppSize.size.width * 0.04,
            children: [
              Expanded(
                child: _buildShimmerCard(),
              ),
              Expanded(
                child: _buildShimmerCard(),
              ),
            ],
          ),
          SizedBox(height: AppSize.size.height * 0.002),
          // Second row of shimmer cards
          Row(
            spacing: AppSize.size.width * 0.04,
            children: [
              Expanded(
                child: _buildShimmerCard(),
              ),
              Expanded(
                child: _buildShimmerCard(),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildShimmerCard() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColor.purple.withValues(alpha: 0.3)),
        color: Colors.white,
      ),
      padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: AppSize.size.height * 0.02,
        children: [
          // Shimmer for card title
          Container(
            height: AppSize.width(value: 12),
            width: double.infinity,
            color: Colors.white,
          ),
          // Shimmer for card value
          Container(
            height: AppSize.width(value: 18),
            width: AppSize.width(value: 60),
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
