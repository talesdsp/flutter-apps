class Hotel {
  final String imageUrl;
  final String name;
  final String address;
  final String description;
  final int price;
  final int vacancies;

  const Hotel({
    this.imageUrl,
    this.name,
    this.address,
    this.description,
    this.price,
    this.vacancies,
  });
}

final List<Hotel> hotels = [
  Hotel(
    imageUrl: 'assets/images/hotel0.jpg',
    name: 'Saint-Exupéry',
    address: '400 Clare St',
    price: 175,
    vacancies: 0,
    description: description,
  ),
  Hotel(
    imageUrl: 'assets/images/hotel1.jpg',
    name: 'Paradise Island',
    address: '503 Joana Av',
    price: 300,
    vacancies: 10,
    description: description,
  ),
  Hotel(
    imageUrl: 'assets/images/hotel2.jpg',
    name: 'Coco Village',
    address: '404 George St',
    price: 240,
    vacancies: 5,
    description: description,
  ),
];

const String description =
    "Bienvenue to the foremost hotel of the world, be ready to appreciate nature as we offer crystal water swimming pools, coconuts served directly from our local trees, that provide us a fresh smooth breeze.";
