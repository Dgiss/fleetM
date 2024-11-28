import 'package:fleet_watcher_mobile/utils/constants/colors.dart';
import 'package:fleet_watcher_mobile/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class InputTextField extends StatelessWidget {
  const InputTextField({
    super.key,
    required this.hintText,
    required this.hintColor,
    required this.icon,
    required this.iconColor,
    required this.contentPading,
    this.obscurePass = false,
    this.isSuffix = false,
    this.onPressed,
    required this.controller,
    this.errorText,
  });

  final String hintText;
  final Color hintColor;
  final IconData icon;
  final Color iconColor;
  final double contentPading;
  final bool isSuffix;
  final bool obscurePass;
  final Function()? onPressed;
  final TextEditingController controller;
  final String? errorText;

  @override
  Widget build(BuildContext context) {
    const borderRadius =
        BorderRadius.all(Radius.circular(12.0)); // Define the border radius

    return TextFormField(
      controller: controller,
      obscureText: obscurePass,
      style: const TextStyle(color: MyColors.black, fontSize: FSizes.fonSizeLg),
      decoration: InputDecoration(
        fillColor: MyColors.gris,
        filled: true,
        hintText: hintText,
        hintStyle: TextStyle(color: hintColor),
        prefixIcon: Icon(
          icon,
          color: errorText?.isNotEmpty == true ? Colors.red : iconColor,
        ),
        suffixIcon: isSuffix
            ? IconButton(
                icon: Icon(
                  obscurePass ? Iconsax.eye : Iconsax.eye_slash,
                  color: errorText?.isNotEmpty == true
                      ? Colors.red
                      : MyColors.primary,
                ),
                onPressed: onPressed,
              )
            : null,
        contentPadding: EdgeInsets.symmetric(vertical: contentPading),
        errorText: errorText?.isNotEmpty == true ? '' : null,
        enabledBorder: const OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide: BorderSide(color: MyColors.primary, width: 1.0),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide: BorderSide(color: MyColors.primary, width: 1.0),
        ),
        errorBorder: errorText?.isNotEmpty == true
            ? const OutlineInputBorder(
                borderRadius: borderRadius,
                borderSide: BorderSide(color: Colors.red, width: 1.0),
              )
            : null,
        focusedErrorBorder: errorText?.isNotEmpty == true
            ? const OutlineInputBorder(
                borderRadius: borderRadius,
                borderSide: BorderSide(color: Colors.red, width: 1.0),
              )
            : null,
      ),
    );
  }
}
