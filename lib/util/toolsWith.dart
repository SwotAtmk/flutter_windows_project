import 'dart:io';

class ToolsWith{
  String currentDirectory = Directory.current.path;
  final ds = Platform.pathSeparator;

  folderExists(String filepath) async {
    var file = Directory(filepath);
    try {
      bool exists = await file.exists();
      if (!exists) {
        await file.create();
      }
    } catch (e) {
      print(e);
    }
  }

  Future<File> getFile(String path,String fileName) async {
    final filePath = path+ds+fileName;
    File file = new File(filePath);
    bool exists = await file.exists();
    if(!exists){
      await file.create();
    }
    return file;
  }

  Future<File> checkFileExists(String path,String fileName) async{
    final filePath = path+ds+fileName;
    File file = new File(filePath);
    bool exists = await file.exists();
    if(!exists){
      return null;
    }
    return file;
  }

  String dateToYMD(date){
    return "${date.year.toString()}_${date.month.toString().padLeft(2,'0')}_${date.day.toString().padLeft(2,'0')}";
  }
}