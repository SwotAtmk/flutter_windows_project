import 'package:flutter/painting.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';

/// 提示服务
class ToastUtilsService{
  double x;
  double y;


  Future<ToastUtilsService> init (ix,iy) async{
    x = ix;
    y = iy;
    return this;
  }

  /// 显示默认Text
  CancelFunc showText(textContent) => BotToast.showText(text:textContent, align: Alignment(x,y));

  CancelFunc showLoading() => BotToast.showLoading();

  void removeAll() => BotToast.removeAll();

  CancelFunc showPromptBox(Text text,{VoidCallback cancel,VoidCallback confirm,VoidCallback backgroundReturn}){
    return showAlertDialog(text,BackButtonBehavior.none, cancel:cancel, confirm:confirm , backgroundReturn: backgroundReturn);
  }
  CancelFunc showAlertDialog(Text text,BackButtonBehavior backButtonBehavior,
      {VoidCallback cancel,
        VoidCallback confirm,
        VoidCallback backgroundReturn}) {
    return BotToast.showAnimationWidget(
        clickClose: false,
        allowClick: false,
        onlyOne: true,
        crossPage: true,
        backButtonBehavior: backButtonBehavior,
        wrapToastAnimation: (controller, cancel, child) => Stack(
          children: <Widget>[
            GestureDetector(
              child: AnimatedBuilder(
                builder: (_, child) => Opacity(
                  opacity: controller.value,
                  child: child,
                ),
                child: DecoratedBox(
                  decoration: BoxDecoration(color: Colors.black26),
                  child: SizedBox.expand(),
                ),
                animation: controller,
              ),
            ),
            CustomOffsetAnimation(
              controller: controller,
              child: child,
            )
          ],
        ),
        toastBuilder: (cancelFunc) => AlertDialog(
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          title: text,
          actions: <Widget>[
            FlatButton(
              onPressed: () {
                cancelFunc();
                confirm?.call();
              },
              child: const Text('确定'),
            ),
          ],
        ),
        animationDuration: Duration(milliseconds: 300));
  }
}

class CustomOffsetAnimation extends StatefulWidget {
  final AnimationController controller;
  final Widget child;

  const CustomOffsetAnimation({Key key, this.controller, this.child})
      : super(key: key);

  @override
  _CustomOffsetAnimationState createState() => _CustomOffsetAnimationState();
}

class _CustomOffsetAnimationState extends State<CustomOffsetAnimation> {
  Tween<Offset> tweenOffset;
  Tween<double> tweenScale;

  Animation<double> animation;

  @override
  void initState() {
    tweenOffset = Tween<Offset>(
      begin: const Offset(0.0, 0.8),
      end: Offset.zero,
    );
    tweenScale = Tween<double>(begin: 0.3, end: 1.0);
    animation =
        CurvedAnimation(parent: widget.controller, curve: Curves.decelerate);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      child: widget.child,
      animation: widget.controller,
      builder: (BuildContext context, Widget child) {
        return FractionalTranslation(
            translation: tweenOffset.evaluate(animation),
            child: ClipRect(
              child: Transform.scale(
                scale: tweenScale.evaluate(animation),
                child: Opacity(
                  child: child,
                  opacity: animation.value,
                ),
              ),
            ));
      },
    );
  }
}
