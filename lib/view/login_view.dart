import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import '../store/login_store.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final loginStore = Provider.of<LoginStore>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Observer(
          builder: (_) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextField(
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    CpfInputFormatter(),
                  ],
                  onChanged: loginStore.setCpf,
                  decoration: const InputDecoration(
                    labelText: 'CPF',
                  ),
                ),
                TextField(
                  onChanged: loginStore.setPassword,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Senha',
                  ),
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: loginStore.canLogin ? loginStore.login : null,
                  child: const Text('Login'),
                ),
                if (loginStore.isLoading) const CircularProgressIndicator(),
              ],
            );
          },
        ),
      ),
    );
  }
}
