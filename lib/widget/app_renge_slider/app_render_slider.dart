import 'package:flutter/material.dart';
import 'package:tinnierenee12/const/app_color.dart';
import 'package:tinnierenee12/utils/app_size.dart';

class CustomProgressBarSlider extends StatefulWidget {
  final double minimumValue;
  final double maximumValue;
  final double value;
  final Function(double) onChanged;

  const CustomProgressBarSlider({
    super.key,
    this.minimumValue = 10,
    this.maximumValue = 100,
    required this.value,
    required this.onChanged,
  });

  @override
  State<CustomProgressBarSlider> createState() =>
      _CustomProgressBarSliderState();
}

class _CustomProgressBarSliderState extends State<CustomProgressBarSlider> {
  late double _currentValue;

  @override
  void initState() {
    super.initState();
    _currentValue = widget.value < widget.minimumValue
        ? widget.minimumValue
        : widget.value;
  }

  void _updateValueFromTap(Offset localPosition, double barWidth) {
    final dx = localPosition.dx.clamp(0, barWidth);
    final newValue = widget.minimumValue +
        (dx / barWidth * (widget.maximumValue - widget.minimumValue));

    setState(() {
      _currentValue = newValue;
    });
    widget.onChanged(_currentValue);
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final barWidth = screenWidth;

    return GestureDetector(
      // 🔹 Tap anywhere on bar to jump
      onTapDown: (details) {
        final box = context.findRenderObject() as RenderBox;
        final local = box.globalToLocal(details.globalPosition);
        _updateValueFromTap(local, barWidth);
      },
      child: SizedBox(
        height: AppSize.height(value: 30),
        child: Stack(
          alignment: Alignment.centerLeft,
          children: [
            // Background track
            Container(
              width: barWidth,
              height: 3.5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Colors.grey.withValues(alpha: 0.3),
              ),
            ),

            // Active progress
            Container(
              height: 4,
              width: ((_currentValue - widget.minimumValue) /
                          (widget.maximumValue - widget.minimumValue) *
                          barWidth)
                      .clamp(0, barWidth),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: AppColor.purple,
              ),
            ),

            // Thumb (draggable circle)
            Positioned(
              left: ((_currentValue - widget.minimumValue) /
                          (widget.maximumValue - widget.minimumValue) *
                          barWidth)
                      .clamp(0, barWidth) -
                  6,
              child: GestureDetector(
                onPanUpdate: (details) {
                  final RenderBox box =
                      context.findRenderObject() as RenderBox;
                  final local = box.globalToLocal(details.globalPosition);
                  _updateValueFromTap(local, barWidth);
                },
                child: Container(
                  width: 12,
                  height: 12,
                  decoration: const BoxDecoration(
                    color: AppColor.purple,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}




// import 'package:flutter/material.dart';
// import 'package:tinnierenee12/const/app_color.dart';
// import 'package:tinnierenee12/utils/app_size.dart';

// class CustomProgressBarSlider extends StatefulWidget {
//   final double minimumValue;
//   final double maximumValue;
//   final double value;
//   final Function(double) onChanged;

//   const CustomProgressBarSlider({
//     super.key,
//     this.minimumValue = 10,
//     this.maximumValue = 100,
//     required this.value,
//     required this.onChanged,
//   });

//   @override
//   State<CustomProgressBarSlider> createState() =>
//       _CustomProgressBarSliderState();
// }

// class _CustomProgressBarSliderState extends State<CustomProgressBarSlider> {
//   late double _currentValue;

//   @override
//   void initState() {
//     super.initState();
//     _currentValue = widget.value < widget.minimumValue
//         ? widget.minimumValue
//         : widget.value;
//   }

//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
//     final barWidth = screenWidth;

//     return SizedBox(
//       height: AppSize.height(value: 20),
//       child: Stack(
//         alignment: Alignment.centerLeft,
//         children: [
//           // Background track
//           Container(
//             width: barWidth,
//             height: 3.5,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(100),
//               color: Colors.grey.withValues(alpha: 0.3),
//             ),
//           ),

//           // Active progress
//           Container(
//             height: 4,
//             width:
//                 ((_currentValue - widget.minimumValue) /
//                         (widget.maximumValue - widget.minimumValue) *
//                         barWidth)
//                     .clamp(0, barWidth),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(100),
//               color: AppColor.purple,
//             ),
//           ),

//           // Thumb (draggable circle)
//           Positioned(
//             left:
//                 ((_currentValue - widget.minimumValue) /
//                         (widget.maximumValue - widget.minimumValue) *
//                         barWidth)
//                     .clamp(0, barWidth) -
//                 6,
//             child: GestureDetector(
//               onPanUpdate: (details) {
//                 final RenderBox box = context.findRenderObject() as RenderBox;
//                 final local = box.globalToLocal(details.globalPosition);
//                 final newValue =
//                     widget.minimumValue +
//                     (local.dx /
//                         barWidth *
//                         (widget.maximumValue - widget.minimumValue));

//                 if (newValue >= widget.minimumValue &&
//                     newValue <= widget.maximumValue) {
//                   setState(() {
//                     _currentValue = newValue;
//                   });
//                   widget.onChanged(_currentValue);
//                 }
//               },
//               child: Container(
//                 width: 12,
//                 height: 12,
//                 decoration: const BoxDecoration(
//                   color: AppColor.purple,
//                   shape: BoxShape.circle,
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
