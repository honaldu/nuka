final AlarmSocketUrl = 'ws://15.164.212.90:8000/ws/alarm/';
final ServerIp = 'http://15.164.212.90:8000/';
//final ServerIp = 'http://192.168.219.100:8000/';
final SignUrl = '${ServerIp}auth/sign';
final AlarmUrl = '${ServerIp}story/storyalarmlist/';
final Map<String, String> Header = {
  'Content-type' : 'application/json',
  'Accept': 'application/json'};