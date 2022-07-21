import 'package:app_restaurant_flutter/presentation/provider/history/history_provider.dart';
import 'package:app_restaurant_flutter/presentation/ui/history/widgets/list_history.dart';
import 'package:app_restaurant_flutter/presentation/widgets/bar_back.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HistoryPage extends StatefulWidget{
  const HistoryPage({Key? key}) : super(key: key);
  @override
  History createState()=> History();
}

class History extends State<HistoryPage> with SingleTickerProviderStateMixin{
  late HistoryProvider provider;

  @override
  void initState() {
    provider = Provider.of<HistoryProvider>(context,listen: false);
    WidgetsBinding.instance.addPostFrameCallback((_) async{
      _loadHistory();
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<HistoryProvider>(this.context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Padding(padding: const EdgeInsets.only(top: 80),
                  child: listHistory(
                      context,
                      provider.history
                  )
              ),
              Column(
                children: [
                  barBack(context),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  _loadHistory() async{
    provider.loadHistory();
  }

}