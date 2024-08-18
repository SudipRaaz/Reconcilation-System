import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ndpc_gokyo/core/utils/pageLayout_constant.dart';
import 'package:ndpc_gokyo/presentation/Recharge/recharge_page.dart';
import 'package:ndpc_gokyo/presentation/pageLayout/cubit/tab_manager_cubit.dart';

class PageLayout extends StatefulWidget {
  @override
  _PageLayoutState createState() => _PageLayoutState();
}

class _PageLayoutState extends State<PageLayout> {
  bool isDrawerOpen = true; // State to manage drawer visibility
  double drawerWidth = 250.0;

  void toggleDrawer() {
    setState(() {
      isDrawerOpen = !isDrawerOpen;
      drawerWidth = isDrawerOpen ? 250.0 : 60.0; // Adjust width when toggled
    });
  }

  @override
  Widget build(BuildContext context) {
    final tabManagerCubit = BlocProvider.of<TabManagerCubit>(context);
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Dashboard'),
      //   // leading: IconButton(
      //   //   icon: const Icon(Icons.menu),
      //   //   onPressed: toggleDrawer, // Toggle drawer on button press
      //   // ),
      //   // actions: [],
      // ),
      body: Row(
        children: <Widget>[
          // Toggleable Drawer/Side navigation bar
          AnimatedContainer(
            duration: const Duration(milliseconds: 150),
            width: drawerWidth,
            color: Colors.grey[200],
            child: Column(
              children: [
                Expanded(
                  child: ListView.separated(
                      itemBuilder: (context, index) => sideBarItem(
                          isDrawerOpen: isDrawerOpen,
                          title: sideBarMenuItems.keys.elementAt(index),
                          onPressed: () {
                            tabManagerCubit.updateTab(index);
                          }),
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 12),
                      itemCount: sideBarMenuItems.length),
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      icon: const Icon(CupertinoIcons.back),
                      onPressed: toggleDrawer, // Toggle drawer on button press
                    ),
                  ],
                ),
                // Add more items here
              ],
            ),
          ),
          // Main content area with grid tiles
          Expanded(
              child: BlocConsumer<TabManagerCubit, int>(
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              return sideBarMenuItems.values.elementAt(state);
            },
          )

              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: LayoutBuilder(
              //     builder: (context, constraints) {
              //       int columns = constraints.maxWidth ~/ 150;
              //       return GridView.builder(
              //         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //           crossAxisCount: columns,
              //           crossAxisSpacing: 8.0,
              //           mainAxisSpacing: 8.0,
              //           childAspectRatio: 1.0,
              //         ),
              //         itemCount: 24,
              //         itemBuilder: (context, index) {
              //           return Card(
              //             elevation: 4.0,
              //             child: Center(
              //               child: Text('Tile ${index + 1}'),
              //             ),
              //           );
              //         },
              //       );
              //     },
              //   ),
              // ),
              ),
        ],
      ),
    );
  }
}

class sideBarItem extends StatelessWidget {
  const sideBarItem({
    super.key,
    required this.isDrawerOpen,
    required this.title,
    required this.onPressed,
  });

  final bool isDrawerOpen;
  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(isDrawerOpen ? title : '', // Show text if open
          style: const TextStyle(fontSize: 16)),
      leading: const Icon(Icons.dashboard),
      onTap: onPressed,
    );
  }
}

// class DashboardPage extends StatelessWidget {
//   final services = AppConstantData().serviceNames;

//   DashboardPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Dashboard'),
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.fromLTRB(80, 0, 80, 0),
//         child: GridView.builder(
//           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 4, // 4 columns
//             crossAxisSpacing: 100,
//             mainAxisSpacing: 60,
//             childAspectRatio: 2.0, // Aspect ratio of 1:1 for square tiles
//           ),
//           itemCount: services.length, // 4x3 grid
//           itemBuilder: (context, index) {
//             return _buildTile(index);
//           },
//         ),
//       ),
//     );
//   }

//   // Helper method to build each tile
//   Widget _buildTile(
//     int index,
//   ) {
//     return GestureDetector(
//       onTap: () {
//         final pageRoute = services.values.elementAt(index);
//         NavigatorService.pushNamed(pageRoute);
//       },
//       child: Container(
//         decoration: BoxDecoration(
//           color: Colors.white70,
//           borderRadius: BorderRadius.circular(15),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black.withOpacity(0.6),
//               offset: const Offset(5, 5),
//               blurRadius: 10,
//             ),
//           ],
//         ),
//         child: Center(
//           child: Text(
//             "${services.keys.elementAt(index)} ",
//             style: const TextStyle(
//               // color: Colors.white,
//               fontSize: 18,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
