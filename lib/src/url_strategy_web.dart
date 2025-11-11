// Web implementation: sets the hash URL strategy for web builds.
import 'package:flutter_web_plugins/flutter_web_plugins.dart'
    show setUrlStrategy, HashUrlStrategy;

void setHashUrlStrategy() {
  setUrlStrategy(const HashUrlStrategy());
}
