import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trakli/gen/translations/codegen_loader.g.dart';
import 'package:trakli/presentation/history_screen.dart';
import 'package:trakli/presentation/notification_screen.dart';
import 'package:trakli/presentation/utils/app_navigator.dart';
import 'package:trakli/presentation/utils/custom_appbar.dart';
import 'package:trakli/presentation/utils/enums.dart';
import 'package:trakli/gen/assets.gen.dart';
import 'package:trakli/presentation/utils/transaction_tile.dart';
import 'package:trakli/presentation/utils/wallet_tile.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: SvgPicture.asset(
          Assets.images.logoGreen,
          height: 38.h,
        ),
        actions: [
          GestureDetector(
            onTap: (){
              AppNavigator.push(context, const NotificationScreen());
            },
            child: Container(
              width: 42.r,
              height: 42.r,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                color: Theme.of(context).primaryColor.withValues(alpha: 0.2),
              ),
              padding: EdgeInsets.all(8.r),
              child: Center(
                child: Icon(
                  Icons.notifications,
                  size: 24.r,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
          ),
          SizedBox(width: 16.w),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 16.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const WalletTile(),
            SizedBox(height: 12.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  LocaleKeys.transactions.tr(),
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                    color: Theme.of(context).primaryColorDark,
                  ),
                ),
                InkWell(
                  onTap: (){
                    AppNavigator.push(context, const HistoryScreen());
                  },
                  child: Text(
                    LocaleKeys.seeAll.tr(),
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.orangeAccent,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 12.h),
            Container(
              padding: EdgeInsets.all(16.sp),
              constraints: BoxConstraints(
                maxHeight: 0.5.sh,
                minWidth: 100.h,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(
                  color: Colors.grey.shade300,
                ),
              ),
              child: ListView(
                // physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: List.generate(
                  4,
                  (index) => TransactionTile(
                    transactionType: (index % 2 == 0)
                        ? TransactionType.income
                        : TransactionType.expense,
                    accentColor: (index % 2 == 0)
                        ? Theme.of(context).primaryColor
                        : const Color(0xFFEB5757),
                  ),
                ),
              ),
            ),
            SizedBox(height: 28.h),
          ],
        ),
      ),
    );
  }
}
