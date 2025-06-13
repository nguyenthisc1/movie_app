import 'package:movie_app/core/entities/movie_trailer_entity.dart';
import 'package:movie_app/core/models/movie_trailer_model.dart';

class MovieTrailerMapper {
  static TrailerEntity toEntity(TrailerModel model) {
    return TrailerEntity(
      iso6391: model.iso6391,
      iso31661: model.iso31661,
      name: model.name,
      key: model.key,
      site: model.site,
      size: model.size,
      type: model.type,
      official: model.official,
      publishedAt: model.publishedAt,
      id: model.id,
    );
  }
}
