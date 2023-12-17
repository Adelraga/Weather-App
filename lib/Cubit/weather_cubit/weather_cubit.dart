import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/Cubit/weather_cubit/weather_state.dart';
import 'package:weather/models/weather_model.dart';
import 'package:weather/services/weather_services.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit(this.weatherService) : super(WeatherInitial());
  WeatherServices weatherService;
  WeatherModel? weatherModel;
  String ? cityName;
  void getWeather({required String cityname}) async {
    emit(WeatherLoading());
    try {
      weatherModel = await weatherService.getWeather(cityname: cityname);
      emit(WeatherSuccess());
    } on Exception catch (e) {
      emit(WeatherFailure());
    }
  }
}
