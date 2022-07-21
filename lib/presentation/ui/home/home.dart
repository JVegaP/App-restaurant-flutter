import 'package:animate_do/animate_do.dart';
import 'package:app_restaurant_flutter/core/utils/strings.dart';
import 'package:app_restaurant_flutter/presentation/provider/home/home_provider.dart';
import 'package:app_restaurant_flutter/presentation/ui/home/widgets/list_restaurants.dart';
import 'package:app_restaurant_flutter/presentation/widgets/app_bar.dart';
import 'package:app_restaurant_flutter/presentation/widgets/text_input_custom.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget{
  const HomePage({Key? key}) : super(key: key);
  @override
  Home createState()=> Home();
}

class Home extends State<HomePage> with SingleTickerProviderStateMixin{
  late HomeProvider provider;
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    provider = Provider.of<HomeProvider>(context,listen: false);
    WidgetsBinding.instance.addPostFrameCallback((_) async{
      _loadRestaurants();
    });
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<HomeProvider>(this.context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Padding(padding: const EdgeInsets.only(top: 130),
                  child: listRestaurants(
                      context,
                      provider.restaurant
                  )
              ),
              Column(
                children: [
                  appBar(context, false),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Row(
                      children: [
                        FadeInLeft(
                          delay: const Duration(milliseconds: 250),
                          duration: const Duration(milliseconds: 500),
                          child: TextInputCustom(
                            placeHolder: Strings.search,
                            controller: searchController,
                            keyboard: TextInputType.text,
                            validationText: "",
                            onChanged: (value) {
                              if(value.isEmpty){
                                provider.loaRestaurants();
                              }
                              provider.searchRestaurants(value);
                            },
                          ),
                        ),
                        const SizedBox(width: 10),
                        InkWell(
                          onTap: () {},
                          child: FadeInRight(
                              delay: const Duration(milliseconds: 150),
                              duration: const Duration(milliseconds: 350),
                              child: Material(
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                    decoration: const BoxDecoration(
                                        color: Colors.blueAccent,
                                        shape: BoxShape.circle
                                    ),
                                    child: const Icon(
                                        Icons.add_location_sharp, color: Colors.white, size: 25)
                                ),
                              )
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  _loadRestaurants() async{
    provider.loaRestaurants();
  }

}