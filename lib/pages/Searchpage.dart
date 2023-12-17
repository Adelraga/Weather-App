import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:weather/Cubit/weather_cubit/weather_cubit.dart';
import 'package:weather/models/weather_model.dart';
import 'package:weather/providers/weather_provider.dart';
import 'package:weather/services/weather_services.dart';

// ignore: must_be_immutable
class Searchpage extends StatelessWidget {
//var mycontroller= TextEditingController();
  String? cityname;

  Searchpage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search a city"),
        backgroundColor: Color.fromARGB(255, 181, 168, 46),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Center(
          child: TextField(
              //controller: mycontroller ,
              onSubmitted: (data) async {
                cityname = data;
                BlocProvider.of<WeatherCubit>(context).getWeather(cityname: cityname!);
                BlocProvider.of<WeatherCubit>(context).cityName =cityname;

              Navigator.pop(context);
              },
              decoration: InputDecoration(
                  label: Text("Search"),
                  suffix: Icon(Icons.search),
                  hintText: "Enter the name of your City",
                  border: OutlineInputBorder())),
        ),
      ),
    );
  }
}
