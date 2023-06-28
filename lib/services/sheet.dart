import 'package:gsheets/gsheets.dart';
import 'package:hystero/models/dataset.dart';

class DataSheetApi {
  static const credentials = r'''
{
  "type": "service_account",
  "project_id": "hysteroscopy-382504",
  "private_key_id": "a7aeeb0116870849053343827801dc6d5d16247c",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQCdULNHalIia552\nR36pPSVTih9D2LXGFRN0qdoE40u3oXP4sK+aGagAnd4hSS9LA3MEcw2SnlSBiWSw\ntIW8AKj2JnpiX5lXuYEvI1wCUi23aJtX1DlXDDUQBiTPRH806K8FaF7AFmP7W94f\nSRyk7D2a4GrSRXgFQnmd1H3hDt/v34FHDkFKBorEn83hMY3UmQR0w/wBHPW0MX3q\n6MfDxrntaYgAm62e2l3aCyVIv0KZQEfSESbF5seNZRBrM95xGwTN//JSQO6qyJfb\nECrf5x85uL/TH9M0ufMg6MXog5sFdCc+4guCeATyUWQJjiB0RqnFh21baV38V6sY\ntXyzOjnHAgMBAAECggEABygUfJ6fZx910WdGCAiKRsQIauHt8Wy+Bz2lRGzbe42y\nix3s+/N7Pn2Jps8y6C4bY/8HHz3PfFq18O/71+ZAlkoaOsvWKJtKZczG/8TU4/yA\n39YwvmWfK4zYzQqoFGeAps9Tsb6TBJ+7E1NHiun2xEskF0+Mh58f9AhZqnMulTWH\nmLe0YNG2VnTZSJUvd2sp5zu/eHJzerg5FTd/e9Xl6aXVokgTK0KI8vjnPs8+Hwye\n4l19ADgLbxq+4Edak5Wi8qk83eJ04jv6ukGc2OOvC8wp7cV9rLOXkWDo2Spv7PVY\nb06pSlAeBCX1q1n7krIE52PM43rlcij10TlbmZwykQKBgQDeR2vfaYCShnvlDZm0\nChLWfuc0sFwdYe1VdPoDCjruAj+FoQTP47TAiSvEh925lydK1pTNZy6t/4+d1mPe\nPmim6L7+ALR38/VblPv/6u+0EK1aq50m8Iim67gtzztMDZXJfeJonK2UsTWGwtgw\nQMIZO7sALbeXP5icLYJuGAjhzwKBgQC1Lk1d99YwazQpEYxFlikf/7ckr60M+gn+\nDojsUIis7P0uLA+Ay6z9VsIqOBJ8DT96mugHES2yaqFuiyQ2jmrYsThoiS3Xqnjk\nDWDR3v2kDEdV8cqJ3oWYPFyOGPdLf+h7VrSs/2UxFf052NmCpaa0clBcaR1jurPC\noxMLVDL+iQKBgQC1lR74mdVg3eAklGG2BGyzMWRrVI9LqY4au77p8NeHS+rcnVez\nBM/KYcSRfnSRgnuk1Xsl+V7W4elPBa78BXu0rnooQicrvu33bNQYkrJTJTSY141A\nHEtmITaKpbpJPOfafK4Sy7u5trKFbnLxqFVoC7WORcqvElL3cu4URiorXQKBgQCc\nr9dezafhpcStQ6zAvVUBhF95jagl0dN0cFN/s0IP8sAd/yLFKt+HFFHEu0tZFwfv\n2ymQew2+/7JubEy8FbxXfCQhW4lWuunjp6I0vhkylx/WNs4HH3b/qiwNA5BSLeL7\nT4ffGNwFcFPXhC7ParzZzwaqdIljJyKwz+D3ajDTqQKBgBx/LCntKX7BqznBOuWf\nSd4nAbK633Yy8bInUqHbV2zoAWXfDy3mV348ET2au781GwvBdR9aMFYZZ+dO8AK0\niD+6lm+YBmCqIK1xPK77KKdtD6MkAG7rC335en7+zTIPW3o8xh9T8t5/r39eVNs6\nGcaTzqGPzkBovKT+J84apmlK\n-----END PRIVATE KEY-----\n",
  "client_email": "hysteroscopy@hysteroscopy-382504.iam.gserviceaccount.com",
  "client_id": "108070044485666010154",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/hysteroscopy%40hysteroscopy-382504.iam.gserviceaccount.com"
}

''';
  static const spreadsheetId = '1G4WavDM5zx4XDcY-fXZHcQ3zhi13UbKQaSzBAkAvgjU';

  static final gsheets = GSheets(credentials);

  static Worksheet? dataSheet;

  static Future init() async {
    try {
      final spreadsheet = await gsheets.spreadsheet(spreadsheetId);
      dataSheet = await getWorksheet(spreadsheet, 'Sheet 2');

      final firstRow = DataSet.getFields();
      dataSheet!.values.insertRow(1, firstRow);
    } catch (e) {
      print('init error: $e');
    }
  }

  static Future<Worksheet> getWorksheet(
      Spreadsheet spreadsheet, String title) async {
    try {
      return await spreadsheet.addWorksheet(title);
    } catch (e) {
      return spreadsheet.worksheetByTitle(title)!;
    }
  }

  static Future insert(List<Map<String, dynamic>> rowList) async {
    dataSheet!.values.map.appendRows(rowList);
  }

  static Future deleteByImagePath(String imagePath) async {
    if (dataSheet == null) return false;

    final index = await dataSheet!.values.rowIndexOf(imagePath);
    if (index == -1) return false;

    return dataSheet!.deleteRow(index);
  }
}
