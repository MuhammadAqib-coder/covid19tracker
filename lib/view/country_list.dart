import 'package:covid19_tracker/models/country_list_model.dart';
import 'package:covid19_tracker/services/state_services.dart';
import 'package:covid19_tracker/view/country_detail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class CountrtList extends StatefulWidget {
  const CountrtList({Key? key}) : super(key: key);

  @override
  State<CountrtList> createState() => _CountrtListState();
}

class _CountrtListState extends State<CountrtList>
    with TickerProviderStateMixin {
  var searchControler = TextEditingController();
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
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: const Text('Country List'),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 10.h,
            ),
            TextField(
              onChanged: (value) {
                setState(() {});
              },
              controller: searchControler,
              decoration: InputDecoration(
                  hintText: 'search country by name',
                  contentPadding: EdgeInsets.symmetric(horizontal: 20.w),
                  suffixIcon: const Icon(
                    Icons.search,
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.h),
                      borderSide: BorderSide(),
                      gapPadding: 20.w)),
            ),
            SizedBox(
              height: 20.h,
            ),
            Expanded(
              child: FutureBuilder<List<dynamic>>(
                  future: StateServices().getCountriesList(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          String name = snapshot.data![index]['country'];
                          if (searchControler.text.isEmpty) {
                            return Card(
                              child: ListTile(
                                leading: CircleAvatar(
                                    backgroundImage: NetworkImage(snapshot
                                        .data![index]['countryInfo']['flag'])),
                                title: Text(snapshot.data![index]['country']),
                                subtitle: Text(
                                    snapshot.data![index]['cases'].toString()),
                                onTap: () {
                                  var flag = snapshot.data![index]
                                      ['countryInfo']['flag'];
                                  var deaths = snapshot.data![index]['deaths'];
                                  var covered =
                                      snapshot.data![index]['recovered'];
                                  var population =
                                      snapshot.data![index]['population'];
                                  var cases = snapshot.data![index]['cases'];
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => CountryDetail(
                                              name: name,
                                              flag: flag,
                                              deaths: deaths,
                                              covered: covered,
                                              population: population,
                                              cases: cases)));
                                },
                              ),
                            );
                          } else if (name
                              .toLowerCase()
                              .contains(searchControler.text.toLowerCase())) {
                            return Card(
                              child: ListTile(
                                leading: CircleAvatar(
                                    backgroundImage: NetworkImage(snapshot
                                        .data![index]['countryInfo']['flag'])),
                                title: Text(snapshot.data![index]['country']),
                                subtitle: Text(
                                    snapshot.data![index]['cases'].toString()),
                                onTap: () {
                                  var flag = snapshot.data![index]
                                      ['countryInfo']['flag'];
                                  var deaths = snapshot.data![index]['deaths'];
                                  var covered =
                                      snapshot.data![index]['recovered'];
                                  var population =
                                      snapshot.data![index]['population'];
                                  var cases = snapshot.data![index]['cases'];
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => CountryDetail(
                                              name: name,
                                              flag: flag,
                                              deaths: deaths,
                                              covered: covered,
                                              population: population,
                                              cases: cases)));
                                },
                              ),
                            );
                          } else {
                            return Container();
                          }
                        },
                      );
                    } else {
                      return Shimmer.fromColors(
                        baseColor: Colors.grey.shade700,
                        highlightColor: Colors.grey.shade100,
                        child: ListView.builder(
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return ListTile(
                                leading: const CircleAvatar(
                                  radius: 30,
                                  backgroundColor: Colors.black,
                                ),
                                title: Container(
                                  height: 8,
                                  width: 20,
                                  color: Colors.black,
                                ),
                                subtitle: Container(
                                  height: 8,
                                  width: 20,
                                  color: Colors.black,
                                ));
                          },
                        ),
                      );
                    }
                  }),
            )
          ],
        ),
      ),
    );
  }
}
