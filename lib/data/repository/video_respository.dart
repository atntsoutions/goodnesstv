import 'dart:async';
import 'dart:convert';
import 'package:goodnessapp/data/models/video.dart';
import 'package:goodnessapp/data/repository/ivideo_repository.dart';
import 'package:goodnessapp/data/service/video_local_service.dart';
import 'package:goodnessapp/data/service/video_remote_service.dart';
import 'package:goodnessapp/utils/singleton.dart';

class VideoRepository extends iVideoRepository {
  final VideoLocalService videoLocalService;
  final VideoRemoteService videoRemoteService;

  int _local_version = 0;
  int _remote_version = 0;
  String _json = "";

  VideoRepository(
      {required this.videoRemoteService, required this.videoLocalService});

  int getRemoteVersion() {
    return _remote_version;
  }

  String getJson() {
    return _json;
  }

  Future<List<video>> GetList(String source) async {
    try {
      if (source == "REMOTE") {
        _json = await videoRemoteService.ReadData();
        final _list1 = jsonDecode(_json) as List;
        return _list1.map((e) => video.fromJson(e)).toList();
      }
      final _list2 = await videoLocalService.ReadData("DATA");
      return _list2.map((e) => video.fromJson(e)).toList();
    } catch (e) {
      print('Error Reading ${source}-${e}');
      return [];
    }
  }

  Future<bool> IsDataOK() async {
    final _version = await videoLocalService.ReadVersion('VERSION');
    final _data = await videoRemoteService.ReadVersion();

    _local_version = _version;
    _remote_version = _data["version"];

    if (_remote_version > 0) Singleton.Version = _remote_version;

    print('Local Version ${_local_version}');
    print('Remote Version ${_remote_version}');

    if (_local_version < _remote_version)
      return false;
    else
      return true;
  }

  Future<bool> Save() async {
    try {
      await videoLocalService.SaveData(_json);
      await videoLocalService.SaveVersion(_remote_version);
      print('Save Local Data');
      return true;
    } catch (e) {
      print('Save Video Repo ${e}');
      return false;
    }
  }
}
