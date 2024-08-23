class FanNotes {
  final int id;
  final DateTime noteDate;
  final String notice;
  final String observe;
  final int breastType;
  final int noticedType;
  final String howLong;
  final int constantsType;
  final String patternts;
  final int periodType;
  final String period;

  const FanNotes({
    required this.id,
    required this.noteDate,
    required this.notice,
    required this.observe,
    required this.breastType,
    required this.noticedType,
    required this.howLong,
    required this.constantsType,
    required this.patternts,
    required this.periodType,
    required this.period,
  });

  factory FanNotes.fromMap(Map<String, dynamic> map) {
    final fanDate = DateTime(
      int.parse(map['year'].toString()),
      int.parse(map['month'].toString()),
      int.parse(map['day'].toString()),
    );
    return FanNotes(
      id: int.parse(map['id'].toString()),
      noteDate: fanDate,
      notice: map['notice'].toString(),
      observe: map['observe'].toString(),
      breastType: int.parse(map['breastType'].toString()),
      noticedType: int.parse(map['noticedType'].toString()),
      howLong: map['howLong'].toString(),
      constantsType: int.parse(map['constantsType'].toString()),
      patternts: map['patternts'].toString(),
      periodType: int.parse(map['periodType'].toString()),
      period: map['period'].toString(),
    );
  }

  factory FanNotes.empty() => FanNotes(
        id: 0,
        noteDate: DateTime.now(),
        notice: '',
        observe: '',
        breastType: 0,
        noticedType: 0,
        howLong: '',
        constantsType: 0,
        patternts: '',
        periodType: 0,
        period: '',
      );

  Map<String, dynamic> toMap() => {
        'day': noteDate.day.toString(),
        'month': noteDate.month.toString(),
        'year': noteDate.year.toString(),
        'notice': notice,
        'observe': observe,
        'breastType': breastType,
        'noticedType': noticedType,
        'howLong': howLong,
        'constantsType': constantsType,
        'patternts': patternts,
        'periodType': periodType,
        'period': period,
      };
}
