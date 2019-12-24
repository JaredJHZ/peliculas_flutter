class Peliculas {
  List<Pelicula> items = new List();

  Peliculas();

  Peliculas.fromJsonList(List<dynamic> jsonList) {
    if(jsonList == null) return;

    for(final item in jsonList) {
      final pelicula = new Pelicula.fromJsonMap(item);
      this.items.add(pelicula);
    }

  }
}


class Pelicula {
  int voteCount;
  int id;
  bool video;
  double voteAverage;
  String title;
  double popularity;
  String posterPath;
  String originalTitle;
  List <int> genreIds;
  String backdropPath;
  bool adult;
  String overview;
  String releaseDate;
  String originalLanguage;

  getPosterImg() {
    if (posterPath == null) {
      return 'https://cdn11.bigcommerce.com/s-hcp6qon/stencil/01eb2250-b30a-0137-ba33-0242ac110046/icons/icon-no-image.svg';
    }else {
      return 'https://image.tmdb.org/t/p/w500/$posterPath';
    }
  }

  Pelicula({
    this.voteCount,
    this.voteAverage,
    this.id,
    this.video,
    this.title,
    this.popularity,
    this.posterPath,
    this.originalTitle,
    this.genreIds,
    this.backdropPath,
    this.adult,
    this.overview,
    this.releaseDate,
    this.originalLanguage
  });

  Pelicula.fromJsonMap(Map<String, dynamic> json) {
        voteCount = json['vote_count'];
        voteAverage = json['vote_average'] / 1;
        id = json['id'];
        video = json['video'];
        title = json['title'];
        popularity = json['popularity'] / 1;
        posterPath = json['poster_path'];
        originalTitle = json['original_title'];
        genreIds = json['genre_ids'].cast<int>();
        backdropPath = json['backdrop_path'];
        adult = json['adult'];
        overview = json['overview'];
        releaseDate = json['release_date'];
        originalLanguage = json['original_language'];
  } 

}