import 'package:flutter/services.dart';

Future<List<String>> listMarkdownAssets() async {
  final assetManifest = await AssetManifest.loadFromAssetBundle(rootBundle);
  final allAssets = assetManifest.listAssets();

  // Filter for English Markdown files
  final markdownFiles = allAssets
      .where((path) => path.startsWith('assets/contents/en/'))
      .where((path) => path.endsWith('.md'))
      .toList();

  markdownFiles.sort();
  return markdownFiles;
}
