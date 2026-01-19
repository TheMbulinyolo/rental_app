class House {
  final int id;
  final String titre;
  final String localisation;
  final double prix;
  final int chambres;
  final int douche_toilettes;
  final String image;

  const House({
    required this.id,
    required this.titre,
    required this.localisation,
    required this.prix,
    required this.chambres,
    required this.douche_toilettes,
    required this.image,
   });

   factory House.fromJson(Map<String, dynamic> json) {
    return House(
      id: json['id'], 
      titre: json['titre'], 
      localisation: json['localisation'], 
      prix: double.parse(json['prix'].toString()),   // convertir en double
      chambres: int.parse(json['chambres'].toString()), // convertir en int
      douche_toilettes: int.parse(json['douches_toilettes'].toString()),
      image: json['image']
    );
   }
}