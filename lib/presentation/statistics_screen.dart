import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trakli/gen/translations/codegen_loader.g.dart';
import 'package:trakli/presentation/utils/dashboard_expenses.dart';
import 'package:trakli/presentation/utils/dashboard_pie_data.dart';
import 'package:trakli/presentation/utils/graph_widget.dart';

class StatisticsScreen extends StatelessWidget {
  const StatisticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60.h,
        backgroundColor: const Color(0xFFEBEDEC),
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          "Statistics",
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 20.sp,
          ),
        ),
        shape: UnderlineInputBorder(
          borderSide: BorderSide(
            width: 0.5.h,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 20.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              LocaleKeys.transactionLast30DaysPerParties.tr(
                args: [
                  30.toString(),
                  LocaleKeys.days.toString(),
                ],
              ),
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(height: 12.h),
            const GraphWidget(),
            SizedBox(height: 12.h),
            const DashboardExpenses(),
            SizedBox(height: 28.h),
            Text(
              "Transactions of Last 30 days In total",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(height: 12.h),
            const DashboardPieData(),
          ],
        ),
      ),
    );
  }
}
