import 'package:flutter/material.dart';

import '../../../utils/app_theme.dart';
import '../../../utils/utils.dart';

class RecentActivityWidget extends StatelessWidget {
  const RecentActivityWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Recent Activity",
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(4),
          ),
          child:
              // ListView.separated(
              //   shrinkWrap: true,
              //   physics: const NeverScrollableScrollPhysics(),
              //   itemCount: 3,
              //   itemBuilder: (context, index) {
              //     return _recentActivityItems(
              //       companyName: "Kubu Tropis",
              //       activity: "Cloud PMS - Enterprise",
              //       amount: 720000,
              //       imgUrl: "assets/images/guestpro logo.png",
              //     );
              //   },
              //   separatorBuilder: (context, index) => Container(
              //     margin: const EdgeInsets.symmetric(vertical: 12),
              //     height: 0.75,
              //     width: double.infinity,
              //     color: Colors.grey[400],
              //   ),
              // ),
              Column(
            children: [
              _recentActivityItems(
                companyName: "Kubu Tropis",
                activity: "Cloud PMS - Enterprise / 2 year",
                amount: 12640000,
                imgUrl: "assets/images/guestpro logo.png",
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 12),
                height: 0.75,
                width: double.infinity,
                color: Colors.grey[400],
              ),
              _recentActivityItems(
                companyName: "Taulan Social Hideout",
                activity: "OrderBil - Basic / 3 month",
                amount: 535000,
                imgUrl: "assets/images/orderbil logo.png",
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 12),
                height: 0.75,
                width: double.infinity,
                color: Colors.grey[400],
              ),
              _recentActivityItems(
                companyName: "Agrapana Beach Villa",
                activity: "GuestAps - Professional / 6 month",
                amount: 1852000,
                imgUrl: "assets/images/guestaps logo.PNG",
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 12),
                height: 0.75,
                width: double.infinity,
                color: Colors.grey[400],
              ),
              _recentActivityItems(
                companyName: "Wr. Bubble",
                activity: "OrderBil - Professional / 1 year",
                amount: 4752000,
                imgUrl: "assets/images/orderbil logo.png",
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _recentActivityItems(
      {required String companyName, required String activity, required num amount, required String imgUrl}) {
    return Row(
      children: [
        Image.asset(
          imgUrl,
          height: 35,
          width: 35,
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                companyName,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
              Text(
                activity,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(color: Colors.grey, fontSize: 13, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: AppTheme.primaryColor,
            borderRadius: BorderRadiusDirectional.circular(4),
          ),
          child: Text(
            Utils.compactCurrency(amount),
            style: const TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
          ),
        ),
      ],
    );
  }
}
