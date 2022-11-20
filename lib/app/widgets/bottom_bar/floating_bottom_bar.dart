import 'package:flutter/material.dart';
import 'package:lecode_app/config/theme/styles/styles.dart';

import 'bottom_bar_controller.dart';
import 'bottom_item.dart';

class FloatingBottomBar extends StatefulWidget {
  const FloatingBottomBar({
    Key? key,
    required this.items,
    this.initialIndex = 0,
    this.controller,
    this.onItemSelected,
  }) : super(key: key);

  final List<BottomElevenItem> items;
  final BottomBarController? controller;
  final ValueChanged<int>? onItemSelected;
  final int initialIndex;

  @override
  State<FloatingBottomBar> createState() => _FloatingBottomBarState();
}

class _FloatingBottomBarState extends State<FloatingBottomBar> {
  late final BottomBarController controller;
  final Color mainColor = AppColors.secondary;
  final Color inactive = AppColors.white;

  @override
  void initState() {
    controller = widget.controller ?? BottomBarController(widget.initialIndex);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.transparent,
      elevation: 0,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: const EdgeInsets.only(
              left: 40,
              right: 40,
            ),
            height: 55,
            decoration: BoxDecoration(
              color: AppColors.blueBlack,
              borderRadius: BorderRadius.circular(12),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 30,
                  offset: Offset(0, 10),
                ),
              ],
            ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: widget.items.map((item) {
                  var index = widget.items.indexOf(item);
                  return Expanded(
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      onTap: () {
                        widget.onItemSelected?.call(index);

                        if (index == controller.index) return;
                        controller.changeIndex(index);
                      },
                      child: AnimatedBuilder(
                        animation: controller,
                        builder: (_, child) {
                          final item = widget.items[index];
                          final isCurrent = index == controller.index;

                          return Column(
                            // crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(
                                item.icon,
                                size: isCurrent ? 22 : 20,
                                color: isCurrent ? mainColor : inactive,
                              ),
                              const SizedBox(height: 5),
                              AnimatedContainer(
                                width: 6,
                                height: isCurrent ? 6 : 0,
                                duration: const Duration(milliseconds: 1500),
                                curve: Curves.fastLinearToSlowEaseIn,
                                margin:
                                    EdgeInsets.only(bottom: isCurrent ? 10 : 8),
                                decoration: BoxDecoration(
                                  color: mainColor,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              const SizedBox(height: 5),

                              // SizedBox(height: size.width * .03),
                            ],
                          );
                        },
                      ),
                    ),
                  );
                }).toList()),
          ),
        ],
      ),
    );
  }
}
