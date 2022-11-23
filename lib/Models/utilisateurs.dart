// ignore_for_file: public_member_api_docs, sort_constructors_first
class Utilisateur {
  const Utilisateur({
    required this.idUtilisateur,
    this.nom,
    this.prenom,
    required this.pseudo,
    required this.idGender,
    required this.idLangue,
    required this.dateNaissance,
    required this.idProgramme,
    required this.dateIntallAppli,
    required this.dateDebutSobriete,
    required this.heureNotificationQuotidienne,
    required this.idWorkbook,
    required this.actif,
    required this.isDeleted,
    required this.pwd,
  });

  final int idUtilisateur;
  final String? nom;
  final String? prenom;
  final String pseudo;
  final int idGender;
  final int idLangue;
  final String dateNaissance;
  final int idProgramme;
  final String dateIntallAppli;
  final String dateDebutSobriete;
  final String heureNotificationQuotidienne;
  final int idWorkbook;
  final bool actif;
  final bool isDeleted;
  final String pwd;

  factory Utilisateur.fromJson(List json) {
    final utilisateurList = json[0] as Map<String, Object?>;
    return Utilisateur(
      idUtilisateur: utilisateurList['Id_User'] as int,
      nom: utilisateurList['Nom'] as String,
      prenom: utilisateurList['Prenom'] as String,
      pseudo: utilisateurList['Pseudo'] as String,
      idGender: utilisateurList['Id_Gender'] as int,
      idLangue: utilisateurList['Id_Langue'] as int,
      dateNaissance: utilisateurList['Date_Naissance'] as String,
      idProgramme: utilisateurList['Id_Programme'] as int,
      dateIntallAppli: utilisateurList['Date_InstallAppli'] as String,
      dateDebutSobriete: utilisateurList['Date_DebutSobriete'] as String,
      heureNotificationQuotidienne:
          utilisateurList['Heure_NotificationQuotidienne'] as String,
      idWorkbook: utilisateurList['Id_Workbook'] as int,
      actif: utilisateurList['Actif'] as bool,
      isDeleted: utilisateurList['IsDeleted'] as bool,
      pwd: utilisateurList['Pwd'] as String,
    );
  }
}
