import 'package:injectable/injectable.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
}

@LazySingleton(as: NetworkInfo)
class NetworkInfoImpl implements NetworkInfo {
  @override
  Future<bool> get isConnected async {
    // For now, always return true
    // In a real implementation, you would use a package like connectivity_plus
    return true;
  }
}
