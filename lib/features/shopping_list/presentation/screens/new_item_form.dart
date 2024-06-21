import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:shopping_list_app/features/shopping_list/data/models/category.dart';
import 'package:shopping_list_app/features/shopping_list/data/models/grocery_item_model.dart';
import 'package:shopping_list_app/features/shopping_list/domain/entities/grocery_item_entity.dart';
import 'package:shopping_list_app/core/di/injection.dart';
import 'package:shopping_list_app/config/routes/app_router.dart';
import 'package:shopping_list_app/assets/strings.dart';

@RoutePage<GroceryItemEntity>()
class NewItemFormScreen extends StatefulWidget {
  const NewItemFormScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _NewItemState();
  }
}

class _NewItemState extends State<NewItemFormScreen> {
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    var enteredName = '';
    var enteredQty = 1;
    var enteredCategory = Category.vegetables;

    void saveForm() {
      if (formKey.currentState?.validate() == true) {
        formKey.currentState?.save();

        var newGroceryItem = GroceryItemModel(name: enteredName, quantity: enteredQty, category: enteredCategory); 
        getIt<AppRouter>().maybePop<GroceryItemModel>(newGroceryItem);
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text( AString.addNewItem),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Form(
            key: formKey,
            child: Column(
              children: [
                TextFormField(
                  maxLength: 50,
                  decoration: const InputDecoration(label: Text( AString.name)),
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        value.trim().length == 1) {
                      return  AString.nameError;
                    }
                    return null;
                  },
                  onSaved: (value) {
                    enteredName = value!;
                  },
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          label: Text( AString.quantity),
                        ),
                        initialValue: '1',
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              int.tryParse(value) == null ||
                              int.tryParse(value)! < 1) {
                            return AString.qtyError;
                          }
                          return null;
                        },
                        onSaved: (value) {
                          enteredQty = int.parse(value!);
                        },
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: DropdownButtonFormField(
                        onChanged: (value) {
                          //setState(() {
                            enteredCategory = value as Category;
                          //});
                        },
                        value: enteredCategory,
                        items: [
                          for (final category in Category.values)
                            DropdownMenuItem(
                                value: category,
                                child: Row(children: [
                                  Container(
                                      width: 16,
                                      height: 16,
                                      color: category.color),
                                  const SizedBox(width: 6),
                                  Text(category.title),
                                ]))
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: () {
                          formKey.currentState?.reset();
                        },
                        child: const Text( AString.reset)),
                    ElevatedButton(
                        onPressed: () {
                          saveForm();
                        },
                        child: const Text( AString.addItem))
                  ],
                )
              ],
            )),
      ),
    );
  }
}
