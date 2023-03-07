import 'dart:async';

import 'package:injectable/injectable.dart';

import '../../../../../core/core.dart';
import '../../domain/domain.dart';

abstract class HousesDataSource {
  FutureOr<List<HouseEntity>> fetchAllHouses();
}

@Injectable(as: HousesDataSource)
class HousesDataSourceImpl implements HousesDataSource {
  HousesDataSourceImpl(this._client);

  final CustomHttpClient _client;

  @override
  FutureOr<List<HouseEntity>> fetchAllHouses() async {
    try {
      final response = await _client.get(url: '/Houses');
      final houses = HouseEntity.listFromJsonHouseEntity(response.data);
      return houses;
    } catch (e) {
      throw DefaultException(
        message: e.toString(),
      );
    }
  }
}
