import 'package:mobx/mobx.dart';
import 'package:get/get_utils/src/get_utils/get_utils.dart';
import '../model/user_model.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store {
  @observable
  String cpf = '';

  @observable
  String password = '';

  @observable
  bool isLoading = false;

  @observable
  UserModel? user;

  @observable
  bool isLoggedIn = false;

  @computed
  bool get isCpfValid => _validarCpf();

  @computed
  bool get isPasswordValid => password.length >= 6;

  @computed
  bool get canLogin => isCpfValid && isPasswordValid;

  bool _validarCpf() {
    if (GetUtils.isCpf(cpf)) {
      return true;
    } else {
      return false;
    }
  }

  @action
  void setCpf(String value) => cpf = value;

  @action
  void setPassword(String value) => password = value;

  @action
  Future<void> login() async {
    isLoading = true;

    // Simulate an API call
    await Future.delayed(const Duration(seconds: 2));

    // Login successful
    isLoggedIn = true;

    isLoading = false;
  }
}
