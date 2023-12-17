// ignore_for_file: dead_code

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:weather/Cubit/weather_cubit/weather_cubit.dart';
import 'package:weather/Cubit/weather_cubit/weather_state.dart';
import 'package:weather/models/weather_model.dart';
import 'package:weather/providers/weather_provider.dart';

import 'Searchpage.dart';

class HomePage extends StatelessWidget {
  WeatherModel? weatherdata;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Searchpage();
                  }));
                },
                icon: Icon(Icons.search)),
          ],
          title: Text('Weather App'),
        ),
        body:
            BlocBuilder<WeatherCubit, WeatherState>(builder: (context, State) {
          if (State is WeatherLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (State is WeatherSuccess) {
            weatherdata = BlocProvider.of<WeatherCubit>(context).weatherModel;
            return Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Spacer(
                    flex: 1,
                  ),
                  Text(
                    '25°C',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    BlocProvider.of<WeatherCubit>(context).cityName!,
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Spacer(
                    flex: 1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(weatherdata!.getImage()),
                      Text(
                        '30',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Column(
                        children: [
                          Text('maxTemp: ${weatherdata?.maxTemp.toInt()}'),
                          Text('minTemp: ${weatherdata?.minTemp.toInt()}'),
                        ],
                      )
                    ],
                  ),
                  Spacer(
                    flex: 1,
                  ),
                  Text(
                    weatherdata!.weatherStateName,
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(
                    flex: 1,
                  ),
                ],
              ),
            );
          } else if (State is WeatherFailure) {
            return Center(child: Text("Error"));
          } else {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'there is no weather 😔 start',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                  Text(
                    'searching now 🔍',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  )
                ],
              ),
            );
          }
        }));
  }
}
