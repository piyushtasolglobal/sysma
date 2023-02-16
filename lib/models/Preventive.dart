import 'dart:convert';
/// api_status : 1
/// api_message : "66 audit schedules found"
/// total : 66
/// totalAssetScheduledata : [{"maintenance_type":"preventive","audit_schdule_id":13720,"audit_id":186,"audit_start_date":"2023-01-02 00:00:00","audit_end_date":"2023-01-02 00:45:00","schedule_expire_date":"2023-01-02 12:59:00","audit_inspection_date":"2023-01-02 00:45:00","audit_status":"overdue","escalated_audit_levels":"","audit_name":" Refri-Log Book-Hourly","asset_tag_id":2570,"name":"Refri-Log Book","asset_tag":"UAT-VD-07","model_id":178,"model_name":"Refri-Log Book","image":"asset-image-3Cc07ZTQKs.jpg","asset_image":"https://uat.sysmatech.com/public/uploads/assets/asset-image-3Cc07ZTQKs.jpg","purchase_date":null,"warranty_months":12,"location":"Vidya Dairy","supplier_name":"VD","category_name":"Refri -","company_name":"Vidya Dairy","pm_history":[{"audit_schdule_id":12604,"asset_tag_id":2570,"audit_name":" Refri-Log Book-Hourly","audit_inspection_date":"2022-12-27 15:12:11","audit_result":"Fail"}],"can_checkin":0,"can_checkout":1,"status_label":"Overdue","due_date":"2023-01-02 12:59:00","audit_params_values":"[{\"audit_params_id\":184,\"audit_params_name\":\"Refri-Log Book-Hourly\",\"asset_model\":\"178\",\"company_id\":14,\"status\":\"1\",\"audit_camera_photos\":null,\"audit_comment\":null,\"show_when_photos\":null,\"show_when_comment\":null,\"param_disp_name\":\"High Stage Compressor 1 - SP\",\"param_type\":\"Number\",\"benchmark_range_low\":0,\"benchmark_range_high\":100,\"dropdown_values\":\"\",\"dropdown_reject_value\":\"\",\"dropdown_accept_value\":\"\",\"audit_camera_photos_key\":\"1163_img\",\"audit_comment_key\":\"1163_comment\",\"audit_audio_key\":null,\"audit_param_audio_path\":null,\"text_validation\":null,\"date_validation\":null,\"text\":null,\"date\":null,\"validation\":\"{\\\"textfield_accept_comment_validation\\\":\\\"Optional\\\",\\\"textfield_reject_photos_validation\\\":\\\"Required\\\",\\\"textfield_reject_comment_validation\\\":\\\"Required\\\",\\\"textfield_aacept_photos_validation\\\":\\\"Optional\\\"}\"},{\"audit_params_id\":184,\"audit_params_name\":\"Refri-Log Book-Hourly\",\"asset_model\":\"178\",\"company_id\":14,\"status\":\"1\",\"audit_camera_photos\":null,\"audit_comment\":null,\"show_when_photos\":null,\"show_when_comment\":null,\"param_disp_name\":\"High Stage Compressor 1 - DP\",\"param_type\":\"Number\",\"benchmark_range_low\":0,\"benchmark_range_high\":100,\"dropdown_values\":\"\",\"dropdown_reject_value\":\"\",\"dropdown_accept_value\":\"\",\"audit_camera_photos_key\":\"1164_img\",\"audit_comment_key\":\"1164_comment\",\"audit_audio_key\":null,\"audit_param_audio_path\":null,\"text_validation\":null,\"date_validation\":null,\"text\":null,\"date\":null,\"validation\":\"{\\\"textfield_accept_comment_validation\\\":\\\"Optional\\\",\\\"textfield_reject_photos_validation\\\":\\\"Required\\\",\\\"textfield_reject_comment_validation\\\":\\\"Required\\\",\\\"textfield_aacept_photos_validation\\\":\\\"Optional\\\"}\"},{\"audit_params_id\":184,\"audit_params_name\":\"Refri-Log Book-Hourly\",\"asset_model\":\"178\",\"company_id\":14,\"status\":\"1\",\"audit_camera_photos\":null,\"audit_comment\":null,\"show_when_photos\":null,\"show_when_comment\":null,\"param_disp_name\":\"High Stage Compressor 1 - OP\",\"param_type\":\"Number\",\"benchmark_range_low\":0,\"benchmark_range_high\":100,\"dropdown_values\":\"\",\"dropdown_reject_value\":\"\",\"dropdown_accept_value\":\"\",\"audit_camera_photos_key\":\"1165_img\",\"audit_comment_key\":\"1165_comment\",\"audit_audio_key\":null,\"audit_param_audio_path\":null,\"text_validation\":null,\"date_validation\":null,\"text\":null,\"date\":null,\"validation\":\"{\\\"textfield_accept_comment_validation\\\":\\\"Optional\\\",\\\"textfield_reject_photos_validation\\\":\\\"Required\\\",\\\"textfield_reject_comment_validation\\\":\\\"Required\\\",\\\"textfield_aacept_photos_validation\\\":\\\"Optional\\\"}\"},{\"audit_params_id\":184,\"audit_params_name\":\"Refri-Log Book-Hourly\",\"asset_model\":\"178\",\"company_id\":14,\"status\":\"1\",\"audit_camera_photos\":null,\"audit_comment\":null,\"show_when_photos\":null,\"show_when_comment\":null,\"param_disp_name\":\"High Stage Compressor 1 - HRS MTS\",\"param_type\":\"Number\",\"benchmark_range_low\":0,\"benchmark_range_high\":100,\"dropdown_values\":\"\",\"dropdown_reject_value\":\"\",\"dropdown_accept_value\":\"\",\"audit_camera_photos_key\":\"1166_img\",\"audit_comment_key\":\"1166_comment\",\"audit_audio_key\":null,\"audit_param_audio_path\":null,\"text_validation\":null,\"date_validation\":null,\"text\":null,\"date\":null,\"validation\":\"{\\\"textfield_accept_comment_validation\\\":\\\"Optional\\\",\\\"textfield_reject_photos_validation\\\":\\\"Required\\\",\\\"textfield_reject_comment_validation\\\":\\\"Required\\\",\\\"textfield_aacept_photos_validation\\\":\\\"Optional\\\"}\"},{\"audit_params_id\":184,\"audit_params_name\":\"Refri-Log Book-Hourly\",\"asset_model\":\"178\",\"company_id\":14,\"status\":\"1\",\"audit_camera_photos\":null,\"audit_comment\":null,\"show_when_photos\":null,\"show_when_comment\":null,\"param_disp_name\":\"High Stage Compressor 2 - SP\",\"param_type\":\"Number\",\"benchmark_range_low\":0,\"benchmark_range_high\":100,\"dropdown_values\":\"\",\"dropdown_reject_value\":\"\",\"dropdown_accept_value\":\"\",\"audit_camera_photos_key\":\"1167_img\",\"audit_comment_key\":\"1167_comment\",\"audit_audio_key\":null,\"audit_param_audio_path\":null,\"text_validation\":null,\"date_validation\":null,\"text\":null,\"date\":null,\"validation\":\"{\\\"textfield_accept_comment_validation\\\":\\\"Optional\\\",\\\"textfield_reject_photos_validation\\\":\\\"Required\\\",\\\"textfield_reject_comment_validation\\\":\\\"Required\\\",\\\"textfield_aacept_photos_validation\\\":\\\"Optional\\\"}\"},{\"audit_params_id\":184,\"audit_params_name\":\"Refri-Log Book-Hourly\",\"asset_model\":\"178\",\"company_id\":14,\"status\":\"1\",\"audit_camera_photos\":null,\"audit_comment\":null,\"show_when_photos\":null,\"show_when_comment\":null,\"param_disp_name\":\"High Stage Compressor 2-DP\",\"param_type\":\"Number\",\"benchmark_range_low\":0,\"benchmark_range_high\":100,\"dropdown_values\":\"\",\"dropdown_reject_value\":\"\",\"dropdown_accept_value\":\"\",\"audit_camera_photos_key\":\"1168_img\",\"audit_comment_key\":\"1168_comment\",\"audit_audio_key\":null,\"audit_param_audio_path\":null,\"text_validation\":null,\"date_validation\":null,\"text\":null,\"date\":null,\"validation\":\"{\\\"textfield_accept_comment_validation\\\":\\\"Optional\\\",\\\"textfield_reject_photos_validation\\\":\\\"Required\\\",\\\"textfield_reject_comment_validation\\\":\\\"Required\\\",\\\"textfield_aacept_photos_validation\\\":\\\"Optional\\\"}\"},{\"audit_params_id\":184,\"audit_params_name\":\"Refri-Log Book-Hourly\",\"asset_model\":\"178\",\"company_id\":14,\"status\":\"1\",\"audit_camera_photos\":null,\"audit_comment\":null,\"show_when_photos\":null,\"show_when_comment\":null,\"param_disp_name\":\"High Stage Compressor 2-OP\",\"param_type\":\"Number\",\"benchmark_range_low\":0,\"benchmark_range_high\":100,\"dropdown_values\":\"\",\"dropdown_reject_value\":\"\",\"dropdown_accept_value\":\"\",\"audit_camera_photos_key\":\"1169_img\",\"audit_comment_key\":\"1169_comment\",\"audit_audio_key\":null,\"audit_param_audio_path\":null,\"text_validation\":null,\"date_validation\":null,\"text\":null,\"date\":null,\"validation\":\"{\\\"textfield_accept_comment_validation\\\":\\\"Optional\\\",\\\"textfield_reject_photos_validation\\\":\\\"Required\\\",\\\"textfield_reject_comment_validation\\\":\\\"Required\\\",\\\"textfield_aacept_photos_validation\\\":\\\"Optional\\\"}\"},{\"audit_params_id\":184,\"audit_params_name\":\"Refri-Log Book-Hourly\",\"asset_model\":\"178\",\"company_id\":14,\"status\":\"1\",\"audit_camera_photos\":null,\"audit_comment\":null,\"show_when_photos\":null,\"show_when_comment\":null,\"param_disp_name\":\"High Stage Compressor 2-HRS MTS\",\"param_type\":\"Number\",\"benchmark_range_low\":0,\"benchmark_range_high\":100,\"dropdown_values\":\"\",\"dropdown_reject_value\":\"\",\"dropdown_accept_value\":\"\",\"audit_camera_photos_key\":\"1170_img\",\"audit_comment_key\":\"1170_comment\",\"audit_audio_key\":null,\"audit_param_audio_path\":null,\"text_validation\":null,\"date_validation\":null,\"text\":null,\"date\":null,\"validation\":\"{\\\"textfield_accept_comment_validation\\\":\\\"Optional\\\",\\\"textfield_reject_photos_validation\\\":\\\"Required\\\",\\\"textfield_reject_comment_validation\\\":\\\"Required\\\",\\\"textfield_aacept_photos_validation\\\":\\\"Optional\\\"}\"},{\"audit_params_id\":184,\"audit_params_name\":\"Refri-Log Book-Hourly\",\"asset_model\":\"178\",\"company_id\":14,\"status\":\"1\",\"audit_camera_photos\":null,\"audit_comment\":null,\"show_when_photos\":null,\"show_when_comment\":null,\"param_disp_name\":\"High Stage Compressor 3-SP\",\"param_type\":\"Number\",\"benchmark_range_low\":0,\"benchmark_range_high\":100,\"dropdown_values\":\"\",\"dropdown_reject_value\":\"\",\"dropdown_accept_value\":\"\",\"audit_camera_photos_key\":\"1171_img\",\"audit_comment_key\":\"1171_comment\",\"audit_audio_key\":null,\"audit_param_audio_path\":null,\"text_validation\":null,\"date_validation\":null,\"text\":null,\"date\":null,\"validation\":\"{\\\"textfield_accept_comment_validation\\\":\\\"Optional\\\",\\\"textfield_reject_photos_validation\\\":\\\"Required\\\",\\\"textfield_reject_comment_validation\\\":\\\"Required\\\",\\\"textfield_aacept_photos_validation\\\":\\\"Optional\\\"}\"},{\"audit_params_id\":184,\"audit_params_name\":\"Refri-Log Book-Hourly\",\"asset_model\":\"178\",\"company_id\":14,\"status\":\"1\",\"audit_camera_photos\":null,\"audit_comment\":null,\"show_when_photos\":null,\"show_when_comment\":null,\"param_disp_name\":\"High Stage Compressor 3-DP\",\"param_type\":\"Number\",\"benchmark_range_low\":0,\"benchmark_range_high\":100,\"dropdown_values\":\"\",\"dropdown_reject_value\":\"\",\"dropdown_accept_value\":\"\",\"audit_camera_photos_key\":\"1172_img\",\"audit_comment_key\":\"1172_comment\",\"audit_audio_key\":null,\"audit_param_audio_path\":null,\"text_validation\":null,\"date_validation\":null,\"text\":null,\"date\":null,\"validation\":\"{\\\"textfield_accept_comment_validation\\\":\\\"Optional\\\",\\\"textfield_reject_photos_validation\\\":\\\"Required\\\",\\\"textfield_reject_comment_validation\\\":\\\"Required\\\",\\\"textfield_aacept_photos_validation\\\":\\\"Optional\\\"}\"},{\"audit_params_id\":184,\"audit_params_name\":\"Refri-Log Book-Hourly\",\"asset_model\":\"178\",\"company_id\":14,\"status\":\"1\",\"audit_camera_photos\":null,\"audit_comment\":null,\"show_when_photos\":null,\"show_when_comment\":null,\"param_disp_name\":\"High Stage Compressor 3-OP\",\"param_type\":\"Number\",\"benchmark_range_low\":0,\"benchmark_range_high\":100,\"dropdown_values\":\"\",\"dropdown_reject_value\":\"\",\"dropdown_accept_value\":\"\",\"audit_camera_photos_key\":\"1173_img\",\"audit_comment_key\":\"1173_comment\",\"audit_audio_key\":null,\"audit_param_audio_path\":null,\"text_validation\":null,\"date_validation\":null,\"text\":null,\"date\":null,\"validation\":\"{\\\"textfield_accept_comment_validation\\\":\\\"Optional\\\",\\\"textfield_reject_photos_validation\\\":\\\"Required\\\",\\\"textfield_reject_comment_validation\\\":\\\"Required\\\",\\\"textfield_aacept_photos_validation\\\":\\\"Optional\\\"}\"},{\"audit_params_id\":184,\"audit_params_name\":\"Refri-Log Book-Hourly\",\"asset_model\":\"178\",\"company_id\":14,\"status\":\"1\",\"audit_camera_photos\":null,\"audit_comment\":null,\"show_when_photos\":null,\"show_when_comment\":null,\"param_disp_name\":\"High Stage Compressor 3-HRS MTS\",\"param_type\":\"Number\",\"benchmark_range_low\":0,\"benchmark_range_high\":100,\"dropdown_values\":\"\",\"dropdown_reject_value\":\"\",\"dropdown_accept_value\":\"\",\"audit_camera_photos_key\":\"1174_img\",\"audit_comment_key\":\"1174_comment\",\"audit_audio_key\":null,\"audit_param_audio_path\":null,\"text_validation\":null,\"date_validation\":null,\"text\":null,\"date\":null,\"validation\":\"{\\\"textfield_accept_comment_validation\\\":\\\"Optional\\\",\\\"textfield_reject_photos_validation\\\":\\\"Required\\\",\\\"textfield_reject_comment_validation\\\":\\\"Required\\\",\\\"textfield_aacept_photos_validation\\\":\\\"Optional\\\"}\"},{\"audit_params_id\":184,\"audit_params_name\":\"Refri-Log Book-Hourly\",\"asset_model\":\"178\",\"company_id\":14,\"status\":\"1\",\"audit_camera_photos\":null,\"audit_comment\":null,\"show_when_photos\":null,\"show_when_comment\":null,\"param_disp_name\":\"High Stage KCX 3 Compressor 1-SP\",\"param_type\":\"Number\",\"benchmark_range_low\":0,\"benchmark_range_high\":100,\"dropdown_values\":\"\",\"dropdown_reject_value\":\"\",\"dropdown_accept_value\":\"\",\"audit_camera_photos_key\":\"1175_img\",\"audit_comment_key\":\"1175_comment\",\"audit_audio_key\":null,\"audit_param_audio_path\":null,\"text_validation\":null,\"date_validation\":null,\"text\":null,\"date\":null,\"validation\":\"{\\\"textfield_accept_comment_validation\\\":\\\"Optional\\\",\\\"textfield_reject_photos_validation\\\":\\\"Required\\\",\\\"textfield_reject_comment_validation\\\":\\\"Required\\\",\\\"textfield_aacept_photos_validation\\\":\\\"Optional\\\"}\"},{\"audit_params_id\":184,\"audit_params_name\":\"Refri-Log Book-Hourly\",\"asset_model\":\"178\",\"company_id\":14,\"status\":\"1\",\"audit_camera_photos\":null,\"audit_comment\":null,\"show_when_photos\":null,\"show_when_comment\":null,\"param_disp_name\":\"High Stage KCX 3 Compressor 1-DP\",\"param_type\":\"Number\",\"benchmark_range_low\":0,\"benchmark_range_high\":100,\"dropdown_values\":\"\",\"dropdown_reject_value\":\"\",\"dropdown_accept_value\":\"\",\"audit_camera_photos_key\":\"1176_img\",\"audit_comment_key\":\"1176_comment\",\"audit_audio_key\":null,\"audit_param_audio_path\":null,\"text_validation\":null,\"date_validation\":null,\"text\":null,\"date\":null,\"validation\":\"{\\\"textfield_accept_comment_validation\\\":\\\"Optional\\\",\\\"textfield_reject_photos_validation\\\":\\\"Required\\\",\\\"textfield_reject_comment_validation\\\":\\\"Required\\\",\\\"textfield_aacept_photos_validation\\\":\\\"Optional\\\"}\"},{\"audit_params_id\":184,\"audit_params_name\":\"Refri-Log Book-Hourly\",\"asset_model\":\"178\",\"company_id\":14,\"status\":\"1\",\"audit_camera_photos\":null,\"audit_comment\":null,\"show_when_photos\":null,\"show_when_comment\":null,\"param_disp_name\":\"High Stage KCX 3 Compressor 1-OP\",\"param_type\":\"Number\",\"benchmark_range_low\":0,\"benchmark_range_high\":100,\"dropdown_values\":\"\",\"dropdown_reject_value\":\"\",\"dropdown_accept_value\":\"\",\"audit_camera_photos_key\":\"1177_img\",\"audit_comment_key\":\"1177_comment\",\"audit_audio_key\":null,\"audit_param_audio_path\":null,\"text_validation\":null,\"date_validation\":null,\"text\":null,\"date\":null,\"validation\":\"{\\\"textfield_accept_comment_validation\\\":\\\"Optional\\\",\\\"textfield_reject_photos_validation\\\":\\\"Required\\\",\\\"textfield_reject_comment_validation\\\":\\\"Required\\\",\\\"textfield_aacept_photos_validation\\\":\\\"Optional\\\"}\"},{\"audit_params_id\":184,\"audit_params_name\":\"Refri-Log Book-Hourly\",\"asset_model\":\"178\",\"company_id\":14,\"status\":\"1\",\"audit_camera_photos\":null,\"audit_comment\":null,\"show_when_photos\":null,\"show_when_comment\":null,\"param_disp_name\":\"High Stage KCX 3 Compressor 1-HRS MTS\",\"param_type\":\"Number\",\"benchmark_range_low\":0,\"benchmark_range_high\":100,\"dropdown_values\":\"\",\"dropdown_reject_value\":\"\",\"dropdown_accept_value\":\"\",\"audit_camera_photos_key\":\"1178_img\",\"audit_comment_key\":\"1178_comment\",\"audit_audio_key\":null,\"audit_param_audio_path\":null,\"text_validation\":null,\"date_validation\":null,\"text\":null,\"date\":null,\"validation\":\"{\\\"textfield_accept_comment_validation\\\":\\\"Optional\\\",\\\"textfield_reject_photos_validation\\\":\\\"Required\\\",\\\"textfield_reject_comment_validation\\\":\\\"Required\\\",\\\"textfield_aacept_photos_validation\\\":\\\"Optional\\\"}\"},{\"audit_params_id\":184,\"audit_params_name\":\"Refri-Log Book-Hourly\",\"asset_model\":\"178\",\"company_id\":14,\"status\":\"1\",\"audit_camera_photos\":null,\"audit_comment\":null,\"show_when_photos\":null,\"show_when_comment\":null,\"param_disp_name\":\"High Stage KCX 3 Compressor 2-SP\",\"param_type\":\"Number\",\"benchmark_range_low\":0,\"benchmark_range_high\":100,\"dropdown_values\":\"\",\"dropdown_reject_value\":\"\",\"dropdown_accept_value\":\"\",\"audit_camera_photos_key\":\"1179_img\",\"audit_comment_key\":\"1179_comment\",\"audit_audio_key\":null,\"audit_param_audio_path\":null,\"text_validation\":null,\"date_validation\":null,\"text\":null,\"date\":null,\"validation\":\"{\\\"textfield_accept_comment_validation\\\":\\\"Optional\\\",\\\"textfield_reject_photos_validation\\\":\\\"Required\\\",\\\"textfield_reject_comment_validation\\\":\\\"Required\\\",\\\"textfield_aacept_photos_validation\\\":\\\"Optional\\\"}\"},{\"audit_params_id\":184,\"audit_params_name\":\"Refri-Log Book-Hourly\",\"asset_model\":\"178\",\"company_id\":14,\"status\":\"1\",\"audit_camera_photos\":null,\"audit_comment\":null,\"show_when_photos\":null,\"show_when_comment\":null,\"param_disp_name\":\"High Stage KCX 3 Compressor 2-DP\",\"param_type\":\"Number\",\"benchmark_range_low\":0,\"benchmark_range_high\":100,\"dropdown_values\":\"\",\"dropdown_reject_value\":\"\",\"dropdown_accept_value\":\"\",\"audit_camera_photos_key\":\"1180_img\",\"audit_comment_key\":\"1180_comment\",\"audit_audio_key\":null,\"audit_param_audio_path\":null,\"text_validation\":null,\"date_validation\":null,\"text\":null,\"date\":null,\"validation\":\"{\\\"textfield_accept_comment_validation\\\":\\\"Optional\\\",\\\"textfield_reject_photos_validation\\\":\\\"Required\\\",\\\"textfield_reject_comment_validation\\\":\\\"Required\\\",\\\"textfield_aacept_photos_validation\\\":\\\"Optional\\\"}\"},{\"audit_params_id\":184,\"audit_params_name\":\"Refri-Log Book-Hourly\",\"asset_model\":\"178\",\"company_id\":14,\"status\":\"1\",\"audit_camera_photos\":null,\"audit_comment\":null,\"show_when_photos\":null,\"show_when_comment\":null,\"param_disp_name\":\"High Stage KCX 3 Compressor 2-OP\",\"param_type\":\"Number\",\"benchmark_range_low\":0,\"benchmark_range_high\":100,\"dropdown_values\":\"\",\"dropdown_reject_value\":\"\",\"dropdown_accept_value\":\"\",\"audit_camera_photos_key\":\"1181_img\",\"audit_comment_key\":\"1181_comment\",\"audit_audio_key\":null,\"audit_param_audio_path\":null,\"text_validation\":null,\"date_validation\":null,\"text\":null,\"date\":null,\"validation\":\"{\\\"textfield_accept_comment_validation\\\":\\\"Optional\\\",\\\"textfield_reject_photos_validation\\\":\\\"Required\\\",\\\"textfield_reject_comment_validation\\\":\\\"Required\\\",\\\"textfield_aacept_photos_validation\\\":\\\"Optional\\\"}\"},{\"audit_params_id\":184,\"audit_params_name\":\"Refri-Log Book-Hourly\",\"asset_model\":\"178\",\"company_id\":14,\"status\":\"1\",\"audit_camera_photos\":null,\"audit_comment\":null,\"show_when_photos\":null,\"show_when_comment\":null,\"param_disp_name\":\"High Stage KCX 3 Compressor 2-HRS MTS\",\"param_type\":\"Number\",\"benchmark_range_low\":0,\"benchmark_range_high\":100,\"dropdown_values\":\"\",\"dropdown_reject_value\":\"\",\"dropdown_accept_value\":\"\",\"audit_camera_photos_key\":\"1182_img\",\"audit_comment_key\":\"1182_comment\",\"audit_audio_key\":null,\"audit_param_audio_path\":null,\"text_validation\":null,\"date_validation\":null,\"text\":null,\"date\":null,\"validation\":\"{\\\"textfield_accept_comment_validation\\\":\\\"Optional\\\",\\\"textfield_reject_photos_validation\\\":\\\"Required\\\",\\\"textfield_reject_comment_validation\\\":\\\"Required\\\",\\\"textfield_aacept_photos_validation\\\":\\\"Optional\\\"}\"},{\"audit_params_id\":184,\"audit_params_name\":\"Refri-Log Book-Hourly\",\"asset_model\":\"178\",\"company_id\":14,\"status\":\"1\",\"audit_camera_photos\":null,\"audit_comment\":null,\"show_when_photos\":null,\"show_when_comment\":null,\"param_disp_name\":\"High Stage KCX 3 Compressor 3-SP\",\"param_type\":\"Number\",\"benchmark_range_low\":0,\"benchmark_range_high\":100,\"dropdown_values\":\"\",\"dropdown_reject_value\":\"\",\"dropdown_accept_value\":\"\",\"audit_camera_photos_key\":\"1183_img\",\"audit_comment_key\":\"1183_comment\",\"audit_audio_key\":null,\"audit_param_audio_path\":null,\"text_validation\":null,\"date_validation\":null,\"text\":null,\"date\":null,\"validation\":\"{\\\"textfield_accept_comment_validation\\\":\\\"Optional\\\",\\\"textfield_reject_photos_validation\\\":\\\"Required\\\",\\\"textfield_reject_comment_validation\\\":\\\"Required\\\",\\\"textfield_aacept_photos_validation\\\":\\\"Optional\\\"}\"},{\"audit_params_id\":184,\"audit_params_name\":\"Refri-Log Book-Hourly\",\"asset_model\":\"178\",\"company_id\":14,\"status\":\"1\",\"audit_camera_photos\":null,\"audit_comment\":null,\"show_when_photos\":null,\"show_when_comment\":null,\"param_disp_name\":\"High Stage KCX 3 Compressor 3-DP\",\"param_type\":\"Number\",\"benchmark_range_low\":0,\"benchmark_range_high\":100,\"dropdown_values\":\"\",\"dropdown_reject_value\":\"\",\"dropdown_accept_value\":\"\",\"audit_camera_photos_key\":\"1184_img\",\"audit_comment_key\":\"1184_comment\",\"audit_audio_key\":null,\"audit_param_audio_path\":null,\"text_validation\":null,\"date_validation\":null,\"text\":null,\"date\":null,\"validation\":\"{\\\"textfield_accept_comment_validation\\\":\\\"Optional\\\",\\\"textfield_reject_photos_validation\\\":\\\"Required\\\",\\\"textfield_reject_comment_validation\\\":\\\"Required\\\",\\\"textfield_aacept_photos_validation\\\":\\\"Optional\\\"}\"},{\"audit_params_id\":184,\"audit_params_name\":\"Refri-Log Book-Hourly\",\"asset_model\":\"178\",\"company_id\":14,\"status\":\"1\",\"audit_camera_photos\":null,\"audit_comment\":null,\"show_when_photos\":null,\"show_when_comment\":null,\"param_disp_name\":\"High Stage KCX 3 Compressor 3-OP\",\"param_type\":\"Number\",\"benchmark_range_low\":0,\"benchmark_range_high\":100,\"dropdown_values\":\"\",\"dropdown_reject_value\":\"\",\"dropdown_accept_value\":\"\",\"audit_camera_photos_key\":\"1185_img\",\"audit_comment_key\":\"1185_comment\",\"audit_audio_key\":null,\"audit_param_audio_path\":null,\"text_validation\":null,\"date_validation\":null,\"text\":null,\"date\":null,\"validation\":\"{\\\"textfield_accept_comment_validation\\\":\\\"Optional\\\",\\\"textfield_reject_photos_validation\\\":\\\"Required\\\",\\\"textfield_reject_comment_validation\\\":\\\"Required\\\",\\\"textfield_aacept_photos_validation\\\":\\\"Optional\\\"}\"},{\"audit_params_id\":184,\"audit_params_name\":\"Refri-Log Book-Hourly\",\"asset_model\":\"178\",\"company_id\":14,\"status\":\"1\",\"audit_camera_photos\":null,\"audit_comment\":null,\"show_when_photos\":null,\"show_when_comment\":null,\"param_disp_name\":\"High Stage KCX 3 Compressor 3-HRS MTS\",\"param_type\":\"Number\",\"benchmark_range_low\":0,\"benchmark_range_high\":100,\"dropdown_values\":\"\",\"dropdown_reject_value\":\"\",\"dropdown_accept_value\":\"\",\"audit_camera_photos_key\":\"1186_img\",\"audit_comment_key\":\"1186_comment\",\"audit_audio_key\":null,\"audit_param_audio_path\":null,\"text_validation\":null,\"date_validation\":null,\"text\":null,\"date\":null,\"validation\":\"{\\\"textfield_accept_comment_validation\\\":\\\"Optional\\\",\\\"textfield_reject_photos_validation\\\":\\\"Required\\\",\\\"textfield_reject_comment_validation\\\":\\\"Required\\\",\\\"textfield_aacept_photos_validation\\\":\\\"Optional\\\"}\"},{\"audit_params_id\":184,\"audit_params_name\":\"Refri-Log Book-Hourly\",\"asset_model\":\"178\",\"company_id\":14,\"status\":\"1\",\"audit_camera_photos\":null,\"audit_comment\":null,\"show_when_photos\":null,\"show_when_comment\":null,\"param_disp_name\":\"High Stage-Load\",\"param_type\":\"Number\",\"benchmark_range_low\":0,\"benchmark_range_high\":100,\"dropdown_values\":\"\",\"dropdown_reject_value\":\"\",\"dropdown_accept_value\":\"\",\"audit_camera_photos_key\":\"1187_img\",\"audit_comment_key\":\"1187_comment\",\"audit_audio_key\":null,\"audit_param_audio_path\":null,\"text_validation\":null,\"date_validation\":null,\"text\":null,\"date\":null,\"validation\":\"{\\\"textfield_accept_comment_validation\\\":\\\"Optional\\\",\\\"textfield_reject_photos_validation\\\":\\\"Required\\\",\\\"textfield_reject_comment_validation\\\":\\\"Required\\\",\\\"textfield_aacept_photos_validation\\\":\\\"Optional\\\"}\"},{\"audit_params_id\":184,\"audit_params_name\":\"Refri-Log Book-Hourly\",\"asset_model\":\"178\",\"company_id\":14,\"status\":\"1\",\"audit_camera_photos\":null,\"audit_comment\":null,\"show_when_photos\":null,\"show_when_comment\":null,\"param_disp_name\":\"High Stage-AMP\",\"param_type\":\"Number\",\"benchmark_range_low\":0,\"benchmark_range_high\":100,\"dropdown_values\":\"\",\"dropdown_reject_value\":\"\",\"dropdown_accept_value\":\"\",\"audit_camera_photos_key\":\"1188_img\",\"audit_comment_key\":\"1188_comment\",\"audit_audio_key\":null,\"audit_param_audio_path\":null,\"text_validation\":null,\"date_validation\":null,\"text\":null,\"date\":null,\"validation\":\"{\\\"textfield_accept_comment_validation\\\":\\\"Optional\\\",\\\"textfield_reject_photos_validation\\\":\\\"Required\\\",\\\"textfield_reject_comment_validation\\\":\\\"Required\\\",\\\"textfield_aacept_photos_validation\\\":\\\"Optional\\\"}\"},{\"audit_params_id\":184,\"audit_params_name\":\"Refri-Log Book-Hourly\",\"asset_model\":\"178\",\"company_id\":14,\"status\":\"1\",\"audit_camera_photos\":null,\"audit_comment\":null,\"show_when_photos\":null,\"show_when_comment\":null,\"param_disp_name\":\"Condenser Operation-No 1\",\"param_type\":\"Number\",\"benchmark_range_low\":0,\"benchmark_range_high\":100,\"dropdown_values\":\"\",\"dropdown_reject_value\":\"\",\"dropdown_accept_value\":\"\",\"audit_camera_photos_key\":\"1189_img\",\"audit_comment_key\":\"1189_comment\",\"audit_audio_key\":null,\"audit_param_audio_path\":null,\"text_validation\":null,\"date_validation\":null,\"text\":null,\"date\":null,\"validation\":\"{\\\"textfield_accept_comment_validation\\\":\\\"Optional\\\",\\\"textfield_reject_photos_validation\\\":\\\"Required\\\",\\\"textfield_reject_comment_validation\\\":\\\"Required\\\",\\\"textfield_aacept_photos_validation\\\":\\\"Optional\\\"}\"},{\"audit_params_id\":184,\"audit_params_name\":\"Refri-Log Book-Hourly\",\"asset_model\":\"178\",\"company_id\":14,\"status\":\"1\",\"audit_camera_photos\":null,\"audit_comment\":null,\"show_when_photos\":null,\"show_when_comment\":null,\"param_disp_name\":\"Condenser Operation-No 2\",\"param_type\":\"Number\",\"benchmark_range_low\":0,\"benchmark_range_high\":100,\"dropdown_values\":\"\",\"dropdown_reject_value\":\"\",\"dropdown_accept_value\":\"\",\"audit_camera_photos_key\":\"1190_img\",\"audit_comment_key\":\"1190_comment\",\"audit_audio_key\":null,\"audit_param_audio_path\":null,\"text_validation\":null,\"date_validation\":null,\"text\":null,\"date\":null,\"validation\":\"{\\\"textfield_accept_comment_validation\\\":\\\"Optional\\\",\\\"textfield_reject_photos_validation\\\":\\\"Required\\\",\\\"textfield_reject_comment_validation\\\":\\\"Required\\\",\\\"textfield_aacept_photos_validation\\\":\\\"Optional\\\"}\"},{\"audit_params_id\":184,\"audit_params_name\":\"Refri-Log Book-Hourly\",\"asset_model\":\"178\",\"company_id\":14,\"status\":\"1\",\"audit_camera_photos\":null,\"audit_comment\":null,\"show_when_photos\":null,\"show_when_comment\":null,\"param_disp_name\":\"Condenser Operation-No 3\",\"param_type\":\"Number\",\"benchmark_range_low\":0,\"benchmark_range_high\":100,\"dropdown_values\":\"\",\"dropdown_reject_value\":\"\",\"dropdown_accept_value\":\"\",\"audit_camera_photos_key\":\"1191_img\",\"audit_comment_key\":\"1191_comment\",\"audit_audio_key\":null,\"audit_param_audio_path\":null,\"text_validation\":null,\"date_validation\":null,\"text\":null,\"date\":null,\"validation\":\"{\\\"textfield_accept_comment_validation\\\":\\\"Optional\\\",\\\"textfield_reject_photos_validation\\\":\\\"Required\\\",\\\"textfield_reject_comment_validation\\\":\\\"Required\\\",\\\"textfield_aacept_photos_validation\\\":\\\"Optional\\\"}\"}]"}]

