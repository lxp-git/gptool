import 'package:http/http.dart' as http;
import 'http_client_web.dart' if (dart.library.io) 'http_client_io.dart';

final http.Client client = createClient();
