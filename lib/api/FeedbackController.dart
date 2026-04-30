import 'package:intl/intl.dart';
import 'package:tornado/network/HttpService.dart';
// region 前端扩展导入包
import '../entity/security/entity/Feedback.dart';
// endregion

   /**
   * @Author: gonglei
   * @Date: 2018/6/26 下午2:04
   * @Description: 
   */
class FeedbackController{

    static const ADD_FEEDBACK = 'feedback/addFeedback';
   /**
   */
    static Future<Feedback> addFeedback(Feedback feedback) {
        return HttpService.post<Feedback>(ADD_FEEDBACK, data: feedback, fromJson: Feedback.fromJson);
    }

    static const PAGE_FEEDBACK = 'feedback/pageFeedback';

    static const UPDATE_FEEDBACK = 'feedback/updateFeedback';
   /**
   */
    static Future<Feedback> updateFeedback(Feedback feedback) {
        return HttpService.post<Feedback>(UPDATE_FEEDBACK, data: feedback, fromJson: Feedback.fromJson);
    }

    // region 前端扩展代码区
    // endregion
}
