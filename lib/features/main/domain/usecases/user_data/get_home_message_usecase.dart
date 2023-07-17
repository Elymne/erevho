import 'package:erevho/core/usecase.dart';
import 'package:erevho/features/main/data/repositories/local/user_params_local_repository_impl.dart';
import 'package:erevho/features/main/domain/repositories/local/user_data_local_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getHomeMessageUsecaseProvider = Provider((ref) => GetHomeMessageUsecase(ref.read(userDataLocalRepositoryProvider)));

/// J'aimerais bien que les messages soient un peu aléatoire et lié à l'heure.
/// Et pourquoi pas à la date. Je verrais.
/// TODO à compléter.
class GetHomeMessageUsecase extends UsecaseNoParams<GetHomeMessageUsecaseResult> {
  final UserDataLocalRepository userDataLocalRepository;

  GetHomeMessageUsecase(this.userDataLocalRepository);

  @override
  Future<GetHomeMessageUsecaseResult> perform() async {
    final userData = await userDataLocalRepository.getUserData();
    final userName = userData?.pseudonym ?? '';
    final datetime = DateTime.now();

    if (datetime.hour < 18) {
      return GetHomeMessageUsecaseResult('Bonjour ', userName, 'Comment vas-tu ?');
    }
    return GetHomeMessageUsecaseResult('Bonsoir ', userName, 'Comment vas-tu ?');
  }
}

class GetHomeMessageUsecaseResult {
  final String greeting;
  final String userName;
  final String specialMessage;

  GetHomeMessageUsecaseResult(this.greeting, this.userName, this.specialMessage);
}
