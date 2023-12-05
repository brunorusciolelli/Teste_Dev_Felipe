import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'signup_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  static const String imageUrl =
      "https://lh3.googleusercontent.com/pw/ADCreHcMbSS4WqJhvzp8JM9aZuBedXGw-ERKkvj50h9_QtgCyoXt-vKANd46RchQtAKGFgQvbgExlM-PWHWuKQyyw4b4L9pKKwaE6PLYZOWAMcWabO-3gSHWtS6ZH0YjXe5AsXzuPqe1CgSE4DeXy2vtWBk=w500-h500-s-no-gm?authuser=2";

  Future<void> _selectImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? pickedImage =
        await _picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      print("Imagem selecionada: ${pickedImage.path}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Image(
          image: NetworkImage(imageUrl),
          width: 0,
        ),
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(27),
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 0, 0, 0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildLogo(),
          const Text(
            "Digite os dados de acesso nos campos abaixo.",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 30),
          _buildLoginTextField("Digite o seu e-mail", false),
          const SizedBox(height: 5),
          _buildLoginTextField("Digite sua senha", true),
          const SizedBox(height: 30),
          _buildElevatedButton(),
          const SizedBox(height: 7),
          _buildCreateAccountButton(context),
        ],
      ),
    );
  }

  Widget _buildLogo() {
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      child: const Image(
        image: NetworkImage(imageUrl),
        width: 150,
      ),
    );
  }

  Widget _buildLoginTextField(String hintText, bool obscureText) {
    return LoginTextField(
      hintText: hintText,
      obscureText: obscureText,
    );
  }

  Widget _buildElevatedButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(17),
          primary: const Color.fromARGB(255, 0, 255, 0),
        ),
        onPressed: () {
          // Adicione a lógica de autenticação aqui
        },
        child: const Text(
          "Acessar",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Widget _buildCreateAccountButton(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white, width: 0.8),
        borderRadius: BorderRadius.circular(7),
      ),
      child: TextButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SignUpPage()),
          );
        },
        child: const Text(
          "Crie sua conta",
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
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
      placeholderStyle: const TextStyle(
        color: Color.fromARGB(179, 0, 0, 0),
        fontSize: 14,
      ),
      style: const TextStyle(
        color: Color.fromARGB(255, 0, 0, 0),
        fontSize: 14,
      ),
      obscureText: obscureText,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 255, 255),
        borderRadius: const BorderRadius.all(
          Radius.circular(7),
        ),
      ),
    );
  }
}
