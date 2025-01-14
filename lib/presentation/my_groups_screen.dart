import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trakli/gen/translations/codegen_loader.g.dart';
import 'package:trakli/presentation/utils/app_navigator.dart';
import 'package:trakli/presentation/utils/group_tile.dart';

class MyGroupsScreen extends StatelessWidget {
  const MyGroupsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF047844),
        leading: IconButton(
          style: ButtonStyle(
            backgroundColor: const WidgetStatePropertyAll(Colors.white),
            foregroundColor: WidgetStatePropertyAll(
              Theme.of(context).primaryColor,
            ),
          ),
          onPressed: () {
            AppNavigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            size: 20,
          ),
        ),
        title: Text(
          LocaleKeys.groupsMyGroups.tr(),
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(16.sp),
        margin: EdgeInsets.all(16.sp),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: const Color(0xFFB8BBB4),
          ),
        ),
        child: ListView(
          shrinkWrap: true,
          children: List.generate(
            5,
            (index) => const GroupTile(),
          ),
        ),
      ),
    );
  }
}
