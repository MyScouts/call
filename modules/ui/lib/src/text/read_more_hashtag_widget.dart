// ignore_for_file: constant_identifier_names, avoid_hard_coded_colors, avoid_hard_coded_text_style, avoid_nested_if_statements, no_leading_underscores_for_local_identifiers

import 'package:app_core/app_core.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

enum TrimModeRM { LENGTH, LINE }

enum DetectTextType { PHONE, HASHTAG, LINK, MENTION, TEXT }

typedef MentionItemAsString<T> = String Function(T item);

typedef CallbackDetectedText = void Function(DetectedText text);
typedef CallbackMention<T> = void Function(T? mention);

class ReadMoreHashtag<T> extends StatefulWidget {
  const ReadMoreHashtag({
    required this.data,
    super.key,
    this.dataStyle,
    this.moreStyle,
    this.lessStyle,
    this.expandedText = '...Show less',
    this.collapsedText = '...Read more',
    this.colorClickableText,
    this.trimLength = 120,
    this.trimLines = 1,
    this.trimMode = TrimModeRM.LINE,
    this.seeMore = false,
    this.textAlign = TextAlign.start,
    this.textScaleFactor = 1.0,
    this.textDirection = TextDirection.ltr,
    this.listMention,
    this.mentionItemAsString,
    this.onTapDetectedText,
    this.colorHighlightDetectedText = Colors.blue,
    this.onTapMention,
  });

  final String data;
  final TextStyle? dataStyle;

  /// TextStyle for expanded text
  final TextStyle? moreStyle;

  /// TextStyle for compressed text
  final TextStyle? lessStyle;

  /// Text for expanded text
  final String expandedText;

  /// Text for collapsed text
  final String collapsedText;

  /// color when clickable text
  final Color? colorClickableText;

  final int trimLength;
  final int trimLines;

  /// TrimMode length or lines
  final TrimModeRM trimMode;

  /// if true that init is enable expanded
  final bool seeMore;

  final TextAlign textAlign;

  final double textScaleFactor;

  final TextDirection textDirection;

  final List<T>? listMention;

  /// function that return the String value of an object
  final MentionItemAsString<T>? mentionItemAsString;

  /// Callback value when on tap detected text
  final CallbackDetectedText? onTapDetectedText;

  /// Callback value when on tap mention
  final CallbackMention<T>? onTapMention;

  final Color colorHighlightDetectedText;

  @override
  State<ReadMoreHashtag<T>> createState() => _ReadMoreHashtagState<T>();
}

class _ReadMoreHashtagState<T> extends State<ReadMoreHashtag<T>> {
  late TextSpan dataTextSpan;
  late TextSpan link;

  late TextPainter textPainter;

  late bool _seeMore;

  @override
  void initState() {
    super.initState();
    _seeMore = widget.seeMore;
  }

