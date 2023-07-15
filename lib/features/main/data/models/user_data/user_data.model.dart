import 'package:erevho/features/main/domain/entities/user_data/user_data.entity.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class UserDataModel {
  int id = 0;

  @Unique()
  final String uuid;

  final String pseudonym;

  UserDataModel(this.uuid, this.pseudonym);

  UserDataModel.fromEntity(UserData userData)
      : uuid = userData.uuid,
        pseudonym = userData.pseudonym;

  UserData toEntity() {
    return UserData(
      uuid: uuid,
      pseudonym: pseudonym,
    );
  }
}
