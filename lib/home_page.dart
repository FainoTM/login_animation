import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rive/rive.dart' as rv;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late rv.RiveAnimationController _controller;
  List<bool> isSelected = [true, false];

  @override
  void initState() {
    super.initState();
    _controller = rv.OneShotAnimation('test', autoplay: true);
  }

  void _playanimation() {
    setState(() {
      _controller.isActive = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // Animação ocupando 60% da largura da tela
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width * 0.6,
            child: rv.RiveAnimation.asset(
              'assets/animations/tiny_green_mall_wizard.riv',
              controllers: [_controller],
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(100, 25, 200, 25),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.network(
                      'https://cdn.rive.app/icons/rive_logo_black.svg',
                      height: 50,
                    ),
                    SizedBox(height: 70),
                    Text(
                      'Express login via Google and Facebook',
                      style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: () {},
                            icon: Icon(Icons.g_mobiledata,),
                            label: Text('Google'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.grey[100],
                              foregroundColor: Colors.black,
                              padding: EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    bottomLeft: Radius.circular(10)),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 2),
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: () {},
                            label: Text('Facebook'),
                            icon: Icon(Icons.facebook),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.grey[100],
                              foregroundColor: Colors.black,
                              padding: EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(10),
                                    bottomRight: Radius.circular(10)),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 32,),
                    Divider(),
                    SizedBox(height: 32),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ToggleButtons(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8),
                              topRight: Radius.circular(8),
                            ),
                            selectedBorderColor: Colors.transparent,
                            fillColor: Colors.grey[200],
                            selectedColor: Colors.black,
                            color: Colors.grey[700],
                            constraints: BoxConstraints(minHeight: 48, minWidth: 100),
                            isSelected: isSelected,
                            onPressed: (index) {
                              setState(() {
                                isSelected = [index == 0, index == 1];
                              });
                            },
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 16),
                                child: Text('Log in'),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 16),
                                child: Text('Sign up'),
                              ),
                            ],
                          ),
                          if (isSelected[0])
                            Column(
                              children: [
                                Container(
                                  color: Colors.grey[200],
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextField(
                                      decoration: InputDecoration(
                                        labelText: 'email or username',
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  color: Colors.grey[200],
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextField(
                                      obscureText: true,
                                      decoration: InputDecoration(
                                        labelText: 'password',
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          if (isSelected[0])
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {},
                                child: Text(
                                  'Log in',
                                  style: TextStyle(color: Colors.white),
                                ),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.black,
                                  padding: EdgeInsets.symmetric(vertical: 16),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(8),
                                      bottomRight: Radius.circular(8),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16),
                    Center(
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          'Log in with SSO',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Center(
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          'Forgot password?',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
