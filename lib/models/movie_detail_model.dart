// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:app_filmes/models/cast_model.dart';
import 'package:app_filmes/models/genres_model.dart';

class MovieDetailModel {
  final String title;
  final double stars;
  final List<GenresModel> genres;
  final List<String> urlImages;
  final DateTime releaseDate;
  final String overview;
  final List<String> productionCompanies;
  final String originalLanguage;
  final List<CastModel> cast;
  MovieDetailModel({
    required this.title,
    required this.stars,
    required this.genres,
    required this.urlImages,
    required this.releaseDate,
    required this.overview,
    required this.productionCompanies,
    required this.originalLanguage,
    required this.cast,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'stars': stars,
      'genres': genres.map((x) => x.toMap()).toList(),
      'urlImages': urlImages,
      'releaseDate': releaseDate.millisecondsSinceEpoch,
      'overview': overview,
      'productionCompanies': productionCompanies,
      'originalLanguage': originalLanguage,
      'cast': cast.map((x) => x.toMap()).toList(),
    };
  }

  factory MovieDetailModel.fromMap(Map<String, dynamic> map) {
    var urlImagesPosters = map['images']['posters'];
    var urlImages = urlImagesPosters
            ?.map<String>(
                (i) => 'https://image.tmdb.org/t/p/w200${i['file_path']}')
            .toList() ??
        [];

    return MovieDetailModel(
      title: map['title'] ?? '',
      stars: map['vote_average'] ?? 0.0,
      genres: List<GenresModel>.from(
        map['genres'].map<GenresModel>(
          (x) => GenresModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      urlImages: urlImages,
      releaseDate: DateTime.parse(map['release_date']),
      overview: map['overview'] ?? '',
      productionCompanies: List<dynamic>.from(map['production_companies'] ?? [])
          .map<String>((c) => c['name'])
          .toList(),
      originalLanguage: map['original_language'] ?? '',
      cast: List<CastModel>.from(
        map['credits']['cast'].map<CastModel>(
          (x) => CastModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory MovieDetailModel.fromJson(String source) =>
      MovieDetailModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
