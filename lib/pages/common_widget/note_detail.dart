import 'package:flutter/material.dart';

class NoteDetail extends StatelessWidget {
  final String content;
  final String? date;
  final String title;

  const NoteDetail(
      {super.key,
      required this.content,
      this.date,
      this.title = "(của khách hàng)"});

  @override
  Widget build(BuildContext context) {
    var maxWidth = MediaQuery.sizeOf(context).width;
    return Padding(
      padding: const EdgeInsets.only(top: 24.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              color: Colors.yellow[400],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        'Ghi chú ',
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        title,
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                  Icon(
                    Icons.event_note_outlined,
                    color: Colors.black87,
                    size: 30.0,
                  ),
                ],
              ),
            ),
            Container(
              width: maxWidth,
              padding: EdgeInsets.all(12),
              color: Colors.yellow[100],
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    content,
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    date ?? "",
                    style: TextStyle(color: Colors.black54),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
