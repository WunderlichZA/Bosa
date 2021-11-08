import 'package:dartz/dartz.dart';
import 'package:flutter_projects/core/error/exceptions.dart';
import 'package:flutter_projects/core/error/failures.dart';
import 'package:flutter_projects/features/weather/data/datasources/weather_remote_data_source.dart';
import 'package:flutter_projects/features/weather/data/models/clouds_model.dart';
import 'package:flutter_projects/features/weather/data/models/five_day_weather_forecast.dart';
import 'package:flutter_projects/features/weather/data/models/weather_response_model.dart';
import 'package:flutter_projects/features/weather/data/repositories/weather_repository_impl.dart';
import 'package:flutter_projects/features/weather/domain/entities/city.dart';
import 'package:flutter_projects/features/weather/domain/entities/coordinates.dart';
import 'package:flutter_projects/features/weather/domain/entities/list_item.dart';
import 'package:flutter_projects/features/weather/domain/entities/main.dart';
import 'package:flutter_projects/features/weather/domain/entities/sys.dart';
import 'package:flutter_projects/features/weather/domain/entities/weather.dart';
import 'package:flutter_projects/features/weather/domain/entities/wind.dart';
import 'package:flutter_projects/network/network_info.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockRemoteDataSource extends Mock implements WeatherRemoteDataSource {}

class MockNetworkInfo extends Mock implements NetworkInfo {}

void main() {
  WeatherRepositoryImpl? repository;
  MockRemoteDataSource? mockRemoteDataSource;
  late MockNetworkInfo mockNetworkInfo;

  final tLat = -33.9493;
  final tLon = 18.53;
  final tApiKey = '6968ada2271ff56637317e5c6ad43ab0';

  setUp(() {
    mockRemoteDataSource = MockRemoteDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repository = WeatherRepositoryImpl(
      dataSource: mockRemoteDataSource,
      networkInfo: mockNetworkInfo,
    );
  });

  void runTestsOnline(Function body) {
    group('device is online', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });

      body();
    });
  }

  void runTestsOffline(Function body) {
    group('device is offline', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
      });

      body();
    });
  }

  group('getFiveDayForecast', () {
    final tFiveDayForecast = FiveDayForecastModel(
      message: 1,
      list: <ListItem>[],
      cod: 200,
      cnt: 1,
      city: City(
        timezone: 7200,
        sunset: 1,
        sunrise: 1,
        population: 14,
        name: 'Pinelands',
        id: 3362864,
        country: 'South Africa',
        coord: Coord(lon: 18.53, lat: -33.9493),
      ),
    );

    test(
      'should check if the device is online',
          () async* {
        // arrange
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
        // act
        repository?.getWeatherUpdate(tLat, tLon, tApiKey);
        // assert
        verify(mockNetworkInfo.isConnected);
      },
    );

    runTestsOnline(() {
      test(
          'should return remote data when the call to remote data source is successful',
              () async* {
            // arrange
            when(mockRemoteDataSource?.getFiveDayForecast(tLat, tLon, tApiKey))
                .thenAnswer((_) async => tFiveDayForecast);
            // act
            final result = await repository?.getFiveDayForecast(tLat, tLon, tApiKey);
            // assert
            verify(mockRemoteDataSource?.getFiveDayForecast(tLat, tLon, tApiKey));
            expect(result, equals(Right(tFiveDayForecast)));
          });
    });

    runTestsOffline(() {
      test(
          'should return server failure when the call to remote data source is unsuccessful',
              () async* {
            // arrange
            when(mockRemoteDataSource?.getFiveDayForecast(tLat, tLon, tApiKey))
                .thenThrow(ServerException());
            // act
            final result = await repository?.getFiveDayForecast(tLat, tLon, tApiKey);
            // assert
            verify(mockRemoteDataSource?.getFiveDayForecast(tLat, tLon, tApiKey));
            verifyZeroInteractions(mockRemoteDataSource);
            expect(result, equals(Left(ServerFailure())));
          });
    });

  });

  group('getWeatherUpdate', () {
    final tCloudsModel = CloudsModel(all: 0);
    final tWeatherModel = WeatherResponseModel(
        base: 'stations',
        clouds: tCloudsModel,
        cod: 200,
        coord: Coord(lon: 18.53, lat: -33.9493),
        dt: 1630971862,
        id: 3362864,
        main: Main(),
        name: 'Pinelands',
        sys: Sys(),
        timezone: 7200,
        visibility: 10000,
        weather: <Weather>[],
        wind: Wind(deg: 170, speed: 6.7));

    test(
      'should check if the device is online',
      () async* {
        // arrange
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
        // act
        repository?.getWeatherUpdate(tLat, tLon, tApiKey);
        // assert
        verify(mockNetworkInfo.isConnected);
      },
    );

    runTestsOnline(() {
      test(
          'should return remote data when the call to remote data source is successful',
          () async* {
        // arrange
        when(mockRemoteDataSource?.getWeatherUpdate(tLat, tLon, tApiKey))
            .thenAnswer((_) async => tWeatherModel);
        // act
        final result = await repository?.getWeatherUpdate(tLat, tLon, tApiKey);
        // assert
        verify(mockRemoteDataSource?.getWeatherUpdate(tLat, tLon, tApiKey));
        expect(result, equals(Right(tWeatherModel)));
      });
    });

    runTestsOffline(() {
      test(
          'should return server failure when the call to remote data source is unsuccessful',
          () async* {
        // arrange
        when(mockRemoteDataSource?.getWeatherUpdate(tLat, tLon, tApiKey))
            .thenThrow(ServerException());
        // act
        final result = await repository?.getWeatherUpdate(tLat, tLon, tApiKey);
        // assert
        verify(mockRemoteDataSource?.getWeatherUpdate(tLat, tLon, tApiKey));
        verifyZeroInteractions(mockRemoteDataSource);
        expect(result, equals(Left(ServerFailure())));
      });
    });
  });
}
