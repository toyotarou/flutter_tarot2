enum APIPath { getAllTarot, tarothistory, getCategoryRate, tarotcard }

extension APIPathExtension on APIPath {
  String? get value {
    switch (this) {
      case APIPath.getAllTarot:
        return 'getAllTarot';
      case APIPath.tarothistory:
        return 'tarothistory';
      case APIPath.getCategoryRate:
        return 'getCategoryRate';
      case APIPath.tarotcard:
        return 'tarotcard';
    }
  }
}
