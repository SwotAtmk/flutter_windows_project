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

  CancelFunc showLoading() {
    return BotToast.showCustomLoading(
        clickClose: true,
        allowClick: true,
        backButtonBehavior: BackButtonBehavior.none,
        ignoreContentClick: false,
        animationDuration: Duration(milliseconds: 200),
        animationReverseDuration: Duration(milliseconds: 200),
        duration: null,
        backgroundColor: Color(0x42000000),
        align: Alignment.center,
        toastBuilder: (cancelFunc) {
          return _CustomLoadWidget(cancelFunc: cancelFunc);
        });
  }

  void removeAll(String groupKey) => BotToast.removeAll(groupKey);

  void cleanAll() => BotToast.cleanAll();

  CancelFunc showPromptBox(Text text,{VoidCallback cancel,VoidCallback confirm,VoidCallback backgroundReturn}) => showAlertDialog(text,BackButtonBehavior.none, cancel:cancel, confirm:confirm , backgroundReturn: backgroundReturn);

  // ignore: missing_return
  CancelFunc showMenuBox(BuildContext context, {@required Widget child}){
    return BotToast.showAttachedWidget(
        attachedBuilder: (_) => Card(
          color: Colors.white,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
            child: child
          ),
        ),
        wrapToastAnimation: (controller, cancel, Widget child) => CustomAttachedAnimation(controller: controller, child: child,),
        animationDuration: Duration(milliseconds: 300),
        enableSafeArea: false,
        duration: null,
        targetContext: context
    );
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


/// 弹窗动画
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


/// 降重操作动画
class _CustomLoadWidget extends StatefulWidget {
  final CancelFunc cancelFunc;

  const _CustomLoadWidget({Key key, this.cancelFunc}) : super(key: key);

  @override
  __CustomLoadWidgetState createState() => __CustomLoadWidgetState();
}

class __CustomLoadWidgetState extends State<_CustomLoadWidget>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;

  @override
  void initState() {
    animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 300));

    animationController.addStatusListener((AnimationStatus status) {
      if (status == AnimationStatus.completed) {
        animationController.reverse();
      } else if (status == AnimationStatus.dismissed) {
        animationController.forward();
      }
    });
    animationController.forward();

    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            FadeTransition(
              opacity: animationController,
              child: IconButton(
                icon: Icon(Icons.archive, color: Color(0xff4296ff), size: 30),
                onPressed: (){

                },
              ),
            ),
            Text(
              "正在去重中",
            )
          ],
        ),
      ),
    );
  }
}


/// 菜单动画
class CustomAttachedAnimation extends StatefulWidget {
  final AnimationController controller;
  final Widget child;

  const CustomAttachedAnimation({Key key, this.controller, this.child})
      : super(key: key);

  @override
  _CustomAttachedAnimationState createState() =>
      _CustomAttachedAnimationState();
}

class _CustomAttachedAnimationState extends State<CustomAttachedAnimation> {
  Animation<double> animation;
  static final Tween<Offset> tweenOffset = Tween<Offset>(
    begin: const Offset(0, 40),
    end: const Offset(0, 0),
  );

  @override
  void initState() {
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
        return ClipRect(
          child: Align(
            heightFactor: animation.value,
            widthFactor: animation.value,
            child: Opacity(
              opacity: animation.value,
              child: child,
            ),
          ),
        );
      },
    );
  }
}
