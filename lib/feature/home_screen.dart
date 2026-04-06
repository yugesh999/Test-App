import 'package:demo_project/shared/constants/fonts/font_constants.dart';
import 'package:demo_project/shared/constants/fonts/size_config.dart';
import 'package:flutter/material.dart';

import '../shared/text_widgets/build_text.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = "/homeScreen";
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double height = 0;
  double width = 0;

  @override
  void initState() {
    super.initState();
    height = SizeConfig.safeBlockVertical ?? 0;
    width = SizeConfig.safeBlockHorizontal ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      body: _createBody(),
    );
  }

  _createBody() {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(height * 2),
        child: Column(
          spacing: height * 3,
          children: [
            _headerSection(),
            _tempSection(),
            _statusSection(),
            _hourlyForecastSection(),
            _dayForecastSection(),
          ],
        ),
      ),
    );
  }

  _headerSection() {
    return Row(
      spacing: height * 23,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BuildText(text: "City Name", fontSize: 10.0.large28px()),
        Container(
          padding: EdgeInsets.all(height * 1),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Colors.blue[700],
          ),
          child: Icon(Icons.search_outlined),
        ),
      ],
    );
  }

  _tempSection() {
    return Column(
      spacing: height,
      children: [
        Icon(Icons.cloud, size: height * 10, color: Colors.grey[350],),
        BuildText(text: "25°C"),
        BuildText(text: "Partly Cloudy"),
        BuildText(text: "Feels like 21°C · High 26° · Low 14°"),
      ],
    );
  }

  _statusSection() {
    return GridView.count(
      crossAxisCount: 3,
      crossAxisSpacing: height * 1.5,
      shrinkWrap: true,
      childAspectRatio: 1.3,
      physics: NeverScrollableScrollPhysics(),
      children: List.generate(3, (index) {
        return Container(
          decoration: BoxDecoration(
            // color: Colors.grey,
            color: Colors.blue[300],
            border: Border.all(color: Colors.black, width: 1),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(child: Text("Item $index")),
        );
      }),
    );
  }

  _hourlyForecastSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BuildText(text: "Hourly Forecast", fontSize: 10.0.medium20px()),
        SizedBox(height: height * 2),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            spacing: height,
            children: List.generate(6, (index) {
              return Container(
                height: height * 15,
                width: height * 10,
                decoration: BoxDecoration(
                  // color: Colors.grey,
                  color: Colors.blue[300],
                  border: Border.all(color: Colors.black, width: 1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(child: Text("Item $index")),
              );
            }),
          ),
        ),
      ],
    );
  }

  _dayForecastSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BuildText(text: "7-Day Forecast", fontSize: 10.0.medium20px()),
        SizedBox(height: height * 2),
        SizedBox(
          height: height * 18,
          child: ListView.builder(
            itemCount: 7,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.symmetric(vertical: height * 0.2),
                height: height * 6,
                width: double.infinity,
                decoration: BoxDecoration(
                  // color: Colors.white,
                  color: Colors.blue[500],
                  border: Border.all(color: Colors.black, width: 1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(child: Text("Item $index")),
              );
            },
          ),
        ),
      ],
    );
  }
}
