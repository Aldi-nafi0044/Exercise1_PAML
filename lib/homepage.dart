import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class homepage extends StatelessWidget {
  const homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 20,
            ),
            Text('Pokedex.',
                style: TextStyle(
                    fontSize: 40,
                    color: Color.fromARGB(255, 255, 175, 55),
                    fontWeight: FontWeight.bold)),
            Text(
              'Welcome to Pokedex\nYou can find your favorit pokemon here',
              style:
                  TextStyle(fontSize: 15, color: Colors.black.withOpacity(0.6)),
              textAlign: TextAlign.center,
            ),
            Container(
              height: 80,
            ),
            Image.network(
              'https://purepng.com/public/uploads/large/purepng.com-pokeballpokeballdevicepokemon-ballpokemon-capture-ball-1701527825789urzm0.png',
              width: 150,
              height: 150,
            ),
            Container(
              height: 80,
            ),
            FloatingActionButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Loginpage()));
              },
              child: const Icon(Icons.east),
              backgroundColor: Color.fromARGB(255, 255, 175, 55),
            )
          ],
        ),
      ),
    );
  }
}

class Loginpage extends StatefulWidget {
  const Loginpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  final _formKey = GlobalKey<FormState>();

  bool hidepass = true;
  String? name;
  String? pass;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Image.network(
                    'https://pluspng.com/img-png/pokemon-logo-png-pokemon-logo-text-png-1428-1390.png',
                    width: 350,
                    height: null),
                Text(
                  "Let's get started.",
                  style: TextStyle(
                      fontSize: 30,
                      color: Color.fromARGB(255, 255, 175, 55),
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "There's No Sense In Going Out Of\nYour Way To Gey Somebody To Like You",
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.black.withOpacity(0.6),
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 35, right: 35),
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'please enter your name';
                      }
                    },
                    onSaved: (Value) {
                      name = Value;
                    },
                    decoration: const InputDecoration(
                      labelText: 'Name',
                      labelStyle: TextStyle(color: Colors.blue),
                      prefixIcon: Icon(Icons.person, color: Colors.blue),
                      hintText: 'Enter Your name',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 35, right: 35),
                  child: TextFormField(
                    obscureText: hidepass,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'please enter your name';
                      }
                      if (value.length < 6) {
                        return 'password must be more than 6 charater';
                      }
                    },
                    onSaved: (value) {
                      pass = value;
                    },
                    decoration: InputDecoration(
                      labelText: 'Password',
                      labelStyle: TextStyle(color: Colors.blue),
                      prefixIcon: Icon(Icons.lock, color: Colors.blue),
                      hintText: 'Enter Your Password',
                      suffixIcon: IconButton(
                        icon: hidepass
                            ? Icon(Icons.visibility_off)
                            : Icon(Icons.visibility),
                        onPressed: () {
                          setState(() {
                            hidepass = !hidepass;
                          });
                        },
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              Mainpage(),
                        ),
                      );
                    }
                    setState(() {});
                  },
                  child: Text('Sign In'),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Does not have account?'),
                    TextButton(
                      onPressed: () {Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              Regiterpage(),
                        ),
                      );},
                      child: const Text('Sign Up',),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Regiterpage extends StatelessWidget {
  const Regiterpage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class Mainpage extends StatelessWidget {
  const Mainpage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
