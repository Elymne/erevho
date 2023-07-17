import 'package:erevho/core/controller.dart';
import 'package:erevho/features/main/domain/usecases/user_data/get_home_message_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeControllerProvider = Provider((ref) => HomeController(ref));

class HomeController extends Controller {
  late final GetHomeMessageUsecase getHomeMessageUsecase = ref.read(getHomeMessageUsecaseProvider);
  final homeMessageProvider = StateProvider<GetHomeMessageUsecaseResult?>((ref) => null);

  Future init() async {
    ref.read(homeMessageProvider.notifier).state = await getHomeMessageUsecase.perform();
  }

  HomeController(super.ref);
}
