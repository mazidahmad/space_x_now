import 'package:flutter/material.dart';

import '../ui_components.dart';

enum ToastType { info, failed, success, warning }

mixin MessengerMixin {
  BuildContext? globalContext;

  void setMessengerContext(BuildContext context) {
    globalContext = context;
  }

  void showAppToast(
      {ToastType type = ToastType.info,
      required String title,
      String? message,
      void Function()? onClose}) {
    toastification.showCustom(
      context: globalContext,
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
                      color: AppColors.textPrimary,
                    ),
                  ),
                Expanded(
                  child: Text(
                    title,
                    style: AppTextStyle.small(),
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
        return FontAwesomeIcons.circleXmark;
      case ToastType.warning:
        return FontAwesomeIcons.triangleExclamation;
      default:
        return FontAwesomeIcons.info;
    }
  }

  Color _getToastColor(ToastType type) {
    switch (type) {
      case ToastType.failed:
        return AppColors.red2;
      case ToastType.warning:
        return AppColors.secondaryColor;
      case ToastType.success:
        return AppColors.green2;
      default:
        return AppColors.backgroundDefault;
    }
  }
}
