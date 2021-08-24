import 'package:redux/redux.dart';

enum StoreActionType {
  UserLogin,
  UserLogout,
}

class StoreAction {
  final StoreActionType type;
  final dynamic arguments;

  StoreAction(this.type, {this.arguments});
}

class StoreState {
  String? nickname;

  StoreState({this.nickname});
}

StoreState _reducer(StoreState state, _action) {
  StoreAction action = _action;

  switch (action.type) {
    case StoreActionType.UserLogin:
      state.nickname = action.arguments as String;
      break;
    case StoreActionType.UserLogout:
      state.nickname = null;
      break;
    default:
      throw Error();
  }

  return state;
}

createStore() {
  return Store<StoreState>(_reducer, initialState: StoreState());
}
