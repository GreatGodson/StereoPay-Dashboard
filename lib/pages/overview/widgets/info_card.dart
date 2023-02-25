import 'package:flutter/material.dart';
import 'package:streopay_dashboard/constants/style.dart';

class InfoCard extends StatefulWidget {
  final String title;
  final String value;
  final Color? topColor;
  final bool isActive;
  final int index;
  final void Function()? onTap;

  const InfoCard(
      {Key? key,
      required this.title,
      required this.value,
      this.isActive = false,
      required this.onTap,
      this.topColor,
      required this.index})
      : super(key: key);

  @override
  State<InfoCard> createState() => _InfoCardState();
}

class _InfoCardState extends State<InfoCard> {
  final initialIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () {
          initialIndex == widget.index;
          setState(() {});

          print(widget.index);
        },
        child: Container(
          height: 136,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
                width: 2,
                color: widget.index == initialIndex
                    ? const Color(0XFF3751FF)
                    : AppColors.dividerColor),
            boxShadow: [
              BoxShadow(
                  offset: const Offset(0, 6),
                  color: lightGrey.withOpacity(.1),
                  blurRadius: 12)
            ],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            children: [
              // Row(
              //   children: [
              //     Expanded(
              //         child: Container(
              //       color: topColor ?? active,
              //       height: 5,
              //     ))
              //   ],
              // ),
              Expanded(child: Container()),
              RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(children: [
                    TextSpan(
                        text: "${widget.title}\n",
                        style: TextStyle(
                            fontSize: 16,
                            color: widget.isActive ? active : lightGrey)),
                    TextSpan(
                        text: "${widget.value}",
                        style: TextStyle(
                            fontSize: 40,
                            color: widget.isActive ? active : dark)),
                  ])),
              Expanded(child: Container()),
            ],
          ),
        ),
      ),
    );
  }
}
