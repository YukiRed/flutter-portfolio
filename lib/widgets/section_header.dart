// lib/widgets/section_header.dart
import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final String? subtitle;
  final Widget? leading;
  final Widget? trailing;
  final bool center;
  final bool showDivider;
  final EdgeInsetsGeometry padding;
  final double spacing;
  final double dividerWidth;
  final Color? dividerColor;

  const SectionHeader({
    super.key,
    required this.title,
    this.subtitle,
    this.leading,
    this.trailing,
    this.center = false,
    this.showDivider = true,
    this.padding = const EdgeInsets.symmetric(vertical: 24.0),
    this.spacing = 8.0,
    this.dividerWidth = 72.0,
    this.dividerColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final titleStyle =
        theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700) ??
        const TextStyle(fontSize: 20, fontWeight: FontWeight.w700);
    final subtitleStyle =
        theme.textTheme.bodyMedium?.copyWith(
          color: theme.textTheme.bodySmall?.color,
        ) ??
        const TextStyle(fontSize: 14, color: Colors.black54);

    final children = <Widget>[];

    // Title row (with optional leading)
    children.add(
      Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: center
            ? MainAxisAlignment.center
            : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (leading != null) ...[leading!, const SizedBox(width: 8)],
          Expanded(
            child: Text(
              title,
              style: titleStyle,
              textAlign: center ? TextAlign.center : TextAlign.start,
            ),
          ),
          if (trailing != null) ...[const SizedBox(width: 8), trailing!],
        ],
      ),
    );

    // Subtitle
    if (subtitle != null && subtitle!.isNotEmpty) {
      children.add(SizedBox(height: spacing));
      children.add(
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 800),
          child: Text(
            subtitle!,
            style: subtitleStyle,
            textAlign: center ? TextAlign.center : TextAlign.start,
          ),
        ),
      );
    }

    // Divider
    if (showDivider) {
      children.add(SizedBox(height: spacing * 1.25));
      children.add(
        Align(
          alignment: center ? Alignment.center : Alignment.centerLeft,
          child: Container(
            width: dividerWidth,
            height: 3,
            decoration: BoxDecoration(
              color: dividerColor ?? theme.colorScheme.primary,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        ),
      );
    }

    return Padding(
      padding: padding,
      child: Semantics(
        header: true,
        child: Column(
          crossAxisAlignment: center
              ? CrossAxisAlignment.center
              : CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: children,
        ),
      ),
    );
  }
}
