import 'package:app_restaurant_flutter/domain/entities/home/restaurant.dart';
import 'package:flutter/material.dart';

class HomeProvider with ChangeNotifier {
  late List<Restaurant> _restaurant = [];
  List<Restaurant> get restaurant {
    return _restaurant;
  }
  set restaurant(List<Restaurant> restaurant) {
    _restaurant = restaurant;
    notifyListeners();
  }

  /// Init view home
  loaRestaurants() {
    List<Restaurant> restaurantList = [];
    restaurantList.add(
        Restaurant(
            name: "El sazon",
            city: "Bogotá",
            distance: 225
        )
    );
    restaurantList.add(
        Restaurant(
            name: "Corral",
            city: "Bogotá",
            distance: 550
        )
    );
    restaurantList.add(
        Restaurant(
            name: "La plaza centro",
            city: "Bogotá",
            distance: 487
        )
    );
    restaurantList.add(
        Restaurant(
            name: "La casa Gourmet",
            city: "Medellin",
            distance: 10500
        )
    );
    restaurantList.add(
        Restaurant(
            name: "El paisa",
            city: "Medellin",
            distance: 11240
        )
    );
    restaurantList.add(
        Restaurant(
            name: "La plazita",
            city: "Medellin",
            distance: 9987
        )
    );
    restaurant = restaurantList;
  }

  /// Search restaurant by city
  searchRestaurants(String city) {
    List<Restaurant> restaurants = [];
    for(var item in restaurant) {
      if(item.city.trim().toLowerCase().contains(city.trim().toLowerCase())) {
        restaurants.add(item);
      }
    }
    restaurants.sort((a, b) => a.distance.compareTo(b.distance));
    restaurant = restaurants;
  }
}