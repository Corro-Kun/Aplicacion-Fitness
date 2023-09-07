import 'package:fitness/models/CategoryModels.dart';
import 'package:fitness/models/DietModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CategoryModels> categories = [];
  List<DietModel> diets = [];

  void _getCategory() {
    categories = CategoryModels.getCategory();
  }

  void _getDiets() {
    diets = DietModel.getDiets();
  }

  @override
  void initState() {
    _getDiets();
    _getCategory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _search(),
          SizedBox(
            height: 40,
          ),
          _categories_Selection(),
          SizedBox(
            height: 40,
          ),
          _dietSelection()
        ],
      ),
    );
  }

  Column _dietSelection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 22),
          child: Text(
            "Recommendation\nfor Diet",
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Container(
          height: 240,
          child: ListView.separated(
            itemBuilder: (context, index) {
              return Container(
                width: 210,
                decoration: BoxDecoration(
                  color: diets[index].color.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SvgPicture.asset(
                      diets[index].iconPath,
                      height: 120,
                      width: 120,
                    ),
                    Column(
                      children: [
                        Text(
                          diets[index].name,
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                              fontSize: 16),
                        ),
                        Text(
                          diets[index].level +
                              '|' +
                              diets[index].duration +
                              '|' +
                              diets[index].calories,
                          style: TextStyle(
                              color: Color(0xff7B6F72),
                              fontSize: 13,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    Container(
                      height: 45,
                      width: 130,
                      child: Center(
                        child: Text(
                          "View",
                          style: TextStyle(
                              color: diets[index].viewIsSelected
                                  ? Colors.white
                                  : Color(0xffC58BF2),
                              fontSize: 14,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            diets[index].viewIsSelected
                                ? Color(0xff9DCEFF)
                                : Colors.transparent,
                            diets[index].viewIsSelected
                                ? Color(0xff92A3FD)
                                : Colors.transparent,
                          ],
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    )
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) => SizedBox(width: 20),
            itemCount: diets.length,
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.only(left: 20, right: 20),
          ),
        )
      ],
    );
  }

  Column _categories_Selection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 22),
          child: Text(
            'Category',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Container(
          height: 120,
          child: ListView.separated(
              itemCount: categories.length,
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.only(left: 20, right: 20),
              separatorBuilder: (context, index) => SizedBox(width: 20),
              itemBuilder: (context, index) {
                return Container(
                  width: 100,
                  decoration: BoxDecoration(
                    color: categories[index].boxColor.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            color: Colors.white, shape: BoxShape.circle),
                        child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child:
                                SvgPicture.asset(categories[index].iconPath)),
                      ),
                      Text(
                        categories[index].name,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                          fontSize: 14,
                        ),
                      )
                    ],
                  ),
                );
              }),
        ),
      ],
    );
  }

  Container _search() {
    return Container(
      margin: EdgeInsets.only(top: 40, left: 20, right: 20),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: Color(0xff1D1617).withOpacity(0.11),
            blurRadius: 40,
            spreadRadius: 0.0)
      ]),
      child: TextField(
        decoration: InputDecoration(
            hintText: "Search",
            hintStyle: TextStyle(color: Color(0xffDDDADA), fontSize: 14),
            filled: true,
            fillColor: Colors.white,
            contentPadding: EdgeInsets.all(15),
            prefixIcon: Padding(
                padding: const EdgeInsets.all(12),
                child: SvgPicture.asset(
                  "assets/icons/busqueda.svg",
                )),
            suffixIcon: Container(
              width: 60,
              child: IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    VerticalDivider(
                      color: Colors.black,
                      indent: 10,
                      endIndent: 10,
                      thickness: 0.1,
                    ),
                    Padding(
                        padding: const EdgeInsets.all(12),
                        child: SvgPicture.asset(
                          "assets/icons/filtro.svg",
                          height: 20,
                          width: 20,
                        )),
                  ],
                ),
              ),
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none)),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      title: Text("Breakfast",
          style: TextStyle(color: Colors.black, fontSize: 24)),
      centerTitle: true,
      backgroundColor: Colors.white,
      elevation: 0.0,
      leading: GestureDetector(
        onTap: () {},
        child: Container(
          margin: EdgeInsets.all(10),
          alignment: Alignment.center,
          child: SvgPicture.asset(
            "assets/icons/cruz.svg",
            height: 20,
            width: 20,
          ),
          decoration: BoxDecoration(
              color: Color(0xffffffff),
              borderRadius: BorderRadius.circular(10)),
        ),
      ),
      actions: [
        GestureDetector(
          onTap: () {},
          child: Container(
            margin: EdgeInsets.all(10),
            alignment: Alignment.center,
            width: 37,
            child: SvgPicture.asset(
              "assets/icons/menu.svg",
              height: 20,
              width: 20,
            ),
            decoration: BoxDecoration(
                color: Color(0xffffffff),
                borderRadius: BorderRadius.circular(10)),
          ),
        )
      ],
    );
  }
}
