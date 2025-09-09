import 'package:flutter/widgets.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:toastification/toastification.dart';

import '../../shared/themes/app_colors.dart';
import '../../shared/themes/app_text_styles.dart';
import '../di/service_locator.dart';
import '../services/global_service.dart';

enum ToastType { info, failed, success, warning }

mixin MessengerMixin {
  void showAppToast(
      {ToastType type = ToastType.info,
      required String title,
      String? message,
      void Function()? onClose}) {
    toastification.showCustom(
      context: getIt<GlobalService>().globalNavKey.currentContext,
      autoCloseDuration: const Duration(seconds: 5),
      alignment: Alignment.bottomCenter,
      builder: (context, holder) {
        return Center(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            decoration: BoxDecoration(
              color: _getToastColor(type),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                if (type != ToastType.info)
                  Container(
                    margin: const EdgeInsets.only(
                      right: 10,
                    ),
                    child: Icon(
                      _getIconByType(type),
                      color: AppColors.coreWhite,
                    ),
                  ),
                Expanded(
                  child: Text(
                    title,
                    style:
                        AppTextStyle.pTextSmMedium(color: AppColors.coreWhite),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  IconData _getIconByType(ToastType type) {
    switch (type) {
      case ToastType.failed:
        return Iconsax.close_square;
      case ToastType.warning:
        return Iconsax.warning_2;
      default:
        return Iconsax.tick_square;
    }
  }

  Color _getToastColor(ToastType type) {
    switch (type) {
      case ToastType.failed:
        return AppColors.error900;
      case ToastType.warning:
        return AppColors.warning;
      case ToastType.success:
        return AppColors.success900;
      default:
        return AppColors.neutralGray900;
    }
  }
}
