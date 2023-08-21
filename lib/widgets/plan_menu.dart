import 'package:flutter/material.dart';

class PlanMenu extends StatelessWidget {
  final Function tapHandler;
  final String title;
  final String imagePath;

  const PlanMenu({
    super.key,
    required this.title,
    required this.imagePath,
    required this.tapHandler,
  });


  @override
  Widget build(BuildContext context) {
    // final local = AppLocalizations.of(context)!;
    return GestureDetector(
      onTap: () => tapHandler(title),
      child: SizedBox(
        height: 180,
        width: 240,
        child: Card(
          elevation: 2,
          color: Colors.lightGreen,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Column(
            children: [
              SizedBox(
                height: 130,
                width: double.infinity,
                child: Image.asset(imagePath, fit: BoxFit.fill,),
              ),
              Container(
                margin: const EdgeInsets.only(top: 8),
                child: Text(title,
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    // fontWeight: FontWeight.bold
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