Preventive preventiveFromJson(String str) => Preventive.fromJson(json.decode(str));
String preventiveToJson(Preventive data) => json.encode(data.toJson());

class Preventive {
  Preventive({
      num? apiStatus, 
      String? apiMessage, 
      num? total, 
      List<PreventiveScheduleData>? totalAssetScheduledata,}){
    _apiStatus = apiStatus;
    _apiMessage = apiMessage;
    _total = total;
    _totalAssetScheduledata = totalAssetScheduledata;
}

  Preventive.fromJson(dynamic json)
  {
    _apiStatus = json['api_status'];
    _apiMessage = json['api_message'];
    _total = json['total'];
    if (json['totalAssetScheduledata'] != null) {
      _totalAssetScheduledata = [];
      json['totalAssetScheduledata'].forEach((v) {
        _totalAssetScheduledata?.add(PreventiveScheduleData.fromJson(v));
      });
    }
  }
  num? _apiStatus;
  String? _apiMessage;
  num? _total;
  int? tot;
  List<PreventiveScheduleData>? _totalAssetScheduledata;

  Preventive copyWith({  num? apiStatus,
  String? apiMessage,
  num? total,
  List<PreventiveScheduleData>? totalAssetScheduledata,
}) => Preventive(  apiStatus: apiStatus ?? _apiStatus,
  apiMessage: apiMessage ?? _apiMessage,
  total: total ?? _total,
  totalAssetScheduledata: totalAssetScheduledata ?? _totalAssetScheduledata,
);
  num? get apiStatus => _apiStatus;
  String? get apiMessage => _apiMessage;
  num? get total => _total;

