import 'package:flutter/material.dart';
import 'package:flutter_application_1/App_theme.dart';

class SettingTap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 20,vertical: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Log out',style: Theme.of(context).textTheme.titleMedium,),
                IconButton(onPressed: (){}, icon: Icon(Icons.logout) , iconSize: 20,)
              ]
        
            )
          ]
        ),
      ),
    );
  }
}
