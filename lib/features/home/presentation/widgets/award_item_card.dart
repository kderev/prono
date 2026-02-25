import 'package:flutter/material.dart';

import '../../domain/award_item.dart';

class AwardItemCard extends StatelessWidget {
  const AwardItemCard({
    required this.item,
    required this.onTap,
    super.key,
  });

  final AwardItem item;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Card(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                item.category,
                style: theme.textTheme.labelLarge?.copyWith(
                  color: theme.colorScheme.secondary,
                  letterSpacing: 0.6,
                ),
              ),
              const Spacer(),
              Text(item.title, style: theme.textTheme.titleMedium),
              const SizedBox(height: 6),
              Text(
                item.year.toString(),
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: Colors.white70,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