  List<PreventiveScheduleData>? get totalAssetScheduledata => _totalAssetScheduledata;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['api_status'] = _apiStatus;
    map['api_message'] = _apiMessage;
    map['total'] = _total;

    if (_totalAssetScheduledata != null) {
      map['totalAssetScheduledata'] = _totalAssetScheduledata?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// maintenance_type : "preventive"
/// audit_schdule_id : 13720
/// audit_id : 186
/// audit_start_date : "2023-01-02 00:00:00"
/// audit_end_date : "2023-01-02 00:45:00"
/// schedule_expire_date : "2023-01-02 12:59:00"
/// audit_inspection_date : "2023-01-02 00:45:00"
/// audit_status : "overdue"
/// escalated_audit_levels : ""
/// audit_name : " Refri-Log Book-Hourly"
/// asset_tag_id : 2570
/// name : "Refri-Log Book"
/// asset_tag : "UAT-VD-07"
/// model_id : 178
/// model_name : "Refri-Log Book"
/// image : "asset-image-3Cc07ZTQKs.jpg"
/// asset_image : "https://uat.sysmatech.com/public/uploads/assets/asset-image-3Cc07ZTQKs.jpg"
/// purchase_date : null
/// warranty_months : 12
/// location : "Vidya Dairy"
/// supplier_name : "VD"
/// category_name : "Refri -"
/// company_name : "Vidya Dairy"
/// pm_history : [{"audit_schdule_id":12604,"asset_tag_id":2570,"audit_name":" Refri-Log Book-Hourly","audit_inspection_date":"2022-12-27 15:12:11","audit_result":"Fail"}]
/// can_checkin : 0
/// can_checkout : 1
/// status_label : "Overdue"
/// due_date : "2023-01-02 12:59:00"
/// audit_params_values : "[{\"audit_params_id\":184,\"audit_params_name\":\"Refri-Log Book-Hourly\",\"asset_model\":\"178\",\"company_id\":14,\"status\":\"1\",\"audit_camera_photos\":null,\"audit_comment\":null,\"show_when_photos\":null,\"show_when_comment\":null,\"param_disp_name\":\"High Stage Compressor 1 - SP\",\"param_type\":\"Number\",\"benchmark_range_low\":0,\"benchmark_range_high\":100,\"dropdown_values\":\"\",\"dropdown_reject_value\":\"\",\"dropdown_accept_value\":\"\",\"audit_camera_photos_key\":\"1163_img\",\"audit_comment_key\":\"1163_comment\",\"audit_audio_key\":null,\"audit_param_audio_path\":null,\"text_validation\":null,\"date_validation\":null,\"text\":null,\"date\":null,\"validation\":\"{\\\"textfield_accept_comment_validation\\\":\\\"Optional\\\",\\\"textfield_reject_photos_validation\\\":\\\"Required\\\",\\\"textfield_reject_comment_validation\\\":\\\"Required\\\",\\\"textfield_aacept_photos_validation\\\":\\\"Optional\\\"}\"},{\"audit_params_id\":184,\"audit_params_name\":\"Refri-Log Book-Hourly\",\"asset_model\":\"178\",\"company_id\":14,\"status\":\"1\",\"audit_camera_photos\":null,\"audit_comment\":null,\"show_when_photos\":null,\"show_when_comment\":null,\"param_disp_name\":\"High Stage Compressor 1 - DP\",\"param_type\":\"Number\",\"benchmark_range_low\":0,\"benchmark_range_high\":100,\"dropdown_values\":\"\",\"dropdown_reject_value\":\"\",\"dropdown_accept_value\":\"\",\"audit_camera_photos_key\":\"1164_img\",\"audit_comment_key\":\"1164_comment\",\"audit_audio_key\":null,\"audit_param_audio_path\":null,\"text_validation\":null,\"date_validation\":null,\"text\":null,\"date\":null,\"validation\":\"{\\\"textfield_accept_comment_validation\\\":\\\"Optional\\\",\\\"textfield_reject_photos_validation\\\":\\\"Required\\\",\\\"textfield_reject_comment_validation\\\":\\\"Required\\\",\\\"textfield_aacept_photos_validation\\\":\\\"Optional\\\"}\"},{\"audit_params_id\":184,\"audit_params_name\":\"Refri-Log Book-Hourly\",\"asset_model\":\"178\",\"company_id\":14,\"status\":\"1\",\"audit_camera_photos\":null,\"audit_comment\":null,\"show_when_photos\":null,\"show_when_comment\":null,\"param_disp_name\":\"High Stage Compressor 1 - OP\",\"param_type\":\"Number\",\"benchmark_range_low\":0,\"benchmark_range_high\":100,\"dropdown_values\":\"\",\"dropdown_reject_value\":\"\",\"dropdown_accept_value\":\"\",\"audit_camera_photos_key\":\"1165_img\",\"audit_comment_key\":\"1165_comment\",\"audit_audio_key\":null,\"audit_param_audio_path\":null,\"text_validation\":null,\"date_validation\":null,\"text\":null,\"date\":null,\"validation\":\"{\\\"textfield_accept_comment_validation\\\":\\\"Optional\\\",\\\"textfield_reject_photos_validation\\\":\\\"Required\\\",\\\"textfield_reject_comment_validation\\\":\\\"Required\\\",\\\"textfield_aacept_photos_validation\\\":\\\"Optional\\\"}\"},{\"audit_params_id\":184,\"audit_params_name\":\"Refri-Log Book-Hourly\",\"asset_model\":\"178\",\"company_id\":14,\"status\":\"1\",\"audit_camera_photos\":null,\"audit_comment\":null,\"show_when_photos\":null,\"show_when_comment\":null,\"param_disp_name\":\"High Stage Compressor 1 - HRS MTS\",\"param_type\":\"Number\",\"benchmark_range_low\":0,\"benchmark_range_high\":100,\"dropdown_values\":\"\",\"dropdown_reject_value\":\"\",\"dropdown_accept_value\":\"\",\"audit_camera_photos_key\":\"1166_img\",\"audit_comment_key\":\"1166_comment\",\"audit_audio_key\":null,\"audit_param_audio_path\":null,\"text_validation\":null,\"date_validation\":null,\"text\":null,\"date\":null,\"validation\":\"{\\\"textfield_accept_comment_validation\\\":\\\"Optional\\\",\\\"textfield_reject_photos_validation\\\":\\\"Required\\\",\\\"textfield_reject_comment_validation\\\":\\\"Required\\\",\\\"textfield_aacept_photos_validation\\\":\\\"Optional\\\"}\"},{\"audit_params_id\":184,\"audit_params_name\":\"Refri-Log Book-Hourly\",\"asset_model\":\"178\",\"company_id\":14,\"status\":\"1\",\"audit_camera_photos\":null,\"audit_comment\":null,\"show_when_photos\":null,\"show_when_comment\":null,\"param_disp_name\":\"High Stage Compressor 2 - SP\",\"param_type\":\"Number\",\"benchmark_range_low\":0,\"benchmark_range_high\":100,\"dropdown_values\":\"\",\"dropdown_reject_value\":\"\",\"dropdown_accept_value\":\"\",\"audit_camera_photos_key\":\"1167_img\",\"audit_comment_key\":\"1167_comment\",\"audit_audio_key\":null,\"audit_param_audio_path\":null,\"text_validation\":null,\"date_validation\":null,\"text\":null,\"date\":null,\"validation\":\"{\\\"textfield_accept_comment_validation\\\":\\\"Optional\\\",\\\"textfield_reject_photos_validation\\\":\\\"Required\\\",\\\"textfield_reject_comment_validation\\\":\\\"Required\\\",\\\"textfield_aacept_photos_validation\\\":\\\"Optional\\\"}\"},{\"audit_params_id\":184,\"audit_params_name\":\"Refri-Log Book-Hourly\",\"asset_model\":\"178\",\"company_id\":14,\"status\":\"1\",\"audit_camera_photos\":null,\"audit_comment\":null,\"show_when_photos\":null,\"show_when_comment\":null,\"param_disp_name\":\"High Stage Compressor 2-DP\",\"param_type\":\"Number\",\"benchmark_range_low\":0,\"benchmark_range_high\":100,\"dropdown_values\":\"\",\"dropdown_reject_value\":\"\",\"dropdown_accept_value\":\"\",\"audit_camera_photos_key\":\"1168_img\",\"audit_comment_key\":\"1168_comment\",\"audit_audio_key\":null,\"audit_param_audio_path\":null,\"text_validation\":null,\"date_validation\":null,\"text\":null,\"date\":null,\"validation\":\"{\\\"textfield_accept_comment_validation\\\":\\\"Optional\\\",\\\"textfield_reject_photos_validation\\\":\\\"Required\\\",\\\"textfield_reject_comment_validation\\\":\\\"Required\\\",\\\"textfield_aacept_photos_validation\\\":\\\"Optional\\\"}\"},{\"audit_params_id\":184,\"audit_params_name\":\"Refri-Log Book-Hourly\",\"asset_model\":\"178\",\"company_id\":14,\"status\":\"1\",\"audit_camera_photos\":null,\"audit_comment\":null,\"show_when_photos\":null,\"show_when_comment\":null,\"param_disp_name\":\"High Stage Compressor 2-OP\",\"param_type\":\"Number\",\"benchmark_range_low\":0,\"benchmark_range_high\":100,\"dropdown_values\":\"\",\"dropdown_reject_value\":\"\",\"dropdown_accept_value\":\"\",\"audit_camera_photos_key\":\"1169_img\",\"audit_comment_key\":\"1169_comment\",\"audit_audio_key\":null,\"audit_param_audio_path\":null,\"text_validation\":null,\"date_validation\":null,\"text\":null,\"date\":null,\"validation\":\"{\\\"textfield_accept_comment_validation\\\":\\\"Optional\\\",\\\"textfield_reject_photos_validation\\\":\\\"Required\\\",\\\"textfield_reject_comment_validation\\\":\\\"Required\\\",\\\"textfield_aacept_photos_validation\\\":\\\"Optional\\\"}\"},{\"audit_params_id\":184,\"audit_params_name\":\"Refri-Log Book-Hourly\",\"asset_model\":\"178\",\"company_id\":14,\"status\":\"1\",\"audit_camera_photos\":null,\"audit_comment\":null,\"show_when_photos\":null,\"show_when_comment\":null,\"param_disp_name\":\"High Stage Compressor 2-HRS MTS\",\"param_type\":\"Number\",\"benchmark_range_low\":0,\"benchmark_range_high\":100,\"dropdown_values\":\"\",\"dropdown_reject_value\":\"\",\"dropdown_accept_value\":\"\",\"audit_camera_photos_key\":\"1170_img\",\"audit_comment_key\":\"1170_comment\",\"audit_audio_key\":null,\"audit_param_audio_path\":null,\"text_validation\":null,\"date_validation\":null,\"text\":null,\"date\":null,\"validation\":\"{\\\"textfield_accept_comment_validation\\\":\\\"Optional\\\",\\\"textfield_reject_photos_validation\\\":\\\"Required\\\",\\\"textfield_reject_comment_validation\\\":\\\"Required\\\",\\\"textfield_aacept_photos_validation\\\":\\\"Optional\\\"}\"},{\"audit_params_id\":184,\"audit_params_name\":\"Refri-Log Book-Hourly\",\"asset_model\":\"178\",\"company_id\":14,\"status\":\"1\",\"audit_camera_photos\":null,\"audit_comment\":null,\"show_when_photos\":null,\"show_when_comment\":null,\"param_disp_name\":\"High Stage Compressor 3-SP\",\"param_type\":\"Number\",\"benchmark_range_low\":0,\"benchmark_range_high\":100,\"dropdown_values\":\"\",\"dropdown_reject_value\":\"\",\"dropdown_accept_value\":\"\",\"audit_camera_photos_key\":\"1171_img\",\"audit_comment_key\":\"1171_comment\",\"audit_audio_key\":null,\"audit_param_audio_path\":null,\"text_validation\":null,\"date_validation\":null,\"text\":null,\"date\":null,\"validation\":\"{\\\"textfield_accept_comment_validation\\\":\\\"Optional\\\",\\\"textfield_reject_photos_validation\\\":\\\"Required\\\",\\\"textfield_reject_comment_validation\\\":\\\"Required\\\",\\\"textfield_aacept_photos_validation\\\":\\\"Optional\\\"}\"},{\"audit_params_id\":184,\"audit_params_name\":\"Refri-Log Book-Hourly\",\"asset_model\":\"178\",\"company_id\":14,\"status\":\"1\",\"audit_camera_photos\":null,\"audit_comment\":null,\"show_when_photos\":null,\"show_when_comment\":null,\"param_disp_name\":\"High Stage Compressor 3-DP\",\"param_type\":\"Number\",\"benchmark_range_low\":0,\"benchmark_range_high\":100,\"dropdown_values\":\"\",\"dropdown_reject_value\":\"\",\"dropdown_accept_value\":\"\",\"audit_camera_photos_key\":\"1172_img\",\"audit_comment_key\":\"1172_comment\",\"audit_audio_key\":null,\"audit_param_audio_path\":null,\"text_validation\":null,\"date_validation\":null,\"text\":null,\"date\":null,\"validation\":\"{\\\"textfield_accept_comment_validation\\\":\\\"Optional\\\",\\\"textfield_reject_photos_validation\\\":\\\"Required\\\",\\\"textfield_reject_comment_validation\\\":\\\"Required\\\",\\\"textfield_aacept_photos_validation\\\":\\\"Optional\\\"}\"},{\"audit_params_id\":184,\"audit_params_name\":\"Refri-Log Book-Hourly\",\"asset_model\":\"178\",\"company_id\":14,\"status\":\"1\",\"audit_camera_photos\":null,\"audit_comment\":null,\"show_when_photos\":null,\"show_when_comment\":null,\"param_disp_name\":\"High Stage Compressor 3-OP\",\"param_type\":\"Number\",\"benchmark_range_low\":0,\"benchmark_range_high\":100,\"dropdown_values\":\"\",\"dropdown_reject_value\":\"\",\"dropdown_accept_value\":\"\",\"audit_camera_photos_key\":\"1173_img\",\"audit_comment_key\":\"1173_comment\",\"audit_audio_key\":null,\"audit_param_audio_path\":null,\"text_validation\":null,\"date_validation\":null,\"text\":null,\"date\":null,\"validation\":\"{\\\"textfield_accept_comment_validation\\\":\\\"Optional\\\",\\\"textfield_reject_photos_validation\\\":\\\"Required\\\",\\\"textfield_reject_comment_validation\\\":\\\"Required\\\",\\\"textfield_aacept_photos_validation\\\":\\\"Optional\\\"}\"},{\"audit_params_id\":184,\"audit_params_name\":\"Refri-Log Book-Hourly\",\"asset_model\":\"178\",\"company_id\":14,\"status\":\"1\",\"audit_camera_photos\":null,\"audit_comment\":null,\"show_when_photos\":null,\"show_when_comment\":null,\"param_disp_name\":\"High Stage Compressor 3-HRS MTS\",\"param_type\":\"Number\",\"benchmark_range_low\":0,\"benchmark_range_high\":100,\"dropdown_values\":\"\",\"dropdown_reject_value\":\"\",\"dropdown_accept_value\":\"\",\"audit_camera_photos_key\":\"1174_img\",\"audit_comment_key\":\"1174_comment\",\"audit_audio_key\":null,\"audit_param_audio_path\":null,\"text_validation\":null,\"date_validation\":null,\"text\":null,\"date\":null,\"validation\":\"{\\\"textfield_accept_comment_validation\\\":\\\"Optional\\\",\\\"textfield_reject_photos_validation\\\":\\\"Required\\\",\\\"textfield_reject_comment_validation\\\":\\\"Required\\\",\\\"textfield_aacept_photos_validation\\\":\\\"Optional\\\"}\"},{\"audit_params_id\":184,\"audit_params_name\":\"Refri-Log Book-Hourly\",\"asset_model\":\"178\",\"company_id\":14,\"status\":\"1\",\"audit_camera_photos\":null,\"audit_comment\":null,\"show_when_photos\":null,\"show_when_comment\":null,\"param_disp_name\":\"High Stage KCX 3 Compressor 1-SP\",\"param_type\":\"Number\",\"benchmark_range_low\":0,\"benchmark_range_high\":100,\"dropdown_values\":\"\",\"dropdown_reject_value\":\"\",\"dropdown_accept_value\":\"\",\"audit_camera_photos_key\":\"1175_img\",\"audit_comment_key\":\"1175_comment\",\"audit_audio_key\":null,\"audit_param_audio_path\":null,\"text_validation\":null,\"date_validation\":null,\"text\":null,\"date\":null,\"validation\":\"{\\\"textfield_accept_comment_validation\\\":\\\"Optional\\\",\\\"textfield_reject_photos_validation\\\":\\\"Required\\\",\\\"textfield_reject_comment_validation\\\":\\\"Required\\\",\\\"textfield_aacept_photos_validation\\\":\\\"Optional\\\"}\"},{\"audit_params_id\":184,\"audit_params_name\":\"Refri-Log Book-Hourly\",\"asset_model\":\"178\",\"company_id\":14,\"status\":\"1\",\"audit_camera_photos\":null,\"audit_comment\":null,\"show_when_photos\":null,\"show_when_comment\":null,\"param_disp_name\":\"High Stage KCX 3 Compressor 1-DP\",\"param_type\":\"Number\",\"benchmark_range_low\":0,\"benchmark_range_high\":100,\"dropdown_values\":\"\",\"dropdown_reject_value\":\"\",\"dropdown_accept_value\":\"\",\"audit_camera_photos_key\":\"1176_img\",\"audit_comment_key\":\"1176_comment\",\"audit_audio_key\":null,\"audit_param_audio_path\":null,\"text_validation\":null,\"date_validation\":null,\"text\":null,\"date\":null,\"validation\":\"{\\\"textfield_accept_comment_validation\\\":\\\"Optional\\\",\\\"textfield_reject_photos_validation\\\":\\\"Required\\\",\\\"textfield_reject_comment_validation\\\":\\\"Required\\\",\\\"textfield_aacept_photos_validation\\\":\\\"Optional\\\"}\"},{\"audit_params_id\":184,\"audit_params_name\":\"Refri-Log Book-Hourly\",\"asset_model\":\"178\",\"company_id\":14,\"status\":\"1\",\"audit_camera_photos\":null,\"audit_comment\":null,\"show_when_photos\":null,\"show_when_comment\":null,\"param_disp_name\":\"High Stage KCX 3 Compressor 1-OP\",\"param_type\":\"Number\",\"benchmark_range_low\":0,\"benchmark_range_high\":100,\"dropdown_values\":\"\",\"dropdown_reject_value\":\"\",\"dropdown_accept_value\":\"\",\"audit_camera_photos_key\":\"1177_img\",\"audit_comment_key\":\"1177_comment\",\"audit_audio_key\":null,\"audit_param_audio_path\":null,\"text_validation\":null,\"date_validation\":null,\"text\":null,\"date\":null,\"validation\":\"{\\\"textfield_accept_comment_validation\\\":\\\"Optional\\\",\\\"textfield_reject_photos_validation\\\":\\\"Required\\\",\\\"textfield_reject_comment_validation\\\":\\\"Required\\\",\\\"textfield_aacept_photos_validation\\\":\\\"Optional\\\"}\"},{\"audit_params_id\":184,\"audit_params_name\":\"Refri-Log Book-Hourly\",\"asset_model\":\"178\",\"company_id\":14,\"status\":\"1\",\"audit_camera_photos\":null,\"audit_comment\":null,\"show_when_photos\":null,\"show_when_comment\":null,\"param_disp_name\":\"High Stage KCX 3 Compressor 1-HRS MTS\",\"param_type\":\"Number\",\"benchmark_range_low\":0,\"benchmark_range_high\":100,\"dropdown_values\":\"\",\"dropdown_reject_value\":\"\",\"dropdown_accept_value\":\"\",\"audit_camera_photos_key\":\"1178_img\",\"audit_comment_key\":\"1178_comment\",\"audit_audio_key\":null,\"audit_param_audio_path\":null,\"text_validation\":null,\"date_validation\":null,\"text\":null,\"date\":null,\"validation\":\"{\\\"textfield_accept_comment_validation\\\":\\\"Optional\\\",\\\"textfield_reject_photos_validation\\\":\\\"Required\\\",\\\"textfield_reject_comment_validation\\\":\\\"Required\\\",\\\"textfield_aacept_photos_validation\\\":\\\"Optional\\\"}\"},{\"audit_params_id\":184,\"audit_params_name\":\"Refri-Log Book-Hourly\",\"asset_model\":\"178\",\"company_id\":14,\"status\":\"1\",\"audit_camera_photos\":null,\"audit_comment\":null,\"show_when_photos\":null,\"show_when_comment\":null,\"param_disp_name\":\"High Stage KCX 3 Compressor 2-SP\",\"param_type\":\"Number\",\"benchmark_range_low\":0,\"benchmark_range_high\":100,\"dropdown_values\":\"\",\"dropdown_reject_value\":\"\",\"dropdown_accept_value\":\"\",\"audit_camera_photos_key\":\"1179_img\",\"audit_comment_key\":\"1179_comment\",\"audit_audio_key\":null,\"audit_param_audio_path\":null,\"text_validation\":null,\"date_validation\":null,\"text\":null,\"date\":null,\"validation\":\"{\\\"textfield_accept_comment_validation\\\":\\\"Optional\\\",\\\"textfield_reject_photos_validation\\\":\\\"Required\\\",\\\"textfield_reject_comment_validation\\\":\\\"Required\\\",\\\"textfield_aacept_photos_validation\\\":\\\"Optional\\\"}\"},{\"audit_params_id\":184,\"audit_params_name\":\"Refri-Log Book-Hourly\",\"asset_model\":\"178\",\"company_id\":14,\"status\":\"1\",\"audit_camera_photos\":null,\"audit_comment\":null,\"show_when_photos\":null,\"show_when_comment\":null,\"param_disp_name\":\"High Stage KCX 3 Compressor 2-DP\",\"param_type\":\"Number\",\"benchmark_range_low\":0,\"benchmark_range_high\":100,\"dropdown_values\":\"\",\"dropdown_reject_value\":\"\",\"dropdown_accept_value\":\"\",\"audit_camera_photos_key\":\"1180_img\",\"audit_comment_key\":\"1180_comment\",\"audit_audio_key\":null,\"audit_param_audio_path\":null,\"text_validation\":null,\"date_validation\":null,\"text\":null,\"date\":null,\"validation\":\"{\\\"textfield_accept_comment_validation\\\":\\\"Optional\\\",\\\"textfield_reject_photos_validation\\\":\\\"Required\\\",\\\"textfield_reject_comment_validation\\\":\\\"Required\\\",\\\"textfield_aacept_photos_validation\\\":\\\"Optional\\\"}\"},{\"audit_params_id\":184,\"audit_params_name\":\"Refri-Log Book-Hourly\",\"asset_model\":\"178\",\"company_id\":14,\"status\":\"1\",\"audit_camera_photos\":null,\"audit_comment\":null,\"show_when_photos\":null,\"show_when_comment\":null,\"param_disp_name\":\"High Stage KCX 3 Compressor 2-OP\",\"param_type\":\"Number\",\"benchmark_range_low\":0,\"benchmark_range_high\":100,\"dropdown_values\":\"\",\"dropdown_reject_value\":\"\",\"dropdown_accept_value\":\"\",\"audit_camera_photos_key\":\"1181_img\",\"audit_comment_key\":\"1181_comment\",\"audit_audio_key\":null,\"audit_param_audio_path\":null,\"text_validation\":null,\"date_validation\":null,\"text\":null,\"date\":null,\"validation\":\"{\\\"textfield_accept_comment_validation\\\":\\\"Optional\\\",\\\"textfield_reject_photos_validation\\\":\\\"Required\\\",\\\"textfield_reject_comment_validation\\\":\\\"Required\\\",\\\"textfield_aacept_photos_validation\\\":\\\"Optional\\\"}\"},{\"audit_params_id\":184,\"audit_params_name\":\"Refri-Log Book-Hourly\",\"asset_model\":\"178\",\"company_id\":14,\"status\":\"1\",\"audit_camera_photos\":null,\"audit_comment\":null,\"show_when_photos\":null,\"show_when_comment\":null,\"param_disp_name\":\"High Stage KCX 3 Compressor 2-HRS MTS\",\"param_type\":\"Number\",\"benchmark_range_low\":0,\"benchmark_range_high\":100,\"dropdown_values\":\"\",\"dropdown_reject_value\":\"\",\"dropdown_accept_value\":\"\",\"audit_camera_photos_key\":\"1182_img\",\"audit_comment_key\":\"1182_comment\",\"audit_audio_key\":null,\"audit_param_audio_path\":null,\"text_validation\":null,\"date_validation\":null,\"text\":null,\"date\":null,\"validation\":\"{\\\"textfield_accept_comment_validation\\\":\\\"Optional\\\",\\\"textfield_reject_photos_validation\\\":\\\"Required\\\",\\\"textfield_reject_comment_validation\\\":\\\"Required\\\",\\\"textfield_aacept_photos_validation\\\":\\\"Optional\\\"}\"},{\"audit_params_id\":184,\"audit_params_name\":\"Refri-Log Book-Hourly\",\"asset_model\":\"178\",\"company_id\":14,\"status\":\"1\",\"audit_camera_photos\":null,\"audit_comment\":null,\"show_when_photos\":null,\"show_when_comment\":null,\"param_disp_name\":\"High Stage KCX 3 Compressor 3-SP\",\"param_type\":\"Number\",\"benchmark_range_low\":0,\"benchmark_range_high\":100,\"dropdown_values\":\"\",\"dropdown_reject_value\":\"\",\"dropdown_accept_value\":\"\",\"audit_camera_photos_key\":\"1183_img\",\"audit_comment_key\":\"1183_comment\",\"audit_audio_key\":null,\"audit_param_audio_path\":null,\"text_validation\":null,\"date_validation\":null,\"text\":null,\"date\":null,\"validation\":\"{\\\"textfield_accept_comment_validation\\\":\\\"Optional\\\",\\\"textfield_reject_photos_validation\\\":\\\"Required\\\",\\\"textfield_reject_comment_validation\\\":\\\"Required\\\",\\\"textfield_aacept_photos_validation\\\":\\\"Optional\\\"}\"},{\"audit_params_id\":184,\"audit_params_name\":\"Refri-Log Book-Hourly\",\"asset_model\":\"178\",\"company_id\":14,\"status\":\"1\",\"audit_camera_photos\":null,\"audit_comment\":null,\"show_when_photos\":null,\"show_when_comment\":null,\"param_disp_name\":\"High Stage KCX 3 Compressor 3-DP\",\"param_type\":\"Number\",\"benchmark_range_low\":0,\"benchmark_range_high\":100,\"dropdown_values\":\"\",\"dropdown_reject_value\":\"\",\"dropdown_accept_value\":\"\",\"audit_camera_photos_key\":\"1184_img\",\"audit_comment_key\":\"1184_comment\",\"audit_audio_key\":null,\"audit_param_audio_path\":null,\"text_validation\":null,\"date_validation\":null,\"text\":null,\"date\":null,\"validation\":\"{\\\"textfield_accept_comment_validation\\\":\\\"Optional\\\",\\\"textfield_reject_photos_validation\\\":\\\"Required\\\",\\\"textfield_reject_comment_validation\\\":\\\"Required\\\",\\\"textfield_aacept_photos_validation\\\":\\\"Optional\\\"}\"},{\"audit_params_id\":184,\"audit_params_name\":\"Refri-Log Book-Hourly\",\"asset_model\":\"178\",\"company_id\":14,\"status\":\"1\",\"audit_camera_photos\":null,\"audit_comment\":null,\"show_when_photos\":null,\"show_when_comment\":null,\"param_disp_name\":\"High Stage KCX 3 Compressor 3-OP\",\"param_type\":\"Number\",\"benchmark_range_low\":0,\"benchmark_range_high\":100,\"dropdown_values\":\"\",\"dropdown_reject_value\":\"\",\"dropdown_accept_value\":\"\",\"audit_camera_photos_key\":\"1185_img\",\"audit_comment_key\":\"1185_comment\",\"audit_audio_key\":null,\"audit_param_audio_path\":null,\"text_validation\":null,\"date_validation\":null,\"text\":null,\"date\":null,\"validation\":\"{\\\"textfield_accept_comment_validation\\\":\\\"Optional\\\",\\\"textfield_reject_photos_validation\\\":\\\"Required\\\",\\\"textfield_reject_comment_validation\\\":\\\"Required\\\",\\\"textfield_aacept_photos_validation\\\":\\\"Optional\\\"}\"},{\"audit_params_id\":184,\"audit_params_name\":\"Refri-Log Book-Hourly\",\"asset_model\":\"178\",\"company_id\":14,\"status\":\"1\",\"audit_camera_photos\":null,\"audit_comment\":null,\"show_when_photos\":null,\"show_when_comment\":null,\"param_disp_name\":\"High Stage KCX 3 Compressor 3-HRS MTS\",\"param_type\":\"Number\",\"benchmark_range_low\":0,\"benchmark_range_high\":100,\"dropdown_values\":\"\",\"dropdown_reject_value\":\"\",\"dropdown_accept_value\":\"\",\"audit_camera_photos_key\":\"1186_img\",\"audit_comment_key\":\"1186_comment\",\"audit_audio_key\":null,\"audit_param_audio_path\":null,\"text_validation\":null,\"date_validation\":null,\"text\":null,\"date\":null,\"validation\":\"{\\\"textfield_accept_comment_validation\\\":\\\"Optional\\\",\\\"textfield_reject_photos_validation\\\":\\\"Required\\\",\\\"textfield_reject_comment_validation\\\":\\\"Required\\\",\\\"textfield_aacept_photos_validation\\\":\\\"Optional\\\"}\"},{\"audit_params_id\":184,\"audit_params_name\":\"Refri-Log Book-Hourly\",\"asset_model\":\"178\",\"company_id\":14,\"status\":\"1\",\"audit_camera_photos\":null,\"audit_comment\":null,\"show_when_photos\":null,\"show_when_comment\":null,\"param_disp_name\":\"High Stage-Load\",\"param_type\":\"Number\",\"benchmark_range_low\":0,\"benchmark_range_high\":100,\"dropdown_values\":\"\",\"dropdown_reject_value\":\"\",\"dropdown_accept_value\":\"\",\"audit_camera_photos_key\":\"1187_img\",\"audit_comment_key\":\"1187_comment\",\"audit_audio_key\":null,\"audit_param_audio_path\":null,\"text_validation\":null,\"date_validation\":null,\"text\":null,\"date\":null,\"validation\":\"{\\\"textfield_accept_comment_validation\\\":\\\"Optional\\\",\\\"textfield_reject_photos_validation\\\":\\\"Required\\\",\\\"textfield_reject_comment_validation\\\":\\\"Required\\\",\\\"textfield_aacept_photos_validation\\\":\\\"Optional\\\"}\"},{\"audit_params_id\":184,\"audit_params_name\":\"Refri-Log Book-Hourly\",\"asset_model\":\"178\",\"company_id\":14,\"status\":\"1\",\"audit_camera_photos\":null,\"audit_comment\":null,\"show_when_photos\":null,\"show_when_comment\":null,\"param_disp_name\":\"High Stage-AMP\",\"param_type\":\"Number\",\"benchmark_range_low\":0,\"benchmark_range_high\":100,\"dropdown_values\":\"\",\"dropdown_reject_value\":\"\",\"dropdown_accept_value\":\"\",\"audit_camera_photos_key\":\"1188_img\",\"audit_comment_key\":\"1188_comment\",\"audit_audio_key\":null,\"audit_param_audio_path\":null,\"text_validation\":null,\"date_validation\":null,\"text\":null,\"date\":null,\"validation\":\"{\\\"textfield_accept_comment_validation\\\":\\\"Optional\\\",\\\"textfield_reject_photos_validation\\\":\\\"Required\\\",\\\"textfield_reject_comment_validation\\\":\\\"Required\\\",\\\"textfield_aacept_photos_validation\\\":\\\"Optional\\\"}\"},{\"audit_params_id\":184,\"audit_params_name\":\"Refri-Log Book-Hourly\",\"asset_model\":\"178\",\"company_id\":14,\"status\":\"1\",\"audit_camera_photos\":null,\"audit_comment\":null,\"show_when_photos\":null,\"show_when_comment\":null,\"param_disp_name\":\"Condenser Operation-No 1\",\"param_type\":\"Number\",\"benchmark_range_low\":0,\"benchmark_range_high\":100,\"dropdown_values\":\"\",\"dropdown_reject_value\":\"\",\"dropdown_accept_value\":\"\",\"audit_camera_photos_key\":\"1189_img\",\"audit_comment_key\":\"1189_comment\",\"audit_audio_key\":null,\"audit_param_audio_path\":null,\"text_validation\":null,\"date_validation\":null,\"text\":null,\"date\":null,\"validation\":\"{\\\"textfield_accept_comment_validation\\\":\\\"Optional\\\",\\\"textfield_reject_photos_validation\\\":\\\"Required\\\",\\\"textfield_reject_comment_validation\\\":\\\"Required\\\",\\\"textfield_aacept_photos_validation\\\":\\\"Optional\\\"}\"},{\"audit_params_id\":184,\"audit_params_name\":\"Refri-Log Book-Hourly\",\"asset_model\":\"178\",\"company_id\":14,\"status\":\"1\",\"audit_camera_photos\":null,\"audit_comment\":null,\"show_when_photos\":null,\"show_when_comment\":null,\"param_disp_name\":\"Condenser Operation-No 2\",\"param_type\":\"Number\",\"benchmark_range_low\":0,\"benchmark_range_high\":100,\"dropdown_values\":\"\",\"dropdown_reject_value\":\"\",\"dropdown_accept_value\":\"\",\"audit_camera_photos_key\":\"1190_img\",\"audit_comment_key\":\"1190_comment\",\"audit_audio_key\":null,\"audit_param_audio_path\":null,\"text_validation\":null,\"date_validation\":null,\"text\":null,\"date\":null,\"validation\":\"{\\\"textfield_accept_comment_validation\\\":\\\"Optional\\\",\\\"textfield_reject_photos_validation\\\":\\\"Required\\\",\\\"textfield_reject_comment_validation\\\":\\\"Required\\\",\\\"textfield_aacept_photos_validation\\\":\\\"Optional\\\"}\"},{\"audit_params_id\":184,\"audit_params_name\":\"Refri-Log Book-Hourly\",\"asset_model\":\"178\",\"company_id\":14,\"status\":\"1\",\"audit_camera_photos\":null,\"audit_comment\":null,\"show_when_photos\":null,\"show_when_comment\":null,\"param_disp_name\":\"Condenser Operation-No 3\",\"param_type\":\"Number\",\"benchmark_range_low\":0,\"benchmark_range_high\":100,\"dropdown_values\":\"\",\"dropdown_reject_value\":\"\",\"dropdown_accept_value\":\"\",\"audit_camera_photos_key\":\"1191_img\",\"audit_comment_key\":\"1191_comment\",\"audit_audio_key\":null,\"audit_param_audio_path\":null,\"text_validation\":null,\"date_validation\":null,\"text\":null,\"date\":null,\"validation\":\"{\\\"textfield_accept_comment_validation\\\":\\\"Optional\\\",\\\"textfield_reject_photos_validation\\\":\\\"Required\\\",\\\"textfield_reject_comment_validation\\\":\\\"Required\\\",\\\"textfield_aacept_photos_validation\\\":\\\"Optional\\\"}\"}]"

PreventiveScheduleData totalAssetScheduledataFromJson(String str) => PreventiveScheduleData.fromJson(json.decode(str));
String totalAssetScheduledataToJson(PreventiveScheduleData data) => json.encode(data.toJson());

class PreventiveScheduleData
{
  PreventiveScheduleData({
      String? maintenanceType, 
      num? auditSchduleId, 
      num? auditId, 
      String? auditStartDate, 
      String? auditEndDate, 
      String? scheduleExpireDate, 
      String? auditInspectionDate, 
      String? auditStatus,
    dynamic escalatedAuditLevels,
      String? auditName, 
      num? assetTagId, 
      String? name, 
      String? assetTag, 
      num? modelId, 
      String? modelName, 
      String? image, 
      String? assetImage, 
      dynamic purchaseDate, 
      num? warrantyMonths, 
      String? location, 
      String? supplierName, 
      String? categoryName, 
      String? companyName, 
      List<PmHistory>? pmHistory, 
      num? canCheckin, 
      num? canCheckout, 
      String? statusLabel, 
      String? dueDate, 
      String? auditParamsValues,}){
    _maintenanceType = maintenanceType;
    _auditSchduleId = auditSchduleId;
    _auditId = auditId;
    _auditStartDate = auditStartDate;
    _auditEndDate = auditEndDate;
    _scheduleExpireDate = scheduleExpireDate;
    _auditInspectionDate = auditInspectionDate;
    _auditStatus = auditStatus;
    _escalatedAuditLevels = escalatedAuditLevels;
    _auditName = auditName;
    _assetTagId = assetTagId;
    _name = name;
    _assetTag = assetTag;
    _modelId = modelId;
    _modelName = modelName;
    _image = image;
    _assetImage = assetImage;
    _purchaseDate = purchaseDate;
    _warrantyMonths = warrantyMonths;
    _location = location;
    _supplierName = supplierName;
    _categoryName = categoryName;
    _companyName = companyName;
    _pmHistory = pmHistory;
    _canCheckin = canCheckin;
    _canCheckout = canCheckout;
    _statusLabel = statusLabel;
    _dueDate = dueDate;
    _auditParamsValues = auditParamsValues;
}

  PreventiveScheduleData.fromJson(dynamic json) {
    _maintenanceType = json['maintenance_type'];
    _auditSchduleId = json['audit_schdule_id'];
    _auditId = json['audit_id'];
    _auditStartDate = json['audit_start_date'];
    _auditEndDate = json['audit_end_date'];
    _scheduleExpireDate = json['schedule_expire_date'];
    _auditInspectionDate = json['audit_inspection_date'];
    _auditStatus = json['audit_status'];
    _escalatedAuditLevels = json['escalated_audit_levels'];
    _auditName = json['audit_name'];
    _assetTagId = json['asset_tag_id'];
    _name = json['name'];
    _assetTag = json['asset_tag'];
    _modelId = json['model_id'];
    _modelName = json['model_name'];
    _image = json['image'];
    _assetImage = json['asset_image'];
    _purchaseDate = json['purchase_date'];
    _warrantyMonths = json['warranty_months'];
    _location = json['location'];
    _supplierName = json['supplier_name'];
    _categoryName = json['category_name'];
    _companyName = json['company_name'];
    if (json['pm_history'] != null) {
      _pmHistory = [];
      json['pm_history'].forEach((v) {
        _pmHistory?.add(PmHistory.fromJson(v));
      });
    }
    _canCheckin = json['can_checkin'];
    _canCheckout = json['can_checkout'];
    _statusLabel = json['status_label'];
    _dueDate = json['due_date'];
    _auditParamsValues = json['audit_params_values'];
  }
  String? _maintenanceType;
  num? _auditSchduleId;
  num? _auditId;
  String? _auditStartDate;
  String? _auditEndDate;
  String? _scheduleExpireDate;
  String? _auditInspectionDate;
  String? _auditStatus;
  dynamic _escalatedAuditLevels;
  String? _auditName;
  num? _assetTagId;
  String? _name;
  String? _assetTag;
  num? _modelId;
  String? _modelName;
  String? _image;
  String? _assetImage;
  dynamic _purchaseDate;
  num? _warrantyMonths;
  String? _location;
  String? _supplierName;
  String? _categoryName;
  String? _companyName;
  List<PmHistory>? _pmHistory;
  num? _canCheckin;
  num? _canCheckout;
  String? _statusLabel;
  String? _dueDate;
  String? _auditParamsValues;
PreventiveScheduleData copyWith({  String? maintenanceType,
  num? auditSchduleId,
  num? auditId,
  String? auditStartDate,
  String? auditEndDate,
  String? scheduleExpireDate,
  String? auditInspectionDate,
  String? auditStatus,
  dynamic escalatedAuditLevels,
  String? auditName,
  num? assetTagId,
  String? name,
  String? assetTag,
  num? modelId,
  String? modelName,
  String? image,
  String? assetImage,
  dynamic purchaseDate,
  num? warrantyMonths,
  String? location,
  String? supplierName,
  String? categoryName,
  String? companyName,
  List<PmHistory>? pmHistory,
  num? canCheckin,
  num? canCheckout,
  String? statusLabel,
  String? dueDate,
  String? auditParamsValues,
}) => PreventiveScheduleData(  maintenanceType: maintenanceType ?? _maintenanceType,
  auditSchduleId: auditSchduleId ?? _auditSchduleId,
  auditId: auditId ?? _auditId,
  auditStartDate: auditStartDate ?? _auditStartDate,
  auditEndDate: auditEndDate ?? _auditEndDate,
  scheduleExpireDate: scheduleExpireDate ?? _scheduleExpireDate,
  auditInspectionDate: auditInspectionDate ?? _auditInspectionDate,
  auditStatus: auditStatus ?? _auditStatus,
  escalatedAuditLevels: escalatedAuditLevels ?? _escalatedAuditLevels,
  auditName: auditName ?? _auditName,
  assetTagId: assetTagId ?? _assetTagId,
  name: name ?? _name,
  assetTag: assetTag ?? _assetTag,
  modelId: modelId ?? _modelId,
  modelName: modelName ?? _modelName,
  image: image ?? _image,
  assetImage: assetImage ?? _assetImage,
  purchaseDate: purchaseDate ?? _purchaseDate,
  warrantyMonths: warrantyMonths ?? _warrantyMonths,
  location: location ?? _location,
  supplierName: supplierName ?? _supplierName,
  categoryName: categoryName ?? _categoryName,
  companyName: companyName ?? _companyName,
  pmHistory: pmHistory ?? _pmHistory,
  canCheckin: canCheckin ?? _canCheckin,
  canCheckout: canCheckout ?? _canCheckout,
  statusLabel: statusLabel ?? _statusLabel,
  dueDate: dueDate ?? _dueDate,
  auditParamsValues: auditParamsValues ?? _auditParamsValues,
);
  String? get maintenanceType => _maintenanceType;
  num? get auditSchduleId => _auditSchduleId;
  num? get auditId => _auditId;
  String? get auditStartDate => _auditStartDate;
  String? get auditEndDate => _auditEndDate;
  String? get scheduleExpireDate => _scheduleExpireDate;
  String? get auditInspectionDate => _auditInspectionDate;
  String? get auditStatus => _auditStatus;
  dynamic get escalatedAuditLevels => _escalatedAuditLevels;
  String? get auditName => _auditName;
  num? get assetTagId => _assetTagId;
  String? get name => _name;
  String? get assetTag => _assetTag;
  num? get modelId => _modelId;
  String? get modelName => _modelName;
  String? get image => _image;
  String? get assetImage => _assetImage;
  dynamic get purchaseDate => _purchaseDate;
  num? get warrantyMonths => _warrantyMonths;
  String? get location => _location;
  String? get supplierName => _supplierName;
  String? get categoryName => _categoryName;
  String? get companyName => _companyName;
  List<PmHistory>? get pmHistory => _pmHistory;
  num? get canCheckin => _canCheckin;
  num? get canCheckout => _canCheckout;
  String? get statusLabel => _statusLabel;
  String? get dueDate => _dueDate;
  String? get auditParamsValues => _auditParamsValues;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['maintenance_type'] = _maintenanceType;
    map['audit_schdule_id'] = _auditSchduleId;
    map['audit_id'] = _auditId;
    map['audit_start_date'] = _auditStartDate;
    map['audit_end_date'] = _auditEndDate;
    map['schedule_expire_date'] = _scheduleExpireDate;
    map['audit_inspection_date'] = _auditInspectionDate;
    map['audit_status'] = _auditStatus;
    map['escalated_audit_levels'] = _escalatedAuditLevels;
    map['audit_name'] = _auditName;
    map['asset_tag_id'] = _assetTagId;
    map['name'] = _name;
    map['asset_tag'] = _assetTag;
    map['model_id'] = _modelId;
    map['model_name'] = _modelName;
    map['image'] = _image;
    map['asset_image'] = _assetImage;
    map['purchase_date'] = _purchaseDate;
    map['warranty_months'] = _warrantyMonths;
    map['location'] = _location;
    map['supplier_name'] = _supplierName;
    map['category_name'] = _categoryName;
    map['company_name'] = _companyName;
    if (_pmHistory != null) {
      map['pm_history'] = _pmHistory?.map((v) => v.toJson()).toList();
    }
    map['can_checkin'] = _canCheckin;
    map['can_checkout'] = _canCheckout;
    map['status_label'] = _statusLabel;
    map['due_date'] = _dueDate;
    map['audit_params_values'] = _auditParamsValues;
    return map;
  }

}

/// audit_schdule_id : 12604
/// asset_tag_id : 2570
/// audit_name : " Refri-Log Book-Hourly"
/// audit_inspection_date : "2022-12-27 15:12:11"
/// audit_result : "Fail"

PmHistory pmHistoryFromJson(String str) => PmHistory.fromJson(json.decode(str));
String pmHistoryToJson(PmHistory data) => json.encode(data.toJson());
class PmHistory {
  PmHistory({
      num? auditSchduleId, 
      num? assetTagId, 
      String? auditName, 
      String? auditInspectionDate, 
      String? auditResult,}){
    _auditSchduleId = auditSchduleId;
    _assetTagId = assetTagId;
    _auditName = auditName;
    _auditInspectionDate = auditInspectionDate;
    _auditResult = auditResult;
}

