import 'package:flutter/material.dart';

class InputString extends StatelessWidget {
  final String? hintText;
  final String? labelText;
  final String? helperText;
  final IconData? icon;
  final IconData? suffixIcon;
  final String? msjValidacion;

  final bool obscureText;
  final bool requerido;

  final String formProperty;
  final Map<String, Object> formValues;

  const InputString(
      {Key? key,
      this.hintText,
      this.labelText,
      this.helperText,
      this.icon,
      this.suffixIcon,
      this.msjValidacion,
      required this.obscureText,
      required this.formProperty,
      required this.formValues,
      required this.requerido})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextFormField(
          autofocus: false,
          autocorrect: false,
          initialValue: '',
          textCapitalization: TextCapitalization.none,
          obscureText: obscureText,
          onChanged: (value) => formValues[formProperty] = value,
          validator: (value) {
            if (value == null && requerido) return msjValidacion ?? '';
            return (((value != null) ? value.length : 0) < 1 && requerido)
                ? msjValidacion
                : null;
          },
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.justify,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
            labelStyle: const TextStyle(
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
            labelText: labelText,
            helperText: helperText,
            prefixIcon: icon == null
                ? null
                : Icon(
                    icon,
                    color: Colors.white,
                  ),
            // prefixIcon: Icon( Icons.verified_user_outlined ),
            suffixIcon: suffixIcon == null
                ? null
                : Icon(suffixIcon, color: Colors.white),
          )),
    );
  }
}
