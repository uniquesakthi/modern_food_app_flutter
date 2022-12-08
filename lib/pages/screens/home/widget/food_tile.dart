import 'package:flutter/material.dart';
import 'package:food_app_ui/constants/size_config.dart';

class FoodTile extends StatefulWidget {
  final String? img, name, offer;
  final Color? color;
  final bool? isOffer;

  const FoodTile({
    super.key,
    required this.img,
    required this.name,
    required this.offer,
    required this.color,
    required this.isOffer,
  });

  @override
  State<FoodTile> createState() => _FoodTileState();
}

class _FoodTileState extends State<FoodTile> with TickerProviderStateMixin {
  bool? isoffer;
  AnimationController? _animationController;
  Animation<double>? scaleAnimation;

  @override
  void initState() {
    isoffer = widget.isOffer;
    _animationController = AnimationController(
        vsync: this,
        duration: const Duration(
          seconds: 2,
        ));
    scaleAnimation = CurvedAnimation(
        parent: _animationController!,
        curve: const Interval(
          0.1,
          0.4,
          curve: Curves.elasticInOut,
        ));
    _animationController!.forward();
    super.initState();
  }

  @override
  void dispose() {
    _animationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: SizeConfig.screenWidth! * 0.25,
        decoration: BoxDecoration(
          color: widget.color,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            isoffer == true
                ? Positioned(
                    right: -10,
                    top: -10,
                    child: ScaleTransition(
                      scale: scaleAnimation!,
                      child: Container(
                        alignment: Alignment.center,
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(30)),
                        child: Text(
                          '${widget.offer!}%',
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  )
                : const SizedBox(),
            Positioned(
              left: 10,
              top: 15,
              child: Text(
                widget.name!,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
            Stack(
              children: [
                Positioned(
                  bottom: 0,
                  left: 5,
                  child: ScaleTransition(
                    scale: scaleAnimation!,
                    child: Image.asset(
                      widget.img!,
                      width: SizeConfig.screenWidth! * 0.4,
                      height: SizeConfig.screenWidth! * 0.3,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
