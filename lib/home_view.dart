

import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:to_do_app/create_todo_view.dart';
import 'package:to_do_app/utilities.dart';

class HomeView extends StatefulWidget {
   HomeView({ Key? key }) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  String selectedItem = 'to-do';

  final List <Map<String, dynamic>> _unCompletedData = [];
  final List <Map<String, dynamic>> _completedData = [];
  final List <Map<String, dynamic>> data = [

    {
      'title' : 'Lorem ipsum dolor sit amet, consectetur adipiscing elit',
      'description' : 'Quisque blandit facilisis erat, semper egestas ipsum. Duis a pharetra dolor. Nullam arcu diam, vulputate id congue eget, volutpat sit amet nisi. Integer tortor nibh',
      'date_time' : 'Yesterday',
      'status' : true,
    },
    {
      'title' : 'Nunc cursus fringilla nisl, in lobortis metus tristique nec.',
      'description' : 'Aenean rutrum, magna quis vestibulum convallis, augue lorem lobortis ligula, eu aliquet odio urna dignissim nibh',
      'date_time' : 'Today',
      'status' : true,
    },
    {
      'title' : 'Quisque a metus mi. Sed elit magna',
      'description' : 'Proin sagittis id odio ut porta. Nam mattis eros purus, ut volutpat magna fringilla ac. In a sollicitudin leo. Ut id enim et mauris condimentum pellentesque a lobortis leo',
      'date_time' : 'Tomorrow',
      'status' : false,
    },
    {
      'title' : 'Nunc interdum lorem sed justo euismod, vel imperdiet enim viverra. Nullam vehicula tincidunt egestas',
      'description' : 'Aliquam erat volutpat. Vivamus turpis enim, consequat ac ultricies in, ullamcorper ut leo. Lorem ipsum dolor sit amet, consectetur adipiscing elit',
      'date_time' : 'Tomorrow',
      'status' : false,
    },
    {
      'title' : 'Lorem ipsum dolor sit amet, consectetur adipiscing elit',
      'description' : 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque blandit facilisis erat, semper egestas ipsum. Duis a pharetra dolor',
      'date_time' : 'Today',
      'status' : true,
    },
    {
      'title' : 'Aenean vel porttitor tortor, quis ultrices elit.',
      'description' : 'Aliquam nec faucibus turpis, a gravida lorem. Suspendisse potenti',
      'date_time' : 'Yesterday',
      'status' : true,
    },
    {
      'title' : 'Pellentesque suscipit risus eget magna pellentesque, sit amet imperdiet arcu iaculis',
      'description' : 'Ut efficitur turpis ut rutrum venenatis. Duis tincidunt cursus purus, ac lobortis est volutpat nec.',
      'date_time' : 'Tomorrow',
      'status' : false,
    },
    {
      'title' : 'Nulla in lacus pulvinar, pellentesque nulla ac, tempus tellus',
      'description' : 'Quisque et tempor est. Cras aliquet facilisis tortor. Sed dignissim turpis felis, ut luctus orci egestas id',
      'date_time' : 'Sun. 19 Dec',
      'status' : false,
    },
    {
      'title' : 'Phasellus quam quam, suscipit nec suscipit ac, rhoncus quis elit',
      'description' : 'Aliquam rutrum a arcu eu rhoncus. Nullam scelerisque tortor mi, sed sodales dui tempor suscipit',
      'date_time' : 'Yesterday',
      'status' : true,
    },
    {
      'title' : 'Duis aliquet id quam et pharetra.',
      'description' : 'Phasellus ac diam ac libero laoreet rhoncus eget in leo. Aliquam erat volutpat. Curabitur tincidunt lacus id aliquet suscipit',
      'date_time' : 'Tues. 14 Dec',
      'status' : false,
    }
  ];

  @override
  void initState() {
    for (Map <String, dynamic> element in data) {
  if (!element['status']){
     _unCompletedData.add(element);
  }else{
    _completedData.add(element);
  }
}
    super.initState();
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
         title: Text(
           'My tasks',
           style: TextStyle(
             fontSize: 22,
             fontWeight: FontWeight.bold
           ),),
           leading: Center(
             child: FlutterLogo(size: 40)),
             actions: [
               PopupMenuButton <String>(
                 icon: Icon(Icons.menu),
                 onSelected: (value){
                   setState(() {
                     selectedItem = value;
                   });
                 },
                 itemBuilder: (context){
                    return [
                      PopupMenuItem(
                        child: Text('To-do'), 
                      value: 'to-do'),
                      PopupMenuItem(
                        child: Text('Completed'), 
                        value: 'completed'),
                    ];
                 }),
                 IconButton(
                   onPressed: (){}, 
                   icon: Icon(Icons.search))
             ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) {
               return CreateTodoView();
          }));
        },
        child: Icon(Icons.add),
        backgroundColor: Color.fromRGBO(37, 43, 103, 1),
      ),
      body: ListView.separated(
        padding: EdgeInsets.all(16.0),
        itemBuilder: (context, index){
          return TaskCardWidget(
            dateTime: selectedItem == 'to-do' 
            ? _unCompletedData[index]['date_time']
            : _completedData[index]['date_time'], 
            title: selectedItem == 'to-do'
            ? _unCompletedData[index]['title']
            : _completedData[index]['title'],
            description: selectedItem == 'to-do'
            ? _unCompletedData[index]['description']
            : _completedData[index]['description'],

);
        }, 
        separatorBuilder: (context, index){
          return SizedBox(
            height: 10,
          );
        }, 
        itemCount: selectedItem == 'to-do' ? _unCompletedData.length : _completedData.length,),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          child: InkWell(
            onTap: (){
              showBarModalBottomSheet(context: context, builder: (context){
                   return ListView.separated(
                     padding: EdgeInsets.all(15.0),
                     itemBuilder: (context, index){
                       return TaskCardWidget(
                         dateTime: _completedData[index]['date_time'],
                         description: _completedData[index]['description'],
                         title: _completedData[index]['title'],
                       );
                     }, 
                     separatorBuilder: (context, index){
                       return SizedBox(
                       height: 5,
                     );
                   }, 
                   itemCount: _completedData.length);
              });
            },
            child: Material(
              borderRadius: BorderRadius.circular(15),
              color: Color.fromRGBO(37, 43, 103, 1),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: [
                  Icon(
                    Icons.check_circle, 
                    color: Colors.white,
                  size: 30,),
                  SizedBox(width: 15,),
                  Text(
                    'Completed',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),),
                    Spacer(),
                    Text('${_completedData.length}',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                    ),)
                ],
              ),
            ),
            ),
          ),
        ),
      ),
    );
      
    
  }
}

class TaskCardWidget extends StatelessWidget {
   const TaskCardWidget ({Key? key, 
   required this.title, 
   required this.description, 
   required this.dateTime}) : super(key: key);
  
   final String title;
   final String description;
   final String dateTime;

  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
    padding: const EdgeInsets.all(15.0),
    child: Row(
      children: [
        Icon(Icons.check_circle_outline_outlined,
        size: 30,
        color: customColor(
          date: dateTime),),
        SizedBox(
          width: 10,
        ),
      Expanded(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(37, 43, 103, 1),
              ),),
            Text(
              description,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.grey,
              ),),
          ],
        ),
      ),
      SizedBox(
        width: 15,
      ),
      Row(
        children: [
          Icon(
            Icons.notifications_outlined, 
            color: customColor(
              date: dateTime),),
          Text(
            dateTime,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: customColor(
                date: dateTime),
            ),),

        ],
      )
        ],          
    ),
        ),
      );
  }
}