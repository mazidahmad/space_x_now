import 'dart:async';

import 'package:flutter/material.dart';
import 'package:space_x_now_ui_components/ui_components.dart';

class AppSearchTextField extends StatefulWidget {
  const AppSearchTextField({
    required this.searchText,
    this.debounceTime = 500,
    this.onChanged,
    this.focusNode,
    super.key,
  });

  final void Function(String)? onChanged;
  final String searchText;
  final int debounceTime;
  final FocusNode? focusNode;

  @override
  State<AppSearchTextField> createState() => _AppSearchTextFieldState();
}

class _AppSearchTextFieldState extends State<AppSearchTextField> {
  final TextEditingController _controller = TextEditingController();
  Timer? _debounce;

  @override
  void dispose() {
    _controller.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.bg01,
          borderRadius: BorderRadius.circular(12),
        ),
        child: TextFormField(
          focusNode: widget.focusNode,
          onChanged: (value) {
            if (_debounce?.isActive ?? false) _debounce?.cancel();
            _debounce = Timer(Duration(milliseconds: widget.debounceTime), () {
              widget.onChanged?.call(value);
            });
          },
          style: AppTextStyle.body14(),
          controller: _controller,
          decoration: InputDecoration(
            border: InputBorder.none,
            fillColor: AppColors.dark3,
            focusColor: AppColors.dark3,
            hintStyle:
                AppTextStyle.body14(color: AppColors.dark3).copyWith(height: 0),
            hintText: widget.searchText,
            prefixIcon: Icon(
              FontAwesomeIcons.magnifyingGlass,
              size: 20,
            ),
            contentPadding: const EdgeInsets.symmetric(vertical: 14),
            suffixIcon: _controller.text.isNotEmpty
                ? InkWell(
                    child: const Icon(
                      Icons.clear,
                      color: AppColors.textSecondary,
                    ),
                    onTap: () {
                      _controller.text = '';
                      widget.onChanged?.call('');
                    },
                  )
                : null,
          ),
        ),
      ),
    );
  }
}
