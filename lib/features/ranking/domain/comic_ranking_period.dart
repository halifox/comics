enum ComicRankingPeriod {
  day(label: '日榜'),
  week(label: '周榜'),
  month(label: '月榜'),
  total(label: '总榜');

  const ComicRankingPeriod({required this.label});

  final String label;
}
