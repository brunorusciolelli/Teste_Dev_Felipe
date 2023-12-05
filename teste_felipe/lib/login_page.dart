import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Image(
          image: NetworkImage(
              "https://lh3.googleusercontent.com/pw/ADCreHcMbSS4WqJhvzp8JM9aZuBedXGw-ERKkvj50h9_QtgCyoXt-vKANd46RchQtAKGFgQvbgExlM-PWHWuKQyyw4b4L9pKKwaE6PLYZOWAMcWabO-3gSHWtS6ZH0YjXe5AsXzuPqe1CgSE4DeXy2vtWBk=w500-h500-s-no-gm?authuser=2"),
          width: 0,
        ),
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(27),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 0, 0, 0),
              Color.fromARGB(255, 0, 0, 0),
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Centraliza a imagem
            Container(
              margin: const EdgeInsets.only(bottom: 30),
              child: const Image(
                image: NetworkImage(
                    "https://lh3.googleusercontent.com/pw/ADCreHcMbSS4WqJhvzp8JM9aZuBedXGw-ERKkvj50h9_QtgCyoXt-vKANd46RchQtAKGFgQvbgExlM-PWHWuKQyyw4b4L9pKKwaE6PLYZOWAMcWabO-3gSHWtS6ZH0YjXe5AsXzuPqe1CgSE4DeXy2vtWBk=w500-h500-s-no-gm?authuser=2"),
                width: 150, // Ajuste o tamanho conforme necessário
              ),
            ),
            const Text(
              "Digite os dados de acesso nos campos abaixo.",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 30),
            LoginTextField(
              hintText: "Digite o seu e-mail",
              obscureText: false,
            ),
            const SizedBox(height: 5),
            LoginTextField(
              hintText: "Digite sua senha",
              obscureText: true,
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              child: CupertinoButton(
                padding: const EdgeInsets.all(17),
                color: Color.fromARGB(255, 255, 255, 255),
                child: const Text(
                  "Acessar",
                  style: TextStyle(
                      color: Colors.black45,
                      fontSize: 14,
                      fontWeight: FontWeight.w600),
                ),
                onPressed: () {
                  // Adicione a lógica de autenticação aqui
                },
              ),
            ),
            const SizedBox(height: 7),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white70, width: 0.8),
                borderRadius: BorderRadius.circular(7),
              ),
              child: CupertinoButton(
                child: const Text(
                  "Crie sua conta",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w600),
                ),
                onPressed: () async {
                  // Adiciona a lógica de criação de conta aqui
                  bool accountCreated = await createAccount(
                    email: "exemplo@email.com",
                    password: "senha123",
                  );

                  if (accountCreated) {
                    // A conta foi criada com sucesso, pode redirecionar para outra tela
                    print("Conta criada com sucesso!");
                  } else {
                    // O e-mail já está em uso ou outros erros
                    print("Erro ao criar conta");
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LoginTextField extends StatelessWidget {
  final String hintText;
  final bool obscureText;

  const LoginTextField({
    Key? key,
    required this.hintText,
    required this.obscureText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
      cursorColor: Colors.pinkAccent,
      padding: const EdgeInsets.all(15),
      placeholder: hintText,
      placeholderStyle: const TextStyle(color: Color.fromARGB(179, 0, 0, 0), fontSize: 14),
      style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 14),
      obscureText: obscureText,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 255, 255, 255),
        borderRadius: const BorderRadius.all(
          Radius.circular(7),
        ),
      ),
    );
  }
}

List<Map<String, String>> userList = [
  {"email": "exemplo@email.com", "password": "senha123"},
];

Future<bool> createAccount({
  required String email,
  required String password,
}) async {
  await Future.delayed(Duration(seconds: 2));

  bool emailInUse = userList.any((user) => user["email"] == email);

  if (!emailInUse) {
    userList.add({"email": email, "password": password});
    return true;
  } else {
    return false;
  }
}