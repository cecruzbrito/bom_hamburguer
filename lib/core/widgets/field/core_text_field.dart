// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CoreTextField extends StatelessWidget {
  const CoreTextField({
    super.key,
    this.ctr,
    this.label,
    this.hint,
    this.suffix,
    this.prefix,
    this.hasObscureTxt = false,
    this.validator,
    this.type,
    this.minLines,
    this.onChangeTxt,
    this.onTapEnter,
  });
  final TextEditingController? ctr;
  final String? label;
  final String? hint;
  final Widget? suffix;
  final Widget? prefix;
  final bool hasObscureTxt;
  final String? Function(String?)? validator;
  final TextInputType? type;
  final int? minLines;
  final Function(String?)? onChangeTxt;
  final Function(String?)? onTapEnter;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: type,
      controller: ctr,
      validator: validator,
      obscureText: hasObscureTxt,
      onChanged: onChangeTxt,
      onFieldSubmitted: onTapEnter,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.0)),
        labelText: label,
        hintText: hint,
        suffixIcon: suffix,
        prefixIcon: prefix,
      ),
    );
  }
}
