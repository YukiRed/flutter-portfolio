import 'dart:io';

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
    // return "Vdc5Cq7nQf6REKpXvwi9Iw==";
    return Platform.environment['AUTH_CANARY_SALT'] ??
        (throw Exception("AUTH_CANARY_SALT 环境变量未配置"));
  }

  static String get authCanaryNonce {
    // return "goCaHaPQyh0lmIAp";
    return Platform.environment['AUTH_CANARY_NONCE'] ??
        (throw Exception("AUTH_CANARY_NONCE 环境变量未配置"));
  }

  static String get authCanaryData {
    // return "hjQ=";
    return Platform.environment['AUTH_CANARY_DATA'] ??
        (throw Exception("AUTH_CANARY_DATA 环境变量未配置"));
  }

  static String get authCanaryMac {
    // return "VXb08nJsHtL8JnoBsD4Plg==";
    return Platform.environment['AUTH_CANARY_MAC'] ??
        (throw Exception("AUTH_CANARY_MAC 环境变量未配置"));
  }
}
