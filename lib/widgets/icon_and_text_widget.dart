import 'package:flutter/cupertino.dart';
import 'package:flutter_app/widgets/dimensions.dart';
import 'package:flutter_app/widgets/small_text.dart';

class IconAndTextWidget extends StatelessWidget {
  final IconData icon;
  final String text;

  final Color iconColor;
  const IconAndTextWidget({Key? key,
    required this.icon,
    required this.text,

    required this.iconColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: iconColor,),
        // ignore: prefer_const_constructors
        SizedBox(width: Dimensions.width30,),
        SmallText(text: text,),
      ],
    );
  }
}
