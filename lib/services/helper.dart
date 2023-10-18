import 'package:ecommerce/model/productcart.dart';
import 'package:flutter/services.dart' as the_bundle;
import '';

// this class fetches data from the json file and return it to the app
class helper {
  // Male
  Future<List<Sneakers>> getMaleSneakers() async {
    final data = await the_bundle.rootBundle.loadString("json/men_shoes.json");

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
    final data = await the_bundle.rootBundle.loadString("json/kids_shoes.json");

    final kidsList = sneakersFromJson(data);

    print(kidsList);

    return kidsList;
  }

  // Single Male
  Future<Sneakers> getMaleSneakersById(String id) async {
    final data = await the_bundle.rootBundle.loadString("json/men_shoes.json");

    final maleList = sneakersFromJson(data);

    final sneaker = maleList.firstWhere((sneaker) => sneaker.id == id);

    return sneaker;
  }

// getting fav list
  Future<List<Sneakers>> getListMaleSneakersById(
      List<String> id, List<String> categrory, List<String> fav) async {
    final data = await the_bundle.rootBundle.loadString("json/men_shoes.json");

    final maleList = sneakersFromJson(data);

    final data2 =
        await the_bundle.rootBundle.loadString("json/women_shoes.json");

    final femaleList = sneakersFromJson(data2);

    final data3 =
        await the_bundle.rootBundle.loadString("json/kids_shoes.json");

    final kidsList = sneakersFromJson(data3);

    List<Sneakers> sneaker = [];

    int index = 0;

    id.forEach((element) {
      if (categrory[index] == "Men's Running" && fav[index] == 'true') {
        final temp = maleList.firstWhere((sneaker) => sneaker.id == element);
        sneaker.add(temp);
        // add male fav shoes
      } else if (categrory[index] == "Women's Running" &&
          fav[index] == 'true') {
        final temp = femaleList.firstWhere((sneaker) => sneaker.id == element);
        sneaker.add(temp);

        // add female shoes
      } else if (categrory[index] == "Kids' Running" && fav[index] == 'true') {
        final temp = kidsList.firstWhere((sneaker) => sneaker.id == element);
        sneaker.add(temp);
      } else {}
      index++;
    });

    return sneaker;
  }

  Future<List<Sneakers>> getuserSearchedShoes(String shoe_name) async {
    List<Sneakers> searchedShoe = [];
    final data = await the_bundle.rootBundle.loadString("json/men_shoes.json");

    final maleList = sneakersFromJson(data);

    final data2 =
        await the_bundle.rootBundle.loadString("json/women_shoes.json");

    final femaleList = sneakersFromJson(data2);

    final data3 =
        await the_bundle.rootBundle.loadString("json/kids_shoes.json");

    final kidsList = sneakersFromJson(data3);

    maleList.forEach((element) {
      if (element.name.toLowerCase().contains(shoe_name)) {
        searchedShoe.add(element);
      }
    });

    femaleList.forEach((element) {
      if (element.name.toLowerCase().contains(shoe_name)) {
        searchedShoe.add(element);
      }
    });

    kidsList.forEach((element) {
      if (element.name.toLowerCase().contains(shoe_name)) {
        searchedShoe.add(element);
      }
    });

    return searchedShoe;
  }

  Future<List<Sneakers>> getListCARTSneakersById(
      List<String> id, List<String> categrory, List<String> fav) async {
    print(id);
    print(categrory);
    print(fav);

    final data = await the_bundle.rootBundle.loadString("json/men_shoes.json");

    final maleList = sneakersFromJson(data);

    final data2 =
        await the_bundle.rootBundle.loadString("json/women_shoes.json");

    final femaleList = sneakersFromJson(data2);

    final data3 =
        await the_bundle.rootBundle.loadString("json/kids_shoes.json");

    final kidsList = sneakersFromJson(data3);

    List<Sneakers> sneaker = [];

    int index = 0;

    id.forEach((element) {
      print(categrory[index]);
      print(fav[index]);
      print(element);
      if (categrory[index] == "Men's Running" && fav[index] == 'true') {
        final temp = maleList.firstWhere((sneaker) => sneaker.id == element);
        sneaker.add(temp);
        // add male fav shoes
      } else if (categrory[index] == "Women's Running" &&
          fav[index] == 'true') {
        final temp = femaleList.firstWhere((sneaker) => sneaker.id == element);
        sneaker.add(temp);

        // add female shoes
      } else if (categrory[index] == "Kids' Running" && fav[index] == 'true') {
        final temp = kidsList.firstWhere((sneaker) => sneaker.id == element);
        sneaker.add(temp);
      } else {}
      index++;
    });

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
    final data = await the_bundle.rootBundle.loadString("json/kids_shoes.json");

    final maleList = sneakersFromJson(data);

    final sneaker = maleList.firstWhere((sneaker) => sneaker.id == id);

    return sneaker;
  }
}
