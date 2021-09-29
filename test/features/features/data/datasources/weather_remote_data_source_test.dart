import 'dart:convert';

import 'package:flutter_projects/core/error/exceptions.dart';
import 'package:flutter_projects/features/weather/data/datasources/weather_remote_data_source.dart';
import 'package:flutter_projects/features/weather/data/models/five_day_weather_forecast.dart';
import 'package:flutter_projects/features/weather/data/models/weather_response_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

import '../../../fixtures/fixture_reader.dart';

class MockHttpClient extends Mock implements http.Client {}

void main(){
  WeatherRemoteDataSourceImpl? dataSource;
  MockHttpClient? mockHttpClient;

  final tLat = -33.9493;
  final tLon = 18.53;
  final tApiKey = '6968ada2271ff56637317e5c6ad43ab0';

  setUp(() {
    mockHttpClient = MockHttpClient();
    dataSource = WeatherRemoteDataSourceImpl(client: mockHttpClient);
  });

  void setUpMockHttpClientSuccess200() {
    when(mockHttpClient?.get(Uri(path: any), headers: anyNamed('headers')))
        .thenAnswer((_) async => http.Response(fixture('response.json'), 200));
  }

  void setUpMockHttpClientFailure404() {
    when(mockHttpClient?.get(Uri(path: any), headers: anyNamed('headers')))
        .thenAnswer((_) async => http.Response('Something went wrong', 404));
  }

  group('getWeatherUpdate', (){
    final tWeatherResponseModel =
    WeatherResponseModel.fromJson(json.decode(fixture('response.json')));

    test(
      '''should perform a POST request on a URL with current location and api key 
       being the endpoint and with application/json header''',
          () async* {
        // arrange
        setUpMockHttpClientSuccess200();
        // act
        dataSource?.getWeatherUpdate(tLat, tLon, tApiKey);
        // assert
        verify(mockHttpClient?.post(
          Uri(path: 'http://api.openweathermap.org/data/2.5/weather?lat=$tLat&lon=$tLon&appid=$tApiKey'),
          headers: {
            'Content-Type': 'application/json',
          },
        ));
      },
    );

    test(
      'should return WeatherResponseModel when the response code is 200 (success)',
          () async* {
        // arrange
        setUpMockHttpClientSuccess200();
        // act
        final result = await dataSource?.getWeatherUpdate(tLat, tLon, tApiKey);
        // assert
        expect(result, equals(tWeatherResponseModel));
      },
    );

    test(
      'should throw a ServerException when the response code is 404 or other',
          () async* {
        // arrange
        setUpMockHttpClientFailure404();
        // act
        final call = dataSource?.getWeatherUpdate;
        // assert
        expect(() => call!(tLat, tLon, tApiKey), throwsA(TypeMatcher<ServerException>()));
      },
    );
  });

  group('getFiveDayForecast', (){
    final tFiveDayForecastModel =
    FiveDayForecastModel.fromJson(json.decode(fixture('response.json')));

    test(
      '''should perform a POST request on a URL with current location and api key 
       being the endpoint and with application/json header''',
          () async* {
        // arrange
        setUpMockHttpClientSuccess200();
        // act
        dataSource?.getFiveDayForecast(tLat, tLon, tApiKey);
        // assert
        verify(mockHttpClient?.post(
          Uri(path: 'http://api.openweathermap.org/data/2.5/forecast?lat=$tLat&lon=$tLon&appid=$tApiKey'),
          headers: {
            'Content-Type': 'application/json',
          },
        ));
      },
    );

    test(
      'should return FiveDayForecastModel when the response code is 200 (success)',
          () async* {
        // arrange
        setUpMockHttpClientSuccess200();
        // act
        final result = await dataSource?.getFiveDayForecast(tLat, tLon, tApiKey);
        // assert
        expect(result, equals(tFiveDayForecastModel));
      },
    );

    test(
      'should throw a ServerException when the response code is 404 or other',
          () async* {
        // arrange
        setUpMockHttpClientFailure404();
        // act
        final call = dataSource?.getFiveDayForecast;
        // assert
        expect(() => call!(tLat, tLon, tApiKey), throwsA(TypeMatcher<ServerException>()));
      },
    );

  });
}