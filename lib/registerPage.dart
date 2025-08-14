import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final nameController = TextEditingController();
  final surnameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    surnameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmController.dispose();
    super.dispose();
  }

  void _showMessage(String message, {bool isError = true}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: isError ? Colors.redAccent : Colors.green,
      ),
    );
  }

  void _register() {
    final name = nameController.text.trim();
    final surname = surnameController.text.trim();
    final email = emailController.text.trim();
    final password = passwordController.text;
    final confirm = confirmController.text;

    if ([name, surname, email, password, confirm].any((e) => e.isEmpty)) {
      _showMessage("Сите полиња мора да бидат пополнети!");
      return;
    }

    if (password != confirm) {
      _showMessage("Лозинките не се совпаѓаат!");
      return;
    }

    _showMessage("Регистрацијата е успешна!", isError: false);
    // Тука можеш да додадеш API повик или логика за зачувување
  }

@override
Widget build(BuildContext context) {
  final theme = Theme.of(context);
  final buttonStyle = theme.elevatedButtonTheme.style;
  final cardColor = theme.cardColor;
  return Scaffold(
    backgroundColor: theme.scaffoldBackgroundColor,
    appBar: AppBar(
      backgroundColor: theme.appBarTheme.backgroundColor,
      title: const Text('Регистрација на нов корисник'),
    ),
    body: SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            color: cardColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Card(
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            color: cardColor,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  _buildTextField(nameController, 'Име', Icons.person),
                  _buildTextField(surnameController, 'Презиме', Icons.person_outline),
                  _buildTextField(emailController, 'Email', Icons.email),
                  _buildTextField(passwordController, 'Лозинка', Icons.lock, obscure: true),
                  _buildTextField(confirmController, 'Потврди лозинка', Icons.lock_outline, obscure: true),
                  const SizedBox(height: 20),
                  ElevatedButton.icon(
                    onPressed: _register,
                    icon: const Icon(Icons.check),
                    label: const Text('Регистрирај се'),
                    style: buttonStyle,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ),
  );
}

  Widget _buildTextField(
    TextEditingController controller,
    String label,
    IconData icon, {
    bool obscure = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: controller,
        obscureText: obscure,
        decoration: InputDecoration(
          filled: true,
          fillColor: const Color.fromARGB(255, 251, 247, 247), // 👈 бела позадина на текст полето
          labelText: label,
          prefixIcon: Icon(icon),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}