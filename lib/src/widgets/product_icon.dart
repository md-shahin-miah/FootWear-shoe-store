import 'package:e_commerce_app_shoe/src/widgets/extentions.dart';
import 'package:flutter/material.dart';

import '../model/category.dart';
import '../themes/light_color.dart';
import '../themes/theme.dart';
import 'title_text.dart';


class ProductIcon extends StatelessWidget {
  // final String imagePath;
  // final String text;
  final ValueChanged<Category> onSelected;
  final Category model;
  ProductIcon({Key? key, required this.model, required this.onSelected}) : super(key: key);

  Widget build(BuildContext context) {
    return model.id == null
        ? Container(width: 5)
        : Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            child: Container(
              padding: AppTheme.hPadding,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                color: model.isSelected!
                    ? LightColor.background
                    : Colors.transparent,
                border: Border.all(
                  color: model.isSelected! ? LightColor.orange : LightColor.grey,
                  width: model.isSelected! ? 2 : 1,
                ),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: model.isSelected! ? Color(0xfffbf2ef) : Colors.white,
                    blurRadius: 10,
                    spreadRadius: 5,
                    offset: Offset(5, 5),
                  ),
                ],
              ),
              child: Row(
                children: <Widget>[
                  model.image != null ? Image.asset(model.image!,height: 30,width: 50,) : SizedBox(),
                  model.name == null
                      ? Container()
                      : Container(
                          child: TitleText(
                            text: model.name!,
                            fontWeight: FontWeight.w700,
                            fontSize: 15,
                          ),
                        )
                ],
              ),
            ).ripple(
              () {
                onSelected(model);
              },
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
          );
  }
}