  PmHistory.fromJson(dynamic json) {
    _auditSchduleId = json['audit_schdule_id'];
    _assetTagId = json['asset_tag_id'];
    _auditName = json['audit_name'];
    _auditInspectionDate = json['audit_inspection_date'];
    _auditResult = json['audit_result'];
  }
  num? _auditSchduleId;
  num? _assetTagId;
  String? _auditName;
  String? _auditInspectionDate;
  String? _auditResult;
PmHistory copyWith({  num? auditSchduleId,
  num? assetTagId,
  String? auditName,
  String? auditInspectionDate,
  String? auditResult,
}) => PmHistory(  auditSchduleId: auditSchduleId ?? _auditSchduleId,
  assetTagId: assetTagId ?? _assetTagId,
  auditName: auditName ?? _auditName,
  auditInspectionDate: auditInspectionDate ?? _auditInspectionDate,
  auditResult: auditResult ?? _auditResult,
);
  num? get auditSchduleId => _auditSchduleId;
  num? get assetTagId => _assetTagId;
  String? get auditName => _auditName;
  String? get auditInspectionDate => _auditInspectionDate;
  String? get auditResult => _auditResult;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['audit_schdule_id'] = _auditSchduleId;
    map['asset_tag_id'] = _assetTagId;
    map['audit_name'] = _auditName;
    map['audit_inspection_date'] = _auditInspectionDate;
    map['audit_result'] = _auditResult;
    return map;
  }

}