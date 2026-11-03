/// Filter riwayat: satu spesies dan/atau rentang tanggal (inklusif).
class SessionFilter {
  const SessionFilter({this.speciesId, this.from, this.to});

  final int? speciesId;
  final DateTime? from;
  final DateTime? to;

  bool get isEmpty => speciesId == null && from == null && to == null;

  @override
  bool operator ==(Object other) =>
      other is SessionFilter &&
      other.speciesId == speciesId &&
      other.from == from &&
      other.to == to;

  @override
  int get hashCode => Object.hash(speciesId, from, to);
}
