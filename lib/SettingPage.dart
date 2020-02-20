import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';

class SetiingPage extends StatefulWidget {
  @override
  _SetiingPageState createState() => _SetiingPageState();
}

class _SetiingPageState extends State<SetiingPage> {
  bool lockInBackground = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Settings',
            style: TextStyle(
              color: Color.fromRGBO(236, 128, 130, 1.0),
            ),
          ),
          backgroundColor: Colors.white,
          bottomOpacity: 0.0,
          elevation: 0.0,
          iconTheme: IconThemeData(
            color: Color.fromRGBO(236, 128, 130, 1.0),
          ),
        ),
        body: SettingsList(
          sections: [
            SettingsSection(
              tiles: [
                SettingsTile.switchTile(
                  title: 'Vibration',
                  leading: Icon(Icons.vibration),
                  switchValue: lockInBackground,
                  onToggle: (bool value) {
                    setState(() {
                      lockInBackground = value;
                    });
                  },
                ),
                SettingsTile.switchTile(
                  title: 'Sound',
                  leading: Icon(Icons.music_note),
                  switchValue: lockInBackground,
                  onToggle: (bool value) {
                    setState(() {
                      lockInBackground = value;
                    });
                  },
                ),
                SettingsTile.switchTile(
                  title: 'Push Alarm',
                  leading: Icon(Icons.alarm),
                  switchValue: lockInBackground,
                  onToggle: (bool value) {
                    setState(() {
                      lockInBackground = value;
                    });
                  },
                ),
                SettingsTile.switchTile(
                  title: 'Disable Account',
                  leading: Icon(Icons.phonelink_lock),
                  switchValue: lockInBackground,
                  onToggle: (bool value) {
                    setState(() {
                      lockInBackground = value;
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
