import 'package:get/get.dart';

extension GetInterfaceExtension on GetInterface {
  T tryPut<T>(
    T dependency, {
    bool permanent = false,
  }) {
    if (Get.isRegistered<T>()) return Get.find<T>();
    return Get.put(
      dependency,
      permanent: permanent,
    );
  }
}
