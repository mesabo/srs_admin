class SubscriptionsModel {
  final int id;
  final int userid;
  final int serviceid;
  final String createdat;
  final String updatedat;
  final String inprogresss;

  SubscriptionsModel({
    this.id = 0,
    this.userid = 0,
    this.serviceid = 0,
    this.createdat = '',
    this.updatedat = '',
    this.inprogresss = '',
  });

  SubscriptionsModel.fromJsonMap(Map<String, dynamic> map)
      : id = map['id'] as int,
        userid = map['user_id'] as int,
        serviceid = map['service_id'] as int,
        createdat = map['created_at'] as String,
        updatedat = map['updated_at'] as String,
        inprogresss = map['inprogresss'] as String;

  Map<String, dynamic> toJsonMap() => {
        'id': id,
        'user_id': userid,
        'service_id': serviceid,
        'created_at': updatedat,
        'updated_at': updatedat,
        'inprogresss': inprogresss
      };

  @override
  String toString() {
    return '{ ${this.id},${this.userid},${this.serviceid},${this.createdat},${this.updatedat},${this.inprogresss},}';
  }
}
