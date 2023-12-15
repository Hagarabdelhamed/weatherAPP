
import 'package:app/Services/weatherService.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../models/weatherModel.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Search City",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xff5FBDFF),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          //For search using text field
          child: TextField(
            //using this function if i need in the search a recommendition Values(Search)
            // onChanged: (value){},

            //ussing this function if i need the value to be subimeted only (CHAT , LOGIN)
            onSubmitted: (value) async 
            {
               weatherModel = await WeatherService(dio: Dio()).getCurrentWeather(cityName: value);
              //to get the weather page after search
              // ignore: use_build_context_synchronously
              Navigator.pop(context);
            },
            // The first text field is focused on as soon as the app starts.
            autofocus: true,
            decoration: const InputDecoration(
              //focusedBorder after i press on the text field
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xff5FBDFF),
                  width: 2,
                ),
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 30, horizontal: 8),
              labelText: 'Search',
              labelStyle: TextStyle(
                color: Color.fromARGB(190, 95, 188, 255),
                fontWeight: FontWeight.bold,
              ),
              hintText: "Enter City Name",
              suffixIcon: Icon(Icons.search),
              
              //border before i pressed on it
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              // enabledBorder: OutlineInputBorder(borderSide:BorderSide(color:Color.fromARGB(255, 221, 4, 4)) ),
            ),
          ),
        ),
      ),
    );
  }
}

//global var to be able to access this object in another page
WeatherModel? weatherModel;