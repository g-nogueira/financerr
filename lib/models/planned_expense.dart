class PlannedExpense {
  final String id;
  final String userId;
  final String? expenseCategory;
  final String description;
  final double valuePlanned;
  final int expenseDayOfTheMonth;
  final bool canFluctuate;
  final String paymentMethod;

  PlannedExpense({
    required this.id,
    required this.userId,
    required this.expenseCategory,
    required this.description,
    required this.valuePlanned,
    required this.expenseDayOfTheMonth,
    required this.canFluctuate,
    required this.paymentMethod,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'user_id': userId,
      'expense_category': expenseCategory,
      'value_planned': valuePlanned,
      'expense_day_of_the_month': expenseDayOfTheMonth,
      'can_fluctuate': canFluctuate ? 1 : 0,
      'payment_method': paymentMethod,
    };
  }

  factory PlannedExpense.fromMap(Map<String, dynamic> map) {
    return PlannedExpense(
      id: map['id'],
      userId: map['user_id'],
      expenseCategory: map['expense_category'],
      description: map['description'],
      valuePlanned: map['value_planned'],
      expenseDayOfTheMonth: map['expense_day_of_the_month'],
      canFluctuate: map['can_fluctuate'] == 1,
      paymentMethod: map['payment_method'],
    );
  }
}