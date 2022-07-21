import 'package:app_restaurant_flutter/domain/entities/history/history_entity.dart';
import 'package:flutter/material.dart';

class HistoryProvider with ChangeNotifier {
  late List<History> _history = [];
  List<History> get history {
    return _history;
  }
  set history(List<History> history) {
    _history = history;
    notifyListeners();
  }

  /// Init view history
  loadHistory() {
    List<History> historyList = [];
    historyList.add(
      History(
        id: "1",
        date: "10-06-2022",
        description: "Plato fuerte",
        numberTransaction: "00001",
        value: "5.000"
      )
    );
    historyList.add(
        History(
            id: "2",
            date: "17-06-2022",
            description: "Plato mediano",
            numberTransaction: "00002",
            value: "3.000"
        )
    );
    historyList.add(
        History(
            id: "3",
            date: "25-06-2022",
            description: "Plato completo",
            numberTransaction: "00005",
            value: "8.000"
        )
    );
    history = historyList;
  }
}