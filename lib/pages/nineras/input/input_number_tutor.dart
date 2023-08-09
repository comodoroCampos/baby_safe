import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputNumberNinera extends StatelessWidget {
  final String? hintText;
  final String? labelText;
  final String? helperText;
  final IconData? icon;
  final IconData? suffixIcon;
  final double? width;
  final bool decimales;
  final String? valorInicial;

  final String formProperty;
  final Map<String, Object> formValues;
  const InputNumberNinera(
      {Key? key,
      this.hintText,
      this.labelText,
      this.helperText,
      this.icon,
      this.suffixIcon,
      required this.formProperty,
      required this.formValues,
      this.width,
      required this.decimales,
      this.valorInicial})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final regex =
        (decimales) ? RegExp(r'^\d+\.?\d{0,2}') : RegExp(r'^([0-9])*');

    return SizedBox(
      width: width,
      child: TextFormField(
        obscureText: false,
        initialValue: valorInicial ?? '',
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        inputFormatters: [FilteringTextInputFormatter.allow(regex)],
        onChanged: (value) => formValues[formProperty] = value,
        validator: (value) {
          if (value == null) return 'Este campo es requerido';
          if (value == '') return 'Este campo es requerido';
          if (num.tryParse(value)! < 0) return 'Debe ser mayor a cero';
        },
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
          hintText: hintText,
          labelText: labelText,
          labelStyle: const TextStyle(
            fontWeight: FontWeight.w300,
          ),
          helperText: helperText,
          suffixIcon: suffixIcon == null ? null : Icon(suffixIcon),
          icon: icon == null ? null : Icon(icon),
        ),
      ),
    );
  }
}
