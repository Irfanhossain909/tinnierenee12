import 'package:flutter/material.dart';
import 'package:tinnierenee12/const/app_color.dart';
import 'package:tinnierenee12/utils/app_size.dart';
import 'package:tinnierenee12/widget/app_log/gap.dart';
import 'package:tinnierenee12/widget/app_text/app_text.dart';

class AppExpandedCard extends StatefulWidget {
  // Required parameters
  final String title;
  final String shortDescription;

  // Optional parameters (nullable)
  final Widget? leadingImage;
  final String? longDescription;
  final String? buttonText;
  final VoidCallback? onButtonPressed;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? buttonColor;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final BorderRadius? borderRadius;
  final double? elevation;
  final bool? initiallyExpanded;
  final Duration? animationDuration;
  final IconData? expandIcon;
  final IconData? collapseIcon;
  final Color? iconColor;

  const AppExpandedCard({
    super.key,
    required this.title,
    required this.shortDescription,
    this.leadingImage,
    this.longDescription,
    this.buttonText,
    this.onButtonPressed,
    this.backgroundColor,
    this.textColor,
    this.buttonColor,
    this.padding,
    this.margin,
    this.borderRadius,
    this.elevation,
    this.initiallyExpanded,
    this.animationDuration,
    this.expandIcon,
    this.collapseIcon,
    this.iconColor,
  });

  @override
  State<AppExpandedCard> createState() => _AppExpandedCardState();
}

class _AppExpandedCardState extends State<AppExpandedCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _expandAnimation;
  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    _isExpanded = widget.initiallyExpanded ?? false;
    _animationController = AnimationController(
      duration: widget.animationDuration ?? const Duration(milliseconds: 300),
      vsync: this,
    );
    _expandAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );

    if (_isExpanded) {
      _animationController.value = 1.0;
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _toggleExpansion() {
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColor.black.withValues(alpha: 0.2)),
      ),
      margin: widget.margin ?? const EdgeInsets.symmetric(vertical: 8),
      child: Material(
        elevation: widget.elevation ?? 0,
        borderRadius: widget.borderRadius ?? BorderRadius.circular(12),
        color: widget.backgroundColor ?? theme.cardColor,
        child: InkWell(
          onTap: _toggleExpansion,
          borderRadius: widget.borderRadius ?? BorderRadius.circular(12),
          child: Padding(
            padding: widget.padding ?? const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Always visible content (collapsed state)
                Row(
                  children: [
                    // Leading image/icon
                    if (widget.leadingImage != null) ...[
                      SizedBox(
                        width: 48,
                        height: 48,
                        child: widget.leadingImage!,
                      ),
                      const SizedBox(width: 16),
                    ],

                    // Title and short description
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText(
                            data: widget.title,
                            fontSize: AppSize.width(value: 16),
                            fontWeight: FontWeight.w600,
                            color: AppColor.purple,
                          ),

                          Gap(height: AppSize.width(value: 4)),
                          Text(
                            widget.shortDescription,
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color:
                                  widget.textColor?.withValues(alpha: .7) ??
                                  theme.textTheme.bodyMedium?.color
                                      ?.withValues(alpha: .7),
                            ),
                            maxLines: _isExpanded ? null : 1,
                            overflow: _isExpanded
                                ? TextOverflow.visible
                                : TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),

                    // Trailing expand/collapse button
                    AnimatedRotation(
                      turns: _isExpanded ? 0.5 : 0,
                      duration:
                          widget.animationDuration ??
                          const Duration(milliseconds: 300),
                      child: IconButton(
                        onPressed: _toggleExpansion,
                        icon: Icon(
                          _isExpanded
                              ? (widget.collapseIcon ?? Icons.keyboard_arrow_up)
                              : (widget.expandIcon ??
                                    Icons.keyboard_arrow_down),
                          color: widget.iconColor ?? theme.iconTheme.color,
                        ),
                      ),
                    ),
                  ],
                ),

                // Expandable content
                SizeTransition(
                  sizeFactor: _expandAnimation,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (widget.longDescription != null ||
                          widget.buttonText != null) ...[
                        const SizedBox(height: 16),

                        // Long description
                        if (widget.longDescription != null) ...[
                          Text(
                            widget.longDescription!,
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color:
                                  widget.textColor?.withValues(alpha: .8) ??
                                  theme.textTheme.bodyMedium?.color
                                      ?.withValues(alpha: .8),
                            ),
                          ),
                          if (widget.buttonText != null)
                            const SizedBox(height: 16),
                        ],

                        // Action button
                        if (widget.buttonText != null)
                          Align(
                            alignment: Alignment.centerRight,
                            // child: AppButton(title: widget.buttonText!),
                            child: ElevatedButton(
                              onPressed: widget.onButtonPressed,
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    widget.buttonColor ?? theme.primaryColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: Text(
                                widget.buttonText!,
                                style: TextStyle(
                                  color: widget.buttonColor != null
                                      ? _getContrastingTextColor(
                                          widget.buttonColor!,
                                        )
                                      : Colors.white,
                                ),
                              ),
                            ),
                          ),
                      ],
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Helper method to get contrasting text color
  Color _getContrastingTextColor(Color backgroundColor) {
    // Calculate luminance
    double luminance =
        (0.299 * backgroundColor.red +
            0.587 * backgroundColor.green +
            0.114 * backgroundColor.blue) /
        255;

    return luminance > 0.5 ? Colors.white : Colors.white;
  }
}

// Example usage
class ExampleUsage extends StatelessWidget {
  const ExampleUsage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Custom Expandable Card Example')),
      body: ListView(
        children: [
          // Basic example
          AppExpandedCard(
            title: "Personal Information",
            shortDescription: "Submit your personal details.",
            leadingImage: Container(
              decoration: BoxDecoration(
                color: Colors.blue.shade100,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(Icons.person, color: Colors.blue, size: 24),
            ),
            longDescription:
                "To work at a childcare facility in Ohio, you are required to submit some personal information. This data will be stored securely and used to process necessary paperwork when you are hired by a childcare center. Once you finish this step, the next one will be available.",
            buttonText: "Submit",
            onButtonPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Submit button pressed!')),
              );
            },
          ),

          // Customized example
          AppExpandedCard(
            title: "Account Settings",
            shortDescription: "Manage your account preferences.",
            leadingImage: Container(
              decoration: BoxDecoration(
                color: Colors.green.shade100,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(Icons.settings, color: Colors.green, size: 24),
            ),
            longDescription:
                "Here you can update your profile information, change your password, manage notification preferences, and configure privacy settings.",
            buttonText: "Open Settings",
            backgroundColor: Colors.grey.shade50,
            buttonColor: Colors.green,
            borderRadius: BorderRadius.circular(16),
            elevation: 4,
            initiallyExpanded: false,
            onButtonPressed: () {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(const SnackBar(content: Text('Settings opened!')));
            },
          ),

          // Minimal example
          const AppExpandedCard(
            title: "Simple Card",
            shortDescription: "This card has minimal configuration.",
            longDescription:
                "This demonstrates the widget with only required parameters and one optional long description.",
          ),
        ],
      ),
    );
  }
}
