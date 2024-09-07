
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../manager/main_provider.dart';
import '../widgets/custom_agents.dart';

class AgentsDetailsScreen extends StatelessWidget {
  static const String routeName = "AgentsDetails";

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MainProvider(),
      builder: (context, child) {
        var provider = Provider.of<MainProvider>(context);
        var arg = ModalRoute.of(context)!.settings.arguments as DataAgents;
        return Scaffold(
          appBar: AppBar(
            title: Text(
              arg.title,
              style:const TextStyle(color: Colors.white),
            ),
            actions:<Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.network(arg.iconChar , width: 30 , height: 30,),
              )
            ],
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(15),
              child: Column(
                children: [
                  Stack(
                    children: [
                      Image.network(arg.bgPath ),
                      Image.network(arg.imagePath, fit: BoxFit.cover, width: 440, height: 520,),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "description",
                        style: TextStyle(fontSize: 25, color: Colors.white),
                      ),
                      const SizedBox(height: 10,),
                      Text(
                        arg.desc,
                        style:const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w400, color: Colors.white),
                      ),
                      const SizedBox(height: 10,),
                      const Text(
                        "abilities",
                        style: TextStyle(fontSize: 25, color: Colors.white),
                      ),
                      const SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(width: 2 , color: Colors.white),
                                borderRadius: BorderRadius.circular(15)
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Image.network(
                                  height:  60 , width: 60,
                                  arg.listIcon[0]
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(width: 2 , color: Colors.white),
                                borderRadius: BorderRadius.circular(15)
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Image.network(
                                  height:  60 , width: 60,
                                  arg.listIcon[1]
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(width: 2 , color: Colors.white),
                                borderRadius: BorderRadius.circular(15)
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Image.network(
                                  height:  60 , width: 60,
                                  arg.listIcon[2]
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(width: 2 , color: Colors.white),
                                borderRadius: BorderRadius.circular(15)
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Image.network(
                                  height:  60 , width: 60,
                                  arg.listIcon[3]
                              ),
                            ),
                          ),
                          // Other similar containers go here...
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },

    );
  }
}
