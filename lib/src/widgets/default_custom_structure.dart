import 'package:flutter/material.dart';

class DefaultCustomStructure extends StatelessWidget {
  const DefaultCustomStructure({
    super.key,
    this.appBar,
    this.safeAreaBottom = false,
    this.background,
    required this.body,
  });

  final PreferredSizeWidget? appBar;
  final bool safeAreaBottom;
  final Widget body;
  final Color? background;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: WillPopScope(
        onWillPop: () async {
          return true;
        },
        child: Scaffold(
          appBar: appBar,
          backgroundColor: background,
          body: SafeArea(
            bottom: safeAreaBottom,
            child: body,
          ),
        ),
      ),
    );
  }
}
