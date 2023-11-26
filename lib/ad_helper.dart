import 'dart:io';

class AdHelper {

  static String get bannerAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-2822432236628710/8504219122';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-4204062878719612/4735244943';
    } else {
      throw UnsupportedError('Unsupported platform');
    }
  }

  static String get interstitialAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-2822432236628710/8504219122';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-4204062878719612/4735244943';
    } else {
      throw UnsupportedError('Unsupported platform');
    }
  }

  static String get rewardedAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-2822432236628710/8504219122';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-4204062878719612/4735244943';
    } else {
      throw UnsupportedError('Unsupported platform');
    }
  }
}