import 'dart:io' show Platform;
import 'dart:async' show runZoned;
import 'package:path/path.dart' show join, dirname;
import 'package:shelf/shelf_io.dart' as io;
import 'package:shelf_static/shelf_static.dart';

void main() async {
  // Assumes the server lives in bin/ and that `webdev build` ran
  var pathToBuild = join(dirname(Platform.script.toFilePath()), '..', 'build');
  var handler = createStaticHandler(pathToBuild, defaultDocument: 'index.html');
  var portEnv = Platform.environment['PORT'];
  var port = portEnv == null ? 9999 : int.parse(portEnv);
  runZoned(() {
    io.serve(handler, '0.0.0.0', port);
    print("Serving $pathToBuild on port $port");
  }, onError: (e, stackTrace) => print('Oh noes! $e $stackTrace'));
}
