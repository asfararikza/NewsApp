import 'base_network.dart';

class ApiNews {
  static ApiNews instance = ApiNews();
  Future<Map<String, dynamic>> loadArticles() {
    return BaseNetwork.get("articles/?format=json");
  }

  Future<Map<String, dynamic>> loadBlogs() {
    return BaseNetwork.get("blogs/?format=json");
  }

  Future<Map<String, dynamic>> LoadReports() {
    return BaseNetwork.get("reports/?format=json");
  }

  Future<Map<String, dynamic>> LoadDetailNews(String id) {
    return BaseNetwork.get("articles/$id/?format=json");
  }

  Future<Map<String, dynamic>> LoadDetailBlog(String id) {
    return BaseNetwork.get("blogs/$id/?format=json");
  }

  Future<Map<String, dynamic>> LoadDetailReport(String id) {
    return BaseNetwork.get("reports/$id/?format=json");
  }
}
