import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sketch/core/boilerplate/create_model/cubits/create_model_cubit.dart';

part 'post_state.dart';

class PostCubit extends Cubit<PostState> {
  PostCubit() : super(PostInitial());
  CreateModelCubit? commentsCubit;
  updateStates() {
    emit(UpdateState());
  }
}
