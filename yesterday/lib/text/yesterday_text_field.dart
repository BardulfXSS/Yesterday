import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class YesterdayTextField extends StatelessWidget {
  final TextEditingController controller;
  final bool enabled;
  final FocusNode focusNode;
  final String labelText;
  final bool obscureText;
  final void Function(String) onSubmitted;
  final Widget suffixIcon;
  final TextAlignVertical textAlignVertical;
  final TextInputAction textInputAction;

  YesterdayTextField({
    Key key,
    this.controller,
    this.enabled = true,
    focusNode,
    this.labelText,
    this.obscureText = false,
    this.onSubmitted,
    this.suffixIcon,
    this.textAlignVertical,
    this.textInputAction = TextInputAction.done,
  })  : focusNode = focusNode ?? FocusNode(),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: FocusScope(
        onFocusChange: (value) {
          (context as Element).markNeedsBuild();
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            if (labelText != null)
              Padding(
                padding: const EdgeInsets.all(8),
                child: TextFieldLabelText(
                  labelText,
                  style: TextStyle(
                    color: focusNode.hasFocus
                        ? NeumorphicTheme.of(context).current.accentColor
                        : null,
                  ),
                ),
              ),
            Neumorphic(
              style: NeumorphicStyle(
                boxShape:
                    NeumorphicBoxShape.roundRect(BorderRadius.circular(100)),
                depth: -NeumorphicTheme.of(context).current.depth,
              ),
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                  border: InputBorder.none,
                  suffixIcon: suffixIcon,
                ),
                enabled: enabled,
                focusNode: focusNode,
                textAlignVertical: textAlignVertical,
                textInputAction: textInputAction,
                obscureText: obscureText,
                onSubmitted: onSubmitted,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TextFieldLabelText extends StatelessWidget {
  final String text;
  final TextStyle style;
  const TextFieldLabelText(this.text, {Key key, this.style}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.subtitle2.merge(style),
    );
  }
}
