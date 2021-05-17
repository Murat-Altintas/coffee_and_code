import 'package:flutter/cupertino.dart';

/*
class CoffeeItemScene extends Sprite {
  String imageUrl = "assets/images/espresso_roast_vintage_2.png";

  @override
  Future<void> addedToStage() async {
    //var tx = await TextureUtils.createRect();
    buildProductImage();
  }

  _ProductPlayful product;

  void buildProductImage() async {
    // product = _ProductPlayful();
    product = _ProductSerious();
    product.loadImage(imageUrl);
    addedToStage()
    addChild(product);
  }
}

class _ProductSerious extends _ProductPlayful {
  @override
  void update(double delta) {
    if (numChildren == 0) return;
    moveCounter += .01;
    var ratio = sin(moveCounter);
    image.y = imageY + ratio * 10;
    double ratio2 = (ratio / 2 + .5);
    shadow.scaleX = 0.8 + ratio2 * 0.2;
    shadow.scaleY = 0.2 - ratio2 * 0.05;
    shadow.alpha = 0.6 + ratio2 * 0.3;
  }
}

class _ProductPlayful extends Sprite {
  String url;
  Bitmap image;
  Shape shadow;

  double shadowY = 0.0;
  double imageY = 0.0;
  var moveCounter = 0.0;
  var rotationCounter = 0.0;

  void loadImage(String url) {
    this.url = url;
    initUi();
  }

  void initUi() async {
    var tx = await AssetLoader.loadTexture(url, 2.0);
    image = Bitmap(tx);
    image.alignPivot(Alignment.bottomCenter);

    image.x = image.pivotX;
    imageY = image.y = image.pivotY;

    var itmW = image.width;
    shadow = Shape()..graphics.beginFill(0x0).drawCircle(0, 0, itmW / 2).endFill();
    shadow.filters = [BlurFilter(8, 8)];
    shadow.scaleY = .2;
    shadowY = shadow.y = image.bounds.height + shadow.height;
    shadow.x = image.bounds.width / 2;

    addChild(image);
    addChild(shadow);
  }

  @override
  void update(double delta) {
    super.update(delta);
    if (numChildren == 0) return;
    moveCounter += .05;
    rotationCounter += .02;

    var ratioRot = sin(rotationCounter);
    var ratio = sin(moveCounter);
    image.y = imageY + ratio * 20;
    double ratio2 = (ratio / 2 + .5);
    image.scaleX = 0.9 + ratio2 * .1;
    image.scaleY = 0.88 + -ratio2 * .12;
    image.rotation = ratioRot * .1;
    shadow.scaleX = 0.8 + ratio2 * 0.2;
    shadow.scaleY = 0.2 - ratio2 * 0.05;
    shadow.alpha = 0.6 + ratio2 * 0.3;
    // shadow.y = shadowY + -ratio * 20;
  }
}

 */