  @override
  Widget build(BuildContext context) {
    final DefaultTextStyle defaultTextStyle = DefaultTextStyle.of(context);

    final defaultStyle = defaultTextStyle.style;
    final dataStyle = widget.dataStyle ?? defaultStyle;
    final moreStyle =
        widget.moreStyle ?? defaultStyle.copyWith(color: Colors.blue);
    final lessStyle =
        widget.lessStyle ?? defaultStyle.copyWith(color: Colors.blue);

    link = TextSpan(
      text: _seeMore ? widget.collapsedText : widget.expandedText,
      style: _seeMore ? moreStyle : lessStyle,
      recognizer: TapGestureRecognizer()..onTap = _onTap,
    );

    return LayoutBuilder(
      builder: (context, constraints) {
        final minWidth = constraints.minWidth;
        final maxWidth = constraints.maxWidth;

        dataTextSpan = TextSpan(
          text: widget.data,
          style: dataStyle,
        );

        textPainter = TextPainter(
          textAlign: widget.textAlign,
          textDirection: TextDirection.ltr,
          textScaleFactor: widget.textScaleFactor,
          maxLines: widget.trimLines,
        );

        textPainter.text = link;
        textPainter.layout(minWidth: 0, maxWidth: maxWidth);
        final linkSize = textPainter.size;

        textPainter.text = dataTextSpan;
        textPainter.layout(minWidth: minWidth, maxWidth: maxWidth);
        final dataTextSize = textPainter.size;

        int endIndex;
        bool linkLongerThanLine = false;

        if (linkSize.width < maxWidth) {
          final pos = textPainter.getPositionForOffset(Offset(
            widget.textDirection == TextDirection.rtl
                ? linkSize.width
                : dataTextSize.width - linkSize.width,
            dataTextSize.height,
          ));

          endIndex = textPainter.getOffsetBefore(pos.offset - 5) ?? 0;
        } else {
          // set offset = 0
          final pos = textPainter.getPositionForOffset(
            dataTextSize.bottomLeft(Offset.zero),
          );
          endIndex = pos.offset;
          linkLongerThanLine = true;
        }

        bool isShowLink = false;
        switch (widget.trimMode) {
          case TrimModeRM.LENGTH:
            if (widget.trimLength < widget.data.length) {
              dataTextSpan = TextSpan(
                style: dataStyle,
                text: _seeMore
                    ? widget.data.substring(0, widget.trimLength)
                    : widget.data,
              );
              isShowLink = true;
            } else {
              dataTextSpan = TextSpan(style: dataStyle, text: widget.data);
            }
            break;
          case TrimModeRM.LINE:
            if (textPainter.didExceedMaxLines) {
              dataTextSpan = TextSpan(
                style: dataStyle,
                text: _seeMore
                    ? widget.data.substring(0, endIndex) +
                        (linkLongerThanLine ? '\n' : '')
                    : widget.data,
              );
              isShowLink = true;
            } else {
              dataTextSpan = TextSpan(
                text: widget.data,
                style: widget.dataStyle,
              );
            }
            break;
        }

        return GestureDetector(
          onTap: _onTap,
          child: Text.rich(
            TextSpan(
              children: <TextSpan>[
                TextSpan(
                  style: dataTextSpan.style,
                  children: _convertDetectedText(dataTextSpan.text!),
                ),
                if (isShowLink) link,
              ],
            ),
          ),
        );
      },
    );
  }

  void _onTap() {
    setState(() {
      _seeMore = !_seeMore;
    });
  }

  List<TextSpan> _convertDetectedText(String text) {
    final List<String> parts = text.split('\n');
    List<String> finalParts = [];
    for (int i = 0; i < parts.length; i++) {
      if (i != 0) {
        finalParts
            .add('\n'); 
      }
      finalParts.addAll(parts[i].split('\n'));
    }
    
    List<String> split = [];
    for (final part in finalParts) {
      split.addAll(part.split(' '));
    }

    List<DetectedText> listDetectedText = split.fold([], (t, e) {
      final List<DetectedText> detects = [];

      if (e.startsWith('#') || e.startsWith('@')) {
        return List.of(t)
          ..addAll([
            ..._handleDetected(
                value: e,
                listDetected: detects,
                currentIndex: 0,
                maxLength: e.length),
            DetectedText.getText(' ')
          ]);
      }

      if (e.isEmpty) {
        return List.of(t)..add(DetectedText.getText(' '));
      }

      return List.of(t)
        ..addAll([DetectedText.getText(e), DetectedText.getText(' ')]);
    });

    final List<TextSpan> listTextSpan = [];

    listDetectedText = _handleHashtag(listDetectedText);

    listTextSpan.addAll(listDetectedText.map((DetectedText detectedText) {
      if (detectedText.isHighLight) {
        return TextSpan(
          text: detectedText.text,
          style: TextStyle(color: widget.colorHighlightDetectedText, fontWeight: FontWeight.w600),
          recognizer: TapGestureRecognizer()
            ..onTap = () => _onTapTextHighLight(detectedText),
        );
      }

      return TextSpan(text: detectedText.text);
    }).toList());

    return listTextSpan;
  }

  String _itemAsString(T? data) {
    if (data == null) {
      return '';
    }

    if (widget.mentionItemAsString != null) {
      return widget.mentionItemAsString!(data);
    }

    return data.toString();
  }

  int _indexMentionText(String val) {
    return widget.listMention!
        .indexWhere((element) => _itemAsString(element) == val.substring(1));
  }

