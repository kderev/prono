import 'package:flutter/material.dart';

import '../../../core/router/app_router.dart';
import '../data/awards_repository.dart';
import '../domain/award_item.dart';
import 'widgets/award_item_card.dart';
import 'widgets/premium_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<AwardItem> items = const AwardsRepository().getFeaturedItems();
    final bool isDesktop = MediaQuery.sizeOf(context).width >= 900;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Prono Awards',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: isDesktop ? 48 : 24,
            vertical: isDesktop ? 28 : 18,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'A cinematic dashboard designed for prestigious selections.',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Colors.white70,
                ),
              ),
              const SizedBox(height: 28),
              PremiumButton(
                label: 'Start Your Prediction',
                onPressed: () {
                  Navigator.of(context).pushNamed(
                    AppRouter.details,
                    arguments: 'Start Your Prediction',
                  );
                },
              ),
              const SizedBox(height: 28),
              Text(
                'Featured Categories',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 14),
              Expanded(
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  child: isDesktop
                      ? _AwardsGrid(items: items)
                      : _AwardsList(items: items),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _AwardsGrid extends StatelessWidget {
  const _AwardsGrid({required this.items});

  final List<AwardItem> items;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      key: const ValueKey<String>('desktop-grid'),
      itemCount: items.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 1.25,
        mainAxisSpacing: 14,
        crossAxisSpacing: 14,
      ),
      itemBuilder: (_, int index) {
        final AwardItem item = items[index];
        return AwardItemCard(
          item: item,
          onTap: () => Navigator.of(context).pushNamed(
            AppRouter.details,
            arguments: item.title,
          ),
        );
      },
    );
  }
}

class _AwardsList extends StatelessWidget {
  const _AwardsList({required this.items});

  final List<AwardItem> items;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      key: const ValueKey<String>('mobile-list'),
      itemCount: items.length,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (_, int index) {
        final AwardItem item = items[index];
        return SizedBox(
          height: 150,
          child: AwardItemCard(
            item: item,
            onTap: () => Navigator.of(context).pushNamed(
              AppRouter.details,
              arguments: item.title,
            ),
          ),
        );
      },
    );
  }
}
