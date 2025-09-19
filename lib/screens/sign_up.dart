// lib/screens/auth/sign_up.dart
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _name = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _confirm = TextEditingController();

  bool _obscurePw = true;
  bool _obscureCf = true;
  bool _marketing = false;

  @override
  void dispose() {
    _name.dispose();
    _email.dispose();
    _password.dispose();
    _confirm.dispose();
    super.dispose();
  }

  OutlineInputBorder _border({bool isFocused = false}) => OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide(
      color: isFocused ? const Color(0xFF6DB06C) : Colors.transparent,
      width: 1.2,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios_new_rounded),
                    onPressed: () => Navigator.maybePop(context),
                  ),
                  const Expanded(
                    child: Center(
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.2,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 48),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _filledField(controller: _name, hint: 'Name'),
                    const SizedBox(height: 14),
                    _filledField(
                      controller: _email,
                      hint: 'Email  Id or Username',
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 14),
                    TextField(
                      controller: _password,
                      obscureText: _obscurePw,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        filled: true,
                        fillColor: const Color(0xFFF4F4F4),
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 18),
                        border: _border(),
                        enabledBorder: _border(),
                        focusedBorder: _border(isFocused: true),
                        suffixIcon: IconButton(
                          icon: Icon(_obscurePw
                              ? Icons.visibility_off_rounded
                              : Icons.visibility_rounded),
                          onPressed: () =>
                              setState(() => _obscurePw = !_obscurePw),
                        ),
                      ),
                    ),
                    const SizedBox(height: 14),
                    TextField(
                      controller: _confirm,
                      obscureText: _obscureCf,
                      decoration: InputDecoration(
                        hintText: 'Confirm Password',
                        filled: true,
                        fillColor: const Color(0xFFF4F4F4),
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 18),
                        border: _border(),
                        enabledBorder: _border(),
                        focusedBorder: _border(isFocused: true),
                        suffixIcon: IconButton(
                          icon: Icon(_obscureCf
                              ? Icons.visibility_off_rounded
                              : Icons.visibility_rounded),
                          onPressed: () =>
                              setState(() => _obscureCf = !_obscureCf),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Checkbox(
                          value: _marketing,
                          activeColor: const Color(0xFF6DB06C),
                          onChanged: (v) => setState(() => _marketing = v!),
                        ),
                        const Expanded(
                          child: Text(
                            'Yes, I want to receive discounts, loyalty offers\nand other updates.',
                            style: TextStyle(height: 1.2),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),

                    const _OrDivider(labelTop: 'OR', labelBottom: 'Sign Up using'),
                    const SizedBox(height: 8),
                    const _SocialRow(),

                    const SizedBox(height: 22),
                    _PrimaryButton(
                      label: 'Create Account',
                      onPressed: () {
                        // TODO: 실제 회원가입 처리
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Create Account tapped')),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _filledField({
    required TextEditingController controller,
    required String hint,
    TextInputType? keyboardType,
  }) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: const Color(0xFFF4F4F4),
        contentPadding:
        const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
        border: _border(),
        enabledBorder: _border(),
        focusedBorder: _border(isFocused: true),
      ),
    );
  }
}

// 재사용 위젯들 (Sign In 파일과 동일 이름/동작)
class _OrDivider extends StatelessWidget {
  final String labelTop;
  final String labelBottom;
  const _OrDivider({required this.labelTop, required this.labelBottom});

  @override
  Widget build(BuildContext context) {
    final grey = Colors.grey.shade400;
    return Column(
      children: [
        const SizedBox(height: 6),
        Text(labelTop, style: TextStyle(color: grey)),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(child: Divider(color: grey)),
            const SizedBox(width: 12),
            Text(labelBottom,
                style:
                TextStyle(color: Colors.grey.shade600, letterSpacing: 0.2)),
            const SizedBox(width: 12),
            Expanded(child: Divider(color: grey)),
          ],
        ),
      ],
    );
  }
}

class _SocialRow extends StatelessWidget {
  const _SocialRow();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        _CircleBrand(label: 'N', bg: Color(0xFF03C75A)), // Naver
        SizedBox(width: 18),
        _CircleBrand(label: 'G', bg: Colors.white, border: true), // Google
        SizedBox(width: 18),
        _CircleBrand(label: 'K', bg: Color(0xFFFFE812), textColor: Colors.black), // Kakao
      ],
    );
  }
}

class _CircleBrand extends StatelessWidget {
  final String label;
  final Color bg;
  final bool border;
  final Color textColor;
  const _CircleBrand({
    required this.label,
    required this.bg,
    this.border = false,
    this.textColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return InkResponse(
      onTap: () {},
      child: Container(
        width: 48,
        height: 48,
        decoration: BoxDecoration(
          color: bg,
          shape: BoxShape.circle,
          border: border ? Border.all(color: Colors.grey.shade300, width: 2) : null,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.06),
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        alignment: Alignment.center,
        child: Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.w800,
            fontSize: 20,
            color: textColor,
          ),
        ),
      ),
    );
  }
}

class _PrimaryButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  const _PrimaryButton({required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 52,
      child: FilledButton(
        style: FilledButton.styleFrom(
          backgroundColor: const Color(0xFF6DB06C),
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          textStyle: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        onPressed: onPressed,
        child: Text(label),
      ),
    );
  }
}