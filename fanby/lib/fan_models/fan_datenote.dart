class FanDatenote {
  final int fanDay;
  final bool isRed;

  const FanDatenote({required this.fanDay, required this.isRed});

  factory FanDatenote.fromMap(Map<String, dynamic> map) => FanDatenote(
        fanDay: int.parse(map['day'].toString()),
        isRed: map['notice'].toString().isNotEmpty,
      );
}
