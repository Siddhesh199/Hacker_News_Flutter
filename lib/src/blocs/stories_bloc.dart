import 'package:rxdart/rxdart.dart';
import 'package:hackernewsflutter/src/models/item_model.dart';
import 'package:hackernewsflutter/src/resources/repository.dart';

class StoriesBloc {
  final _repository = Repository();
  final _topIds = PublishSubject<List<int>>();

  Stream<List<int>> get topIds => _topIds.stream;

  fetchTopIds() async {
    final ids = await _repository.fetchTopIds();
    _topIds.sink.add(ids);
  }

  dispose() {
    _topIds.close();
  }
}
