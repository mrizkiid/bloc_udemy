import 'package:flutter/material.dart';
import 'package:latihan_bloc/data/models/data_home.dart';
import '../../bloc/export.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    RandomBloc randomBloc = context.read<RandomBloc>();
    return Scaffold(
      appBar: AppBar(
        title: Text("RANDOM APPS"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: BlocBuilder<RandomBloc, RandomState>(
            bloc: randomBloc,
            builder: (context, state) {
              if (state is RandomLoading) {
                return CircularProgressIndicator();
              }
              if (state is RandomError) {
                return Text("Terjadi Kesalahan");
              }
              if (state is RandomInitial) {
                return Text("Tidak ada data");
              }

              DataHomeModel dataHome = state.data;
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 75,
                    height: 75,
                    child: Container(
                      child: Image.network("${dataHome.profile}"),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "${dataHome.fullname}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text("${dataHome.email}"),
                  SizedBox(height: 20),
                  Text("============== MASAKAN =============="),
                  SizedBox(height: 20),
                  Text(
                    "${dataHome.masakan}",
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 5),
                  Text("${dataHome.porsi}"),
                  SizedBox(height: 5),
                  Text("Tingkat kesulitan ( ${dataHome.kesulitan} )"),
                  SizedBox(height: 20),
                  SizedBox(
                    width: 200,
                    height: 150,
                    child: Container(
                      child: Image.network("${dataHome.gambarMasakan}"),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          randomBloc.add(GetRandomEvent());
          randomBloc.state.data.toJson();
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}
