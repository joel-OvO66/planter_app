import 'package:intl/intl.dart';
import 'package:tornado/network/HttpService.dart';
// region 前端扩展导入包
import '../entity/farm/domain/PlantNode.dart';
import '../entity/farm/entity/Note.dart';
// endregion

   /**
   * 笔记(Note)表控制层
   * @author gonglei
   * @since 2025-06-25 19:32:08
   */
class NoteController{

    static const ADD_NOTE = 'note/addNote';
   /**
   * 新增笔记
   * @param note
   * @return Note
   * @throws FieldException
   */
    static Future<Note> addNote(Note note) {
        return HttpService.post<Note>(ADD_NOTE, data: note, fromJson: Note.fromJson);
    }

    static const GET_NOTE_BY_ID = 'note/getNoteById';
   /**
   * 查看笔记
   * @param noteId
   * @return Note
   */
    static Future<Note?> getNoteById(int noteId) {
        return HttpService.get<Note>(GET_NOTE_BY_ID, queryParameters: {"noteId": noteId}, fromJson: Note.fromJson);
    }

    static const GET_PLANT_NODE_BY_PLANT_ID = 'note/getPlantNodeByPlantId';
   /**
   */
    static Future<PlantNode?> getPlantNodeByPlantId(int plantId) {
        return HttpService.get<PlantNode>(GET_PLANT_NODE_BY_PLANT_ID, queryParameters: {"plantId": plantId}, fromJson: PlantNode.fromJson);
    }

    static const PAGE_NOTE = 'note/pageNote';

    static const REMOVE_NOTE_BY_ID = 'note/removeNoteById';
   /**
   * 删除笔记
   * @param noteId
   * @return int
   */
    static Future<int?> removeNoteById(int noteId) {
        return HttpService.delete<int>(REMOVE_NOTE_BY_ID, queryParameters: {"noteId": noteId});
    }

    static const UPDATE_NOTE = 'note/updateNote';
   /**
   * 修改笔记
   * @param note
   * @return Note
   * @throws FieldException
   */
    static Future<Note> updateNote(Note note) {
        return HttpService.post<Note>(UPDATE_NOTE, data: note, fromJson: Note.fromJson);
    }

    // region 前端扩展代码区
    // endregion
}
