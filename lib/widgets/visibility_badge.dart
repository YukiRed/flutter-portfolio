import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../core/services/auth_service.dart';
import '../core/utils/l10n.dart';

class VisibilityBadge extends StatelessWidget {
  final bool isPrivate;

  const VisibilityBadge({super.key, required this.isPrivate});

  @override
  Widget build(BuildContext context) {
    final auth = context.watch<AuthService>();

    // 🚫 Not logged in → hide completely
    if (!auth.isLoggedIn) return const SizedBox.shrink();

    final scheme = Theme.of(context).colorScheme;
    final baseColor = isPrivate ? scheme.error : scheme.tertiary;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: baseColor.withValues(alpha: 0.15), // ✅ modern API
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        isPrivate
            ? context.l10n.visibilityPrivate
            : context.l10n.visibilityPublic,
        style: TextStyle(
          color: baseColor,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
