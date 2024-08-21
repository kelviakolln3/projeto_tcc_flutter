import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Material(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Colors.blue,
                Colors.red,
              ],
            ),
          ),
          child: Center(
            child: Container(
              width: 350,
              height: 300,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white.withOpacity(0.1)),
                  color: Colors.white.withOpacity(0.1),
                  borderRadius: const BorderRadius.all(Radius.circular(20.0))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Login", style: TextStyle(fontSize: 20, color: Colors.white)),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: TextFormField(
                      cursorColor: Colors.white,
                      style: const TextStyle(fontSize: 15, color: Colors.white),
                      //controller: logingUIController.usuarioTextController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          fillColor: Colors.white,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(90.0)),
                            borderSide: BorderSide(color: Colors.white, width: 1.2),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(90.0)),
                            borderSide: BorderSide(color: Colors.white, width: 1.2),
                          ),
                          prefixIcon: Icon(Icons.person_2_outlined, color: Colors.white),
                          labelText: 'Usuário',
                          labelStyle: TextStyle(fontSize: 15, color: Colors.white)),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: TextFormField(
                      cursorColor: Colors.white,
                      style: const TextStyle(fontSize: 15, color: Colors.white),
                      //controller: logingUIController.senhaTextController,
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          enabledBorder: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(90.0)),
                              borderSide: BorderSide(color: Colors.white, width: 1.2)),
                          focusedBorder: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(90.0)),
                              borderSide: BorderSide(color: Colors.white, width: 1.2)),
                          prefixIcon: const Icon(Icons.lock_outline, color: Colors.white),
                          suffixIcon: IconButton(
                              onPressed: () => {},
                              icon: const Icon(Icons.visibility, color: Colors.white)),
                          labelText: 'Senha',
                          labelStyle: const TextStyle(fontSize: 15, color: Colors.white)),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: 100,
                      height: 50,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                      ),
                      child: const Center(
                        child: Text("Entrar", style: TextStyle(fontSize: 15, color: Colors.white)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
