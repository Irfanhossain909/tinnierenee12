import 'package:flutter/material.dart';
import 'package:tinnierenee12/utils/app_size.dart';

class ProgressiveBorderContainer extends StatefulWidget {
  final double progress; // 0 to 100 percentage
  final Widget? child;
  final double width;
  final double height;
  final double borderRadius;
  final Color progressColor;
  final Color backgroundColor;
  final double borderWidth;
  final Duration animationDuration;

  const ProgressiveBorderContainer({
    Key? key,
    required this.progress,
    this.child,
    this.width = 200,
    this.height = 100,
    this.borderRadius = 50.0,
    this.progressColor = Colors.white,
    this.backgroundColor = Colors.grey,
    this.borderWidth = 4.0,
    this.animationDuration = const Duration(milliseconds: 1000),
  }) : super(key: key);

  @override
  State<ProgressiveBorderContainer> createState() =>
      _ProgressiveBorderContainerState();
}

class _ProgressiveBorderContainerState extends State<ProgressiveBorderContainer>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: widget.animationDuration,
      vsync: this,
    );

    _animation = Tween<double>(begin: 0, end: widget.progress / 100).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    _animationController.forward();
  }

  @override
  void didUpdateWidget(ProgressiveBorderContainer oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.progress != widget.progress) {
      _animation =
          Tween<double>(
            begin: _animation.value,
            end: widget.progress / 100,
          ).animate(
            CurvedAnimation(
              parent: _animationController,
              curve: Curves.easeInOut,
            ),
          );
      _animationController.forward(from: 0);
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return CustomPaint(
          painter: ProgressiveBorderPainter(
            progress: _animation.value,
            progressColor: widget.progressColor,
            backgroundColor: widget.backgroundColor,
            borderWidth: widget.borderWidth,
            borderRadius: widget.borderRadius,
          ),
          child: Container(
            width: widget.width,
            height: widget.height,
            padding: EdgeInsets.all(widget.borderWidth + 8),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (widget.child != null) widget.child!,
                  Text(
                    '${(widget.progress).toStringAsFixed(0)}%',
                    style: TextStyle(
                      fontSize: AppSize.width(value: 16),
                      fontWeight: FontWeight.bold,
                      color: widget.progressColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class ProgressiveBorderPainter extends CustomPainter {
  final double progress;
  final Color progressColor;
  final Color backgroundColor;
  final double borderWidth;
  final double borderRadius;

  ProgressiveBorderPainter({
    required this.progress,
    required this.progressColor,
    required this.backgroundColor,
    required this.borderWidth,
    required this.borderRadius,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromLTWH(
      borderWidth / 2,
      borderWidth / 2,
      size.width - borderWidth,
      size.height - borderWidth,
    );
    final borderRect = RRect.fromRectAndRadius(
      rect,
      Radius.circular(borderRadius),
    );

    // Background border
    final backgroundPaint = Paint()
      ..color = backgroundColor.withOpacity(0.3)
      ..style = PaintingStyle.stroke
      ..strokeWidth = borderWidth;

    canvas.drawRRect(borderRect, backgroundPaint);

    // Progressive border using arc
    final progressPaint = Paint()
      ..color = progressColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = borderWidth
      ..strokeCap = StrokeCap.round;

    // Calculate the sweep angle based on progress (0 to 2π)
    final sweepAngle = 2 * 3.14159 * progress;

    // Draw the progressive arc starting from top (-π/2)
    canvas.drawArc(
      rect,
      -3.14159 / 2, // Start from top
      sweepAngle, // Sweep angle based on progress
      false, // Don't use center
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

// Usage Example
class ExampleUsage extends StatefulWidget {
  @override
  _ExampleUsageState createState() => _ExampleUsageState();
}

class _ExampleUsageState extends State<ExampleUsage> {
  double progress = 40;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Progressive Border Container')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ProgressiveBorderContainer(
              progress: progress,
              width: 150, // Chhoto size
              height: 150, // Square shape
              borderRadius: 75, // Perfectly rounded
              progressColor: Colors.white,
              backgroundColor: Colors.grey,
              borderWidth: 8,
              child: Icon(Icons.download, color: Colors.white, size: 30),
            ),
            SizedBox(height: 50),
            Slider(
              value: progress,
              min: 0,
              max: 100,
              divisions: 100,
              label: '${progress.round()}%',
              onChanged: (value) {
                setState(() {
                  progress = value;
                });
              },
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => setState(() => progress = 25),
                  child: Text('25%'),
                ),
                ElevatedButton(
                  onPressed: () => setState(() => progress = 50),
                  child: Text('50%'),
                ),
                ElevatedButton(
                  onPressed: () => setState(() => progress = 75),
                  child: Text('75%'),
                ),
                ElevatedButton(
                  onPressed: () => setState(() => progress = 100),
                  child: Text('100%'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
