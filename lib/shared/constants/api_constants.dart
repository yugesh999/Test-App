class APIConstants {
  //auth
  static const String signInAPI = "/auth/login";
  static const String forgotPasswordAPI = '/auth/password/forgot';
  static const String resetPasswordAPI = "/auth/password/reset";
  static const String refreshTokenAPI = "/token/refresh";
  static const String setPasswordAPI = "/auth/password/set";
  static const String logoutAPI = "/auth/logout";

  //department
  static const String addDepartmentAPI = "/departments";
  static const String getDepartmentAPI = "/departments";
  static const String updateDepartmentAPI = "/departments";
  static const String deleteDepartmentAPI = "/departments";
  static const String getAllDepartmentAPI = "/departments/list";

  //checklist
  static const String addChecklistAPI = "/checklists";
  static const String getChecklistAPI = "/checklists";
  static const String updateChecklistAPI = "/checklists";
  static const String deleteChecklistAPI = "/checklists";
  static const String getAllChecklistAPI = "/checklists/list";


  //user
  static const String createUserAPI = "/users";
  static const String userDetailsAPI = "/users/{user}/profile";
  static const String changePasswordAPI = "/user/password/change";
  static const String userListAPI = "/users/list";
  static const String getUserAPI = "/users";
  static const String professionDetailsAPI = "/users/{user}/profession";

  //set_profile/users
  static const String getUserProfileAPI = "/users/profile";
  static const String updateUserProfileAPI = "/users/profile";


  //entity type
  static const String usersMetadataAPI = "/users/metadata";
  static const String documentAPI = "/documents/upload";


  //file
  static const String fileUploadAPI = "/files/upload";
  static const String fileDeleteAPI = "/files/{file}";

  // document
  static const String getDocumentsAPI = "/documents/{user}";
  static const String getDocumentsByUserAPI = "/documents/";
  static const String updateDocumentAPI = "/documents/{user}";
  static const String uploadDocumentAPI = "/documents/upload";


  //permissions
  static const String getPermissionsListAPI = "/admin/permissions/list";
  static const String assignPermissionsAPI = "/admin/roles/permissions"; //assign

  //userChecklist
  static const String assignChecklistAPI = "/hr/users/{user}/checklists/{checklist}/assign";
  static const String unassignChecklistAPI = "/hr/users/{user}/checklists/{checklist}/unassign";
  static const String verifyChecklistAPI = "/hr/users/{user}/checklists/{checklist}/verify";
  static const String getUserChecklistAPI = "/hr/users/{user}/checklists";


  // Offboard
  static const String offboardReasonAPI = "/form/reason";
  static const String offboardEnvironmentAPI = "/form/environment";
  static const String offboardFeedbackAPI = "/form/feedback";
  static const String offboardAPI = "/hr/offboard/{user}";
  static const String getOffboardDetailsAPI = "/form";

  static const String getMyChecklistAPI = "/me/checklists";
  static const String updateMyChecklistAPI = "/me/checklists/{checklist}";

}
