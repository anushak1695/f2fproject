import 'package:flutter/material.dart';
import 'package:f2fproject/utils/constants.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final List<Widget>? actions;

  const CommonAppBar({Key? key, this.title, this.actions}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        onPressed: () => Navigator.of(context).maybePop(),
        icon: Icon(
          Icons.arrow_back_ios_new_rounded,
          color: CustomColors.kPrimaryBlue,
        ),
      ),
      title: title != null
          ? Text(title!, style: const TextStyle(color: Colors.black))
          : null,
      actions: actions,
      iconTheme: const IconThemeData(color: Colors.black),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class AdaptiveSize {
  static late double screenWidth;
  static late double screenHeight;
  static late double devicePixelRatio;
  static late double baseHeight;
  static late double baseWidth;

  /// Initialize the screen dimensions
  static void init(
    BuildContext context, {
    double baseHeightValue = 926.0,
    double baseWidthValue = 428.0,
  }) {
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    screenWidth = mediaQuery.size.width;
    screenHeight = mediaQuery.size.height;
    devicePixelRatio = mediaQuery.devicePixelRatio;
    baseHeight = baseHeightValue; // Default base height for scaling
    baseWidth = baseWidthValue;
  }

  static double h(double heightPx) {
    double scaleFactor = screenHeight / baseHeight;
    return heightPx * scaleFactor.clamp(0.8, 1.2); // Limit scaling
  }

  static double w(double widthPx) {
    double scaleFactor = screenWidth / baseWidth;
    return widthPx * scaleFactor.clamp(0.8, 1.2); // Limit scaling
  }

  static double sp(double fontSizePx) {
    double scaleFactor = screenHeight / baseHeight;
    return fontSizePx * scaleFactor.clamp(0.9, 1.1); // Avoid huge fonts
  }
}
