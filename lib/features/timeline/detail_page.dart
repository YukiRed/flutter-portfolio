import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/services/content_service.dart';
import '../../core/markdown/markdown_renderer.dart';
import '../../core/utils/responsive.dart';
import '../../widgets/detail_header.dart';

class TimelineDetailPage extends StatelessWidget {
  final String slug;
  const TimelineDetailPage({super.key, required this.slug});

  @override
  Widget build(BuildContext context) {
    final svc = context.watch<ContentService>();
    return FutureBuilder(
      future: svc.ensureLoaded(),
      builder: (context, snap) {
        // Defensive: sometimes a path may be passed as the slug (e.g. 'assets/contents/.../file.md')
        // Normalize: if the slug looks like a path, extract the basename without extension.
        String normalized = slug;
        if (normalized.startsWith('assets/') ||
            normalized.contains('/contents/')) {
          final parts = normalized.split('/');
          final last = parts.isNotEmpty ? parts.last : normalized;
          if (last.endsWith('.md')) {
            normalized = last.substring(0, last.length - 3);
          }
        }

        final meta = svc.findByTypeAndSlug('timeline', normalized);
        assert(() {
          // debug print helpful during development
          // ignore: avoid_print
          print(
            '[TimelineDetailPage] slug(original)=$slug normalized=$normalized meta=${meta?.path}',
          );
          return true;
        }());
        if (meta == null) return const Center(child: Text('Not found'));
        return FutureBuilder(
          future: svc.loadBodyByPath(meta.path),
          builder: (context, snap) {
            if (!snap.hasData) {
              return const Center(child: CircularProgressIndicator());
            }
            return SingleChildScrollView(
              padding: EdgeInsets.all(context.pagePadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DetailHeader(meta: meta),
                  MarkdownView(data: snap.data!),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
