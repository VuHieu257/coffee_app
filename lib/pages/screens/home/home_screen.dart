import 'package:coffee_cap/core/assets.dart';
import 'package:coffee_cap/core/colors/color.dart';
import 'package:coffee_cap/core/size/size.dart';
import 'package:coffee_cap/core/themes/theme_extensions.dart';
import 'package:coffee_cap/pages/widget_small/custom_button.dart';
import 'package:flutter/material.dart';

import '../../layout/layout.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedDrinkIndex = -1; // To track the selected beverage index

  final List<String> _beverages = [
    'Tất cả',
    'Trà sữa',
    'Cà phê',
    'Nước ép',
    'Sinh tố',
    'Soda',
    'Trà xanh',
    'Nước khoáng',
    // Add more beverages as needed
  ];

  void _onBeverageTapped(int index) {
    setState(() {
      _selectedDrinkIndex = index;
    });
  }
  //product
  int _selectedIndexMoodInProduct = -1;

  void _handleTap(int index) {
    setState(() {
      _selectedIndexMoodInProduct = index; // Cập nhật phần tử được chọn
    });
  }
  int _selectedIndexSizeInProduct = -1;

  void _handleSizeTap(int index) {
    setState(() {
      _selectedIndexSizeInProduct = index; // Cập nhật phần tử được chọn
    });
  }
  int _selectedSugarIndex = -1; // Chỉ số lựa chọn của đường
  int _selectedIceIndex = -1;   // Chỉ số lựa chọn của đá

  final List<String> options = ['30%', '50%', '70%']; // Danh sách lựa chọn

  // @override
  // Widget build(BuildContext context) {
  //   return AppLayout(
  //     initialIndex: 0,
  //     body: _buildBody(context),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    Container containerDrink(String title,String img,bool isSelected){
      return Container(
        padding:const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
        margin: const EdgeInsets.only(right: 20 ),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          color:  isSelected ? Colors.greenAccent.withOpacity(0.1) : Styles.light,
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Styles
                    .green
                    .withOpacity(0.2),
                offset: const Offset(1.1, 1.1),
                blurRadius: 5),
          ],
          border: Border.all(width: 1,
            color:  isSelected ?Styles.green:Styles.grey,
          ),
        ),
        // imgProduct
        child: Column(
          children: [
            Container(height: context.height*0.08,width: context.width*0.06,
              margin: const EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                  color: Styles.light,
                  image: DecorationImage(image: AssetImage(img),fit: BoxFit.fill,)
              ),
            ),
            SizedBox(
              width: context.width*0.055,
              child: Text(title,style: context.theme.textTheme.titleSmall?.copyWith(
                //   color: isSelected ? Colors.white : Colors.black,
                  fontWeight: FontWeight.w600,overflow: TextOverflow.ellipsis
              ),textAlign: TextAlign.center,),
            )
          ],
        ),
      );
    }
    GestureDetector bottomInProduct(BuildContext context,String img,String title,bool isSelected,VoidCallback onTap){
      return GestureDetector(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.only(right: 12,top: 8,bottom: 8),
          child: Opacity(
            opacity:  isSelected ? 0.5 :1,
            child: CircleAvatar(
              backgroundColor: Styles.greyNearLight,
              radius: 20,
              child:title==""?
              Image.asset(img):
              Text(title,style: context.theme.textTheme.headlineSmall,),
            ),
          ),
        ),
      );
    }
    return Padding(
      padding: EdgeInsets.only(left:Styles.defaultPadding,right: Styles.defaultPadding/2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top:25.0),
                    child: SizedBox(
                      width: context.width * 0.62,
                      height: context.height*0.14,
                      child: ListView.builder(
                        // physics: const NeverScrollableScrollPhysics(),
                        // shrinkWrap: true,
                        //  primary: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: _beverages.length,
                        itemBuilder: (context, index) {
                          bool isSelected = _selectedDrinkIndex == index;
                          return GestureDetector(
                              onTap: () => _onBeverageTapped(index),
                              child: containerDrink(_beverages[index],Asset.imgProduct,isSelected));
                        },),
                    ),
                  ),
                  SizedBox(height: context.height*0.02,),
                  Text("Tất cả menu",style: context.theme.textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),),
                  // SizedBox(
                  //   width: context.width *0.61,
                  //   height: context.height*0.4,
                  //   child: ListView.builder(
                  //     // shrinkWrap: true,
                  //     // primary: true,
                  //     // physics: const NeverScrollableScrollPhysics(),
                  //     itemCount: 5,
                  //     itemBuilder: (context, index) {
                  //     return Container(
                  //       height: context.height*0.47,
                  //       width: context.width*0.35,
                  //       padding: EdgeInsets.all(Styles.defaultPadding),
                  //       decoration: BoxDecoration(
                  //           borderRadius: const BorderRadius.all(Radius.circular(10)),
                  //           boxShadow: <BoxShadow>[
                  //             BoxShadow(
                  //                 color: Styles
                  //                     .dark
                  //                     .withOpacity(0.2),
                  //                 offset: const Offset(1.1, 1.1),
                  //                 blurRadius: 5),
                  //           ],
                  //           color: Styles.light
                  //       ),
                  //       child: Column(
                  //         children: [
                  //           Row(
                  //             children: [
                  //               Container(
                  //                   height: context.height*0.2,
                  //                   width: context.width*0.14,
                  //                   margin: const EdgeInsets.only(right: 20),
                  //                   decoration: const BoxDecoration(
                  //                       borderRadius: BorderRadius.all(Radius.circular(20)),
                  //                       image: DecorationImage(image: AssetImage(Asset.imgProduct1),
                  //                           fit: BoxFit.fitHeight)
                  //                   )
                  //               ),
                  //               SizedBox(
                  //                 width: context.width*0.15,
                  //                 child: Column(
                  //                   crossAxisAlignment:  CrossAxisAlignment.start,
                  //                   mainAxisAlignment: MainAxisAlignment.start,
                  //                   children: [
                  //                     Text("Trà xanh Espresso Marble",
                  //                       style: context.theme.textTheme.headlineSmall?.copyWith(
                  //                           fontWeight: FontWeight.bold
                  //                       ),),
                  //                     Text("Cho ngày thêm tươi, tỉnh, êm, mượt với Trà Xanh Espresso Marble.",
                  //                       style: context.theme.textTheme.titleSmall?.copyWith(
                  //                           color: Styles.grey
                  //                       ),),
                  //                     SizedBox(height: context.height*0.015,),
                  //                     Text("49.000 đ",
                  //                       style: context.theme.textTheme.headlineMedium?.copyWith(
                  //                           fontWeight: FontWeight.bold
                  //                       ),),
                  //                   ],
                  //                 ),
                  //               ),
                  //
                  //             ],
                  //           ),
                  //           SizedBox(height: context.height*0.01,),
                  //           Row(
                  //             children: [
                  //               SizedBox(
                  //                 width: context.width*0.15,
                  //                 child: Column(
                  //                   crossAxisAlignment: CrossAxisAlignment.start,
                  //                   children: [
                  //                     Text("Mood",style: context.theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),),
                  //                     Row(
                  //                       children: [
                  //                         bottomInProduct(
                  //                           context,Asset.iconHot,"",_selectedIndexMoodInProduct == 0,() => _handleTap(0),),
                  //                         bottomInProduct(context,Asset.iconCold,"",_selectedIndexMoodInProduct == 1,() => _handleTap(1)),
                  //                       ],
                  //                     ),
                  //                   ],
                  //                 ),
                  //               ),
                  //               Column(
                  //                 crossAxisAlignment: CrossAxisAlignment.start,
                  //                 children: [
                  //                   Text("Size",style: context.theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),),
                  //                   Row(
                  //                     children: [
                  //                       bottomInProduct(context,Asset.iconHot,"S",_selectedIndexSizeInProduct == 0,() => _handleSizeTap(0),),
                  //                       bottomInProduct(context,Asset.iconCold,"M",_selectedIndexSizeInProduct == 1,() => _handleSizeTap(1)),
                  //                       bottomInProduct(context,Asset.iconCold,"L",_selectedIndexSizeInProduct == 2,() => _handleSizeTap(2)),
                  //                     ],
                  //                   ),
                  //                 ],
                  //               ),
                  //             ],
                  //           ),
                  //           Row(
                  //             children: [
                  //               SizedBox(
                  //                 width: context.width*0.15,
                  //                 child: Column(
                  //                   crossAxisAlignment: CrossAxisAlignment.start,
                  //                   children: [
                  //                     Text("Sugar",style: context.theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),),
                  //                     Row(
                  //                       children: options.asMap().entries.map((entry) {
                  //                         int index = entry.key;
                  //                         String option = entry.value;
                  //                         return _buildOptionButton(
                  //                           option: option,
                  //                           isSelected: _selectedSugarIndex == index,
                  //                           onTap: () {
                  //                             setState(() {
                  //                               _selectedSugarIndex = index;
                  //                             });
                  //                           },
                  //                         );
                  //                       }).toList(),
                  //                     ),
                  //                   ],
                  //                 ),
                  //               ),
                  //               SizedBox(
                  //                 width: context.width*0.15,
                  //                 child: Column(
                  //                   crossAxisAlignment: CrossAxisAlignment.start,
                  //                   children: [
                  //                     Text("Ice",style: context.theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),),
                  //                     Row(
                  //                       children: options.asMap().entries.map((entry) {
                  //                         int index = entry.key;
                  //                         String option = entry.value;
                  //                         return _buildOptionButton(
                  //                           option: option,
                  //                           isSelected: _selectedIceIndex == index,
                  //                           onTap: () {
                  //                             setState(() {
                  //                               _selectedIceIndex = index;
                  //                             });
                  //                           },
                  //                         );
                  //                       }).toList(),
                  //                     ),
                  //                   ],
                  //                 ),
                  //               ),
                  //             ],
                  //           ),
                  //         ],
                  //       ),
                  //     );
                  //   },),
                  // ),
                  SizedBox(height: context.height*0.01,),
                  SizedBox(
                    width: context.width * 0.63,
                    height: context.height * 0.62,
                    child: SingleChildScrollView(
                      child: Wrap(
                        spacing: 10.0, // Khoảng cách giữa các item ngang
                        runSpacing: 10.0, // Khoảng cách giữa các hàng
                        children: List.generate(5, (index) {
                          return Container(
                            width: context.width * 0.308, // Đặt chiều rộng cho mỗi item
                            padding: EdgeInsets.all(Styles.defaultPadding),
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(Radius.circular(10)),
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                  color: Styles.dark.withOpacity(0.2),
                                  offset: const Offset(1.1, 1.1),
                                  blurRadius: 5,
                                ),
                              ],
                              color: Styles.light,
                            ),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      height: context.height * 0.2,
                                      width: context.width * 0.1,
                                      margin: const EdgeInsets.only(right: 20),
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(Radius.circular(20)),
                                        image: DecorationImage(
                                          image: AssetImage(Asset.imgProduct1),
                                          fit: BoxFit.fitHeight,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: context.width * 0.15,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Trà xanh Espresso Marble",
                                            style: context.theme.textTheme.headlineSmall?.copyWith(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            "Cho ngày thêm tươi, tỉnh, êm, mượt với Trà Xanh Espresso Marble.",
                                            style: context.theme.textTheme.titleSmall?.copyWith(
                                              color: Styles.grey,
                                            ),
                                          ),
                                          SizedBox(height: context.height * 0.015),
                                          Text(
                                            "49.000 đ",
                                            style: context.theme.textTheme.headlineMedium?.copyWith(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: context.height * 0.01),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: context.width*0.14,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("Mood",style: context.theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),),
                                          Row(
                                            children: [
                                              bottomInProduct(
                                                context,Asset.iconHot,"",_selectedIndexMoodInProduct == 0,() => _handleTap(0),),
                                              bottomInProduct(context,Asset.iconCold,"",_selectedIndexMoodInProduct == 1,() => _handleTap(1)),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("Size",style: context.theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),),
                                        Row(
                                          children: [
                                            bottomInProduct(context,Asset.iconHot,"S",_selectedIndexSizeInProduct == 0,() => _handleSizeTap(0),),
                                            bottomInProduct(context,Asset.iconCold,"M",_selectedIndexSizeInProduct == 1,() => _handleSizeTap(1)),
                                            bottomInProduct(context,Asset.iconCold,"L",_selectedIndexSizeInProduct == 2,() => _handleSizeTap(2)),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: context.width*0.14,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("Sugar",style: context.theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),),
                                          Row(
                                            children: options.asMap().entries.map((entry) {
                                              int index = entry.key;
                                              String option = entry.value;
                                              return _buildOptionButton(
                                                option: option,
                                                isSelected: _selectedSugarIndex == index,
                                                onTap: () {
                                                  setState(() {
                                                    _selectedSugarIndex = index;
                                                  });
                                                },
                                              );
                                            }).toList(),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("Ice",style: context.theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),),
                                        Row(
                                          children: options.asMap().entries.map((entry) {
                                            int index = entry.key;
                                            String option = entry.value;
                                            return _buildOptionButton(
                                              option: option,
                                              isSelected: _selectedIceIndex == index,
                                              onTap: () {
                                                setState(() {
                                                  _selectedIceIndex = index;
                                                });
                                              },
                                            );
                                          }).toList(),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const CusButton(text: "Thêm vào hóa đơn", color: Styles.green)
                              ],
                            ),
                          );
                        }),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                  height: context.height*0.85,
                  width: context.width*0.26,
                  child: _buildInvoice(context))
            ],
          )
        ],
      ),
    );
  }
  Widget _buildOptionButton({
    required String option,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(top:8),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isSelected ? Colors.green.withOpacity(0.1) : Colors.grey.withOpacity(0.1),
          shape: BoxShape.circle,
          border: Border.all(
            color: isSelected ? Colors.green : Colors.grey,
          ),
        ),
        child: Text(
          option,
          style: context.theme.textTheme.titleSmall?.copyWith(
            color: isSelected ? Colors.green : Colors.grey,
              fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
  @override
  Widget _buildInvoice(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top:9),
            child: Text("Hóa đơn",style: context.theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold
            ),),
          ),
          Expanded(
            child: ListView(
              children: [
                buildProductItem(
                  context,
                  Asset.imgProduct1,
                  'Caramel Macchiato',
                  1,
                  49000,
                ),
                buildProductItem(
                  context,
                  Asset.imgProduct1,
                  'Hi-Tea Yuzu Kom...',
                  2,
                  120000,
                ),
                buildProductItem(
                  context,
                  Asset.imgProduct1,
                  'Cold Brew Sữa Tươi',
                  2,
                  120000,
                ),
              ],
            ),
          ),
          // Subtotal, VAT, Total
          const SizedBox(height: 16.0),
          buildSummaryItem('Tổng phụ', '289.000đ'),
          buildSummaryItem('VAT (10%)', '28.900đ'),
          const Divider(),
          buildSummaryItem('Tổng cộng', '317.000đ', isTotal: true),
          // Payment options
          const SizedBox(height: 16.0),
          Text(
            'Thanh toán online',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildPaymentOption('Momo', Asset.qrMomo),
              buildPaymentOption('Vietcombank', Asset.qrVTB),
            ],
          ),
          const SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {
              // Handle export invoice action
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Styles.green,
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            child: const Center(
              child: Text(
                'Xuất hóa đơn',
                style: TextStyle(fontSize: 16.0, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildProductItem(BuildContext context, String image, String title, int quantity, int price) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Container(
            width: context.height*0.1,
            height: context.height*0.1,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 16.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                Row(
                  children: [
                    Text('x$quantity', style: const TextStyle(color: Colors.grey)),
                    const SizedBox(width: 10),
                    Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Styles.green.withOpacity(0.1),
                          borderRadius: const BorderRadius.all(Radius.circular(20)),
                          border: Border.all(color: Styles.green)
                      ),
                      child:const Text('Notes', style: TextStyle(color: Styles.green)),
                    )
                  ],
                ),
              ],
            ),
          ),
          Text(
            '$priceđ',
            style: Theme.of(context).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget buildSummaryItem(String title, String amount, {bool isTotal = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: isTotal ? 16.0 : 14.0,
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          Text(
            amount,
            style: TextStyle(
              fontSize: isTotal ? 16.0 : 14.0,
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildPaymentOption(String label, String qrImagePath) {
    return Column(
      children: [
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            image: DecorationImage(
              image: AssetImage(qrImagePath),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 8.0),
        Text(label, style: const TextStyle(color: Colors.black)),
      ],
    );
  }
