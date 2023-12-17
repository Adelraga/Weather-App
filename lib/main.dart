import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:weather/Cubit/weather_cubit/weather_cubit.dart';
import 'package:weather/providers/weather_provider.dart';
import 'package:weather/services/weather_services.dart';

// ignore: unused_import
import 'models/weather_model.dart';
import 'pages/home_page.dart';

void main() {
  runApp(BlocProvider(
    create: (BuildContext context) { 
        return WeatherCubit(WeatherServices());
      },

      child: WeatherApp()
  ));
}

// ignore: must_be_immutable
class WeatherApp extends StatelessWidget {
  WeatherModel? weather;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
       // primarySwatch: Provider.of<WeatherProvider>(context).weatherData == null ? Colors.blue : Provider.of<WeatherProvider>(context).weatherData!.getThemeColor()
      ),
      home: HomePage(),
    );
  }
}
