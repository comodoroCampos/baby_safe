import 'package:flutter/material.dart';

class InputStringRecepcion extends StatelessWidget {
  final String? hintText;
  final String? labelText;
  final String? helperText;
  final IconData? icon;
  final IconData? suffixIcon;
  final String? msjValidacion;
  final double? width;
  final int lineas;
  final bool obscureText;
  final bool requerido;
  final bool soloLectura;
  final String valorInicial;

  final String formProperty;
  final Map<String, Object> formValues;

  const InputStringRecepcion(
      {Key? key,
      this.hintText,
      this.labelText,
      this.helperText,
      this.icon,
      this.suffixIcon,
      this.msjValidacion,
      required this.obscureText,
      required this.valorInicial,
      required this.formProperty,
      required this.formValues,
      required this.requerido,
      this.width,
      required this.lineas,
      required this.soloLectura})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: TextFormField(
          maxLines: lineas,
          autofocus: false,
          autocorrect: false,
          initialValue: valorInicial,
          readOnly: soloLectura,
          textCapitalization: TextCapitalization.characters,
          obscureText: obscureText,
          onChanged: (value) => formValues[formProperty] = value,
          validator: (value) {
            if (value == null && requerido) return msjValidacion ?? '';
            return (((value != null) ? value.length : 3) < 1 && requerido)
                ? msjValidacion
                : null;
          },
          style: const TextStyle(
            fontWeight: FontWeight.w300,
          ),
          textAlign: TextAlign.justify,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(
              fontWeight: FontWeight.w200,
            ),
            labelStyle: const TextStyle(
              fontWeight: FontWeight.w300,
            ),
            labelText: labelText,
            helperText: helperText,

            prefixIcon: icon == null
                ? null
                : Icon(
                    icon,
                  ),
            // prefixIcon: Icon( Icons.verified_user_outlined ),
            suffixIcon: suffixIcon == null
                ? null
                : Icon(suffixIcon, color: Colors.white),
          )),
    );
  }
}
