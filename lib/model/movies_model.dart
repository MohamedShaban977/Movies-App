class MoviesModel {
  String backdrop_path,
      title,
      original_language,
      original_title,
      overview,
      poster_path,
      release_date;

  var id, vote_count ,vote_average, popularity;

  bool adult, video;

  MoviesModel(
      {this.backdrop_path,
      this.title,
      this.original_language,
      this.original_title,
      this.overview,
      this.poster_path,
      this.release_date,
      this.id,
      this.vote_count,
      this.vote_average,
      this.popularity,
      this.adult,
      this.video});

  MoviesModel.fromJson(Map<String, dynamic> map) {
    this.backdrop_path = map['backdrop_path'];
    this.title = map['title'];
    this.original_language = map['original_language'];
    this.original_title = map['original_title'];
    this.overview = map['overview'];
    this.poster_path = map['poster_path'];
    this.release_date = map['release_date'];

    this.id = map['id'];
    this.popularity = map['popularity'];
    this.video = map['video'];
    this.vote_average = map['vote_average'];
    this.vote_count = map['vote_count'];
  }
}
