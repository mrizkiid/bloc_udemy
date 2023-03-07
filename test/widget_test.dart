import 'package:latihan_bloc/data/models/data_home.dart';
import 'package:latihan_bloc/data/repositories/random_repository.dart';

void main() async {
  RandomRepository randomRepository = RandomRepository();

  Map<String, dynamic> dataRandom = await randomRepository.getRandomData();
  DataHomeModel data = dataRandom["data"];
  print(data.toJson());
}
