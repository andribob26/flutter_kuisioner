import 'package:kuisioner/data/api.dart';
import 'package:kuisioner/models/adminModel.dart';
import 'package:kuisioner/models/dosenModel.dart';
import 'package:kuisioner/models/kuisionerModel.dart';
import 'package:kuisioner/models/mahasiswaModel.dart';
import 'package:kuisioner/models/pertanyaanModel.dart';

class Repository {
  final Api api = Api();
  //dosen api repository
  Future<List<DosenModel>> getAllDosen() async {
    return await api.getAllDosen();
  }

  Future<DosenModel> getDosenById(String id) async {
    return await api.getDosenById(id);
  }

  addDosen({
    String namaDosen,
    int nip,
    int noTelepon,
    String email,
  }) async {
    await api.addDosen(
      namaDosen,
      nip,
      noTelepon,
      email,
    );
  }

  deleteDosen({
    String idDosen,
  }) async {
    await api.deleteDosen(
      idDosen,
    );
  }

  updateDosen({
    String idDosen,
    String namaDosen,
    int nip,
    int noTelepon,
    String email,
  }) async {
    await api.updateDosen(
      idDosen,
      namaDosen,
      nip,
      noTelepon,
      email,
    );
  }

  //mahasiswa api repository

  addMhs({
    String namaMhs,
    int nim,
    String password,
  }) async {
    await api.addMhs(
      namaMhs,
      nim,
      password,
    );
  }

  Future<List<MahasiswaModel>> getAllMhs() async {
    return await api.getAllMhs();
  }

  Future<MahasiswaModel> getMhsById(String id) async {
    return await api.getMhsById(id);
  }

  Future<MahasiswaModel> loginMhs({
    String username,
    String password,
    String role,
  }) async {
    return await api.loginMhs(
      username,
      password,
      role,
    );
  }

  Future<void> logoutMhs() async {
    return await api.logoutMhs();
  }

  Future<MahasiswaModel> getMhsIsLogin() async {
    return await api.getMhsIsLogin();
  }

  deleteMhs({
    String idMhs,
  }) async {
    await api.deleteMhs(
      idMhs,
    );
  }

  Future<void> ubahPass({
    String idMhs,
    String password,
    String passwordBaru,
  }) async {
    return await api.ubahPass(
      idMhs,
      password,
      passwordBaru,
    );
  }

  //pertanyaan api repository
  Future<List<PertanyaanModel>> getAllPertanyaan() async {
    return await api.getAllPertanyaan();
  }

  addPertanyaan({
    Map data,
  }) async {
    await api.addPertanyaan(
      data,
    );
  }

  //kuis api repository
  addKuis({
    String id,
    Map data,
  }) async {
    await api.addKuis(id, data);
  }

  //kuisioner
  Future<List<KuisionerModel>> getAllKuisioner() async {
    return await api.getAllKuisioner();
  }

  deleteKuisioner({
    String idKuisioner,
  }) async {
    await api.deleteKuisioner(
      idKuisioner,
    );
  }

  Future<KuisionerModel> getKuisionerById(String id) async {
    return await api.getKuisionerById(id);
  }

  Future<AdminModel> loginAdmin({
    String username,
    String password,
    String role,
  }) async {
    return await api.loginAdmin(
      username,
      password,
      role,
    );
  }

  Future<void> logoutAdmin() async {
    return await api.logoutAdmin();
  }
}
