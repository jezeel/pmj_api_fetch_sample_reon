import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pmj_api_integration_reon/models/list_card_model.dart';
import '../widgets/f_page_list_card.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  Future<ListCarModel> listCarData() async {
    var response = await http.get(
      Uri.parse('https://mobiledev.refogen.com/api/v1/cars/getAllCars'),
    );
    print(response.body);
    // if (response.statusCode == 200) {
    final jsonData = jsonDecode(response.body);
    print(jsonData);
    return ListCarModel.fromMap(jsonData);
    // } else {
    //   print("failed");
    //
    //   return GetOrderList.fromJson();
    // }
  }

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Positioned(
                      child: Container(
                    width: size.width,
                    height: 200,
                    color: Colors.grey.shade800,
                  )),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 25, vertical: 90),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Heading",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 20),
                          child: SingleChildScrollView(
                            child: FutureBuilder<ListCarModel>(
                                future: widget.listCarData(),
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    ListCarModel? data = snapshot.data;
                                    return ListView.builder(
                                        scrollDirection: Axis.vertical,
                                        shrinkWrap: true,
                                        itemCount: data!.data!.length,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return FPageListCard(
                                            carName: data.data![index].carName,
                                            firstDiscriptIcon: Icons.directions_car,
                                            firstDiscriptName: "Transmission",
                                            firstDiscriptValue: data.data![index].carTransmission.toString().replaceAll('CarTransmission', '').replaceAll('.', ''),
                                            secondDiscriptIcon: Icons.data_usage,
                                            secondDiscriptName: "Wheel Type",
                                            secondDiscriptValue: data.data![index].carWheelType.toString().replaceAll('CarWheelType', '').replaceAll('.', ''),
                                            thirdDiscriptIcon:
                                                Icons.electric_car_rounded,
                                            thirdDiscriptName: "Suspension",
                                            thirdDiscriptValue: data.data![index].carSuspension.toString().replaceAll('CarSuspension', '').replaceAll('.', ''),
                                            fourthDiscriptIcon: Icons.highlight,
                                            fourthDiscriptName: "Head Light",
                                            fourthDiscriptValue: data.data![index].carHeadlightType.toString().replaceAll('CarHeadlightType', '').replaceAll('.', ''),
                                            onTap: () {},
                                          );
                                        });
                                  } else {
                                    return const Center(
                                        child: CircularProgressIndicator());
                                  }
                                }),
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
    );
  }
}
