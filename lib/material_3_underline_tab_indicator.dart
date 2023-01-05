import 'package:flutter/material.dart';

/// Used with [TabBar.indicator] to draw a horizontal line below the
/// selected tab.
///
/// The selected tab underline is inset from the tab's boundary by [insets].
/// The [borderSide] defines the line's color and weight.
///
/// The [TabBar.indicatorSize] property can be used to define the indicator's
/// bounds in terms of its (centered) widget with [TabBarIndicatorSize.label],
/// or the entire tab with [TabBarIndicatorSize.tab].
class Mat3UnderlineTabIndicator extends Decoration {
  /// Creates an underline tab indicator with the given border side and insets.
  ///
  /// The [borderSide] argument must not be null. The [insets] argument defaults
  /// to [EdgeInsets.zero]. The [borderRadius] argument specifies the radius of
  /// the rounded corners of the underline and defaults to 5.
  const Mat3UnderlineTabIndicator({
    this.borderSide = const BorderSide(width: 3.0, color: Colors.white),
    this.borderRadius = 5,
    this.insets = EdgeInsets.zero,
  })  : assert(borderRadius != null),
        assert(borderSide != null),
        assert(insets != null);

  /// The color and weight of the horizontal line drawn below the selected tab.
  final BorderSide borderSide;

  /// The radius of the rounded corners of the underline.
  final double borderRadius;

  /// Locates the selected tab's underline relative to the tab's boundary.
  ///
  /// The [TabBar.indicatorSize] property can be used to define the tab
  /// indicator's bounds in terms of its (centered) tab widget with
  /// [TabBarIndicatorSize.label], or the entire tab with
  /// [TabBarIndicatorSize.tab].
  final EdgeInsetsGeometry insets;

  @override
  Decoration? lerpFrom(Decoration? a, double t) {
    if (a is Mat3UnderlineTabIndicator) {
      return Mat3UnderlineTabIndicator(
        borderSide: BorderSide.lerp(a.borderSide, borderSide, t),
        insets: EdgeInsetsGeometry.lerp(a.insets, insets, t)!,
      );
    }
    return super.lerpFrom(a, t);
  }

  @override
  Decoration? lerpTo(Decoration? b, double t) {
    if (b is Mat3UnderlineTabIndicator) {
      return Mat3UnderlineTabIndicator(
        borderSide: BorderSide.lerp(borderSide, b.borderSide, t),
        insets: EdgeInsetsGeometry.lerp(insets, b.insets, t)!,
      );
    }
    return super.lerpTo(b, t);
  }

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _Mat3UnderlinePainter(this, onChanged);
  }

  RRect _indicatorRRectFor(Rect rect, TextDirection textDirection) {
    assert(rect != null);
    assert(textDirection != null);
    final Rect indicator = insets
        .resolve(textDirection)
        .deflateRect(rect)
        .deflate(borderSide.width / 2.0);
    return RRect.fromRectAndCorners(
      Rect.fromLTWH(
        indicator.left,
        indicator.bottom - borderSide.width,
        indicator.width,
        borderSide.width,
      ),
      topLeft: Radius.circular(borderRadius),
      topRight: Radius.circular(borderRadius),
    );
  }
}

class _Mat3UnderlinePainter extends BoxPainter {
  _Mat3UnderlinePainter(this.decoration, VoidCallback? onChanged)
      : assert(decoration != null),
        super(onChanged);

  final Mat3UnderlineTabIndicator decoration;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    assert(configuration != null);
    assert(configuration.size != null);
    final Rect rect = offset & configuration.size!;
    final TextDirection textDirection = configuration.textDirection!;
    final RRect indicatorRRect =
        decoration._indicatorRRectFor(rect, textDirection);
    final Paint paint = decoration.borderSide.toPaint()
      ..strokeCap = StrokeCap.round;
    canvas.drawRRect(indicatorRRect, paint);
  }
}
