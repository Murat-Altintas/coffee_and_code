import 'package:flutter/material.dart';

/*
class CoffeeScene extends Sprite {
  Bitmap image;
  String url;

  CoffeeScene(this.url) {
    onAddedToStage.addOnce(_initUI);
    // _loadImage(url);
    // graphics.beginFill(Colors.green.value).drawRect(0, 0, 30, 300).endFill();
  }

  double targetScale;

  Future<void> _initUI() async {
    var texture = await AssetLoader.loadTexture(url, 1);
    trace('image texture:', texture);
    image = Bitmap(texture);
    addChild(image);
    ///we must will be change this animation. because i got "need compositing" error from "big to small" effect. First "big" effect is  exceeds the limit of the size.
    image.height = stage.stageHeight;
    targetScale = image.scaleX = image.scaleY;
    image.alignPivot(Alignment.bottomCenter);
    image.x = stage.stageWidth / 2;
    image.y = stage.stageHeight;

    //image.x = (stage.stageWidth - image.width) / 2;
    image.alpha = 0;
    image.scale = 0;
    // image.rotation = GameUtils.rndRange(-.5, .5);

    image.tween(duration: 3, alpha: 1, scale: targetScale, ease: GEase.elasticOut);
  }
}
*/
