import 'package:flutter/material.dart';
import 'package:space_x_now_ui_components/ui_components.dart';

mixin BottomsheetMixin {
  late BuildContext globalContext;

  void setContext(BuildContext context) {
    globalContext = context;
  }

  Future<void> showAppBottomSheet(
      {required Widget widget,
      Color backgroundColor = AppColors.backgroundDefault,
      String? title}) async {
    return showModalBottomSheet(
      context: globalContext,
      builder: (context) {
        return Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
          ),
          child: SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    if (title != null)
                      Text(
                        title,
                        style: AppTextStyle.headline5(),
                      ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(Icons.close),
                    ),
                  ],
                ),
                widget,
              ],
            ),
          ),
        );
      },
    );
  }
}
