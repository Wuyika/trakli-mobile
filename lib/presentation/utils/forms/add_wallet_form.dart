import 'package:currency_picker/currency_picker.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trakli/gen/assets.gen.dart';
import 'package:trakli/gen/translations/codegen_loader.g.dart';

class AddWalletForm extends StatefulWidget {
  const AddWalletForm({super.key});

  @override
  State<AddWalletForm> createState() => _AddWalletFormState();
}

class _AddWalletFormState extends State<AddWalletForm> {
  Currency? currency;


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
        vertical: 16.h,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Name",
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w700,
              color: Theme.of(context).primaryColorDark,
            ),
          ),
          SizedBox(height: 8.h),
          TextFormField(
            decoration: const InputDecoration(
              hintText: "Enter name",
            ),
          ),
          SizedBox(height: 20.h),
          Text(
            "Balance",
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w700,
              color: Theme.of(context).primaryColorDark,
            ),
          ),
          SizedBox(height: 8.h),
          IntrinsicHeight(
            child: Row(
              spacing: 16.w,
              children: [
                Expanded(
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      hintText: "Ex: 250 000",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        // return LocaleKeys.transactionAmountError.tr();
                        return "Amount is required";
                      }
                      return null;
                    },
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    showCurrencyPicker(
                      context: context,
                      theme: CurrencyPickerThemeData(
                        bottomSheetHeight: 0.7.sh,
                        backgroundColor: Colors.white,
                        flagSize: 24.sp,
                        subtitleTextStyle: TextStyle(
                          fontSize: 12.sp,
                          color: Theme.of(context).primaryColor,
                        )
                      ),
                      onSelect: (Currency currencyValue) {
                        setState(() {
                          currency = currencyValue;
                        });
                      },
                    );
                  },
                  child: Container(
                    width: 60.w,
                    decoration: BoxDecoration(
                      color: const Color(0xFFDEE1E0),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(currency?.code ?? "XAF"),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 20.h),
          Text(
            "Description",
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w700,
              color: Theme.of(context).primaryColorDark,
            ),
          ),
          SizedBox(height: 8.h),
          TextFormField(
            maxLines: 3,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: LocaleKeys.typeHere.tr(),
            ),
          ),
          SizedBox(height: 20.h),
          SizedBox(
            height: 54.h,
            width: double.infinity,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(
                  Theme.of(context).primaryColor,
                ),
              ),
              onPressed: () {},
              child: Row(
                spacing: 8.w,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Create wallet"),
                  SvgPicture.asset(
                    Assets.images.add,
                    width: 24,
                    height: 24,
                    colorFilter: const ColorFilter.mode(
                      Colors.white,
                      BlendMode.srcIn,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
