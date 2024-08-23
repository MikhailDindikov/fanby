import 'package:fanby/fan_controllers/fan_db.dart';
import 'package:fanby/fan_models/fan_datenote.dart';
import 'package:fanby/fan_models/fan_notes.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class FanCheckController extends GetxController {
  final Rx<DateTime> fanDate = DateTime.now().obs;
  DateTime? lastCheck;
  List<FanNotes> notes = [];
  List<FanDatenote> datenotes = [];

  Future<void> addNote(FanNotes fanNotes) async {
    final tedb = FanDBHelper();

    await tedb.addNote(fanNotes);
    await getNotes();
  }

  Future<void> addEmptyNote() async {
    final tedb = FanDBHelper();

    await tedb.addNote(FanNotes.empty());
    await getNotes();
  }

  Future<void> getNotes() async {
    final tedb = FanDBHelper();

    lastCheck = DateTime.tryParse(GetStorage().read('lastCheck') ?? '');

    notes = await tedb.getAllNotes(
      fanDate.value.day.toString(),
      fanDate.value.month.toString(),
      fanDate.value.year.toString(),
    );
    datenotes = await tedb.getAllNotesDate(
      fanDate.value.month.toString(),
      fanDate.value.year.toString(),
    );
    update();
  }
}
