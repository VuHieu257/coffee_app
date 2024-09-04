import 'package:coffee_cap/core/size/size.dart';
import 'package:coffee_cap/core/themes/theme_extensions.dart';
import 'package:coffee_cap/pages/layout/layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'core/assets.dart';
import 'core/colors/color.dart';
import 'core/themes/theme_data.dart';

void main() {WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]).then((_) {
    runApp(const MyApp());
});
  // runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: MyAppThemes.lightTheme,
      debugShowCheckedModeBanner: false,
      home: const AppLayout(),
      // home: const OrderScreen(),
      // home: const InvoiceScreen(),
      // home: const SelectionScreen(),
    );
  }
}
//
// class AppLayout extends StatefulWidget {
//   const AppLayout({super.key});
//
//   @override
//   State<AppLayout> createState() => _AppLayoutState();
// }
//
// class _AppLayoutState extends State<AppLayout> {
//   int _selectedIndex = 0;
//   Product? _selectedProduct; // Sản phẩm được chọn để hiển thị chi tiết
//
//   void _onMenuItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//       _selectedProduct = null; // Reset khi chọn menu khác
//     });
//   }
//
//   void _onProductSelected(Product product) {
//     setState(() {
//       _selectedProduct = product;
//     });
//   }
//
//   List<String> menu = [
//     "Chọn món",
//     "Lịch sử hóa đơn",
//     "Chuỗi 2",
//     "Chuỗi 3",
//     "Chọn bàn",
//     "Chuỗi 5",
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () => Styles().hideKeyBoard(),
//       child: Scaffold(
//         body: SingleChildScrollView(
//           child: Padding(
//             padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top + 10),
//             child: SizedBox(
//               height: MediaQuery.of(context).size.height,
//               width: MediaQuery.of(context).size.width,
//               child: Row(
//                 children: [
//                   _buildMenuItem(context),
//                   Expanded(
//                     child: Column(
//                       children: [
//                         _buildTopSection(context),
//                         Expanded(
//                           child: _selectedProduct == null
//                               ? IndexedStack(
//                             index: _selectedIndex,
//                             children: _buildPages(),
//                           )
//                               : ProductDetailPage(product: _selectedProduct!),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   // Hàm xây dựng các trang con
//   List<Widget> _buildPages() {
//     return [
//       HomeScreen(
//           onProductSelected: _onProductSelected
//       ), // Trang Chủ
//       const BillTableScreen(), // Lịch Sử
//       const OnlineOrderScreen(), // Đơn Online
//       const ReportScreen(), // Báo Cáo
//       const FloorLayoutScreen(), // Tại Bàn
//       const SettingsScreen(), // Cài Đặt
//     ];
//   }
//
//   // Hàm xây dựng phần top
//   Widget _buildTopSection(BuildContext context) {
//     return SizedBox(
//       width: MediaQuery.of(context).size.width * 0.84,
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text(
//             _selectedProduct == null ? menu[_selectedIndex] : _selectedProduct!.name,
//             style: Theme.of(context).textTheme.headlineLarge?.copyWith(
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           const Spacer(),
//           SizedBox(
//             width: MediaQuery.of(context).size.width * 0.4,
//             child: TextField(
//               decoration: InputDecoration(
//                 hintText: "Tìm kiếm danh mục hoặc menu ",
//                 hintStyle: Theme.of(context).textTheme.titleMedium?.copyWith(
//                   color: Styles.grey,
//                 ),
//                 border: const OutlineInputBorder(
//                   borderRadius: BorderRadius.all(Radius.circular(20)),
//                   borderSide: BorderSide.none,
//                 ),
//                 fillColor: Styles.light,
//                 filled: true,
//                 suffixIcon: const Icon(Icons.search, color: Styles.grey),
//                 enabledBorder: OutlineInputBorder(
//                   borderRadius: const BorderRadius.all(Radius.circular(20)),
//                   borderSide: BorderSide(
//                     color: Styles.grey.withOpacity(0.5),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           SizedBox(width: MediaQuery.of(context).size.width * 0.01),
//           IconButton(
//             onPressed: () {},
//             icon: const Icon(Icons.notifications_none, size: 35),
//           ),
//           const CircleAvatar(
//             radius: 30,
//             backgroundImage: AssetImage(Asset.bgImageAvatar),
//           ),
//           SizedBox(width: MediaQuery.of(context).size.width * 0.01),
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 "Chào nhân viên,",
//                 style: Theme.of(context).textTheme.headlineSmall?.copyWith(
//                   color: Styles.grey,
//                 ),
//               ),
//               Text(
//                 "Wade Warren",
//                 style: Theme.of(context).textTheme.titleMedium,
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
//
//   // Hàm xây dựng menu bên trái
//   Widget _buildMenuItem(BuildContext context) {
//     GestureDetector menuItem(BuildContext context, String title, IconData icon, int index) {
//       bool isSelected = _selectedIndex == index;
//       return GestureDetector(
//         onTap: () => _onMenuItemTapped(index),
//         child: Container(
//           height: MediaQuery.of(context).size.height * 0.08,
//           width: MediaQuery.of(context).size.width * 0.07,
//           margin: const EdgeInsets.only(bottom: 16),
//           alignment: Alignment.center,
//           decoration: BoxDecoration(
//             color: isSelected ? Styles.green : Styles.light,
//             borderRadius: const BorderRadius.all(Radius.circular(10)),
//             boxShadow: [
//               BoxShadow(
//                 color: Styles.dark.withOpacity(0.2),
//                 offset: const Offset(1.1, 1.1),
//                 blurRadius: 5,
//               ),
//             ],
//           ),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Icon(icon, color: isSelected ? Styles.light : Styles.dark, size: 30),
//               Text(
//                 title,
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   color: isSelected ? Styles.light : Styles.dark,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       );
//     }
//
//     return Column(
//       children: [
//         GestureDetector(
//           onTap: () => _onMenuItemTapped(0),
//           child: Container(
//             height: MediaQuery.of(context).size.height * 0.12,
//             width: MediaQuery.of(context).size.height * 0.12,
//             margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
//             decoration: BoxDecoration(
//               color: Styles.light,
//               image: const DecorationImage(
//                 image: AssetImage(Asset.iconLogo),
//                 fit: BoxFit.cover,
//               ),
//               boxShadow: [
//                 BoxShadow(
//                   color: Styles.dark.withOpacity(0.2),
//                   offset: const Offset(1.1, 1.1),
//                   blurRadius: 5,
//                 ),
//               ],
//             ),
//           ),
//         ),
//         menuItem(context, "Trang Chủ", Icons.home_outlined, 0),
//         menuItem(context, "Lịch Sử", Icons.history, 1),
//         menuItem(context, "Đơn Online", Icons.edit_calendar, 2),
//         menuItem(context, "Báo Cáo", Icons.calendar_month, 3),
//         menuItem(context, "Tại bàn", Icons.table_restaurant_outlined, 4),
//         menuItem(context, "Cài đặt", Icons.settings_suggest_outlined, 5),
//         SizedBox(height: MediaQuery.of(context).size.height * 0.08),
//         IconButton(
//           onPressed: () {},
//           icon: const Icon(Icons.logout, size: 30, color: Styles.grey),
//         ),
//       ],
//     );
//   }
// }
// class HomeScreen extends StatelessWidget {
//   final void Function(Product) onProductSelected;
//
//   const HomeScreen({
//     super.key,
//     required this.onProductSelected,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     // Danh sách sản phẩm mẫu
//     final products = [
//       Product(name: 'Product 1', description: 'Description of Product 1', price: 100.0),
//       Product(name: 'Product 2', description: 'Description of Product 2', price: 200.0),
//       Product(name: 'Product 3', description: 'Description of Product 2', price: 200.0),
//       Product(name: 'Product 4', description: 'Description of Product 2', price: 200.0),
//       Product(name: 'Product 5', description: 'Description of Product 2', price: 200.0),
//     ];
//
//     return ListView.builder(
//       itemCount: products.length,
//       itemBuilder: (context, index) {
//         final product = products[index];
//         return ListTile(
//           title: Text(product.name),
//           subtitle: Text(product.description),
//           onTap: () => onProductSelected(product), // Chuyển tới trang chi tiết sản phẩm
//         );
//       },
//     );
//   }
// }
// class BillTableScreen extends StatelessWidget {
//   const BillTableScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     // Thông tin lịch sử hóa đơn sẽ được hiển thị ở đây
//     return Center(
//       child: Text('Lịch sử hóa đơn', style: TextStyle(fontSize: 24)),
//     );
//   }
// }
// class OnlineOrderScreen extends StatelessWidget {
//   const OnlineOrderScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Text('Đơn Online', style: TextStyle(fontSize: 24)),
//     );
//   }
// }
// class ReportScreen extends StatelessWidget {
//   const ReportScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Text('Báo cáo', style: TextStyle(fontSize: 24)),
//     );
//   }
// }
// class FloorLayoutScreen extends StatelessWidget {
//   const FloorLayoutScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Text('Bố trí bàn', style: TextStyle(fontSize: 24)),
//     );
//   }
// }
// class SettingsScreen extends StatelessWidget {
//   const SettingsScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Text('Cài đặt', style: TextStyle(fontSize: 24)),
//     );
//   }
// }
// class ProductDetailPage extends StatelessWidget {
//   final Product product;
//
//   const ProductDetailPage({
//     Key? key,
//     required this.product,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(product.name, style: Theme.of(context).textTheme.headlineMedium),
//           SizedBox(height: 10),
//           Text(product.description),
//           SizedBox(height: 20),
//           Text('\$${product.price.toStringAsFixed(2)}', style: Theme.of(context).textTheme.headlineSmall),
//         ],
//       ),
//     );
//   }
// }
// class Product {
//   final String name;
//   final String description;
//   final double price;
//
//   Product({
//     required this.name,
//     required this.description,
//     required this.price,
//   });
// }
//





// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           // Example of a product item that opens the receipt dialog
//           ListTile(
//             title: const Text("Hóa đơn CH00002"),
//             onTap: () {
//               showDialog(
//                 context: context,
//                 builder: (context) => const ReceiptDialog(
//                   receiptNumber: "CH00002",
//                   date: "13/08/2024 11:30:12",
//                   employee: "T. Ngân",
//                   table: "Tầng trệt 1",
//                   items: [
//                     {"name": "Trà Xanh Espresso Marble", "quantity": 1, "price": 35000},
//                     {"name": "Caramel Macchiato", "quantity": 2, "price": 80000},
//                   ],
//                   totalAmount: 75000,
//                 ),
//               );
//             },
//           ),
//           // Add more list items here...
//         ],
//       ),
//     );
//   }
// }



