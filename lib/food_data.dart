class FoodData {

  final List<String> locationsData = <String>[
    'Grill',
    'Proxi Rest',
    'Cafeteria',
    'Pizzeria',
    'Store',
    'NewRest'
  ];

  final List<String> imgUrlsData = [
    'assets/grill-2.jpg',
    'assets/proxi-2.jpeg',
    'assets/coffee-4.jpg',
    'assets/pizza-2.jpg',
    'assets/store-2.jpg',
    'assets/newrest-3.jpg'
  ];

  final List<String> locationDetailsData = [
    'Grill · Fastfood',
    'Tacos · Fastfood',
    'Coffee · Cafeteria',
    'Pizza · Fastfood',
    'Store · Groceries',
    'Dish · Dining'
  ];

  get food => {locationsData[0]: ['Tacos', 'Sushi', 'Patte', 'SandWich', ]};

  get popular => {locationsData[0]:''};

}