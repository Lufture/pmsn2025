class MovieDao {
  int? idMovie;
  String? nameMovie;
  String? time;
  String? dateRelease;

  MovieDao({this.idMovie, this.nameMovie, this.time, this.dateRelease});

  factory MovieDao.fromMap(Map<String, dynamic> map) {
    return MovieDao(
      idMovie: map['idMovie'],
      nameMovie: map['nameMovie'],
      time: map['time'],
      dateRelease: map['dateRelease']
      );
  }

}