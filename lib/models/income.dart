class Income {
  final String id;
  final String userId;
  final double value;
  final int incomeDay;

  Income({
    required this.id,
    required this.userId,
    required this.value,
    required this.incomeDay,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'user_id': userId,
      'value': value,
      'income_day': incomeDay,
    };
  }

  factory Income.fromMap(Map<String, dynamic> map) {
    return Income(
      id: map['id'],
      userId: map['user_id'],
      value: map['value'],
      incomeDay: map['income_day'],
    );
  }
}