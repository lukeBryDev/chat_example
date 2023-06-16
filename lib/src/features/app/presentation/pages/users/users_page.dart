import 'package:chat/src/features/data/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class UsersPage extends StatefulWidget {
  static const routeName = '/UsersPage';

  const UsersPage({Key? key}) : super(key: key);

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  List<UserModel> users = [
    UserModel(
        name: 'Brayan', email: 'brayan@email.com', online: true, uid: '1'),
    UserModel(
        name: 'Enrique', email: 'enrique@email.com', online: false, uid: '2'),
    UserModel(
        name: 'Yanbra', email: 'yanbra@email.com', online: true, uid: '3'),
    UserModel(name: 'Gian', email: 'gian@email.com', online: false, uid: '4'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'My name',
          style: TextStyle(color: Colors.black54),
        ),
        elevation: 1,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.exit_to_app, color: Colors.black54),
          onPressed: () {},
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 10),
            child: Icon(
              Icons.check_circle,
              color: Colors.red, //  Connection off
              // color: Colors.blue[400], // Connection on
            ),
          ),
        ],
      ),
      body: SmartRefresher(
        controller: _refreshController,
        enablePullDown: true,
        onRefresh: loadUsers,
        header: WaterDropHeader(
          complete: Icon(
            Icons.check,
            color: Colors.blue[400],
          ),
          waterDropColor: Colors.blue[400] ?? Colors.blue,
        ),
        child: usersListView(),
      ),
    );
  }

  Widget usersListView() {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      itemBuilder: (ctx, i) {
        return _userTile(users[i]);
      },
      separatorBuilder: (ctx, i) {
        return const Divider();
      },
      itemCount: users.length,
    );
  }

  ListTile _userTile(UserModel user) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.blue[100],
        child: Text(user.name?.substring(2) ?? ''),
      ),
      title: Text(user.name ?? ''),
      subtitle: Text(user.email ?? ''),
      trailing: Container(
        decoration: BoxDecoration(
          color: user.online == true ? Colors.green[300] : Colors.red,
          borderRadius: BorderRadius.circular(100),
        ),
      ),
    );
  }

  Future<void> loadUsers() async {
    await Future.delayed(const Duration(milliseconds: 1000));
  }
}
