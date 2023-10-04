import 'package:ecommerce/model/productcart.dart';
import 'package:flutter/services.dart' as the_bundle;
import '';

// this class fetches data from the json file and return it to the app
class helper {
  // Male
  Future<List<Sneakers>> getMaleSneakers() async {
    final data =
        await the_bundle.rootBundle.loadString("json/men_shoes.json");

    final maleList = sneakersFromJson(data);

    print(maleList);

    return maleList;
  }

// Female
  Future<List<Sneakers>> getFemaleSneakers() async {
    final data =
        await the_bundle.rootBundle.loadString("json/women_shoes.json");

    final femaleList = sneakersFromJson(data);

    print(femaleList);

    return femaleList;
  }

// Kids
  Future<List<Sneakers>> getKidsSneakers() async {
    final data =
        await the_bundle.rootBundle.loadString("json/kids_shoes.json");

    final kidsList = sneakersFromJson(data);

    print(kidsList);

    return kidsList;
  }

  // Single Male
  Future<Sneakers> getMaleSneakersById(String id) async {
    final data =
        await the_bundle.rootBundle.loadString("json/men_shoes.json");

    final maleList = sneakersFromJson(data);

    final sneaker = maleList.firstWhere((sneaker) => sneaker.id == id);

    return sneaker;
  }

    // Single Male
  Future<Sneakers> getFemaleSneakersById(String id) async {
    final data =
        await the_bundle.rootBundle.loadString("json/women_shoes.json");

    final maleList = sneakersFromJson(data);

    final sneaker = maleList.firstWhere((sneaker) => sneaker.id == id);

    return sneaker;
  }


    // Single Kids
  Future<Sneakers> getKidsSneakersById(String id) async {
    final data =
        await the_bundle.rootBundle.loadString("json/kids_shoes.json");

    final maleList = sneakersFromJson(data);

    final sneaker = maleList.firstWhere((sneaker) => sneaker.id == id);

    return sneaker;
  }
}
