import 'dart:async';

import 'package:bcoffee/models/models.dart';
import 'package:bcoffee/services/services.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  @override
  UserState get initialState => UserInitial();

  @override
  Stream<UserState> mapEventToState(
    UserEvent event,
  ) async* {
    ///If the event is a loadUser then take data from the Firestore
    if (event is LoadUser) {
      UserModel user = await UserServices.getUser(event.id);

      ///After the above is successful, return the user
      yield UserLoaded(user);
    } else if (event is SignOut) {
      yield UserInitial();
      //If the event is updateData
    } else if (event is UpdateData) {
      //Then the updateUser will be made (new user) from the current state as a userloaded, because it is definitely userLoaded when it is in main_page.dart
      UserModel updatedUser = (state as UserLoaded).user.copyWith(
            name: event.name,
            profilePicture: event.profileImage,
          );

      await UserServices.updateUser(
          updatedUser); //for updateruser so that the ProfileImage is updated in Firestore

      yield UserLoaded(updatedUser);
    }
  }
}
