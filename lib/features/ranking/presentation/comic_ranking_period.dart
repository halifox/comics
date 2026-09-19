enum ComicRankingPeriod {
  day(label: '日榜', apiValue: 'day'),
  week(label: '周榜', apiValue: 'week'),
  month(label: '月榜', apiValue: 'month'),
  total(label: '总榜', apiValue: 'total');

  const ComicRankingPeriod({required this.label, required this.apiValue});

  final String label;
  final String apiValue;
}
