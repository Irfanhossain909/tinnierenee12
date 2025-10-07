import 'package:flutter/material.dart';
import 'package:tinnierenee12/const/app_color.dart';
import 'package:tinnierenee12/utils/app_size.dart';

class CustomDropdown<T> extends StatelessWidget {
  final List<T> items;
  final T? selectedValue; // nullable to allow hint initially
  final String hint;
  final void Function(T?) onChanged;

  // 🎨 Styling parameters
  final Color? hintColor;
  final Color? borderColor;
  final Color? fillColor;
  final Color? dropdownColor;
  final Color? dropdownItemColor;
  final Color? textColor; // selected value color
  final double? fontSize;
  final FontWeight? fontWeight;
  final double borderRadius;

  const CustomDropdown({
    super.key,
    required this.items,
    this.selectedValue, // now optional
    required this.hint,
    required this.onChanged,
    this.hintColor,
    this.borderColor,
    this.fillColor,
    this.dropdownColor,
    this.dropdownItemColor,
    this.textColor,
    this.fontSize,
    this.fontWeight,
    this.borderRadius = 12,
  });

  @override
  Widget build(BuildContext context) {
    final Color effectiveBorderColor = borderColor ?? Colors.black;
    final Color effectiveHintColor = hintColor ?? Colors.black54;
    final Color effectiveDropdownColor = dropdownColor ?? Colors.white;
    final Color effectiveItemColor = dropdownItemColor ?? Colors.black;
    final Color effectiveTextColor = textColor ?? Colors.black;
    final double effectiveFontSize = fontSize ?? 14;
    final FontWeight effectiveFontWeight = fontWeight ?? FontWeight.normal;

    return DropdownButtonFormField<T>(
      value: selectedValue, // null allowed to show hint
      isExpanded: true,
      decoration: InputDecoration(
        filled: true,
        fillColor: fillColor ?? Colors.transparent,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: effectiveBorderColor),
          borderRadius: BorderRadius.circular(
            AppSize.width(value: borderRadius),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: effectiveBorderColor),
          borderRadius: BorderRadius.circular(
            AppSize.width(value: borderRadius),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: effectiveBorderColor, width: 1.5),
          borderRadius: BorderRadius.circular(
            AppSize.width(value: borderRadius),
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(
            AppSize.width(value: borderRadius),
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(
            AppSize.width(value: borderRadius),
          ),
        ),
      ),
      style: TextStyle(
        color: effectiveTextColor,
        fontSize: effectiveFontSize,
        fontWeight: effectiveFontWeight,
      ),
      hint: Text(
        hint,
        style: TextStyle(
          color: effectiveHintColor,
          fontSize: effectiveFontSize,
        ),
      ),
      items: items.map((T value) {
        return DropdownMenuItem<T>(
          value: value,
          child: Text(
            value.toString(),
            style: TextStyle(
              color: effectiveItemColor,
              fontSize: effectiveFontSize,
              fontWeight: effectiveFontWeight,
            ),
          ),
        );
      }).toList(),
      selectedItemBuilder: (BuildContext context) {
        return items.map((T value) {
          return Text(
            value.toString(),
            style: TextStyle(
              color: effectiveTextColor,
              fontSize: effectiveFontSize,
              fontWeight: effectiveFontWeight,
            ),
          );
        }).toList();
      },
      onChanged: onChanged,
      dropdownColor: effectiveDropdownColor,
      icon: Icon(
        Icons.keyboard_arrow_down_rounded,
        size: AppSize.width(value: 18),
        color: AppColor.white.withValues(alpha: 0.6),
      ),
    );
  }
}
