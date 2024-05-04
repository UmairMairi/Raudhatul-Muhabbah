import 'package:flutter/material.dart';
import 'package:raudhatul_muhabbah/utils/colors.dart';
import 'package:raudhatul_muhabbah/utils/my_styles.dart';


class MyTextInputField extends StatefulWidget {
  final bool isLabelRequired;
  final bool isObscure;
  final String? title;
  final TextInputType keyboardType;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Function(String?)? onChange;
  final bool? isEnabled;
  final bool showBorder;
  final bool? expand;
  final int? lines;
  final String? hintText;
  final TextStyle? labelStyle;
  final TextStyle? hintStyle;
  final String? image;
  final Function? onTap;
  final TextCapitalization textCapitalization;
  final BorderRadius? borderRadius;
  final Widget? suffix;
  final bool? readOnly;
  final double? textHeight;

  const MyTextInputField(
      {Key? key,
        this.image,
        this.isLabelRequired = false,
        this.isObscure = false,
        this.title,
        this.keyboardType = TextInputType.text,
        this.lines  = 1,
        this.isEnabled,
        this.showBorder = true,
        this.expand,
        this.controller,
        this.validator,
        this.labelStyle,
        this.onChange,
        this.hintText,
        this.onTap,
        this.borderRadius,
        this.suffix,
        this.readOnly,
        this.textHeight,
        this.textCapitalization = TextCapitalization.none,
        this.hintStyle})
      : super(key: key);

  @override
  _MyTextInputFieldState createState() => _MyTextInputFieldState();
}

class _MyTextInputFieldState extends State<MyTextInputField> {
  bool _isPasswordVisible = false;

  @override
  void initState() {
    super.initState();
    _isPasswordVisible = widget.isObscure;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Visibility(
          visible: widget.isLabelRequired,
          child: Padding(
            // padding: const EdgeInsets.symmetric(horizontal: 5.0),
            padding: EdgeInsets.zero,
            child: Column(
              children: [
                Text(
                  widget.title ?? "",
                  textAlign: TextAlign.start,
                  style: widget.labelStyle ?? MyTextStyle.textFieldLabelStyle,
                ),
                const SizedBox(
                  height: 5,
                ),
              ],
            ),
          ),
        ),
        TextFormField(
          textAlign: TextAlign.start,
          keyboardType: widget.keyboardType,
          controller: widget.controller,
          // expands: widget.expand ?? false,
          validator: widget.validator,
          enabled: widget.isEnabled,
          maxLines: widget.isObscure ? 1 : widget.lines,
          readOnly: widget.readOnly ?? false,
          scrollPadding: EdgeInsets.zero,
          decoration: InputDecoration(
              hintText: widget.hintText,
              suffix: widget.suffix,
              hintStyle: widget.hintStyle ?? MyTextStyle.textFieldHintTextStyle,
              contentPadding:
              const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
              fillColor: MyColors.whiteColor,
              border: (widget.isEnabled != null || widget.isEnabled == false)
                  ? InputBorder.none
                  : widget.showBorder
                  ? OutlineInputBorder(
                borderRadius: widget.borderRadius ?? BorderRadius.circular(5.0),
                borderSide: const BorderSide(
                  color: MyColors.colorBlue,
                  width: 1.0,
                ),
              )
                  : InputBorder.none,
              focusedBorder:
              (widget.isEnabled != null || widget.isEnabled == false)
                  ? InputBorder.none
                  : widget.showBorder
                  ? OutlineInputBorder(
                borderRadius: widget.borderRadius ?? BorderRadius.circular(5.0),
                borderSide: const BorderSide(
                    color: MyColors.colorBlue, width: 1.0),
              )
                  : InputBorder.none,
              suffixIcon: widget.image != null
                  ? Image.asset(
                widget.image!,
                width: 40,
                height: 40,
                fit: BoxFit.cover,
              )
                  : widget.isObscure
                  ? IconButton(
                icon: Icon(
                  // Based on passwordVisible state choose the icon
                  _isPasswordVisible
                      ? Icons.visibility
                      : Icons.visibility_off,
                  color: MyColors.greyAccent,
                ),
                onPressed: () {
                  setState(() {
                    _isPasswordVisible = !_isPasswordVisible;
                  });
                },
              )
                  : null),
          style: MyTextStyle.textFieldTextStyle,
          obscureText: _isPasswordVisible,
          onChanged: widget.onChange,
          textCapitalization: widget.textCapitalization,
          onTap: (widget.onTap != null)
              ? () {
            widget.onTap!();
            // focusNode.removeListener(_onFocusChange);
            // focusNode.dispose();
          }
              : null,
        )
      ],
    );
  }
}