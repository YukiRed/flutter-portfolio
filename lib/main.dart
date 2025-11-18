import 'package:flutter/material.dart';
import 'src/url_strategy_stub.dart'
    if (dart.library.html) 'src/url_strategy_web.dart';
import 'app/app.dart';
// 新增导入
import 'app/config.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // GitHub Pages: hash routing to avoid server rewrites (no-op on non-web)
  setHashUrlStrategy();

  // 验证必要的环境变量（可选，但推荐）
  try {
    // 仅验证存在性，不读取具体值
    AppConfig.authCanarySalt;
    AppConfig.authCanaryNonce;
    AppConfig.authCanaryData;
    AppConfig.authCanaryMac;
  } catch (e) {
    debugPrint("警告：缺少必要的环境变量 - $e");
  }

  runApp(const PortfolioApp());
}
