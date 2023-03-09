import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ik8_otus_food/src/config/theme/main.dart';
import 'package:ik8_otus_food/src/presentations/pages/recipe/recipe_list_view.dart';

class MenuIcon {
  final String active;
  final String unactive;

  const MenuIcon(this.active, this.unactive);

  Widget builder(BuildContext context, bool isActive) {
    return SizedBox(
      height: 20,
      width: 20,
      child: Image.asset(isActive ? active : unactive),
    );
  }

  static const favorite = MenuIcon(favoriteActive, favoriteUnactive);
  static const food = MenuIcon(foodActive, foodUnactive);
  static const profile = MenuIcon(profileActive, profileUnactive);

  static const favoriteActive = 'assets/icons/icon_favorite_active.png';
  static const favoriteUnactive = 'assets/icons/icon_favorite_unactive.png';
  static const foodActive = 'assets/icons/icon_pizza_active.png';
  static const foodUnactive = 'assets/icons/icon_pizza_unactive.png';
  static const profileActive = 'assets/icons/icon_profile_active.png';
  static const profileUnactive = 'assets/icons/icon_profile_unactive.png';
  static const passwordUnactive = 'assets/icons/icon_password_unactive.png';

  static const _valuesSrc = [
    favoriteActive,
    favoriteUnactive,
    foodActive,
    foodUnactive,
    profileActive,
    profileUnactive,
    passwordUnactive,
  ];

  static Future<void> precache(BuildContext context) async {
    for (var icon in _valuesSrc) {
      await precacheImage(Image.asset(icon).image, context);
    }
  }
}

class UnauthMenuPage extends StatefulWidget {
  const UnauthMenuPage({Key? key}) : super(key: key);

  @override
  State<UnauthMenuPage> createState() => _UnauthMenuPageState();
}

class _UnauthMenuPageState extends State<UnauthMenuPage> {
  int index = 0;

  @override
  void didChangeDependencies() async {
    await MenuIcon.precache(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: IndexedStack(
        index: index,
        children: const [
          RecipeListPage(),
          SignSection(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        items: [
          BottomNavigationBarItem(
            icon: MenuIcon.food.builder(context, index == 0),
            label: 'Рецепты',
          ),
          BottomNavigationBarItem(
            icon: MenuIcon.profile.builder(context, index == 1),
            label: 'Вход',
          ),
        ],
        unselectedFontSize: 14,
        onTap: (index) {
          setState(() {
            this.index = index;
          });
        },
      ),
    );
  }
}

class SignSection extends StatefulWidget {
  const SignSection({Key? key}) : super(key: key);

  @override
  _SignSectionState createState() => _SignSectionState();
}

class _SignSectionState extends State<SignSection> {
  bool isSignIn = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: primaryColor,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: primaryColor,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
        ),
      ),
      body: isSignIn
          ? SignInPanelView(
              onSignUpPressed: () {
                setState(() {
                  isSignIn = false;
                });
              },
            )
          : SignUpPanelView(
              onSignInPressed: () {
                setState(() {
                  isSignIn = true;
                });
              },
            ),
    );
  }
}

class SignInPanel extends StatelessWidget {
  final VoidCallback onSignUpPressed;

  const SignInPanel({
    Key? key,
    required this.onSignUpPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SignInPanelView(onSignUpPressed: onSignUpPressed);
  }
}

class SignInPanelView extends StatefulWidget {
  final VoidCallback onSignUpPressed;

  const SignInPanelView({
    Key? key,
    required this.onSignUpPressed,
  }) : super(key: key);

  @override
  State<SignInPanelView> createState() => _SignInPanelViewState();
}

class _SignInPanelViewState extends State<SignInPanelView> {
  final TextEditingController _login = TextEditingController(),
      _password = TextEditingController();

  @override
  void dispose() {
    _login.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              const Flexible(child: SizedBox.expand()),
              Flexible(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(bottom: 80),
                      child: Center(
                        child: Text(
                          'Otus.Food',
                          style: TextStyle(color: Colors.white, fontSize: 30),
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        AppTextInput(
                          hint: "логин",
                          iconSrc: MenuIcon.profileUnactive,
                          controller: _login,
                        ),
                        const SizedBox(height: 16),
                        AppTextInput(
                          hint: "пароль",
                          obscureText: true,
                          iconSrc: MenuIcon.passwordUnactive,
                          controller: _password,
                          textInputAction: TextInputAction.done,
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: AppOutlinedButton(
                        text: 'Войти',
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ),
              const Flexible(child: SizedBox()),
            ],
          ),
        ),
        Center(
          child: GestureDetector(
            onTap: widget.onSignUpPressed,
            child: Container(
              color: Colors.transparent,
              padding: const EdgeInsets.all(26),
              child: const Text(
                'Зарегистрироваться',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class SignUpPanelView extends StatefulWidget {
  final VoidCallback onSignInPressed;

  const SignUpPanelView({
    Key? key,
    required this.onSignInPressed,
  }) : super(key: key);

  @override
  State<SignUpPanelView> createState() => _SignUpPanelViewState();
}

class _SignUpPanelViewState extends State<SignUpPanelView> {
  final TextEditingController _login = TextEditingController(),
      _password = TextEditingController(),
      _repeatPassword = TextEditingController();

  @override
  void dispose() {
    _login.dispose();
    _password.dispose();
    _repeatPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              const Flexible(child: SizedBox.expand()),
              Flexible(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(bottom: 80),
                      child: Center(
                        child: Text(
                          'Otus.Food',
                          style: TextStyle(color: Colors.white, fontSize: 30),
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        AppTextInput(
                          hint: "логин",
                          iconSrc: MenuIcon.profileUnactive,
                          controller: _login,
                        ),
                        const SizedBox(height: 16),
                        AppTextInput(
                          hint: "пароль",
                          obscureText: true,
                          iconSrc: MenuIcon.passwordUnactive,
                          controller: _password,
                        ),
                        const SizedBox(height: 16),
                        AppTextInput(
                          hint: "пароль еще раз",
                          obscureText: true,
                          iconSrc: MenuIcon.passwordUnactive,
                          controller: _repeatPassword,
                          textInputAction: TextInputAction.done,
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: AppOutlinedButton(
                        text: 'Регистрация',
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ),
              const Flexible(child: SizedBox()),
            ],
          ),
        ),
        Center(
          child: GestureDetector(
            onTap: widget.onSignInPressed,
            child: Container(
              color: Colors.transparent,
              padding: const EdgeInsets.all(26),
              child: const Text(
                'Войти в приложение',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class AppTextInput extends StatelessWidget {
  final String hint;
  final String iconSrc;
  final TextEditingController controller;
  final bool obscureText;
  final TextInputAction textInputAction;

  const AppTextInput({
    Key? key,
    required this.hint,
    required this.iconSrc,
    required this.controller,
    this.textInputAction = TextInputAction.next,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 12,
              top: 12,
              bottom: 12,
            ),
            child: SizedBox.square(
              dimension: 24,
              child: Image.asset(iconSrc),
            ),
          ),
          Expanded(
            child: TextFormField(
              textInputAction: textInputAction,
              obscureText: obscureText,
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: const EdgeInsets.all(12),
                hintText: hint,
                hintStyle: const TextStyle(
                  fontSize: 16,
                  color: hintColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AppOutlinedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  const AppOutlinedButton({
    Key? key,
    required this.onPressed,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        backgroundColor: primaryDarkColor,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        textStyle: const TextStyle(fontSize: 16),
        padding: const EdgeInsets.all(12),
      ),
      onPressed: onPressed,
      child: Text(text),
    );
  }
}
