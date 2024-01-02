import '../../models/response/respnse_data_design.dart';
import '../../models/response/respnse_data_design_detail.dart';
import '../../models/response/respnse_default.dart';
import '../../models/response/response_data_category.dart';
import '../services/service_dio/service_dio.dart';
import '../services/service_dio/url_api.dart';

class RepsChamjo {
  static Future<ResponseDataCategory> getCategory() async {
    try {
      var response = await ServiceDio.getCase(url: dataAppCategori);
      return responseDataCategoryFromJson(responseDefaultToJson(response));
    } catch (e) {
      return ResponseDataCategory(
        status: false,
        message: e.toString(),
      );
    }
  }

  static Future<ResponseDataDesign> getAll(String category) async {
    try {
      var response = await ServiceDio.getCase(url: dataApp + category);
      return responseDataDesignFromJson(
        responseDefaultToJson(response),
      );
    } catch (e) {
      return ResponseDataDesign(
        status: false,
        message: e.toString(),
      );
    }
  }

  static Future<ResponseDataDesignDetail> getDetail(String id) async {
    try {
      var response = await ServiceDio.getCase(url: dataAppDetail + id);
      return responseDataDesignDetailFromJson(responseDefaultToJson(response));
    } catch (e) {
      return ResponseDataDesignDetail(
        status: false,
        message: e.toString(),
      );
    }
  }
}
