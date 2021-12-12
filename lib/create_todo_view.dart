import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';

class CreateTodoView extends StatelessWidget {
   CreateTodoView({ Key? key }) : super(key: key);

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();

  final GlobalKey <FormState> _formKey = GlobalKey();

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        title: Text(
          'Create To-Do',
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),),
      ),
      body: Form(
           key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: [
            TextFormField(
              controller: _titleController,
              maxLines: 2,
              decoration: InputDecoration(
                border: UnderlineInputBorder(borderSide: BorderSide(
                  color: Color.fromRGBO(37, 43, 103, 1),
                 ),),
                 hintText: 'Please enter your title',
                 hintStyle: TextStyle(
                   fontSize: 18,
                   fontWeight: FontWeight.w600,
                   color: Colors.grey,
                 ),
                 labelText: 'Title',
                 labelStyle: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Color.fromRGBO(37, 43, 103, 1),
                 ),
                 floatingLabelBehavior: FloatingLabelBehavior.never,
              ),
              validator: (value){
                  if (value!.isEmpty){
                    return 'Title field is required';
                  }
              },
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _descriptionController,
              maxLines: 4,
              decoration: InputDecoration(
                border: UnderlineInputBorder(borderSide: BorderSide(
                  color: Color.fromRGBO(37, 43, 103, 1),
                 ),),
                 hintText: 'Please enter your description',
                 hintStyle: TextStyle(
                   fontSize: 18,
                   fontWeight: FontWeight.w600,
                   color: Colors.grey,
                 ),
                 labelText: 'Description',
                 labelStyle: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Color.fromRGBO(37, 43, 103, 1),
                 ),
                 floatingLabelBehavior: FloatingLabelBehavior.never,
              ),
              validator: (value){
                  if (value!.isEmpty){
                    return 'Description field is required';
              }},
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    onTap: (){
                      showDatePicker(
                        context: context, 
                        initialDate: DateTime.now(), 
                        firstDate: DateTime.now(), 
                        lastDate: DateTime.now().add(Duration(days: 365)),
                        ).then((selectedDate) {
                         final DateFormat _dateFormat = DateFormat.yMMMMEEEEd();
                         _dateController.text = _dateFormat.format(selectedDate!);
                        });
                    },
                            controller: _dateController,
                            maxLines: 2,
                            decoration: InputDecoration(
                  border: UnderlineInputBorder(borderSide: BorderSide(
                    color: Color.fromRGBO(37, 43, 103, 1),
                   ),),
                   hintText: 'Please enter the date',
                   hintStyle: TextStyle(
                     fontSize: 18,
                     fontWeight: FontWeight.w600,
                     color: Colors.grey,
                   ),
                   labelText: 'Date',
                   labelStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Color.fromRGBO(37, 43, 103, 1),
                   ),
                   floatingLabelBehavior: FloatingLabelBehavior.never,
                            ),
                            validator: (value){
                              if (value!.isEmpty){
                    return 'Date field is required';
                            }},
                          ),
                ),
                Spacer(),
            Expanded(
              child: TextFormField(
                onTap: (){
                  showTimePicker(
                    context: context, 
                    initialTime: TimeOfDay.now()).then((selectedTime){
                      _timeController.text = selectedTime!.format(context);
                    });
                },
                controller: _timeController,
                maxLines: 2,
                decoration: InputDecoration(
                  border: UnderlineInputBorder(borderSide: BorderSide(
                    color: Color.fromRGBO(37, 43, 103, 1),
                   ),),
                   hintText: 'Please enter the time',
                   hintStyle: TextStyle(
                     fontSize: 18,
                     fontWeight: FontWeight.w600,
                     color: Colors.grey,
                   ),
                   labelText: 'Time',
                   labelStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Color.fromRGBO(37, 43, 103, 1),
                   ),
                   floatingLabelBehavior: FloatingLabelBehavior.never,
                ),
                validator: (value){
                     if (value!.isEmpty){
                    return 'Time field is required';
                }},
              ),
            ),
              ],
            ),
            SizedBox(
              height: 90,
            ),
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Color.fromRGBO(37, 43, 103, 1),
                padding: EdgeInsets.all(20.0),
                
              ),
              onPressed: (){
                if (_formKey.currentState!.validate()) {
                     print('success');
                     print(_titleController.text);
                     print(_descriptionController.text);
                     print(_dateController.text + "" + _timeController.text);
                } else {
                     print('fail');
                }
              }, 
              child: Text(
                'Create',
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),))
          ],
          
        ),
      ),
      
      
    );
  }
}