import 'package:flutter/material.dart';

class PaginationLoaderIndicator extends StatelessWidget {
  final bool active;
  const PaginationLoaderIndicator({super.key, required this.active});

  @override
  Widget build(BuildContext context) {
    return active
        ? const Center(
            child: CircularProgressIndicator.adaptive(),
          )
        : const SizedBox();
  }
}
