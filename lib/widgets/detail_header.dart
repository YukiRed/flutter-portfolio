import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../core/utils/visibility.dart';
import 'visibility_badge.dart';

class DetailHeader extends StatelessWidget {
  final dynamic meta;
  const DetailHeader({super.key, required this.meta});

  @override
  Widget build(BuildContext context) {
    final title = (meta.title as String?) ?? (meta.slug as String?) ?? '';
    final isPrivate = metaIsPrivate(meta);

    // Prefer navigating to the content's parent index (canonical parent)
    String parentRouteForType(dynamic meta) {
      final t = (meta.type as String?) ?? '';
      return switch (t) {
        'timeline' => '/timeline',
        'project' => '/projects',
        'lab' => '/labs',
        'library' => '/library',
        'blog' => '/blog',
        'meta' => '/meta',
        'foundation' => '/foundation',
        _ => '/',
      };
    }

    final parent = parentRouteForType(meta);

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back_outlined),
            tooltip: 'Back',
            onPressed: () => context.go(parent),
          ),
          Expanded(
            child: Text(
              title,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
          VisibilityBadge(isPrivate: isPrivate),
        ],
      ),
    );
  }
}
