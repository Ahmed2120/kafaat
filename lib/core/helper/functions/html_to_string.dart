// ignore: depend_on_referenced_packages
import 'package:html/parser.dart' show parse;

String convertHtmlToPlainText(String htmlString) {
  var document = parse(htmlString);
  String plainText = parse(document.body!.text).documentElement!.text;
  return plainText.replaceAll('  ', '');
}