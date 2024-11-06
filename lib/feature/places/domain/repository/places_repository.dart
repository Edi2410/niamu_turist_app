import 'package:dartz/dartz.dart';
import 'package:niamu_project/core/error/failure.dart';
import 'package:niamu_project/feature/places/domain/entity/place.dart';

abstract interface class PlacesRepository {
  Future<Either<Failure, List<Place>?>> getAllPlaces();

  Future<Either<Failure, Place?>> getPlaceById(final int placeId);

  Future<Either<Failure, void>> addPlace(final Place place);

  Future<Either<Failure, void>> deletePlace(final int placeId);
}
