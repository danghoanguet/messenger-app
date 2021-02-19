import 'package:flutter/material.dart';
import 'package:flutter_app/models/chatUsers.dart';
import 'package:flutter_app/widgets/conversationList.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<ChatUsers> chatUsers = [
    ChatUsers(name: "Hao Nguyen", messageText: "abc", imageURL: "D:/Tai lieu Hoc tap/Tai lieu Hoc tap/code/my messenger app/flutter_app/lib/models/images/dark_earth-wallpaper-1920x1080.jpg", time: "Now"),
    ChatUsers(name: "Linh dau cat moi", messageText: "cde", imageURL: "D:/Tai lieu Hoc tap/Tai lieu Hoc tap/code/my messenger app/flutter_app/lib/models/images/dark_earth-wallpaper-1920x1080.jpg", time: "Yesterday"),
    ChatUsers(name: "Hieu Minh", messageText: "abc", imageURL: "D:/Tai lieu Hoc tap/Tai lieu Hoc tap/code/my messenger app/flutter_app/lib/models/images/dark_earth-wallpaper-1920x1080.jpg", time: "31 Mar"),
    ChatUsers(name: "Philip Fox", messageText: "abc", imageURL: "D:/Tai lieu Hoc tap/Tai lieu Hoc tap/code/my messenger app/flutter_app/lib/models/images/dark_earth-wallpaper-1920x1080.jpg", time: "28 Mar"),
    ChatUsers(name: "Debra Hawkins", messageText: "abc", imageURL: "D:/Tai lieu Hoc tap/Tai lieu Hoc tap/code/my messenger app/flutter_app/lib/models/images/dark_earth-wallpaper-1920x1080.jpg", time: "23 Mar"),
    ChatUsers(name: "Jacob Pena", messageText: "will update you in evening", imageURL: "images/userImage6.jpeg""D:/Tai lieu Hoc tap/Tai lieu Hoc tap/code/my messenger app/flutter_app/lib/models/images/dark_earth-wallpaper-1920x1080.jpg", time: "17 Mar"),
    ChatUsers(name: "Andrey Jones", messageText: "Can you please share the file?", imageURL: "images/userImage7.jpeg""D:/Tai lieu Hoc tap/Tai lieu Hoc tap/code/my messenger app/flutter_app/lib/models/images/dark_earth-wallpaper-1920x1080.jpg", time: "24 Feb"),
    ChatUsers(name: "John Wick", messageText: "How are you?", imageURL: "D:/Tai lieu Hoc tap/Tai lieu Hoc tap/code/my messenger app/flutter_app/lib/models/images/dark_earth-wallpaper-1920x1080.jpg", time: "18 Feb"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ChatPageHeader(),
            SearchBar(),
            ListViewChats(chatUsers: chatUsers)
          ],
        ),
      ),
    );
  }
}

class ListViewChats extends StatelessWidget {
  const ListViewChats({
    Key key,
    @required this.chatUsers,
  }) : super(key: key);

  final List<ChatUsers> chatUsers;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
     itemCount: chatUsers.length,
     shrinkWrap: true,
     padding: EdgeInsets.only(top:16),
     physics: NeverScrollableScrollPhysics(),
     itemBuilder:(context,index) {
       return ConversationList(
           name: chatUsers[index].name,
           messageText: chatUsers[index].messageText,
           imageUrl: chatUsers[index].imageURL,
           time: chatUsers[index].time,
           isMessageRead: (index == 0 || index == 3)?true:false,
       );
     },
    );
  }
}

class ChatPageHeader extends StatelessWidget {
  const ChatPageHeader({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(left: 16,right: 16,top: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text("Chats",style: TextStyle(fontSize: 32,fontWeight: FontWeight.bold),),
            Container(
              padding: EdgeInsets.only(left: 8,right: 8,top: 2,bottom: 2),
              height: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.blue[50],
              ),
              child: Row(
                children: <Widget>[
                  Icon(Icons.add,color: Colors.lightBlueAccent,size: 20,),
                  SizedBox(width: 2,),
                  Text("Add New",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 16,left: 16,right: 16),
      child: TextField(
        decoration: InputDecoration(
          hintText: "Search...",
          hintStyle: TextStyle(color: Colors.grey.shade600),
          prefixIcon: Icon(Icons.search,color: Colors.grey.shade600, size: 20,),
          filled: true,
          fillColor: Colors.grey.shade100,
          contentPadding: EdgeInsets.all(16),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(
                  color: Colors.grey.shade100
              )
          ),
        ),
      ),
    );
  }
}