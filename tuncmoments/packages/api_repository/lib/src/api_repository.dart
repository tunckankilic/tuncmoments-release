/// {@template api_repository}
/// A fake API repository.
/// {@endtemplate}
class ApiRepository {
  /// {@macro api_repository}
  const ApiRepository();
  //Fetches Todos
  // ignore: public_member_api_docs
  List<String> fetchTodos() => ['Make Homework', 'Go to Shop', 'Go to Code'];
}
