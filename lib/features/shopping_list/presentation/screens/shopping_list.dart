import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_list_app/features/shopping_list/data/models/grocery_item_model.dart';
import 'package:shopping_list_app/features/shopping_list/domain/entities/grocery_item_entity.dart';
import 'package:shopping_list_app/core/di/injection.dart';
import 'package:shopping_list_app/config/routes/app_router.dart';
import 'package:shopping_list_app/assets/strings.dart';
import 'package:shopping_list_app/features/shopping_list/presentation/bloc/article/remote/remote_grocery_bloc.dart';
import 'package:shopping_list_app/features/shopping_list/presentation/bloc/article/remote/remote_grocery_event.dart';
import 'package:shopping_list_app/features/shopping_list/presentation/bloc/article/remote/remote_grocery_state.dart';
import 'package:shopping_list_app/features/shopping_list/presentation/widgets/grocery_item.dart';

@RoutePage()
class ShoppingListScreen extends StatefulWidget {
  const ShoppingListScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ShoppingListState();
  }
}

class _ShoppingListState extends State<ShoppingListScreen> {
  void showNewItemForm() async {
    var newItem = await getIt<AppRouter>().push(const NewItemFormRoute());
    if (newItem == null) {
      return;
    }

    getIt<RemoteGroceryItemsBloc>()
        .add(SaveGroceryListItem(newItem as GroceryItemModel));
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: const Text(AString.yourGroceries),
            actions: [
              IconButton(
                  onPressed: () {
                    showNewItemForm();
                  },
                  icon: const Icon(Icons.add)),
              IconButton(
                  onPressed: () {
                    getIt<AppRouter>().push(const UserProfilRoute());
                  },
                  icon: const Icon(Icons.person))
            ],
          ),
          body: _buildBody()),
    );
  }

  _emptyListDisplay() {
    return Padding(
      padding: const EdgeInsets.all(2),
      child: Center(
          child: Text(
        textAlign: TextAlign.center,
        AString.listEmpty,
        style: Theme.of(context).textTheme.titleLarge,
      )),
    );
  }

  _buildBody() {
    return BlocBuilder<RemoteGroceryItemsBloc, RemoteGroceryState>(
      builder: (remoteGroceryItemBloc, state) {
        if (state is RemoteLoading) {
          return const Center(
            child: CupertinoActivityIndicator(
              radius: 20,
            ),
          );
        }
        if (state is RemoteGroceryItemsError) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(state.getSafeErrorMsg(true)),
              const SizedBox(
                height: 15,
              ),
              const Center(child: Icon(Icons.refresh))
            ],
          );
        }
        if (state is RemoteGroceryListDone ||
            state is RemoteSaveGroceryItemDone ||
            state is RemoteGroceryItemsDeleteError) {
          if (state is RemoteGroceryItemsDeleteError) {
            _showItemDeletFailedSnackBar();
          }

          return ListView.builder(
              itemCount: state.groceryListItems?.length,
              itemBuilder: (BuildContext context, int index) => Dismissible(
                    key: ValueKey(state.groceryListItems![index].getKey()),
                    background:
                        Container(color: Theme.of(context).colorScheme.error),
                    child: GroceryListTile(
                        item: state.groceryListItems![index], ctx: context),
                    onDismissed: (direction) {
                      _onRemoveGroceryItem(state.groceryListItems![index]);
                    },
                  ));
        }
        if (state is RemoteGroceryListEmpty) {
          return _emptyListDisplay();
        }
        return const SizedBox();
      },
    );
  }

  _onRemoveGroceryItem(GroceryItemEntity groceryItemToDelete) {
    getIt<RemoteGroceryItemsBloc>()
        .add(DeleteGroceryListItem(groceryItemToDelete));
  }

  _showItemDeletFailedSnackBar() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          duration: Duration(seconds: 10),
          content: Text(AString.deleteItemFailed),
        ),
      );
    });
  }
}
