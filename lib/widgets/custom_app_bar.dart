import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.title, required this.icon, this.onPressed});
  final String title;
  final IconData icon;
final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title, style: TextStyle(fontSize: 30)),
        Spacer(),
        CustomSearchIcon(onPressed: onPressed,icon: icon),
      ],
    );
  }
}
//CustomSearchIcon--------------------------------------------------CustomSearchIcon//

class CustomSearchIcon extends StatelessWidget {
   CustomSearchIcon({super.key, required this.icon,this.onPressed});
  final IconData icon;
 final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: 45,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(.1),
        borderRadius: BorderRadius.circular(16),
      ),
      child:IconButton(onPressed: onPressed, icon: Icon(icon, size: 28))
    );
  }
}
// Center(child: Icon(icon, size: 28)),