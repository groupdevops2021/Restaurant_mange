import 'package:flutter/material.dart';
import 'package:restaruant_manager/model/request_model.dart';

import '../model/default_model.dart';

class RequestPage extends StatefulWidget {
  const RequestPage(this.requestModel, {Key? key}) : super(key: key);
  final List<RequestModel> requestModel;
  @override
  _RequestPageState createState() => _RequestPageState();
}

class _RequestPageState extends State<RequestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("View Request")),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(
              height: 70,
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) => ListTile(
                  tileColor: index % 2 == 0
                      ? Colors.grey.shade200
                      : Colors.grey.shade400,
                  leading: Text("${index + 1}."),
                  title: Text(
                      "ID : .${widget.requestModel[index].id} ----- Category: ${widget.requestModel[index].cat}"),
                  subtitle: Text("Request: ${widget.requestModel[index].msg}"),
                ),
                itemCount: widget.requestModel.length,
              ),
            )
          ],
        ),
      ),
    );
  }
}
