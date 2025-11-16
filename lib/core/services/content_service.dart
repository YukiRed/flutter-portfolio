import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart' show rootBundle;
import '../markdown/front_matter.dart';
import '../models/content_meta.dart';
import 'asset_index.dart';

class ContentService extends ChangeNotifier {
  bool _loaded = false;
  final List<ContentMeta> _all = [];
  List<ContentMeta> get all => List.unmodifiable(_all);

  Future<void> ensureLoaded() async {
    if (_loaded) return;
    final paths = await listMarkdownAssets();
    if (kDebugMode) {
      print('[ContentService] discovered ${paths.length} markdown assets');
      for (final p in paths) {
        print('[ContentService] asset: $p');
      }
    }
    for (final path in paths) {
      final raw = await rootBundle.loadString(path);
      final fm = parseFrontMatter(raw);
      if (fm.meta.isEmpty) continue;
      final meta = _toMeta(fm.meta, path);
      if (kDebugMode) {
        print(
          '[ContentService] parsed: type=${meta.type} slug=${meta.slug} visibility=${meta.visibility} path=${meta.path}',
        );
      }
      _all.add(meta);
    }
    _loaded = true;
    notifyListeners();
  }

  ContentMeta _toMeta(Map<String, dynamic> m, String path) {
    DateTime? dt;
    final ds = (m['date']?.toString() ?? '').trim();
    if (ds.isNotEmpty) dt = DateTime.tryParse(ds);

    return ContentMeta(
      title: (m['title'] ?? '').toString(),
      slug: (m['slug'] ?? '').toString(),
      type: (m['type'] ?? 'page').toString(),
      visibility: (m['visibility'] ?? 'public').toString(),
      date: dt,
      summary: (m['summary'] ?? '').toString(),
      tags: (m['tags'] as List?)?.map((e) => e.toString()).toList() ?? const [],
      thumbnail: m['thumbnail']?.toString(),
      readingTime: m['reading_time']?.toString(),
      path: path,
    );
  }

  Future<String> loadBodyByPath(String path) async {
    final raw = await rootBundle.loadString(path);
    return parseFrontMatter(raw).body;
  }

  ContentMeta? findByTypeAndSlug(String type, String slug) {
    try {
      return _all.firstWhere((e) => e.type == type && e.slug == slug);
    } catch (_) {
      return null;
    }
  }

  List<ContentMeta> listByType(String type, {bool publicOnly = true}) {
    final xs = _all.where((e) => e.type == type);
    final f = publicOnly ? xs.where((e) => e.isPublic) : xs;
    final list = f.toList();
    list.sort(
      (a, b) => (b.date ?? DateTime(1970)).compareTo(a.date ?? DateTime(1970)),
    );
    return list;
  }

  // ----------------------------------------------------------------------
  // 🔒 NEW — PRIVATE CONTENT DETECTION FOR ROUTER REDIRECT
  // ----------------------------------------------------------------------

  /// Find ContentMeta by matching slug from a route path
  ContentMeta? findMetaByPath(String path) {
    // Extract last path section as slug
    // e.g. /foundation/foundation-credits → slug: foundation-credits
    final slug = path.split('/').last.trim();
    if (slug.isEmpty) return null;

    try {
      return _all.firstWhere((m) => m.slug == slug);
    } catch (_) {
      return null;
    }
  }

  /// Check if a route points to a private content item
  bool isPrivatePath(String path) {
    final meta = findMetaByPath(path);
    if (meta == null) return false;
    return meta.isPrivate;
  }
}
