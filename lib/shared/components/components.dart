import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
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

Widget bigLogo() => Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Image(
          width: 100,
          height: 100,
          image: AssetImage(
            'assets/images/hicon.png',
          ),
        ),
        const SizedBox(
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
Widget nanoLogo() => Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    const Image(
      width: 25,
      height: 25,
      image: AssetImage(
        'assets/images/hicon.png',
      ),
    ),
    const SizedBox(
      width: 5.0,
    ),
    Text(
      'Store',
      style: GoogleFonts.varelaRound(
        color: Colors.white,
        fontSize: 32,
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
  required var onPressed,
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
        onPressed: onPressed,
        child: Text(
          '$text',
          style: style,
        ),
      ),
    );

void showToast({
  required String message,
  required ToastStates state,
}) =>
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,
        backgroundColor: getToastColor(state),
        textColor: Colors.white,
        fontSize: 16.0);

enum ToastStates { success, error, warning }

Color getToastColor(ToastStates state) {
  Color toastColor;
  switch (state) {
    case ToastStates.success:
      toastColor = Colors.green;
      break;
    case ToastStates.error:
      toastColor = Colors.red;
      break;
    case ToastStates.warning:
      toastColor = Colors.amber;
      break;
  }
  return toastColor;
}
