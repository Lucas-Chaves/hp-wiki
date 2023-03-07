import 'package:flutter/material.dart';

class DefaultLoadingHouses extends StatefulWidget {
  const DefaultLoadingHouses({super.key, this.width, this.height});

  final double? width;
  final double? height;

  @override
  State<DefaultLoadingHouses> createState() => _DefaultLoadingHousesState();
}

class _DefaultLoadingHousesState extends State<DefaultLoadingHouses>
    with TickerProviderStateMixin {
  late AnimationController controllerAnimation;

  @override
  void dispose() {
    controllerAnimation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controllerAnimation = AnimationController(
      duration: const Duration(milliseconds: 1800),
      vsync: this,
    );

    return Image.asset(
      'assets/logo/houses.png',
      width: widget.width ?? 200,
      height: widget.height ?? 200,
      opacity: controllerAnimation..repeat(),
    );
  }
}
