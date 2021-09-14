import 'package:flutter/material.dart';
import 'package:coffee_and_code/Components/ContextExtension.dart';

class BottomSpecs extends StatelessWidget {
  final String title;
  final String subtitle;

  final IconData icon;

  const BottomSpecs({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mainTheme = Theme.of(context);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: context.height2 * 5,
          width: context.width2 * 10,
          decoration: new BoxDecoration(
            color: mainTheme.primaryColorLight,
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: Colors.white, size: context.height2 * 3),
        ),
        SizedBox(
          width: context.width2 * 2,
        ),
        Container(
          width: context.width2 * 30,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: mainTheme.primaryTextTheme.headline3,
              ),
              Container(
                width: context.width2 * 30,
                height: context.height2 * 10,
                child: Text(
                  subtitle,
                  style: mainTheme.primaryTextTheme.headline4,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
