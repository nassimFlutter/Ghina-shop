import 'package:best_price/core/api/api_response_model.dart';
import 'package:best_price/core/api/api_service.dart';
import 'package:best_price/core/errors/failures.dart';
import 'package:best_price/core/utils/service_locator.dart';
import 'package:best_price/feature/account/data/repo/contact_us_repo/contact_us_repo.dart';
import 'package:dartz/dartz.dart';

class ContactUsRepoImpl implements ContactUsRepo {
  @override
  Future<Either<Failure, Response>> contactUs(
      String email, String mobile, String name, String message) async {
    try {
      var response = await getIt.get<ApiService>().get(
          endPoint:
              "contactUs?email=$email&mobile=$mobile&name=$name&message=$message");
      Response contactUsResponse = Response.fromJson(response);
      return right(contactUsResponse);
    } catch (e) {
      return left(ErrorHandler.handleError(e));
    }
  }
}
// {{mainURL}}contactUs?email=karim@gmail.com&mobile=77&name=karim&message=hello
