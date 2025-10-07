import 'package:flutter/material.dart';
import 'package:tinnierenee12/const/app_color.dart';
import 'package:tinnierenee12/utils/app_size.dart';
import 'package:tinnierenee12/widget/app_log/gap.dart';
import 'package:tinnierenee12/widget/app_text/app_text.dart';

class AppDescriptionTextField extends StatelessWidget {
  const AppDescriptionTextField({
    super.key,
    this.controller,
    this.hintText = '',
    this.fillColor,
    this.border,
    this.errBorder,
    this.title,
    this.titleColor,
    this.hintColor,
    this.textColor,
    this.titleSize,
  });

  final String? title;
  final TextEditingController? controller;
  final String hintText;
  final Color? fillColor;
  final Color? titleColor;
  final Color? hintColor;
  final Color? textColor;
  final InputBorder? border;
  final InputBorder? errBorder;
  final double? titleSize;

  @override
  Widget build(BuildContext context) {
    final outlineBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide.none, // No border color
    );

    final errorOutlineBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide.none, // No border color
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // const Gap(height: 15),
        // Show SizedBox if title is null or empty, otherwise show AppText
        (title == null || title!.isEmpty)
            ? const SizedBox()
            : AppText(
                data: title!,
                fontWeight: FontWeight.w600,
                color: titleColor ?? Colors.white,
                fontSize: titleSize ?? AppSize.width(value: 18),
              ),

        const Gap(height: 10),
        SizedBox(
          height: 120,
          child: TextFormField(
            style: TextStyle(
              fontSize: AppSize.width(value: 16),
              color: textColor ?? AppColor.white,
            ),
            cursorColor: Colors.white,
            controller: controller,
            keyboardType: TextInputType.multiline,
            maxLines: null,
            expands: true,
            textAlignVertical: TextAlignVertical.top,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(
                fontSize: AppSize.width(value: 16),
                color: hintColor ?? AppColor.white.withValues(alpha: 0.5),
              ),

              filled: true,
              fillColor: fillColor ?? AppColor.purple,
              border: border ?? outlineBorder,
              enabledBorder: border ?? outlineBorder,
              focusedBorder: border ?? outlineBorder,
              errorBorder: errBorder ?? errorOutlineBorder,
              focusedErrorBorder: errBorder ?? errorOutlineBorder,
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'This field is required';
              }
              return null;
            },
          ),
        ),
      ],
    );
  }
}
