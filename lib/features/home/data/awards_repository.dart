import '../domain/award_item.dart';

class AwardsRepository {
  const AwardsRepository();

  List<AwardItem> getFeaturedItems() {
    return const <AwardItem>[
      AwardItem(title: 'Nocturne', category: 'Best Picture', year: 2026),
      AwardItem(title: 'La Lumière', category: 'Best Director', year: 2026),
      AwardItem(title: 'Echoes of Dust', category: 'Best Actor', year: 2025),
      AwardItem(title: 'Velvet Horizon', category: 'Best Actress', year: 2025),
      AwardItem(title: 'The Last Scene', category: 'Best Screenplay', year: 2024),
      AwardItem(title: 'Gold Frame', category: 'Best Editing', year: 2024),
    ];
  }
}
