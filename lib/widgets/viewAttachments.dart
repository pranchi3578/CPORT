import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class ViewAttachments extends StatelessWidget {
  final List images;
  ViewAttachments(this.images);

  _createAttachments(context) {
    List<InkWell> rows = List();
    int no = 1;
    images.forEach((item) {
      rows.add(InkWell(
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (BuildContext context) => Scaffold(
              body: Container(
                color: Colors.white,
                child: PhotoView(
                  backgroundDecoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  initialScale: PhotoViewComputedScale.contained,
                  minScale: PhotoViewComputedScale.contained,
                  maxScale: PhotoViewComputedScale.contained,
                  imageProvider: NetworkImage(item),
                  heroAttributes: PhotoViewHeroAttributes(
                    tag: item,
                  ),
                ),
              ),
            ),
          ),
        ),
        child: Hero(
            tag: item,
            child: Container(
                width: 50,
                decoration: BoxDecoration(
                    color: Color(0xff8BC34A),
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                child: Text(
                  no.toString(),
                  textAlign: TextAlign.center,
                ))),
      ));
      no = no + 1;
    });
    return rows;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: _createAttachments(context),
    );
  }
}
