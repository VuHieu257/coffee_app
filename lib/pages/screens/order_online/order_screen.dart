import 'package:coffee_cap/core/size/size.dart';
import 'package:coffee_cap/core/themes/theme_extensions.dart';
import 'package:flutter/material.dart';

import '../../../core/colors/color.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  int selectedIndex = 0; // To manage selected tab
  int selectedOrderIndex = 0; // To manage selected order

  // Example data
  List<Map<String, dynamic>> orders = [
    {"id": 1240, "time": "17:06", "items": 4, "total": 15.90, "status": "Paid"},
    {"id": 1241, "time": "17:10", "items": 6, "total": 25.10, "status": "Paid"},
    {"id": 1242, "time": "17:14", "items": 2, "total": 6.50, "status": "Paid"},
    {"id": 1243, "time": "17:20", "items": 3, "total": 12.90, "status": "Paid"},
  ];

  // Example items in the order and their selected state
  List<bool> selectedItems = [false, false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Date and Time
                  Text(
                    "28 October 2021 Thursday | 17:30",
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 10),

                  // Tabs
                  Row(
                    children: [
                      _buildTab("Pending", 0),
                      const SizedBox(width: 10),
                      _buildTab("Completed", 1),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: ListView.builder(
                      itemCount: orders.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedOrderIndex = index;
                              // Reset the selectedItems when switching orders
                              selectedItems = List.generate(3, (_) => false);
                            });
                          },
                          child: _buildOrderItem(index),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              flex: 2,
              child: _buildOrderDetails(),
            )

          ],
        ),
      ),
    );
  }

  Widget _buildTab(String title, int index) {
    bool isSelected = selectedIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? Colors.black : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }

  Widget _buildOrderItem(int index) {
    bool isSelected = selectedOrderIndex == index;
    var order = orders[index];

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: isSelected ? Colors.grey : Colors.white,
        // borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Order #${order['id']}",
                  style: context.theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold,color: isSelected ?Styles.light:Styles.dark),
              ),
                  // style: TextStyle(fontWeight: FontWeight.bold,color: isSelected ?Styles.light:Styles.dark)),
              SizedBox(height: context.height*0.01,),
              Text("Number of items: ${order['items']}" ,style: context.theme.textTheme.titleSmall?.copyWith(color: isSelected ?Styles.light:Styles.dark),),
            ],
          ),
          const SizedBox(width: 10),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(order['time'],style: context.theme.textTheme.titleSmall?.copyWith(color: isSelected ?Styles.light:Styles.dark),),
              SizedBox(height: context.height*0.01,),
              Row(
                children: [
                  Text("\$${order['total']}",style: context.theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold,color: isSelected ?Styles.light:Styles.dark)),
                  SizedBox(width: context.width*0.01,),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Text(
                      "Paid",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildOrderDetails() {
    var order = orders[selectedOrderIndex];
    return StreamBuilder<Object>(
      stream: null,
      builder: (context, snapshot) {
        return Align(
          alignment: Alignment.topCenter,
          child: Container(
            padding: const EdgeInsets.all(20),
            height: context.height*0.8,
            color: Styles.light,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Order #${order['id']}",
                  style:context.theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                  Expanded(flex: 4,child: Text("Item",style:context.theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),),
                  Expanded(child: Text("Qty",style:context.theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold))),
                  ],
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: selectedItems.length,
                    itemBuilder: (context, index) {
                      return _buildOrderDetailItem(
                        "Quarter Pounder With Cheese Deluxe ${index + 1}",
                        1,
                        index,
                      );
                    },
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: _isCompleteButtonEnabled()
                      ? () {
                      }
                      : null,
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 50),
                  ),
                  child: const Text("Complete"),
                ),
              ],
            ),
          ),
        );
      }
    );
  }

  Widget _buildOrderDetailItem(String name, int quantity, int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(flex: 4,child: Text(name,style:context.theme.textTheme.titleMedium?.copyWith(overflow: TextOverflow.ellipsis))),
          Expanded(child: Row(
            children: [
              Text("$quantity",style:context.theme.textTheme.titleMedium?.copyWith()),
              const SizedBox(width: 10),
              Checkbox(
                value: selectedItems[index],
                onChanged: (bool? value) {
                  setState(() {
                    selectedItems[index] = value ?? false;
                  });
                },
              ),
            ],
          )),
        ],
      ),
    );
  }

  bool _isCompleteButtonEnabled() {
    return selectedItems.every((item) => item);
  }
}
