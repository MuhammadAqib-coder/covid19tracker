import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CountryDetail extends StatelessWidget {
  const CountryDetail(
      {Key? key,
      required this.name,
      required this.flag,
      required this.deaths,
      required this.covered,
      required this.population,
      required this.cases})
      : super(key: key);
  final String name, flag;
  final int deaths, covered, population, cases;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(name)),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 10, top: 60),
                child: Column(
                  children: [
                    ReusableWidget(title: "Deaths", value: deaths.toString()),
                    ReusableWidget(title: 'Covered', value: covered.toString()),
                    ReusableWidget(
                        title: "population", value: cases.toString()),
                    ReusableWidget(title: "cases", value: cases.toString())
                  ],
                ),
              ),
              CircleAvatar(
                radius: 40.h,
                backgroundImage: NetworkImage(flag),
              )
            ],
          )
        ],
      ),
    );
  }
}

class ReusableWidget extends StatelessWidget {
  final String title, value;
  const ReusableWidget({Key? key, required this.title, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text(title), Text(value)],
          ),
          SizedBox(
            height: 15.h,
          ),
          Divider()
        ],
      ),
    );
  }
}
