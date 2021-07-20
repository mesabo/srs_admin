class UsersModel {
  final int id;
  final String title;
  final String article;
  final double price;
  final double quantity;
  final String description;
  final String telephone1;
  final String telephone2;
  final String client;
  final int duree;
  final String date1;
  final String date2;

  UsersModel(
      {this.id = 0,
      this.title = '',
      this.article = '',
      this.price = 1.0,
      this.quantity = 1.0,
      this.description = '',
      this.telephone1 = '',
      this.telephone2 = '',
      this.client = '',
      this.duree = 0,
      this.date1 = '',
      this.date2 = ''});

  UsersModel.fromJsonMap(Map<String, dynamic> map)
      : id = map['id'] as int,
        title = map['title'] as String,
        article = map['article'] as String,
        price = map['price'] as double,
        quantity = map['quantity'] as double,
        description = map['description'] as String,
        telephone1 = map['telephone1'] as String,
        telephone2 = map['telephone2'] as String,
        client = map['client'] as String,
        duree = map['duree'] as int,
        date1 = map['date1'] as String,
        date2 = map['date2'] as String;

  Map<String, dynamic> toJsonMap() => {
        'id': id,
        'title': title,
        'article': article,
        'price': price,
        'description': description,
        'telephone1': telephone1,
        'telephone2': telephone2,
        'client': client,
        'duree': duree,
        'date1': date1,
        'date2': date2
      };

  @override
  String toString() {
    return '{ ${this.id},${this.title},${this.article},${this.price},${this.quantity},${this.description},${this.telephone1},${this.telephone2},${this.client},${this.duree},${this.date1},${this.date2},}';
  }
}
