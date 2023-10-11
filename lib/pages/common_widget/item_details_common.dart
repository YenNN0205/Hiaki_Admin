
import 'package:flutter/material.dart';

class ItemDetailCommon extends StatefulWidget {
  final String tittle;
  final String description;
  final Color colorBorder;
  final Function() onTap;

  const ItemDetailCommon({super.key, required this.tittle,this.colorBorder = Colors.white, required this.description, required this.onTap});
  @override
  State<ItemDetailCommon> createState() => _ItemDetailCommonState();
}

class _ItemDetailCommonState extends State<ItemDetailCommon> {
  @override
  Widget build(BuildContext context) {

    final double maxHeight = MediaQuery.of(context).size.height;
    final double maxWidth = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: GestureDetector(
          onTap:(){widget.onTap.call();},
          child: Container(
            height: maxHeight*0.09,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    stops:  [0.015, 0.02],
                    // colors: [Colors.red, Colors.white]
                    colors: [widget.colorBorder, Colors.white],
                ),
                borderRadius: BorderRadius.all(Radius.circular(12.0))
            ),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      widget.tittle,
                      style: const TextStyle(
                        color:Color(0xFF666666) ,
                        fontWeight: FontWeight.w500,
                        fontFamily: "SF Pro Display",
                        fontSize: 17.0,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          widget.description,
                          style: const TextStyle( fontWeight: FontWeight.w400,
                              fontFamily: "SF Pro Display",
                              fontSize: 16.0,color: Color(0xFF8A8A8F)
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ) ,
          ),
        ),
      ),
    );
  }
}
