import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppConfig {
  // --- 公开配置（硬编码，无需环境变量）---
  static const String siteName = "Desmond Liew — Portfolio";
  static const String siteTagline = "Calm, privacy-first AI systems.";
  static const String contactEmail = "hello@example.com";
  static const String timezone = "Asia/Kuching";

  // 功能开关
  static const bool enableSearch = true;
  static const bool enableNewsletter = false;
  static const bool showMetaRealm = true;
  static const bool showCreativeRealm = true;

  // 路由配置
  static const bool useHashRouter = true;
  static const String basePath = "";

  // 默认主题
  static const String defaultThemePalette =
      "wood"; // metal|earth|wood|fire|water等
  static const String defaultThemeMode = "system";

  // --- 敏感配置（从环境变量读取）---
  static String get authCanarySalt {
    return dotenv.get(
      'AUTH_CANARY_SALT',
      fallback: throw Exception("AUTH_CANARY_SALT 未配置"),
    );
  }

  static String get authCanaryNonce {
    return dotenv.get(
      'AUTH_CANARY_NONCE',
      fallback: throw Exception("AUTH_CANARY_NONCE 未配置"),
    );
  }

  static String get authCanaryData {
    return dotenv.get(
      'AUTH_CANARY_DATA',
      fallback: throw Exception("AUTH_CANARY_DATA 未配置"),
    );
  }

  static String get authCanaryMac {
    return dotenv.get(
      'AUTH_CANARY_MAC',
      fallback: throw Exception("AUTH_CANARY_MAC 未配置"),
    );
  }
}
