import 'package:flutter/material.dart';

class SliderWidget extends StatefulWidget {
  final String title;
  final double? titleWidth;
  final double max;
  final double min;
  final ValueNotifier<double>? controller;
  final double? indent;
  final int? divisions;
  final Function(double) onChanged;

  const SliderWidget({
    Key? key,
    required this.title,
    this.titleWidth = 80,
    this.max = 100,
    this.min = 10,
    this.controller,
    this.divisions,
    this.indent = 0,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<SliderWidget> createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  late ValueNotifier<double> controller;
  late double value;

  @override
  void initState() {
    controller = widget.controller ?? ValueNotifier<double>(widget.max / 2);
    value = controller.value;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        SizedBox(width: widget.indent),
        Container(
          width: widget.titleWidth,
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Text(
            widget.title,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColorLight,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Text(
            value.toStringAsFixed(1),
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(fontWeight: FontWeight.w600),
          ),
        ),
        Expanded(
          child: SliderTheme(
            data: SliderTheme.of(context).copyWith(
              trackShape: const RoundedRectSliderTrackShape(),
              trackHeight: 4.0,
              thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 10.0),
              overlayShape: const RoundSliderOverlayShape(overlayRadius: 20.0),
              tickMarkShape: const RoundSliderTickMarkShape(),
              valueIndicatorShape: const PaddleSliderValueIndicatorShape(),
              valueIndicatorTextStyle: const TextStyle(color: Colors.white),
            ),
            child: Slider(
              value: value,
              min: widget.min,
              max: widget.max,
              divisions: widget.divisions,
              onChanged: (v) {
                setState(() {
                  value = v;
                  controller.value = v;
                });
                widget.onChanged(v);
              },
              label: '$value',
            ),
          ),
        ),
      ],
    );
  }
}