  void _onTapTextHighLight(DetectedText detectedText) {
    if (detectedText.detectTextType == DetectTextType.MENTION &&
        widget.onTapMention != null) {
      final int index = _indexMentionText(detectedText.text);
      if (index != -1) {
        widget.onTapMention!(
            widget.listMention![_indexMentionText(detectedText.text)]);
      }
    }

    if (widget.onTapDetectedText != null) {
      widget.onTapDetectedText!(detectedText);
    }
  }

  bool _checkNotMention({
    required DetectTextType detectTextType,
    required String val,
  }) {
    return !(detectTextType == DetectTextType.MENTION &&
        _indexMentionText(val) == -1);
  }

  List<DetectedText> _handleDetected({
    required String value,
    required List<DetectedText> listDetected,
    required int currentIndex,
    required int maxLength,
  }) {
    if (currentIndex == maxLength) {
      return listDetected;
    }

    DetectTextType detectTextType;
    detectTextType =
        value.startsWith('#') ? DetectTextType.HASHTAG : DetectTextType.MENTION;

    if (value.length <= 1) {
      currentIndex += value.length;
      listDetected.add(DetectedText.getText(value));
    } else {
      final int index = value
          .substring(1, value.length)
          .split('')
          .indexWhere((element) => !element.hasAlphanumeric);
      if (index != -1) {
        final String val = value.substring(0, index + 1);

        if (val.length > 1) {
          listDetected.add(DetectedText(
            text: val,
            detectTextType: detectTextType,
            isHighLight:
                _checkNotMention(detectTextType: detectTextType, val: val),
          ));
          currentIndex += val.length;
          value = value.substring(val.length, value.length);
        } else {
          listDetected.add(DetectedText.getText(val));
          currentIndex += val.length;
          value = value.substring(val.length, value.length);
        }
      } else {
        bool isHighLight = true;

        if (value.length <= 1 ||
            (detectTextType == DetectTextType.MENTION &&
                _indexMentionText(value) == -1)) {
          isHighLight = false;
        }

        listDetected.add(DetectedText(
          text: value,
          detectTextType: detectTextType,
          isHighLight: isHighLight,
        ));
        currentIndex += value.length;

        listDetected.add(DetectedText.getText(' '));
      }
    }

    return _handleDetected(
      value: value,
      listDetected: listDetected,
      currentIndex: currentIndex,
      maxLength: maxLength,
    );
  }

  List<DetectedText> _handleHashtag(List<DetectedText> list) {
    int _hashTagExist({
      required DetectedText detect,
      required int indexDetect,
    }) {
      for (int index = 0; index < list.length; index++) {
        if (list[index].text == detect.text && indexDetect != index) {
          return index;
        }
      }

      return -1;
    }

    for (var index = 0; index < list.length; index++) {
      final detect = list[index];
      for (var indexDetect = 0; indexDetect < index; indexDetect++) {
        if (_hashTagExist(detect: detect, indexDetect: index) == indexDetect &&
            detect.isHighLight &&
            detect.detectTextType == DetectTextType.HASHTAG) {
          list[index] = detect.copyWith(isHighLight: false);
        }
      }
    }

    return list;
  }
}

class DetectedText {
  DetectedText({
    required this.text,
    required this.detectTextType,
    this.isHighLight = true,
  });

  final String text;
  final bool isHighLight;
  final DetectTextType detectTextType;

  static DetectedText getText(String text) {
    bool isHightLight = false;
    DetectTextType detectTextType = DetectTextType.TEXT;

    // if (ValidationUtils.isLink(text)) {
    //   isHightLight = true;
    //   detectTextType = DetectTextType.LINK;
    // }
    // if (ValidationUtils.isValidPhoneNumber(text)) {
    //   isHightLight = true;
    //   detectTextType = DetectTextType.PHONE;
    // }

    return DetectedText(
      text: text,
      isHighLight: isHightLight,
      detectTextType: detectTextType,
    );
  }

  @override
  String toString() =>
      'DetectedText(text: $text, isHighLight: $isHighLight, detectTextType: $detectTextType)';

  DetectedText copyWith({
    String? text,
    bool? isHighLight,
    DetectTextType? detectTextType,
  }) {
    return DetectedText(
      text: text ?? this.text,
      isHighLight: isHighLight ?? this.isHighLight,
      detectTextType: detectTextType ?? this.detectTextType,
    );
  }
}
