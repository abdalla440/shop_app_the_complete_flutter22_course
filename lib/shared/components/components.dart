import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => widget),
    );
void replaceTo(context, widget) => Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => widget),
      (route) => false,
    );

Widget logoText() => Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image(
          width: 100,
          height: 100,
          image: AssetImage(
            'assets/images/hicon.png',
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(
          'H Store',
          style: GoogleFonts.varelaRound(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.w500,
          ),
        )
      ],
    );

Widget defaultFormField({
  @required TextEditingController? controller,
  TextInputType? type,
  @required String? label,
  @required IconData? prefix,
  @required String? Function(String?)? validator,
  bool isPassword = false,
  bool isClickable = true,
  bool isReadOnly = false,
  IconData? suffixIcon,
  void Function()? suffixOnPress,
  void Function(String)? onSubmit,
  void Function(String)? onChange,
  void Function()? onTap,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      onFieldSubmitted: onSubmit,
      onChanged: onChange,
      onTap: onTap,
      validator: validator,
      obscureText: isPassword,
      enabled: isClickable,
      readOnly: isReadOnly,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        labelText: label,
        prefixIcon: Icon(prefix),
        suffixIcon:
            IconButton(onPressed: suffixOnPress, icon: Icon(suffixIcon)),
      ),
    );

Widget defaultMaterialButton({
  required double? height,
  required double? width,
  required double borderRadius,
  Color? color,
  required void onPressed,
  required String text,
  var style,
}) =>
    Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        color: color,
      ),
      child: MaterialButton(
        onPressed: () {
          onPressed;
        },
        child: Text(
          '$text',
          style: style,
        ),
      ),
    );