import 'dart:math';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';

import 'textStroke.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';

import 'package:image/image.dart' as image;
import 'dart:async';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'about.dart';
import 'dialog.dart';

// make statefull widget for testing
class SlidePuzzle extends StatefulWidget {
  SlidePuzzle({Key? key}) : super(key: key);

  @override
  _SlidePuzzleState createState() => _SlidePuzzleState();
}

class _SlidePuzzleState extends State<SlidePuzzle> {
  // default put 2
  int valueSlider = 2;
  GlobalKey<_SlidePuzzleWidgetState> globalKey = GlobalKey();

  @override
  void initState() {
    Timer(
        const Duration(milliseconds: 200),
        () => showAnimatedDialog<void>(
            animationType: DialogTransitionType.fadeScale,
            barrierDismissible: true,
            duration: const Duration(milliseconds: 350),
            context: context,
            builder: (_) => const AlertTip()));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double border = 5;
    var divHeight = MediaQuery.of(context).size.height;
    var divWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(65),
          child: AppBar(
            backgroundColor: Color(0xff8AD16A),
            toolbarHeight: divHeight,
            title: Container(
              width: divWidth * .45,
              decoration: BoxDecoration(
                color: Color(0XffD9D9D9),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                      flex: 1,
                      child: Image.asset('images/cognitive.png',
                          fit: BoxFit.fitHeight)),
                  const Flexible(
                      flex: 3,
                      child: Text(
                        'Cognitive',
                        style: TextStyle(fontSize: 25, color: Colors.black),
                      ))
                ],
              ),
            ),
            centerTitle: true,
            automaticallyImplyLeading: false,
          )),
      // appBar: AppBar(
      //   centerTitle: true,
      //   title: TextWidget(
      //     "Slide Puzzle ${valueSlider}x$valueSlider",
      //     color: Color(0xff225f87),
      //     strokeColor: Colors.white,
      //     strokeWidth: 8,
      //     fontSize: 30,
      //     overrideSizeStroke: false,
      //     fontFamily: '',
      //     shadow: [],
      //   ),
      //   actions: [
      //     InkWell(
      //       child: Icon(Icons.refresh),
      //       onTap: () => globalKey.currentState?.generatePuzzle(),
      //     )
      //   ],
      // ),
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        // color: Colors.green[100],
        child: SafeArea(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border:
                      Border.all(width: border, color: (Colors.green[600])!),
                ),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return Container(
                      width: constraints.biggest.width,
                      // comment of this so our box can extends height
                      // height: constraints.biggest.width,

                      // if setup decoration,color must put inside
                      // make puzzle widget
                      child: SlidePuzzleWidget(
                        key: globalKey,
                        size: constraints.biggest,
                        // set size puzzle
                        sizePuzzle: valueSlider,
                        imageBckGround: Image(
                          // u can use your own image
                          image: AssetImage("images/Twitter.png"),
                        ),
                      ),
                    );
                  },
                ),
                // child: ,
              ),
              Container(
                child: Slider(
                  min: 2,
                  max: 4,
                  divisions: 2,
                  label: "${valueSlider.toString()}",
                  value: valueSlider.toDouble(),
                  onChanged: (value) {
                    setState(
                      () {
                        valueSlider = value.toInt();
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// statefull widget
class SlidePuzzleWidget extends StatefulWidget {
  Size size;
  // set inner padding
  double innerPadding;
  // set image use for background
  Image imageBckGround;
  int sizePuzzle;
  SlidePuzzleWidget({
    Key? key,
    required this.size,
    this.innerPadding = 5,
    required this.imageBckGround,
    required this.sizePuzzle,
  }) : super(key: key);

  @override
  _SlidePuzzleWidgetState createState() => _SlidePuzzleWidgetState();
}

class _SlidePuzzleWidgetState extends State<SlidePuzzleWidget> {
  GlobalKey _globalKey = GlobalKey();
  late Size size;

  // list array slide objects
  List<SlideObject>? slideObjects;
  // image load with renderer
  image.Image? fullImage;
  // success flag
  bool success = false;
  // flag already start slide
  bool startSlide = false;
  // save current swap process for reverse checking
  late List<int> process;
  // flag finish swap
  bool finishSwap = false;

  @override
  Widget build(BuildContext context) {
    size = Size(widget.size.width - widget.innerPadding * 2,
        widget.size.width - widget.innerPadding);

    return Column(
      mainAxisSize: MainAxisSize.min,
      // let make ui
      children: [
        // make 2 column, 1 for puzzle box, 2nd for button testing
        Container(
          decoration: BoxDecoration(color: Colors.white),
          width: widget.size.width,
          height: widget.size.width,
          padding: EdgeInsets.all(widget.innerPadding),
          child: Stack(
            children: [
              // we use stack stack our background & puzzle box
              // 1st show image use

              if (widget.imageBckGround != null && slideObjects == null) ...[
                RepaintBoundary(
                  key: _globalKey,
                  child: Container(
                    padding: EdgeInsets.all(5),
                    color: Colors.red,
                    height: double.maxFinite,
                    child: widget.imageBckGround,
                  ),
                )
              ],
              // 2nd show puzzle with empty
              if (slideObjects != null)
                ...slideObjects!.where((slideObject) => slideObject.empty).map(
                  (slideObject) {
                    return Positioned(
                      left: slideObject.posCurrent.dx,
                      top: slideObject.posCurrent.dy,
                      child: SizedBox(
                        width: slideObject.size.width,
                        height: slideObject.size.height,
                        child: Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.all(2),
                          color: Colors.white24,
                          child: Stack(
                            children: [
                              if (slideObject.image != null) ...[
                                Opacity(
                                  opacity: success ? 1 : 0.3,
                                  child: slideObject.image,
                                )
                              ]
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ).toList(),
              // this for box with not empty flag
              if (slideObjects != null)
                ...slideObjects!.where((slideObject) => !slideObject.empty).map(
                  (slideObject) {
                    // change to animated position
                    // disabled checking success on swap process
                    return AnimatedPositioned(
                      duration: Duration(milliseconds: 200),
                      curve: Curves.ease,
                      left: slideObject.posCurrent.dx,
                      top: slideObject.posCurrent.dy,
                      child: GestureDetector(
                        onTap: () => changePos(slideObject.indexCurrent),
                        child: SizedBox(
                          width: slideObject.size.width,
                          height: slideObject.size.height,
                          child: Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.all(2),
                            color: Colors.blue,
                            child: Stack(
                              children: [
                                if (slideObject.image != null) ...[
                                  slideObject.image!
                                ],
                                Center(
                                  child: TextWidget(
                                    "${slideObject.indexDefault}",
                                    color: Color(0xff225f87),
                                    strokeColor: Colors.white,
                                    strokeWidth: 8,
                                    fontFamily: "KidZone",
                                    fontSize: 40,
                                    overrideSizeStroke: false,
                                    shadow: [],
                                  ),
                                ),

                                // nice one.. lets make it random
                              ],
                            ),
                            // nice one
                          ),
                        ),
                      ),
                    );
                  },
                ).toList()

              // now not show at all because we dont generate slideObjects yet.. lets generate
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
                onPressed: () {
                  setState(() {
                    Timer(
                        const Duration(milliseconds: 200),
                        () => showAnimatedDialog<void>(
                            animationType: DialogTransitionType.fadeScale,
                            barrierDismissible: true,
                            duration: const Duration(milliseconds: 350),
                            context: context,
                            builder: (_) => const AlertAbout()));
                  });
                },
                tooltip: 'About',
                icon: Icon(
                  Icons.info,
                  // color: Colors.green,
                  size: 27,
                )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () => generatePuzzle(),
                child: Text("PLAY"),
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: ElevatedButton(
            //     // for checking purpose
            //     onPressed: startSlide ? null : () => reversePuzzle(),
            //     child: Text("Reverse"),
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () => clearPuzzle(),
                child: Text("CLEAR"),
              ),
            ),
            IconButton(
                onPressed: () {
                  setState(() {
                    Timer(
                        const Duration(milliseconds: 200),
                        () => showAnimatedDialog<void>(
                            animationType: DialogTransitionType.fadeScale,
                            barrierDismissible: true,
                            duration: const Duration(milliseconds: 350),
                            context: context,
                            builder: (_) => const AlertTip()));
                  });
                },
                tooltip: 'Tips',
                icon: Icon(
                  Icons.question_mark_rounded,
                  // color: Colors.green,
                  size: 27,
                )),
          ],
        ),
      ],
    );
  }

  // setup method use

  // get render image
  // same as jigsaw puzzle method before

  _getImageFromWidget() async {
    // RenderObject? boundary = _globalKey.currentContext?.findRenderObject();
    final RenderRepaintBoundary boundary =
        _globalKey.currentContext!.findRenderObject()! as RenderRepaintBoundary;

    size = boundary.size;
    var img = await boundary.toImage();
    var byteData = await img.toByteData(format: ImageByteFormat.png);
    var pngBytes = byteData?.buffer.asUint8List();

    return image.decodeImage(pngBytes!);
  }

  // method to generate our puzzle
  generatePuzzle() async {
    // dclare our array puzzle
    finishSwap = false;
    setState(() {});
    // 1st load render image to crop, we need load just once
    if (widget.imageBckGround != null && this.fullImage == null)
      this.fullImage = await _getImageFromWidget();

    print(this.fullImage?.width);
    // ok nice..full image loaded

    // calculate box size for each puzzle
    Size sizeBox =
        Size(size.width / widget.sizePuzzle, size.width / widget.sizePuzzle);

    // let proceed with generate box puzzle
    // power of 2 because we need generate row & column same number
    slideObjects =
        List.generate(widget.sizePuzzle * widget.sizePuzzle, (index) {
      // we need setup offset 1st
      Offset offsetTemp = Offset(
        index % widget.sizePuzzle * sizeBox.width,
        index ~/ widget.sizePuzzle * sizeBox.height,
      );

      // set image crop for nice effect, check also if image is null
      image.Image? tempCrop;
      // Uint8List uint8list;
      // uint8list = Uint8List.fromList(tempCrop);
      if (widget.imageBckGround != null && this.fullImage != null)
        tempCrop = image.copyCrop(
          fullImage!,
          offsetTemp.dx.round(),
          offsetTemp.dy.round(),
          sizeBox.width.round(),
          sizeBox.height.round(),
        );

      return SlideObject(
        posCurrent: offsetTemp,
        posDefault: offsetTemp,
        indexCurrent: index,
        indexDefault: index + 1,
        size: sizeBox,
        image: tempCrop == null
            ? null
            : Image.memory(
                Uint8List.fromList(image.encodePng(tempCrop)),
                fit: BoxFit.contain,
              ),
      );
    }); //let set empty on last child

    slideObjects?.last.empty = true;

    // make random.. im using smple method..just rndom with move it.. haha

    // setup moveMethod 1st
    // proceed with swap block place
    // swap true - we swap horizontal line.. false - vertical
    bool swap = true;
    process = [];

    // 20 * size puzzle shuffle
    for (var i = 0; i < widget.sizePuzzle * 20; i++) {
      for (var j = 0; j < widget.sizePuzzle / 2; j++) {
        SlideObject slideObjectEmpty = getEmptyObject();

        // get index of empty slide object
        int emptyIndex = slideObjectEmpty.indexCurrent;
        process.add(emptyIndex);
        int randKey;

        if (swap) {
          // horizontal swap
          int row = emptyIndex ~/ widget.sizePuzzle;
          randKey =
              row * widget.sizePuzzle + new Random().nextInt(widget.sizePuzzle);
        } else {
          int col = emptyIndex % widget.sizePuzzle;
          randKey =
              widget.sizePuzzle * new Random().nextInt(widget.sizePuzzle) + col;
        }

        // call change pos method we create before to swap place

        changePos(randKey);
        // ops forgot to swap
        // hmm bug.. :).. let move 1st with click..check whther bug on swap or change pos
        swap = !swap;
      }
    }

    startSlide = false;
    finishSwap = true;
    setState(() {});
  }
  // eyay.. end

  // get empty slide object from list
  SlideObject getEmptyObject() {
    return slideObjects!.firstWhere((element) => element.empty);
  }

  changePos(int indexCurrent) {
    // problem here i think..
    SlideObject slideObjectEmpty = getEmptyObject();

    // get index of empty slide object
    int emptyIndex = slideObjectEmpty.indexCurrent;

    // min & max index based on vertical or horizontal

    int minIndex = min(indexCurrent, emptyIndex);
    int maxIndex = max(indexCurrent, emptyIndex);

    // temp list moves involves
    List<SlideObject> rangeMoves = [];

    // check if index current from vertical / horizontal line
    if (indexCurrent % widget.sizePuzzle == emptyIndex % widget.sizePuzzle) {
      // same vertical line
      rangeMoves = slideObjects!
          .where((element) =>
              element.indexCurrent % widget.sizePuzzle ==
              indexCurrent % widget.sizePuzzle)
          .toList();
    } else if (indexCurrent ~/ widget.sizePuzzle ==
        emptyIndex ~/ widget.sizePuzzle) {
      rangeMoves = slideObjects!;
    } else {
      rangeMoves = [];
    }

    rangeMoves = rangeMoves
        .where((puzzle) =>
            puzzle.indexCurrent >= minIndex &&
            puzzle.indexCurrent <= maxIndex &&
            puzzle.indexCurrent != emptyIndex)
        .toList();

    // check empty index under or above current touch
    if (emptyIndex < indexCurrent)
      rangeMoves.sort((a, b) => a.indexCurrent < b.indexCurrent ? 1 : 0);
    else
      rangeMoves.sort((a, b) => a.indexCurrent < b.indexCurrent ? 0 : 1);

    // check if rangeMOves is exist,, then proceed switch position
    if (rangeMoves.length > 0) {
      int tempIndex = rangeMoves[0].indexCurrent;

      Offset tempPos = rangeMoves[0].posCurrent;

      // yeayy.. sorry my mistake.. :)
      for (var i = 0; i < rangeMoves.length - 1; i++) {
        rangeMoves[i].indexCurrent = rangeMoves[i + 1].indexCurrent;
        rangeMoves[i].posCurrent = rangeMoves[i + 1].posCurrent;
      }

      rangeMoves.last.indexCurrent = slideObjectEmpty.indexCurrent;
      rangeMoves.last.posCurrent = slideObjectEmpty.posCurrent;

      // haha ..i forget to setup pos for empty puzzle box.. :p
      slideObjectEmpty.indexCurrent = tempIndex;
      slideObjectEmpty.posCurrent = tempPos;
    }

    // this to check if all puzzle box already in default place.. can set callback for success later
    if (slideObjects
                ?.where((slideObject) =>
                    slideObject.indexCurrent == slideObject.indexDefault - 1)
                .length ==
            slideObjects?.length &&
        finishSwap) {
      // print("Success");
      setState(() {
        Timer(
            const Duration(milliseconds: 200),
            () => showAnimatedDialog<void>(
                animationType: DialogTransitionType.fadeScale,
                barrierDismissible: true,
                duration: const Duration(milliseconds: 350),
                context: context,
                builder: (_) => const dialog()));
      });
      success = true;
    } else {
      success = false;
    }

    startSlide = true;
    setState(() {});
  }

  clearPuzzle() {
    setState(() {
      // checking already slide for reverse purpose
      startSlide = true;
      slideObjects = null;
      finishSwap = true;
    });
  }

  reversePuzzle() async {
    startSlide = true;
    finishSwap = true;
    setState(() {});

    await Stream.fromIterable(process.reversed)
        .asyncMap((event) async =>
            await Future.delayed(Duration(milliseconds: 50))
                .then((value) => changePos(event)))
        .toList();

    // yeayy
    process = [];
    setState(() {});
  }
}

// lets start class use
class SlideObject {
  // setup offset for default / current position
  Offset posDefault;
  Offset posCurrent;
  // setup index for default / current position
  int indexDefault;
  int indexCurrent;
  // status box is empty
  bool empty;
  // size each box
  Size size;
  // Image field for crop later
  Image? image;

  SlideObject({
    this.empty = false,
    required this.image,
    required this.indexCurrent,
    required this.indexDefault,
    required this.posCurrent,
    required this.posDefault,
    required this.size,
  });
}
