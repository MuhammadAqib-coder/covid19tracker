import 'dart:async';

import 'package:covid19_tracker/models/world_states_model.dart';
import 'package:covid19_tracker/services/state_services.dart';
import 'package:covid19_tracker/view/country_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pie_chart/pie_chart.dart';

class WorldStateScreen extends StatefulWidget {
  const WorldStateScreen({Key? key}) : super(key: key);

  @override
  State<WorldStateScreen> createState() => _WorldStateScreenState();
}

class _WorldStateScreenState extends State<WorldStateScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 3))
          ..repeat();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(15.h),
        child: Column(
          children: [
            SizedBox(
              height: 10.h,
            ),
            FutureBuilder<WorldStatesModel>(
                future: StateServices().getStateServices(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      children: [
                        PieChart(
                          dataMap: {
                            'Total': snapshot.data!.cases.toDouble(),
                            'Recovered': snapshot.data!.recovered.toDouble(),
                            'Death': snapshot.data!.deaths.toDouble()
                          },
                          chartValuesOptions: const ChartValuesOptions(
                              showChartValuesInPercentage: true),
                          animationDuration: const Duration(milliseconds: 1200),
                          chartRadius: MediaQuery.of(context).size.width / 3.2,
                          colorList: colorList,
                          chartType: ChartType.ring,
                          legendOptions: const LegendOptions(
                              legendPosition: LegendPosition.left),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: 30.h, right: 5.w, left: 5.w, bottom: 15.h),
                          child: Card(
                            margin: EdgeInsets.only(top: 30.h, bottom: 30.h),
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: 15.w,
                                  right: 15.w,
                                  bottom: 10.h,
                                  top: 15.h),
                              child: Column(children: [
                                ReusableWidget(
                                    title: 'Active',
                                    value: snapshot.data!.active.toString()),
                                ReusableWidget(
                                    title: 'Critical',
                                    value: snapshot.data!.critical.toString()),
                                ReusableWidget(
                                    title: 'Population',
                                    value:
                                        snapshot.data!.population.toString()),
                                ReusableWidget(
                                    title: 'Tests',
                                    value: snapshot.data!.tests.toString())
                              ]),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => CountrtList()));
                          },
                          child: Container(
                            height: 50.h,
                            decoration: BoxDecoration(
                                color: colorList[1],
                                borderRadius: BorderRadius.circular(10)),
                            child: const Center(child: Text('Track Country')),
                          ),
                        )
                      ],
                    );
                  } else {
                    return Expanded(
                        flex: 1,
                        child: SpinKitFadingCircle(
                          color: Colors.black,
                          controller: _controller,
                        ));
                  }
                }),
          ],
        ),
      )),
    );
  }

  final colorList = [Color(0xff4285F4), Color(0xff1aa260), Color(0xffde5246)];
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
