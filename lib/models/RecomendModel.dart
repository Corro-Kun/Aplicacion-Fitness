class PopulariRecomend {
  String name;
  String iconPath;
  String level;
  String duration;
  String calories;
  bool BoxIsSelected;

  PopulariRecomend({
    required this.name,
    required this.iconPath,
    required this.level,
    required this.duration,
    required this.calories,
    required this.BoxIsSelected,
  });

  static List<PopulariRecomend> getPopulariRecomend() {
    List<PopulariRecomend> populariDiets = [];

    populariDiets.add(
      PopulariRecomend(
        name: "only meet",
        iconPath: "assets/icons/meet.svg",
        level: "Beginner",
        duration: "3 Weeks",
        calories: "1200 Calories",
        BoxIsSelected: true,
      ),
    );

    populariDiets.add(PopulariRecomend(
      name: 'only pizza',
      iconPath: 'assets/icons/pizza.svg',
      level: 'Easy',
      duration: '10 min',
      calories: '300 kcal',
      BoxIsSelected: false,
    ));

    return populariDiets;
  }
}
