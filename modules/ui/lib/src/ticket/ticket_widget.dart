import 'package:flutter/material.dart';

class TicketModel {
  final Widget top;
  final Widget bottom;
  final double bottomSizeWidget;
  final Color bottomColor;

  const TicketModel({
    required this.top,
    required this.bottom,
    required this.bottomSizeWidget,
    required this.bottomColor,
  });
}

class TicketWidget extends StatelessWidget {
  final TicketModel ticketModel;

  const TicketWidget({
    Key? key,
    required this.ticketModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ATicketWidget(
      top: ticketModel.top,
      bottomSizeWidget: ticketModel.bottomSizeWidget,
      bottom: SizedBox(
        width: ticketModel.bottomSizeWidget,
        height: ticketModel.bottomSizeWidget,
        child: ticketModel.bottom,
      ),
      bottomColor: ticketModel.bottomColor,
    );
  }
}

abstract class TicketScreen extends StatelessWidget {
  final Widget top;
  final Widget bottom;
  final double bottomSizeWidget;
  final Color bottomColor;

  const TicketScreen({
    Key? key,
    required this.top,
    required this.bottom,
    required this.bottomSizeWidget,
    this.bottomColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ATicketWidget(
      top: top,
      bottomSizeWidget: bottomSizeWidget,
      bottom: SizedBox(
        height: bottomSizeWidget,
        child: bottom,
      ),
      bottomColor: bottomColor,
    );
  }
}

class ATicketWidget extends StatefulWidget {
  final double punchRadius;
  final double borderRadius;
  final Widget top;
  final Widget bottom;
  final Color color;
  final bool isCornerRounded;
  final double bottomSizeWidget;
  final Color bottomColor;

  const ATicketWidget({
    Key? key,
    required this.top,
    required this.bottom,
    this.borderRadius = 10,
    this.punchRadius = 10,
    this.color = Colors.white,
    this.isCornerRounded = false,
    required this.bottomSizeWidget,
    required this.bottomColor,
  }) : super(key: key);

  @override
  State<ATicketWidget> createState() => _TicketWidgetState();
}

class _TicketWidgetState extends State<ATicketWidget> {
  final paddingVertical = 15.0;

  @override
  Widget build(BuildContext context) {
    final topHight = MediaQuery.of(context).size.height -
        widget.bottomSizeWidget -
        paddingVertical * 2 -
        1;

    return Material(
      color: Colors.black,
      child: Stack(
        children: [
          Column(
            children: <Widget>[
              ClipPath(
                clipper: TicketClipper(widget.punchRadius),
                child: Column(
                  children: <Widget>[
                    Container(
                      width: double.infinity,
                      height: topHight,
                      decoration: BoxDecoration(
                        color: widget.color,
                        borderRadius:
                            BorderRadius.circular(widget.borderRadius),
                      ),
                      child: widget.top,
                    ),
                  ],
                ),
              ),
              ClipPath(
                clipper: TicketClipperBottom(widget.punchRadius),
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(paddingVertical),
                  decoration: BoxDecoration(
                    color: widget.bottomColor,
                    borderRadius: BorderRadius.circular(widget.borderRadius),
                  ),
                  child: widget.bottom,
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(
                  bottom: widget.bottomSizeWidget +
                      -widget.punchRadius / 2 +
                      paddingVertical * 2 +
                      3),
              child: const Dash(width: 8, height: 4, color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}

class TicketClipper extends CustomClipper<Path> {
  final double punchRadius;

  const TicketClipper(this.punchRadius);

  @override
  Path getClip(Size size) {
    final path = Path();

    path.lineTo(0.0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.0);

    path.addOval(
        Rect.fromCircle(center: Offset(0.0, size.height), radius: punchRadius));
    path.addOval(Rect.fromCircle(
        center: Offset(size.width, size.height), radius: punchRadius));

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

class TicketClipperBottom extends CustomClipper<Path> {
  final double punchRadius;

  const TicketClipperBottom(this.punchRadius);

  @override
  Path getClip(Size size) {
    final path = Path();

    path.lineTo(0.0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.0);

    path.addOval(
        Rect.fromCircle(center: const Offset(0.0, 0), radius: punchRadius));
    path.addOval(
        Rect.fromCircle(center: Offset(size.width, 0), radius: punchRadius));

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

class Dash extends StatelessWidget {
  final double height;
  final double width;
  final Color color;

  const Dash({
    Key? key,
    this.height = 1,
    this.width = 3,
    this.color = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final boxWidth = constraints.constrainWidth();
        final dashWidth = width;
        final dashHeight = height;
        final dashCount = (boxWidth / (2 * dashWidth)).floor();
        return Flex(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: Axis.horizontal,
          children: List.generate(
            dashCount,
            (_) {
              return SizedBox(
                width: dashWidth,
                height: dashHeight,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(dashHeight / 2),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
