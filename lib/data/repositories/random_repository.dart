import 'dart:math';

import 'package:latihan_bloc/data/models/data_home.dart';
import 'package:latihan_bloc/data/models/masakan.dart';
import 'package:latihan_bloc/data/models/user.dart';
import 'package:latihan_bloc/data/providers/masakan_provider.dart';
import 'package:latihan_bloc/data/providers/user_provider.dart';

class RandomRepository {
  UserProvider userProvider = UserProvider();
  MasakanProvider masakanProvider = MasakanProvider();

  Future<Map<String, dynamic>> getRandomData() async {
    Map<String, dynamic> dataUser = await userProvider.getDataUser();
    Map<String, dynamic> dataMasakan = await masakanProvider.getDataMasakan();

    if (dataUser["error"] == true && dataMasakan["error"] == true) {
      return {
        "error": true,
        "message": "Terjadi error saat mengambil database user & masakan",
      };
    }

    // GET RANDOM USER
    UserModel userModel = dataUser["data"] as UserModel;

    late DataUser dataRandomUser;

    if (userModel.data != null) {
      dataRandomUser = userModel.data!.randomUser();
    } else {
      dataRandomUser = DataUser();
    }

    // GET RANDOM MASAKAN
    MasakanModel masakanModel = dataMasakan["data"] as MasakanModel;

    late Results dataRandomMasakan;

    if (masakanModel.results != null) {
      dataRandomMasakan = masakanModel.results!.randomMasakan();
    } else {
      dataRandomMasakan = Results();
    }

    // Memasukan ke dalam 1 kesatuan model / object
    return {
      "error": false,
      "message": "Berhasil mengambil database random user & masakan",
      "data": DataHomeModel(
        fullname: "${dataRandomUser.firstName} ${dataRandomUser.lastName}",
        email: "${dataRandomUser.email}",
        profile: "${dataRandomUser.avatar}",
        masakan: "${dataRandomMasakan.title}",
        gambarMasakan: "${dataRandomMasakan.thumb}",
        porsi: "${dataRandomMasakan.serving}",
        kesulitan: "${dataRandomMasakan.difficulty}",
      ),
    };
  }
}

extension RandomUser on List<DataUser> {
  DataUser randomUser() {
    return elementAt(Random().nextInt(length - 1));
  }
}

extension RandomMasakan on List<Results> {
  Results randomMasakan() {
    return elementAt(Random().nextInt(length - 1));
  }
}
