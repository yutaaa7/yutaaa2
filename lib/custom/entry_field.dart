import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EntryField extends StatelessWidget {
  final TextEditingController? controller;
  final String? label;
  final String? initialValue;
  final bool? readOnly;
  final TextInputType? keyboardType;
  final int? maxLength;
  final int? maxLines;
  final int? minLines;
  final String? hint;
  final Function? onSuffixPressed;
  final TextCapitalization? textCapitalization;
  final bool showUnderline;
  final IconData? prefixIcon;
  final Widget? suffixIcon;
  final TextStyle? style;
  ValueChanged? onChanged;
  List<TextInputFormatter>? inputFormatters;
  final
  bool obscureText;
  var onTap;
  EntryField({
    this.controller,
    this.onChanged,
    this.minLines,
    this.suffixIcon,
    this.label,
    this.initialValue,
    this.readOnly,
    this.keyboardType,
    this.maxLength,
    this.hint,
    this.maxLines,
    this.onSuffixPressed,
    this.textCapitalization,
    this.showUnderline = true,
    this.inputFormatters,
    this.obscureText = false,
    this.prefixIcon,
    this.style,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: label != null?16.0:5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          if (label != null) SizedBox(height: 12),
          if (label != null)
            Text(
              label!,
              style: Theme.of(context)
                  .textTheme
                  .labelLarge!
                  .copyWith(color: Theme.of(context).hintColor),
            ),
          if (label != null) SizedBox(height: 5),
          Row(
            children: [
              if (prefixIcon != null)
                Icon(
                  prefixIcon,
                  color: Theme.of(context).primaryColor,
                  size: 20,
                ),
              if (prefixIcon != null) SizedBox(width: 12),
              Expanded(
                child: Container(
                  height: 55,
                  child: TextFormField(
                    textAlignVertical: TextAlignVertical.center,
                    inputFormatters: inputFormatters!=null?inputFormatters:[],
                    style: style ??
                        Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(fontWeight: FontWeight.bold),
                    textCapitalization:
                    textCapitalization ?? TextCapitalization.sentences,
                    onTap: onTap,
                    obscureText: obscureText,
                    cursorColor: Theme.of(context).primaryColor,
                    autofocus: false,
                    controller: controller,
                    readOnly: readOnly ?? false,
                    onChanged: onChanged,
                    keyboardType: keyboardType,
                    minLines:minLines?? 1,
                    initialValue: initialValue,
                    maxLength: maxLength,
                    maxLines: maxLines ?? 1,
                    decoration: InputDecoration(
                      suffixIcon: suffixIcon,
                      filled: true,
                      fillColor: Colors.grey[200],
                      focusedBorder: showUnderline

                          ? OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context).primaryColor))
                          : InputBorder.none,
                      enabledBorder: showUnderline
                          ? OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context).dividerColor,
                              width: 0.5))
                          : InputBorder.none,
                      hintText: hint,
                      hintStyle: Theme.of(context).textTheme.subtitle1!.copyWith(
                          color: Theme.of(context).hintColor,
                          fontSize: 15,
                          fontWeight: FontWeight.w500),
                      counter: Offstage(),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}



