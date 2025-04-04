import 'package:flutter/material.dart';

class MyListTile extends StatelessWidget{
  const MyListTile({
    super.key,
    required this.onTap,
    required this.text,
    required this.icon
    });

  final void Function()? onTap;
  final String text;
  final Widget icon;
  

  @override
  Widget build(BuildContext context) {
    return Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: ListTile(
              onTap: onTap,
              leading: icon,
              title: Text(text,
              style: TextStyle(
                fontSize: 18,
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.w700
              ),),
              horizontalTitleGap: 25.0,
            ),
          );
  }
}