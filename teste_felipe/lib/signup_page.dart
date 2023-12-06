import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? _name;
  String? _email;
  String? _password;
  String? _dob; // Data de Nascimento
  File? _selectedImage;

  Future<void> _selectImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? pickedImage = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      print("Imagem selecionada: ${pickedImage.path}");
      setState(() {
        _selectedImage = File(pickedImage.path);
      });
    }
  }

  void _saveForm() {
    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      // Formulário é válido, faça algo com os dados
      print("Nome: $_name");
      print("E-mail: $_email");
      print("Data de Nascimento: $_dob");
      // Adicione mais lógica conforme necessário
    }
  }

  void _cancel() {
    // Adicione a lógica para navegar de volta para a tela inicial
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Criar Conta",
          style: TextStyle(color: Colors.white), // Cor branca para o texto
        ),
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        iconTheme: IconThemeData(color: Colors.white), // Cor branca para o ícone
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ElevatedButton(
                onPressed: _selectImage,
                child: const Text("Selecionar Foto"),
                style: ElevatedButton.styleFrom(
                  primary: Colors.lightGreen,
                  onPrimary: Colors.black,
                ),
              ),
              if (_selectedImage != null)
                Image.file(_selectedImage!),
              const SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Nome Completo',
                  fillColor: Colors.grey[200],
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira seu nome.';
                  }
                  return null;
                },
                onSaved: (value) {
                  _name = value;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Data de Nascimento',
                  fillColor: Colors.grey[200],
                ),
                validator: (value) {
                  // Adicione a lógica de validação da data de nascimento
                  return null;
                },
                onSaved: (value) {
                  _dob = value;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'E-mail',
                  fillColor: Colors.grey[200],
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty || !value.contains('@')) {
                    return 'Por favor, insira um e-mail válido.';
                  }
                  return null;
                },
                onSaved: (value) {
                  _email = value;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Senha',
                  fillColor: Colors.grey[200],
                ),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira sua senha.';
                  }
                  return null;
                },
                onSaved: (value) {
                  _password = value;
                },
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: _saveForm,
                    child: const Text("Salvar"),
                    style: ElevatedButton.styleFrom(
                      primary: const Color.fromARGB(255, 0, 0, 0),
                      onPrimary: Colors.white,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: _cancel,
                    child: const Text("Cancelar"),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.grey,
                      onPrimary: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
