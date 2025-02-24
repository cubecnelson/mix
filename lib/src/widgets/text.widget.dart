import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mix/src/helpers/extensions.dart';
import 'package:mix/src/widgets/nothing.widget.dart';

import '../mixer/mix_factory.dart';
import '../mixer/mixer.dart';
import 'mix.widget.dart';

class TextMix extends MixWidget {
  const TextMix({
    Mix? mix,
    Key? key,
    required this.text,
  }) : super(mix, key: key);

  final String text;
  @override
  Widget build(BuildContext context) {
    return _TextMixerWidget(
      mix.createContext(context),
      text: text,
    );
  }
}

class _TextMixerWidget extends MixerWidget {
  const _TextMixerWidget(
    MixContext mixer, {
    Key? key,
    required this.text,
  }) : super(mixer, key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    if (!sharedMixer.visible) {
      return const Empty();
    }
    final content = textMixer.applyTextDirectives(text);

    if (sharedMixer.animated) {
      return AnimatedDefaultTextStyle(
        child: Text(
          content,
          textDirection: sharedMixer.textDirection,
          textWidthBasis: textMixer.textWidthBasis,
          textScaleFactor: textMixer.textScaleFactor,
          locale: textMixer.locale,
          maxLines: textMixer.maxLines,
          overflow: textMixer.overflow,
          softWrap: textMixer.softWrap,
          strutStyle: textMixer.strutStyle,
          style: textMixer.style,
          textAlign: textMixer.textAlign,
          textHeightBehavior: textMixer.textHeightBehavior,
        ),
        style: textMixer.style ?? context.defaultTextStyle(),
        duration: sharedMixer.animationDuration,
        curve: sharedMixer.animationCurve,
        softWrap: textMixer.softWrap,
        overflow: textMixer.overflow,
        textAlign: textMixer.textAlign,
        maxLines: textMixer.maxLines,
      );
    } else {
      return Text(
        content,
        softWrap: textMixer.softWrap,
        textDirection: sharedMixer.textDirection,
        textWidthBasis: textMixer.textWidthBasis,
        textAlign: textMixer.textAlign,
        overflow: textMixer.overflow,
        maxLines: textMixer.maxLines,
        textScaleFactor: textMixer.textScaleFactor,
        style: textMixer.style,
        locale: textMixer.locale,
        strutStyle: textMixer.strutStyle,
        textHeightBehavior: textMixer.textHeightBehavior,
      );
    }
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);

    properties.add(
      DiagnosticsProperty<bool>(
        'softWrap',
        textMixer.softWrap,
        defaultValue: true,
      ),
    );

    properties.add(
      DiagnosticsProperty<TextAlign>(
        'textAlign',
        textMixer.textAlign,
        defaultValue: null,
      ),
    );

    properties.add(
      DiagnosticsProperty<TextDirection>(
        'textDirection',
        sharedMixer.textDirection,
        defaultValue: null,
      ),
    );

    properties.add(
      DiagnosticsProperty<TextWidthBasis>(
        'textWidthBasis',
        textMixer.textWidthBasis,
        defaultValue: null,
      ),
    );

    properties.add(
      DiagnosticsProperty<double>(
        'textScaleFactor',
        textMixer.textScaleFactor,
        defaultValue: null,
      ),
    );

    properties.add(
      DiagnosticsProperty<Locale>(
        'locale',
        textMixer.locale,
        defaultValue: null,
      ),
    );

    properties.add(
      DiagnosticsProperty<StrutStyle>(
        'strutStyle',
        textMixer.strutStyle,
        defaultValue: null,
      ),
    );

    properties.add(
      DiagnosticsProperty<TextHeightBehavior>(
        'textHeightBehavior',
        textMixer.textHeightBehavior,
        defaultValue: null,
      ),
    );

    properties.add(
      DiagnosticsProperty<TextOverflow>(
        'overflow',
        textMixer.overflow,
        defaultValue: null,
      ),
    );

    properties.add(
      DiagnosticsProperty<int>(
        'maxLines',
        textMixer.maxLines,
        defaultValue: null,
      ),
    );

    properties.add(
      DiagnosticsProperty<double>(
        'textScaleFactor',
        textMixer.textScaleFactor,
        defaultValue: null,
      ),
    );

    properties.add(
      DiagnosticsProperty<TextStyle>(
        'style',
        textMixer.style,
        defaultValue: null,
      ),
    );

    properties.add(
      DiagnosticsProperty<String>(
        'text',
        text,
        defaultValue: null,
      ),
    );

    properties.add(
      DiagnosticsProperty<Duration>(
        'animationDuration',
        sharedMixer.animationDuration,
        defaultValue: null,
      ),
    );

    properties.add(
      DiagnosticsProperty<Curve>(
        'animationCurve',
        sharedMixer.animationCurve,
        defaultValue: null,
      ),
    );

    properties.add(
      DiagnosticsProperty<MixContext>(
        'mixer',
        mixContext,
        defaultValue: null,
      ),
    );

    properties.add(
      DiagnosticsProperty<bool>(
        'animated',
        sharedMixer.animated,
        defaultValue: false,
      ),
    );
  }
}
