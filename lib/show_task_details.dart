
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TaskDetails extends StatefulWidget {
  final Map task;
  const TaskDetails({Key? key, required this.task}) : super(key: key);

  @override
  State<TaskDetails> createState() => _TaskDetailsState();
}

class _TaskDetailsState extends State<TaskDetails> {


  @override
  Widget build(BuildContext context) {
    DateTime durationStart = DateTime.now();
    DateTime durationEnd = DateFormat('EEE, MMM d, ''yyyy').parse(widget.task['date']);
    String DateDay = durationEnd.day.toString() ;
    String DateMonth = widget.task['date'];

    var differenceInDays = durationEnd.difference(durationStart).inDays;


    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white70,
        title: Row(
          children: const [
            Text("inbox", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),),
            Icon(Icons.keyboard_arrow_down,color: Colors.black26)
          ],
        ),
        actions:  [
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert),color: Colors.black,),
        ],
      ),
      bottomNavigationBar: Container(
        width: double.infinity,
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.40,
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  Icon(Icons.local_offer,color: Colors.grey,size: 25,),
                  Icon(Icons.menu,color: Colors.grey,size: 25,),
                  Icon(Icons.alarm,color: Colors.grey,size: 25,),
                  Icon(Icons.photo,color: Colors.grey,size: 25,),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.40,
              height: 50,
              padding: const EdgeInsets.only(right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  Icon(Icons.subdirectory_arrow_left,color: Colors.grey,size: 25,),
                  SizedBox(width: 5,),
                  Icon(Icons.subdirectory_arrow_right,color: Colors.grey,size: 25,),
                  SizedBox(width: 10,),
                  Icon(Icons.expand_more,color: Colors.grey,size: 25,),
                ],
              ),
            ),
          ],
        ),
      ),
      body: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(vertical: 10),
        children:  <Widget>[
          ListTile(
            title: Text(" ${differenceInDays + 1} days later, ${DateMonth.substring(4, 8)} $DateDay", style: const TextStyle(color: Colors.indigoAccent),),
            leading: const Icon(Icons.dvr_sharp),
            trailing: const Icon(Icons.flag_rounded),

          ),
          const SizedBox(height: 10,),
           Text("${widget.task['Title']}", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 32),),
          const SizedBox(height: 20,),
          const Text("Description", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: Colors.grey),),
          ...List.generate(widget.task['subtask'].length   , (index) =>
          CheckboxListTile(
            value: widget.task['checked'],
            title: Text("${widget.task['subtask'][index]}"),
            secondary: const Icon(Icons.menu,color: Colors.grey,size: 25,),
            controlAffinity: ListTileControlAffinity.leading,
            onChanged: (value) {

            },
            activeColor: Colors.blue,
            checkColor: Colors.black,
          ) //: SizedBox.shrink()
          ),
        ],
      ),
    );
  }
}
