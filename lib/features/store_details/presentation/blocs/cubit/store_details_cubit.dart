import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:yabalash_mobile_app/features/search/domain/entities/store_search.dart';

part 'store_details_state.dart';

class StoreDetailsCubit extends Cubit<StoreDetailsState> {
  StoreDetailsCubit() : super(const StoreDetailsState());

  void setStore(StoreSearch store) => emit(StoreDetailsState(store: store));
}
