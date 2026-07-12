enum ComicRankingPeriod {
  day(value: 'day', label: '日榜'),
  week(value: 'week', label: '周榜'),
  month(value: 'month', label: '月榜'),
  total(value: 'total', label: '总榜');

  const ComicRankingPeriod({required this.value, required this.label});

  final String value;
  final String label;
}
