import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:ui' as ui;
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_extend/share_extend.dart';

import '../components/fonts.dart';
import '../models/model.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  List<String> images = [
    "https://i.pinimg.com/236x/40/93/bf/4093bf65f7af52c9cd5bee6fac2da898.jpg",
    "https://i.pinimg.com/236x/0c/1f/54/0c1f54821166f7a03be995132123bff5.jpg",
    "https://i.pinimg.com/236x/be/28/24/be28247cbd364ca26adf9214c17128f6.jpg",
    "https://i.pinimg.com/236x/5d/7c/1d/5d7c1d6324d89bada366786918ad5725.jpg",
    "https://i.pinimg.com/enabled_hi/236x/73/c1/f6/73c1f6aa0d92b9d374edac5f4ac5dae6.jpg",
    "https://i.pinimg.com/236x/89/8a/19/898a1986428094f26e88b042f6889cc3.jpg",
    "https://i.pinimg.com/236x/6a/9b/ac/6a9bac6d27acf91ee2d021d1a5588301.jpg",
    "https://i.pinimg.com/236x/12/d5/25/12d525131f59960914b73349eae53ace.jpg",
    "https://i.pinimg.com/enabled_hi/236x/e4/27/65/e42765141014dd10c090c1c8ef362afa.jpg",
    "https://i.pinimg.com/236x/13/89/43/138943842dbd7cb888dc89afbd81ef9f.jpg",
    "https://i.pinimg.com/236x/23/a8/bb/23a8bb848ed47c10d955519eaf88ae53.jpg",
    "https://i.pinimg.com/236x/be/f6/ad/bef6ad408f96b8123a962b9a965461b3.jpg",
    "https://i.pinimg.com/236x/ca/30/ff/ca30fff2d3ea49a93e92fd60a3f06546.jpg",
    "https://i.pinimg.com/736x/2b/83/e2/2b83e2833d38ee769fa173dc952f7a2d.jpg",
    "https://i.pinimg.com/enabled_hi/236x/c6/72/00/c67200b40d58c6a28cae2c0cd205c79d.jpg",
  ];

  Color backgroundColor = Colors.white;
  String font = "Australia";
  bool isImage = true;
  String? selectedImage;
  Color fontColour = Colors.black87;
  GlobalKey key = GlobalKey();

  Future<void> copyQuote({required FestivalModelClass fest}) async {
    await Clipboard.setData(
      ClipboardData(text: "${fest.description}\n ~ ${fest.name}"),
    ).then((value) {
      SnackBar snackBar = const SnackBar(
        content: Text("Quote copied to clipboard"),
        backgroundColor: Colors.green,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    });
  }

  Future<void> saveToGallery() async {
    try {
      RenderRepaintBoundary boundary =
          key.currentContext!.findRenderObject()! as RenderRepaintBoundary;
      ui.Image image = await boundary.toImage(pixelRatio: 3.0);
      ByteData? byteData =
          await image.toByteData(format: ui.ImageByteFormat.png);
      final buffer = byteData!.buffer.asUint8List();
      final result = await ImageGallerySaver.saveImage(buffer);
      if (result['isSuccess']) {
        SnackBar snackBar = const SnackBar(
          content: Text("Image saved to gallery"),
          backgroundColor: Colors.green,
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    } catch (e) {
      SnackBar snackBar = const SnackBar(
        content: Text("Failed to save image"),
        backgroundColor: Colors.red,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  Future<void> shareImage() async {
    try {
      RenderRepaintBoundary boundary =
          key.currentContext!.findRenderObject()! as RenderRepaintBoundary;
      ui.Image image = await boundary.toImage(pixelRatio: 3.0);
      ByteData? byteData =
          await image.toByteData(format: ui.ImageByteFormat.png);
      final buffer = byteData!.buffer.asUint8List();

      final directory = await getTemporaryDirectory();
      final file = await File('${directory.path}/post_image.png').create();
      await file.writeAsBytes(buffer);

      await ShareExtend.share(file.path, "image");
    } catch (e) {
      SnackBar snackBar = const SnackBar(
        content: Text("Failed to share image"),
        backgroundColor: Colors.red,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    FestivalModelClass fest =
        ModalRoute.of(context)!.settings.arguments as FestivalModelClass;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan.shade700,
        elevation: 0,
        centerTitle: true,
        title: Text(
          fest.name,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(
              width: double.infinity,
              height: 340.h,
              child: RepaintBoundary(
                key: key,
                child: Container(
                  decoration: BoxDecoration(
                    color: isImage ? null : backgroundColor,
                    image: isImage && selectedImage != null
                        ? DecorationImage(
                            image: NetworkImage(selectedImage!),
                            fit: BoxFit.cover,
                          )
                        : null,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          fest.description,
                          style: TextStyle(
                            fontSize: 22.sp,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w500,
                            color: fontColour,
                            fontFamily: font,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Text(
                          "- ${fest.religion}",
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                            color: fontColour,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                // padding: const EdgeInsets.all(5),
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Choose background image:",
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 67.h,
                          child: ListView.builder(
                            itemCount: images.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectedImage = images[index];
                                    });
                                  },
                                  child: CircleAvatar(
                                    radius: 25.h,
                                    backgroundImage:
                                        NetworkImage(images[index]),
                                    backgroundColor: Colors.grey.shade200,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Choose Background Color:",
                              style: TextStyle(fontSize: 15.sp),
                            ),
                            IconButton(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text(
                                        "Pick a color",
                                        style: TextStyle(fontSize: 16.sp),
                                      ),
                                      content: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          ColorPicker(
                                            pickerColor: backgroundColor,
                                            onColorChanged: (color) {
                                              setState(() {
                                                backgroundColor = color;
                                              });
                                            },
                                          ),
                                          ElevatedButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: const Text("Select"),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                );
                              },
                              icon: const Icon(Icons.color_lens),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Select Font:",
                          style: TextStyle(fontSize: 15.sp),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Row(
                          children: [
                            CircleAvatar(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextButton(
                                  onPressed: () {
                                    font = Fonts.values[0].name;
                                    setState(() {});
                                  },
                                  child: Text(
                                    "Aa",
                                    style: TextStyle(
                                      fontSize: 20.sp,
                                      fontFamily: Fonts.values[0].name,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Select Font Color:",
                              style: TextStyle(fontSize: 15.sp),
                            ),
                            IconButton(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text(
                                        "Pick a color",
                                        style: TextStyle(fontSize: 16.sp),
                                      ),
                                      content: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          ColorPicker(
                                            pickerColor: fontColour,
                                            onColorChanged: (color) {
                                              setState(() {
                                                fontColour = color;
                                              });
                                            },
                                          ),
                                          ElevatedButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: const Text("Select"),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                );
                              },
                              icon: const Icon(Icons.color_lens),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton.icon(
                          onPressed: () => saveToGallery(),
                          icon: const Icon(Icons.save),
                          label: const Text("Save Post"),
                        ),
                        const SizedBox(width: 30),
                        ElevatedButton.icon(
                          onPressed: () => shareImage(),
                          icon: const Icon(Icons.share),
                          label: const Text("Share Post"),
                        ),
                      ],
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
}
