class PlannedExpense {
  final String id;
  final String userId;
  final String expenseCategory;
  final double valuePlanned;
  final DateTime expenseDay;
  final bool canFluctuate;
  final String paymentMethod;

  PlannedExpense({
    required this.id,
    required this.userId,
    required this.expenseCategory,
    required this.valuePlanned,
    required this.expenseDay,
    required this.canFluctuate,
    required this.paymentMethod,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'user_id': userId,
      'expense_category': expenseCategory,
      'value_planned': valuePlanned,
      'expense_day': expenseDay.toIso8601String(),
      'can_fluctuate': canFluctuate ? 1 : 0,
      'payment_method': paymentMethod,
    };
  }

  factory PlannedExpense.fromMap(Map<String, dynamic> map) {
    return PlannedExpense(
      id: map['id'],
      userId: map['user_id'],
      expenseCategory: map['expense_category'],
      valuePlanned: map['value_planned'],
      expenseDay: DateTime.parse(map['expense_day']),
      canFluctuate: map['can_fluctuate'] == 1,
      paymentMethod: map['payment_method'],
    );
  }
}