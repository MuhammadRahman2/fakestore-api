import 'package:flutter/material.dart';

class ContainerButton extends StatelessWidget {
  final double? width;
  final double? height;
  final String? title;
  final VoidCallback? onTap;
  
  const ContainerButton(
      {super.key, this.height = 50, 
      this.width = double.infinity, 
      this.title,
      this.onTap,
      });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: width!,
        height: height!,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          title!,
          style:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
