part of 'random_bloc.dart';

abstract class RandomState extends Equatable {
  RandomState(this.data);

  DataHomeModel data;

  @override
  List<Object> get props => [data];
}

class RandomInitial extends RandomState {
  RandomInitial(super.data);
}

class RandomLoading extends RandomState {
  RandomLoading(super.data);
}

class RandomCompleted extends RandomState {
  RandomCompleted(super.data);
}

class RandomError extends RandomState {
  RandomError(super.data);
}
