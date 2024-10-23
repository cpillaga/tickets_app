class Config {

  static String ambiente = "local";
  static String version = "v.1.1.1";

  static String hostImages = '3002';
  static String hostApi = '3001';

  static Map<String, dynamic> urlAmbiente = {

    'local': {
      'host': 'http://157.230.60.3:$hostApi/sofi/api/v1',
      'urlAMedia': 'https://app-web-admin-bk-test.track4go.com/',
      'hostFuel': 'http://192.168.1.30:3005',
    },

    'images': {
      'host': 'http://157.230.60.3:$hostImages/sofi/api/v1',
      'urlAMedia': 'https://app-web-admin-bk-test.track4go.com/',
      'hostFuel': 'http://192.168.1.30:3005',
    },

    'produccion': {
      'host': 'http://192.168.1.4:3001',
      'urlAMedia': 'https://app-web-admin-bk-test.track4go.com/',
      'hostFuel': 'http://192.168.1.30:3005',
    }

  };

  static Map<String, dynamic> initConfig = {'ambiente': ambiente, 'version': version, 'host': urlAmbiente[ambiente]['host']};

}
