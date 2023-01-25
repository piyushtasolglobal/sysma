import 'dart:convert';
/// api_status : 1
/// api_message : "5 audit schedules found"
/// total : 5
/// totalAssetScheduledata : [{"maintenance_type":"preventive","audit_schdule_id":11335,"audit_id":157,"audit_start_date":"2022-12-20 00:00:00","audit_end_date":"2022-12-23 14:00:00","schedule_expire_date":"2022-12-26 23:00:00","audit_inspection_date":"2022-12-21 15:58:11","audit_status":"completed","audit_result":"Pass","escalated_audit_levels":"","audit_name":" Extrusion Machine -Weekly","inspection_by":"Vidya Dairy K V","asset_tag_id":2567,"name":"Extrusion Machine-1","asset_tag":"UAT-VD-04","model_id":175,"model_name":"EM - 1","image":"asset-image-sBsoTrYcmG.jpg","purchase_date":null,"warranty_months":12,"last_audit_date":"2022-12-21T10:28:11.000000Z","location":"Vidya Dairy","supplier_name":"VD","category_name":"Extrusion Machine -","company_name":"Vidya Dairy","audit_params_values":"[{\"audit_params_id\":172,\"audit_params_name\":\"Extrusion Machine -Weekly\",\"asset_model\":\"175\",\"company_id\":14,\"status\":\"1\",\"audit_camera_photos\":null,\"audit_comment\":null,\"show_when_photos\":null,\"show_when_comment\":null,\"param_disp_name\":\"Checking of all numetic cylinders and checking of PU connectors for Air supply & Leakage.\",\"param_type\":\"Drop-down\",\"benchmark_range_low\":null,\"benchmark_range_high\":null,\"dropdown_values\":\"Acceptable,Not Acceptable\",\"dropdown_reject_value\":\"Not Acceptable\",\"dropdown_accept_value\":\"Acceptable\",\"audit_camera_photos_key\":\"1104_img\",\"audit_comment_key\":\"1104_comment\",\"audit_audio_key\":null,\"audit_param_audio_path\":null,\"text_validation\":null,\"date_validation\":null,\"text\":null,\"date\":null,\"validation\":\"[{\\\"name\\\":\\\"Acceptable\\\",\\\"validation\\\":{\\\"dropdown_values_accept_comment_validation\\\":\\\"Optional\\\",\\\"dropdown_values_aacept_photos_validation\\\":\\\"Required\\\",\\\"dropdown_values_reject_comment_validation\\\":\\\"\\\",\\\"dropdown_values_reject_photos_validation\\\":\\\"\\\"}},{\\\"name\\\":\\\"Not Acceptable\\\",\\\"validation\\\":{\\\"dropdown_values_accept_comment_validation\\\":\\\"\\\",\\\"dropdown_values_aacept_photos_validation\\\":\\\"\\\",\\\"dropdown_values_reject_comment_validation\\\":\\\"Required\\\",\\\"dropdown_values_reject_photos_validation\\\":\\\"Required\\\"}}]\"}]","audit_params_transaction":"[{\"audit_params_transaction_id\":1760,\"audit_schedule_id\":11335,\"audit_param_name\":\"Checking of all numetic cylinders and checking of PU connectors for Air supply & Leakage.\",\"audit_update_date\":\"2022-12-21 15:58:11\",\"audit_param_name_val_id\":1104,\"id\":1760,\"audit_param_value\":\"1\",\"audit_param_result\":\"not ok\",\"audit_gps_location\":\"37.785834,-122.406417\",\"audit_asset_image\":\"scaled_2ee01895-ffe7-4cc4-8d09-8c44a63eb4823698832040012499969.jpg\",\"inspection_img\":null,\"inspection_comment\":\"null\",\"inspection_audio\":null}]"},{"maintenance_type":"preventive","audit_schdule_id":11501,"audit_id":152,"audit_start_date":"2022-12-21 00:00:00","audit_end_date":"2022-12-21 12:00:00","schedule_expire_date":"2022-12-21 23:00:00","audit_inspection_date":"2022-12-21 16:53:48","audit_status":"completed","audit_result":"Fail","escalated_audit_levels":"","audit_name":"Homogenizer -20 KL - Daily","inspection_by":"Vidya Dairy K V","asset_tag_id":2572,"name":"Homogenizer -20 KL","asset_tag":"UAT-VD-01","model_id":180,"model_name":"20 KL","image":"asset-image-JL73AroneW.webp","purchase_date":null,"warranty_months":12,"last_audit_date":"2022-12-21T11:23:48.000000Z","location":"Vidya Dairy","supplier_name":"VD","category_name":"HOMOGENIZER -","company_name":"Vidya Dairy","audit_params_values":"[{\"audit_params_id\":166,\"audit_params_name\":\"Homogenizer -20 KL - Daily\",\"asset_model\":\"180\",\"company_id\":14,\"status\":\"1\",\"audit_camera_photos\":null,\"audit_comment\":null,\"show_when_photos\":null,\"show_when_comment\":null,\"param_disp_name\":\"Plunger Seal Water is on or off\",\"param_type\":\"Drop-down\",\"benchmark_range_low\":null,\"benchmark_range_high\":null,\"dropdown_values\":\"on,off\",\"dropdown_reject_value\":\"off\",\"dropdown_accept_value\":\"on\",\"audit_camera_photos_key\":\"1092_img\",\"audit_comment_key\":\"1092_comment\",\"audit_audio_key\":null,\"audit_param_audio_path\":null,\"text_validation\":null,\"date_validation\":null,\"text\":null,\"date\":null,\"validation\":\"[{\\\"name\\\":\\\"on\\\",\\\"validation\\\":{\\\"dropdown_values_accept_comment_validation\\\":\\\"Required\\\",\\\"dropdown_values_aacept_photos_validation\\\":\\\"Required\\\",\\\"dropdown_values_reject_comment_validation\\\":\\\"\\\",\\\"dropdown_values_reject_photos_validation\\\":\\\"\\\"}},{\\\"name\\\":\\\"off\\\",\\\"validation\\\":{\\\"dropdown_values_accept_comment_validation\\\":\\\"\\\",\\\"dropdown_values_aacept_photos_validation\\\":\\\"\\\",\\\"dropdown_values_reject_comment_validation\\\":\\\"Required\\\",\\\"dropdown_values_reject_photos_validation\\\":\\\"Required\\\"}}]\"},{\"audit_params_id\":166,\"audit_params_name\":\"Homogenizer -20 KL - Daily\",\"asset_model\":\"180\",\"company_id\":14,\"status\":\"1\",\"audit_camera_photos\":null,\"audit_comment\":null,\"show_when_photos\":null,\"show_when_comment\":null,\"param_disp_name\":\"Oil level is between black line or not\",\"param_type\":\"Drop-down\",\"benchmark_range_low\":null,\"benchmark_range_high\":null,\"dropdown_values\":\"Yes,No\",\"dropdown_reject_value\":\"No\",\"dropdown_accept_value\":\"Yes\",\"audit_camera_photos_key\":\"1093_img\",\"audit_comment_key\":\"1093_comment\",\"audit_audio_key\":null,\"audit_param_audio_path\":null,\"text_validation\":null,\"date_validation\":null,\"text\":null,\"date\":null,\"validation\":\"[{\\\"name\\\":\\\"Yes\\\",\\\"validation\\\":{\\\"dropdown_values_accept_comment_validation\\\":\\\"Required\\\",\\\"dropdown_values_aacept_photos_validation\\\":\\\"Required\\\",\\\"dropdown_values_reject_comment_validation\\\":\\\"\\\",\\\"dropdown_values_reject_photos_validation\\\":\\\"\\\"}},{\\\"name\\\":\\\"No\\\",\\\"validation\\\":{\\\"dropdown_values_accept_comment_validation\\\":\\\"\\\",\\\"dropdown_values_aacept_photos_validation\\\":\\\"\\\",\\\"dropdown_values_reject_comment_validation\\\":\\\"Required\\\",\\\"dropdown_values_reject_photos_validation\\\":\\\"Required\\\"}}]\"},{\"audit_params_id\":166,\"audit_params_name\":\"Homogenizer -20 KL - Daily\",\"asset_model\":\"180\",\"company_id\":14,\"status\":\"1\",\"audit_camera_photos\":null,\"audit_comment\":null,\"show_when_photos\":null,\"show_when_comment\":null,\"param_disp_name\":\"Milk Inlet Pressure and Flow Check\",\"param_type\":\"Number\",\"benchmark_range_low\":3,\"benchmark_range_high\":10,\"dropdown_values\":\"\",\"dropdown_reject_value\":\"\",\"dropdown_accept_value\":\"\",\"audit_camera_photos_key\":\"1226_img\",\"audit_comment_key\":\"1226_comment\",\"audit_audio_key\":null,\"audit_param_audio_path\":null,\"text_validation\":null,\"date_validation\":null,\"text\":null,\"date\":null,\"validation\":\"{\\\"textfield_accept_comment_validation\\\":\\\"Optional\\\",\\\"textfield_reject_photos_validation\\\":\\\"Required\\\",\\\"textfield_reject_comment_validation\\\":\\\"Required\\\",\\\"textfield_aacept_photos_validation\\\":\\\"Optional\\\"}\"}]","audit_params_transaction":"[]"},{"maintenance_type":"preventive","audit_schdule_id":11502,"audit_id":153,"audit_start_date":"2022-12-21 00:00:00","audit_end_date":"2022-12-21 12:00:00","schedule_expire_date":"2022-12-21 23:00:00","audit_inspection_date":"2022-12-21 15:18:39","audit_status":"completed","audit_result":"Pass","escalated_audit_levels":"","audit_name":" Separator - Daily","inspection_by":"Ajay  zala ","asset_tag_id":2565,"name":"Separator-1","asset_tag":"UAT-VD-02","model_id":173,"model_name":"Separator - 1","image":"asset-image-FzSvGRxH91.png","purchase_date":null,"warranty_months":12,"last_audit_date":"2022-12-21T09:48:39.000000Z","location":"Vidya Dairy","supplier_name":"VD","category_name":"Separator -","company_name":"Vidya Dairy","audit_params_values":"[{\"audit_params_id\":167,\"audit_params_name\":\"Separator - Daily\",\"asset_model\":\"173\",\"company_id\":14,\"status\":\"1\",\"audit_camera_photos\":null,\"audit_comment\":null,\"show_when_photos\":null,\"show_when_comment\":null,\"param_disp_name\":\"Seal cooling water is on or off\",\"param_type\":\"Drop-down\",\"benchmark_range_low\":null,\"benchmark_range_high\":null,\"dropdown_values\":\"on,off\",\"dropdown_reject_value\":\"off\",\"dropdown_accept_value\":\"on\",\"audit_camera_photos_key\":\"1095_img\",\"audit_comment_key\":\"1095_comment\",\"audit_audio_key\":null,\"audit_param_audio_path\":null,\"text_validation\":null,\"date_validation\":null,\"text\":null,\"date\":null,\"validation\":\"[{\\\"name\\\":\\\"on\\\",\\\"validation\\\":{\\\"dropdown_values_accept_comment_validation\\\":\\\"Required\\\",\\\"dropdown_values_aacept_photos_validation\\\":\\\"Required\\\",\\\"dropdown_values_reject_comment_validation\\\":\\\"\\\",\\\"dropdown_values_reject_photos_validation\\\":\\\"\\\"}},{\\\"name\\\":\\\"off\\\",\\\"validation\\\":{\\\"dropdown_values_accept_comment_validation\\\":\\\"\\\",\\\"dropdown_values_aacept_photos_validation\\\":\\\"\\\",\\\"dropdown_values_reject_comment_validation\\\":\\\"Required\\\",\\\"dropdown_values_reject_photos_validation\\\":\\\"Required\\\"}}]\"},{\"audit_params_id\":167,\"audit_params_name\":\"Separator - Daily\",\"asset_model\":\"173\",\"company_id\":14,\"status\":\"1\",\"audit_camera_photos\":null,\"audit_comment\":null,\"show_when_photos\":null,\"show_when_comment\":null,\"param_disp_name\":\"Oil level is above half fill or not\",\"param_type\":\"Drop-down\",\"benchmark_range_low\":null,\"benchmark_range_high\":null,\"dropdown_values\":\"Yes,No\",\"dropdown_reject_value\":\"No\",\"dropdown_accept_value\":\"Yes\",\"audit_camera_photos_key\":\"1096_img\",\"audit_comment_key\":\"1096_comment\",\"audit_audio_key\":null,\"audit_param_audio_path\":null,\"text_validation\":null,\"date_validation\":null,\"text\":null,\"date\":null,\"validation\":\"[{\\\"name\\\":\\\"Yes\\\",\\\"validation\\\":{\\\"dropdown_values_accept_comment_validation\\\":\\\"Required\\\",\\\"dropdown_values_aacept_photos_validation\\\":\\\"Required\\\",\\\"dropdown_values_reject_comment_validation\\\":\\\"\\\",\\\"dropdown_values_reject_photos_validation\\\":\\\"\\\"}},{\\\"name\\\":\\\"No\\\",\\\"validation\\\":{\\\"dropdown_values_accept_comment_validation\\\":\\\"\\\",\\\"dropdown_values_aacept_photos_validation\\\":\\\"\\\",\\\"dropdown_values_reject_comment_validation\\\":\\\"Required\\\",\\\"dropdown_values_reject_photos_validation\\\":\\\"Required\\\"}}]\"},{\"audit_params_id\":167,\"audit_params_name\":\"Separator - Daily\",\"asset_model\":\"173\",\"company_id\":14,\"status\":\"1\",\"audit_camera_photos\":null,\"audit_comment\":null,\"show_when_photos\":null,\"show_when_comment\":null,\"param_disp_name\":\"Running Hrs of Separator\",\"param_type\":\"Number\",\"benchmark_range_low\":0,\"benchmark_range_high\":20,\"dropdown_values\":\"\",\"dropdown_reject_value\":\"\",\"dropdown_accept_value\":\"\",\"audit_camera_photos_key\":\"1228_img\",\"audit_comment_key\":\"1228_comment\",\"audit_audio_key\":null,\"audit_param_audio_path\":null,\"text_validation\":null,\"date_validation\":null,\"text\":null,\"date\":null,\"validation\":\"{\\\"textfield_accept_comment_validation\\\":\\\"Required\\\",\\\"textfield_reject_photos_validation\\\":\\\"Required\\\",\\\"textfield_reject_comment_validation\\\":\\\"Required\\\",\\\"textfield_aacept_photos_validation\\\":\\\"Required\\\"}\"}]","audit_params_transaction":"[{\"audit_params_transaction_id\":1747,\"audit_schedule_id\":11502,\"audit_param_name\":\"Seal cooling water is on or off\",\"audit_update_date\":\"2022-12-21 15:18:39\",\"audit_param_name_val_id\":1095,\"id\":1747,\"audit_param_value\":\"0.8\",\"audit_param_result\":\"not ok\",\"audit_gps_location\":\"37.785834,-122.406417\",\"audit_asset_image\":\"scaled_800ea9f9-5f74-45ce-83d8-ad6261665ea21091924802719597576.jpg\",\"inspection_img\":null,\"inspection_comment\":\"null\",\"inspection_audio\":null},{\"audit_params_transaction_id\":1748,\"audit_schedule_id\":11502,\"audit_param_name\":\"Oil level is above half fill or not\",\"audit_update_date\":\"2022-12-21 15:18:39\",\"audit_param_name_val_id\":1096,\"id\":1748,\"audit_param_value\":\"full\",\"audit_param_result\":\"Full\",\"audit_gps_location\":\"37.785834,-122.406417\",\"audit_asset_image\":\"scaled_800ea9f9-5f74-45ce-83d8-ad6261665ea21091924802719597576.jpg\",\"inspection_img\":null,\"inspection_comment\":\"null\",\"inspection_audio\":null},{\"audit_params_transaction_id\":1749,\"audit_schedule_id\":11502,\"audit_param_name\":\"Running Hrs of Separator\",\"audit_update_date\":\"2022-12-21 15:18:39\",\"audit_param_name_val_id\":1228,\"id\":1749,\"audit_param_value\":\"8.5\",\"audit_param_result\":\"not ok\",\"audit_gps_location\":\"37.785834,-122.406417\",\"audit_asset_image\":\"scaled_400c4d28-60cc-4dee-9db7-68424cce0f2b442627775275157941.jpg\",\"inspection_img\":null,\"inspection_comment\":\"null\",\"inspection_audio\":null}]"},{"maintenance_type":"preventive","audit_schdule_id":11503,"audit_id":155,"audit_start_date":"2022-12-21 00:00:00","audit_end_date":"2022-12-21 14:00:00","schedule_expire_date":"2022-12-21 23:00:00","audit_inspection_date":"2022-12-21 15:22:25","audit_status":"completed","audit_result":"Fail","escalated_audit_levels":"","audit_name":" CIP Report - Daily","inspection_by":"Ajay  zala ","asset_tag_id":2566,"name":"CIP Report-1","asset_tag":"UAT-VD-03","model_id":174,"model_name":"CIP Report - 1","image":"asset-image-2ByDNBvSMi.png","purchase_date":null,"warranty_months":12,"last_audit_date":"2022-12-21T09:52:25.000000Z","location":"Vidya Dairy","supplier_name":"VD","category_name":"CIP Report -","company_name":"Vidya Dairy","audit_params_values":"[{\"audit_params_id\":170,\"audit_params_name\":\"CIP Report - Daily\",\"asset_model\":\"174\",\"company_id\":14,\"status\":\"1\",\"audit_camera_photos\":null,\"audit_comment\":null,\"show_when_photos\":null,\"show_when_comment\":null,\"param_disp_name\":\"Temperature Check\",\"param_type\":\"Number\",\"benchmark_range_low\":70,\"benchmark_range_high\":80,\"dropdown_values\":\"\",\"dropdown_reject_value\":\"\",\"dropdown_accept_value\":\"\",\"audit_camera_photos_key\":\"1098_img\",\"audit_comment_key\":\"1098_comment\",\"audit_audio_key\":null,\"audit_param_audio_path\":null,\"text_validation\":null,\"date_validation\":null,\"text\":null,\"date\":null,\"validation\":\"{\\\"textfield_accept_comment_validation\\\":\\\"Optional\\\",\\\"textfield_reject_photos_validation\\\":\\\"Required\\\",\\\"textfield_reject_comment_validation\\\":\\\"Required\\\",\\\"textfield_aacept_photos_validation\\\":\\\"Required\\\"}\"},{\"audit_params_id\":170,\"audit_params_name\":\"CIP Report - Daily\",\"asset_model\":\"174\",\"company_id\":14,\"status\":\"1\",\"audit_camera_photos\":null,\"audit_comment\":null,\"show_when_photos\":null,\"show_when_comment\":null,\"param_disp_name\":\"Full CIP Report or Partial CIP Report.\",\"param_type\":\"Drop-down\",\"benchmark_range_low\":null,\"benchmark_range_high\":null,\"dropdown_values\":\"Full,Partial\",\"dropdown_reject_value\":\"Partial\",\"dropdown_accept_value\":\"Full\",\"audit_camera_photos_key\":\"1099_img\",\"audit_comment_key\":\"1099_comment\",\"audit_audio_key\":null,\"audit_param_audio_path\":null,\"text_validation\":null,\"date_validation\":null,\"text\":null,\"date\":null,\"validation\":\"[{\\\"name\\\":\\\"Full\\\",\\\"validation\\\":{\\\"dropdown_values_accept_comment_validation\\\":\\\"Optional\\\",\\\"dropdown_values_aacept_photos_validation\\\":\\\"Required\\\",\\\"dropdown_values_reject_comment_validation\\\":\\\"\\\",\\\"dropdown_values_reject_photos_validation\\\":\\\"\\\"}},{\\\"name\\\":\\\"Partial\\\",\\\"validation\\\":{\\\"dropdown_values_accept_comment_validation\\\":\\\"\\\",\\\"dropdown_values_aacept_photos_validation\\\":\\\"\\\",\\\"dropdown_values_reject_comment_validation\\\":\\\"Required\\\",\\\"dropdown_values_reject_photos_validation\\\":\\\"Required\\\"}}]\"}]","audit_params_transaction":"[{\"audit_params_transaction_id\":1750,\"audit_schedule_id\":11503,\"audit_param_name\":\"Temperature Check\",\"audit_update_date\":\"2022-12-21 15:20:49\",\"audit_param_name_val_id\":1098,\"id\":1750,\"audit_param_value\":\"full\",\"audit_param_result\":\"Full\",\"audit_gps_location\":\"37.785834,-122.406417\",\"audit_asset_image\":\"scaled_400c4d28-60cc-4dee-9db7-68424cce0f2b442627775275157941.jpg\",\"inspection_img\":null,\"inspection_comment\":\"null\",\"inspection_audio\":null},{\"audit_params_transaction_id\":1751,\"audit_schedule_id\":11503,\"audit_param_name\":\"Full CIP Report or Partial CIP Report.\",\"audit_update_date\":\"2022-12-21 15:20:49\",\"audit_param_name_val_id\":1099,\"id\":1751,\"audit_param_value\":\"0.5\",\"audit_param_result\":\"not ok\",\"audit_gps_location\":\"37.785834,-122.406417\",\"audit_asset_image\":\"scaled_1d584ab6-ec82-475f-b050-4b52ba2849f04096529961376648892.jpg\",\"inspection_img\":null,\"inspection_comment\":\"null\",\"inspection_audio\":null},{\"audit_params_transaction_id\":1752,\"audit_schedule_id\":11503,\"audit_param_name\":\"Temperature Check\",\"audit_update_date\":\"2022-12-21 15:21:17\",\"audit_param_name_val_id\":1098,\"id\":1752,\"audit_param_value\":\"full\",\"audit_param_result\":\"Full\",\"audit_gps_location\":\"37.785834,-122.406417\",\"audit_asset_image\":\"scaled_1d584ab6-ec82-475f-b050-4b52ba2849f04096529961376648892.jpg\",\"inspection_img\":null,\"inspection_comment\":\"null\",\"inspection_audio\":null},{\"audit_params_transaction_id\":1753,\"audit_schedule_id\":11503,\"audit_param_name\":\"Full CIP Report or Partial CIP Report.\",\"audit_update_date\":\"2022-12-21 15:21:17\",\"audit_param_name_val_id\":1099,\"id\":1753,\"audit_param_value\":\"done\",\"audit_param_result\":\"Done\",\"audit_gps_location\":\"37.785834,-122.406417\",\"audit_asset_image\":\"scaled_f650c489-c285-414a-bb02-e555e2d85aff1504178291102801016.jpg\",\"inspection_img\":null,\"inspection_comment\":\"null\",\"inspection_audio\":null},{\"audit_params_transaction_id\":1754,\"audit_schedule_id\":11503,\"audit_param_name\":\"Temperature Check\",\"audit_update_date\":\"2022-12-21 15:22:25\",\"audit_param_name_val_id\":1098,\"id\":1754,\"audit_param_value\":\"on\",\"audit_param_result\":\"on\",\"audit_gps_location\":\"37.785834,-122.406417\",\"audit_asset_image\":\"scaled_f650c489-c285-414a-bb02-e555e2d85aff1504178291102801016.jpg\",\"inspection_img\":null,\"inspection_comment\":\"null\",\"inspection_audio\":null},{\"audit_params_transaction_id\":1755,\"audit_schedule_id\":11503,\"audit_param_name\":\"Full CIP Report or Partial CIP Report.\",\"audit_update_date\":\"2022-12-21 15:22:25\",\"audit_param_name_val_id\":1099,\"id\":1755,\"audit_param_value\":\"on\",\"audit_param_result\":\"on\",\"audit_gps_location\":\"37.785834,-122.406417\",\"audit_asset_image\":\"scaled_f650c489-c285-414a-bb02-e555e2d85aff1504178291102801016.jpg\",\"inspection_img\":null,\"inspection_comment\":\"null\",\"inspection_audio\":null}]"},{"maintenance_type":"preventive","audit_schdule_id":11504,"audit_id":156,"audit_start_date":"2022-12-21 00:00:00","audit_end_date":"2022-12-21 14:00:00","schedule_expire_date":"2022-12-21 23:00:00","audit_inspection_date":"2022-12-21 15:50:11","audit_status":"completed","audit_result":"Pass","escalated_audit_levels":"","audit_name":" Extrusion Machine -Daily","inspection_by":"Vidya Dairy K V","asset_tag_id":2567,"name":"Extrusion Machine-1","asset_tag":"UAT-VD-04","model_id":175,"model_name":"EM - 1","image":"asset-image-sBsoTrYcmG.jpg","purchase_date":null,"warranty_months":12,"last_audit_date":"2022-12-21T10:28:11.000000Z","location":"Vidya Dairy","supplier_name":"VD","category_name":"Extrusion Machine -","company_name":"Vidya Dairy","audit_params_values":"[{\"audit_params_id\":171,\"audit_params_name\":\"Extrusion Machine -Daily\",\"asset_model\":\"175\",\"company_id\":14,\"status\":\"1\",\"audit_camera_photos\":null,\"audit_comment\":null,\"show_when_photos\":null,\"show_when_comment\":null,\"param_disp_name\":\"Cleaning is done or not\",\"param_type\":\"Drop-down\",\"benchmark_range_low\":null,\"benchmark_range_high\":null,\"dropdown_values\":\"Done,Not Done\",\"dropdown_reject_value\":\"Not Done\",\"dropdown_accept_value\":\"Done\",\"audit_camera_photos_key\":\"1100_img\",\"audit_comment_key\":\"1100_comment\",\"audit_audio_key\":null,\"audit_param_audio_path\":null,\"text_validation\":null,\"date_validation\":null,\"text\":null,\"date\":null,\"validation\":\"[{\\\"name\\\":\\\"Done\\\",\\\"validation\\\":{\\\"dropdown_values_accept_comment_validation\\\":\\\"Optional\\\",\\\"dropdown_values_aacept_photos_validation\\\":\\\"Required\\\",\\\"dropdown_values_reject_comment_validation\\\":\\\"\\\",\\\"dropdown_values_reject_photos_validation\\\":\\\"\\\"}},{\\\"name\\\":\\\"Not Done\\\",\\\"validation\\\":{\\\"dropdown_values_accept_comment_validation\\\":\\\"\\\",\\\"dropdown_values_aacept_photos_validation\\\":\\\"\\\",\\\"dropdown_values_reject_comment_validation\\\":\\\"Required\\\",\\\"dropdown_values_reject_photos_validation\\\":\\\"Required\\\"}}]\"},{\"audit_params_id\":171,\"audit_params_name\":\"Extrusion Machine -Daily\",\"asset_model\":\"175\",\"company_id\":14,\"status\":\"1\",\"audit_camera_photos\":null,\"audit_comment\":null,\"show_when_photos\":null,\"show_when_comment\":null,\"param_disp_name\":\"Check air supply is on or off\",\"param_type\":\"Drop-down\",\"benchmark_range_low\":null,\"benchmark_range_high\":null,\"dropdown_values\":\"on,off\",\"dropdown_reject_value\":\"off\",\"dropdown_accept_value\":\"on\",\"audit_camera_photos_key\":\"1101_img\",\"audit_comment_key\":\"1101_comment\",\"audit_audio_key\":null,\"audit_param_audio_path\":null,\"text_validation\":null,\"date_validation\":null,\"text\":null,\"date\":null,\"validation\":\"[{\\\"name\\\":\\\"on\\\",\\\"validation\\\":{\\\"dropdown_values_accept_comment_validation\\\":\\\"Optional\\\",\\\"dropdown_values_aacept_photos_validation\\\":\\\"Required\\\",\\\"dropdown_values_reject_comment_validation\\\":\\\"\\\",\\\"dropdown_values_reject_photos_validation\\\":\\\"\\\"}},{\\\"name\\\":\\\"off\\\",\\\"validation\\\":{\\\"dropdown_values_accept_comment_validation\\\":\\\"\\\",\\\"dropdown_values_aacept_photos_validation\\\":\\\"\\\",\\\"dropdown_values_reject_comment_validation\\\":\\\"Required\\\",\\\"dropdown_values_reject_photos_validation\\\":\\\"Required\\\"}}]\"},{\"audit_params_id\":171,\"audit_params_name\":\"Extrusion Machine -Daily\",\"asset_model\":\"175\",\"company_id\":14,\"status\":\"1\",\"audit_camera_photos\":null,\"audit_comment\":null,\"show_when_photos\":null,\"show_when_comment\":null,\"param_disp_name\":\"Colling tower is on or off\",\"param_type\":\"Drop-down\",\"benchmark_range_low\":null,\"benchmark_range_high\":null,\"dropdown_values\":\"on,off\",\"dropdown_reject_value\":\"off\",\"dropdown_accept_value\":\"on\",\"audit_camera_photos_key\":\"1102_img\",\"audit_comment_key\":\"1102_comment\",\"audit_audio_key\":null,\"audit_param_audio_path\":null,\"text_validation\":null,\"date_validation\":null,\"text\":null,\"date\":null,\"validation\":\"[{\\\"name\\\":\\\"on\\\",\\\"validation\\\":{\\\"dropdown_values_accept_comment_validation\\\":\\\"Not Required\\\",\\\"dropdown_values_aacept_photos_validation\\\":\\\"NotRequired\\\",\\\"dropdown_values_reject_comment_validation\\\":\\\"\\\",\\\"dropdown_values_reject_photos_validation\\\":\\\"\\\"}},{\\\"name\\\":\\\"off\\\",\\\"validation\\\":{\\\"dropdown_values_accept_comment_validation\\\":\\\"\\\",\\\"dropdown_values_aacept_photos_validation\\\":\\\"\\\",\\\"dropdown_values_reject_comment_validation\\\":\\\"Not Required\\\",\\\"dropdown_values_reject_photos_validation\\\":\\\"NotRequired\\\"}}]\"},{\"audit_params_id\":171,\"audit_params_name\":\"Extrusion Machine -Daily\",\"asset_model\":\"175\",\"company_id\":14,\"status\":\"1\",\"audit_camera_photos\":null,\"audit_comment\":null,\"show_when_photos\":null,\"show_when_comment\":null,\"param_disp_name\":\"Compressor is on or off\",\"param_type\":\"Drop-down\",\"benchmark_range_low\":null,\"benchmark_range_high\":null,\"dropdown_values\":\"on,off\",\"dropdown_reject_value\":\"off\",\"dropdown_accept_value\":\"on\",\"audit_camera_photos_key\":\"1103_img\",\"audit_comment_key\":\"1103_comment\",\"audit_audio_key\":null,\"audit_param_audio_path\":null,\"text_validation\":null,\"date_validation\":null,\"text\":null,\"date\":null,\"validation\":\"[{\\\"name\\\":\\\"on\\\",\\\"validation\\\":{\\\"dropdown_values_accept_comment_validation\\\":\\\"Not Required\\\",\\\"dropdown_values_aacept_photos_validation\\\":\\\"NotRequired\\\",\\\"dropdown_values_reject_comment_validation\\\":\\\"\\\",\\\"dropdown_values_reject_photos_validation\\\":\\\"\\\"}},{\\\"name\\\":\\\"off\\\",\\\"validation\\\":{\\\"dropdown_values_accept_comment_validation\\\":\\\"\\\",\\\"dropdown_values_aacept_photos_validation\\\":\\\"\\\",\\\"dropdown_values_reject_comment_validation\\\":\\\"Not Required\\\",\\\"dropdown_values_reject_photos_validation\\\":\\\"NotRequired\\\"}}]\"}]","audit_params_transaction":"[{\"audit_params_transaction_id\":1756,\"audit_schedule_id\":11504,\"audit_param_name\":\"Cleaning is done or not\",\"audit_update_date\":\"2022-12-21 15:50:11\",\"audit_param_name_val_id\":1100,\"id\":1756,\"audit_param_value\":\"on\",\"audit_param_result\":\"on\",\"audit_gps_location\":\"37.785834,-122.406417\",\"audit_asset_image\":\"scaled_f650c489-c285-414a-bb02-e555e2d85aff1504178291102801016.jpg\",\"inspection_img\":null,\"inspection_comment\":\"null\",\"inspection_audio\":null},{\"audit_params_transaction_id\":1757,\"audit_schedule_id\":11504,\"audit_param_name\":\"Check air supply is on or off\",\"audit_update_date\":\"2022-12-21 15:50:11\",\"audit_param_name_val_id\":1101,\"id\":1757,\"audit_param_value\":\"acceptable\",\"audit_param_result\":\"Acceptable\",\"audit_gps_location\":\"37.785834,-122.406417\",\"audit_asset_image\":\"scaled_e2ec7914-e521-47b4-ae10-21287ca02deb4490191741809076805.jpg\",\"inspection_img\":null,\"inspection_comment\":\"null\",\"inspection_audio\":null},{\"audit_params_transaction_id\":1758,\"audit_schedule_id\":11504,\"audit_param_name\":\"Colling tower is on or off\",\"audit_update_date\":\"2022-12-21 15:50:11\",\"audit_param_name_val_id\":1102,\"id\":1758,\"audit_param_value\":\"on\",\"audit_param_result\":\"on\",\"audit_gps_location\":\"37.785834,-122.406417\",\"audit_asset_image\":\"scaled_2ee01895-ffe7-4cc4-8d09-8c44a63eb4823698832040012499969.jpg\",\"inspection_img\":null,\"inspection_comment\":\"null\",\"inspection_audio\":null},{\"audit_params_transaction_id\":1759,\"audit_schedule_id\":11504,\"audit_param_name\":\"Compressor is on or off\",\"audit_update_date\":\"2022-12-21 15:50:11\",\"audit_param_name_val_id\":1103,\"id\":1759,\"audit_param_value\":\"yes\",\"audit_param_result\":\"Yes\",\"audit_gps_location\":\"37.785834,-122.406417\",\"audit_asset_image\":\"scaled_2ee01895-ffe7-4cc4-8d09-8c44a63eb4823698832040012499969.jpg\",\"inspection_img\":null,\"inspection_comment\":\"null\",\"inspection_audio\":null}]"}]

Completed completedFromJson(String str) => Completed.fromJson(json.decode(str));
String completedToJson(Completed data) => json.encode(data.toJson());
class Completed {
  Completed({
      num? apiStatus, 
      String? apiMessage, 
      num? total, 
      List<CompletedScheduleData>? totalAssetScheduledata,}){
    _apiStatus = apiStatus;
    _apiMessage = apiMessage;
    _total = total;
    _totalAssetScheduledata = totalAssetScheduledata;
}

  Completed.fromJson(dynamic json) {
    _apiStatus = json['api_status'];
    _apiMessage = json['api_message'];
    _total = json['total'];
    if (json['totalAssetScheduledata'] != null) {
      _totalAssetScheduledata = [];
      json['totalAssetScheduledata'].forEach((v) {
        _totalAssetScheduledata?.add(CompletedScheduleData.fromJson(v));
      });
    }
  }
  num? _apiStatus;
  String? _apiMessage;
  num? _total;
  List<CompletedScheduleData>? _totalAssetScheduledata;
Completed copyWith({  num? apiStatus,
  String? apiMessage,
  num? total,
  List<CompletedScheduleData>? totalAssetScheduledata,
}) => Completed(  apiStatus: apiStatus ?? _apiStatus,
  apiMessage: apiMessage ?? _apiMessage,
  total: total ?? _total,
  totalAssetScheduledata: totalAssetScheduledata ?? _totalAssetScheduledata,
);
  num? get apiStatus => _apiStatus;
  String? get apiMessage => _apiMessage;
  num? get total => _total;
  List<CompletedScheduleData>? get totalAssetScheduledata => _totalAssetScheduledata;

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
/// audit_schdule_id : 11335
/// audit_id : 157
/// audit_start_date : "2022-12-20 00:00:00"
/// audit_end_date : "2022-12-23 14:00:00"
/// schedule_expire_date : "2022-12-26 23:00:00"
/// audit_inspection_date : "2022-12-21 15:58:11"
/// audit_status : "completed"
/// audit_result : "Pass"
/// escalated_audit_levels : ""
/// audit_name : " Extrusion Machine -Weekly"
/// inspection_by : "Vidya Dairy K V"
/// asset_tag_id : 2567
/// name : "Extrusion Machine-1"
/// asset_tag : "UAT-VD-04"
/// model_id : 175
/// model_name : "EM - 1"
/// image : "asset-image-sBsoTrYcmG.jpg"
/// purchase_date : null
/// warranty_months : 12
/// last_audit_date : "2022-12-21T10:28:11.000000Z"
/// location : "Vidya Dairy"
/// supplier_name : "VD"
/// category_name : "Extrusion Machine -"
/// company_name : "Vidya Dairy"
/// audit_params_values : "[{\"audit_params_id\":172,\"audit_params_name\":\"Extrusion Machine -Weekly\",\"asset_model\":\"175\",\"company_id\":14,\"status\":\"1\",\"audit_camera_photos\":null,\"audit_comment\":null,\"show_when_photos\":null,\"show_when_comment\":null,\"param_disp_name\":\"Checking of all numetic cylinders and checking of PU connectors for Air supply & Leakage.\",\"param_type\":\"Drop-down\",\"benchmark_range_low\":null,\"benchmark_range_high\":null,\"dropdown_values\":\"Acceptable,Not Acceptable\",\"dropdown_reject_value\":\"Not Acceptable\",\"dropdown_accept_value\":\"Acceptable\",\"audit_camera_photos_key\":\"1104_img\",\"audit_comment_key\":\"1104_comment\",\"audit_audio_key\":null,\"audit_param_audio_path\":null,\"text_validation\":null,\"date_validation\":null,\"text\":null,\"date\":null,\"validation\":\"[{\\\"name\\\":\\\"Acceptable\\\",\\\"validation\\\":{\\\"dropdown_values_accept_comment_validation\\\":\\\"Optional\\\",\\\"dropdown_values_aacept_photos_validation\\\":\\\"Required\\\",\\\"dropdown_values_reject_comment_validation\\\":\\\"\\\",\\\"dropdown_values_reject_photos_validation\\\":\\\"\\\"}},{\\\"name\\\":\\\"Not Acceptable\\\",\\\"validation\\\":{\\\"dropdown_values_accept_comment_validation\\\":\\\"\\\",\\\"dropdown_values_aacept_photos_validation\\\":\\\"\\\",\\\"dropdown_values_reject_comment_validation\\\":\\\"Required\\\",\\\"dropdown_values_reject_photos_validation\\\":\\\"Required\\\"}}]\"}]"
/// audit_params_transaction : "[{\"audit_params_transaction_id\":1760,\"audit_schedule_id\":11335,\"audit_param_name\":\"Checking of all numetic cylinders and checking of PU connectors for Air supply & Leakage.\",\"audit_update_date\":\"2022-12-21 15:58:11\",\"audit_param_name_val_id\":1104,\"id\":1760,\"audit_param_value\":\"1\",\"audit_param_result\":\"not ok\",\"audit_gps_location\":\"37.785834,-122.406417\",\"audit_asset_image\":\"scaled_2ee01895-ffe7-4cc4-8d09-8c44a63eb4823698832040012499969.jpg\",\"inspection_img\":null,\"inspection_comment\":\"null\",\"inspection_audio\":null}]"

CompletedScheduleData totalAssetScheduledataFromJson(String str) => CompletedScheduleData.fromJson(json.decode(str));
String totalAssetScheduledataToJson(CompletedScheduleData data) => json.encode(data.toJson());
class CompletedScheduleData {
  CompletedScheduleData({
      String? maintenanceType, 
      num? auditSchduleId, 
      num? auditId, 
      String? auditStartDate, 
      String? auditEndDate, 
      String? scheduleExpireDate, 
      String? auditInspectionDate, 
      String? auditStatus, 
      String? auditResult,
    dynamic escalatedAuditLevels,
      String? auditName, 
      String? inspectionBy, 
      num? assetTagId, 
      String? name, 
      String? assetTag, 
      num? modelId, 
      String? modelName, 
      String? image,
      String? assetImage,
      dynamic purchaseDate,
      num? warrantyMonths, 
      String? lastAuditDate, 
      String? location, 
      String? supplierName, 
      String? categoryName, 
      String? companyName, 
      String? auditParamsValues,
      String? auditParamsTransaction,
      num? status,
      num? insFrom,
      String? response,}){
    _maintenanceType = maintenanceType;
    _auditSchduleId = auditSchduleId;
    _auditId = auditId;
    _auditStartDate = auditStartDate;
    _auditEndDate = auditEndDate;
    _scheduleExpireDate = scheduleExpireDate;
    _auditInspectionDate = auditInspectionDate;
    _auditStatus = auditStatus;
    _auditResult = auditResult;
    _escalatedAuditLevels = escalatedAuditLevels;
    _auditName = auditName;
    _inspectionBy = inspectionBy;
    _assetTagId = assetTagId;
    _name = name;
    _assetTag = assetTag;
    _modelId = modelId;
    _modelName = modelName;
    _image = image;
    _assetImage = assetImage;
    _purchaseDate = purchaseDate;
    _warrantyMonths = warrantyMonths;
    _lastAuditDate = lastAuditDate;
    _location = location;
    _supplierName = supplierName;
    _categoryName = categoryName;
    _companyName = companyName;
    _auditParamsValues = auditParamsValues;
    _auditParamsTransaction = auditParamsTransaction;
    _status = status;
    _insFrom = insFrom;
    _response = response;
}

  CompletedScheduleData.fromJson(dynamic json) {
    _maintenanceType = json['maintenance_type'];
    _auditSchduleId = json['audit_schdule_id'];
    _auditId = json['audit_id'];
    _auditStartDate = json['audit_start_date'];
    _auditEndDate = json['audit_end_date'];
    _scheduleExpireDate = json['schedule_expire_date'];
    _auditInspectionDate = json['audit_inspection_date'];
    _auditStatus = json['audit_status'];
    _auditResult = json['audit_result'];
    _escalatedAuditLevels = json['escalated_audit_levels'];
    _auditName = json['audit_name'];
    _inspectionBy = json['inspection_by'];
    _assetTagId = json['asset_tag_id'];
    _name = json['name'];
    _assetTag = json['asset_tag'];
    _modelId = json['model_id'];
    _modelName = json['model_name'];
    _image = json['image'];
    _assetImage = json['asset_image'];
    _purchaseDate = json['purchase_date'];
    _warrantyMonths = json['warranty_months'];
    _lastAuditDate = json['last_audit_date'];
    _location = json['location'];
    _supplierName = json['supplier_name'];
    _categoryName = json['category_name'];
    _companyName = json['company_name'];
    _auditParamsValues = json['audit_params_values'];
    _auditParamsTransaction = json['audit_params_transaction'];
    _status = json['status'];
    _insFrom = json['insFrom'];
    _response = json['response'];
  }
  String? _maintenanceType;
  num? _auditSchduleId;
  num? _auditId;
  String? _auditStartDate;
  String? _auditEndDate;
  String? _scheduleExpireDate;
  String? _auditInspectionDate;
  String? _auditStatus;
  String? _auditResult;
  dynamic _escalatedAuditLevels;
  String? _auditName;
  String? _inspectionBy;
  num? _assetTagId;
  String? _name;
  String? _assetTag;
  num? _modelId;
  String? _modelName;
  String? _image;
  String? _assetImage;
  dynamic _purchaseDate;
  num? _warrantyMonths;
  String? _lastAuditDate;
  String? _location;
  String? _supplierName;
  String? _categoryName;
  String? _companyName;
  String? _auditParamsValues;
  String? _auditParamsTransaction;
  num? _status;
  num? _insFrom;
  String? _response;
CompletedScheduleData copyWith({  String? maintenanceType,
  num? auditSchduleId,
  num? auditId,
  String? auditStartDate,
  String? auditEndDate,
  String? scheduleExpireDate,
  String? auditInspectionDate,
  String? auditStatus,
  String? auditResult,
  dynamic escalatedAuditLevels,
  String? auditName,
  String? inspectionBy,
  num? assetTagId,
  String? name,
  String? assetTag,
  num? modelId,
  String? modelName,
  String? image,
  String? assetImage,
  dynamic purchaseDate,
  num? warrantyMonths,
  String? lastAuditDate,
  String? location,
  String? supplierName,
  String? categoryName,
  String? companyName,
  String? auditParamsValues,
  String? auditParamsTransaction,
  num? status,
  num? insFrom,
  String? response,
}) => CompletedScheduleData(  maintenanceType: maintenanceType ?? _maintenanceType,
  auditSchduleId: auditSchduleId ?? _auditSchduleId,
  auditId: auditId ?? _auditId,
  auditStartDate: auditStartDate ?? _auditStartDate,
  auditEndDate: auditEndDate ?? _auditEndDate,
  scheduleExpireDate: scheduleExpireDate ?? _scheduleExpireDate,
  auditInspectionDate: auditInspectionDate ?? _auditInspectionDate,
  auditStatus: auditStatus ?? _auditStatus,
  auditResult: auditResult ?? _auditResult,
  escalatedAuditLevels: escalatedAuditLevels ?? _escalatedAuditLevels,
  auditName: auditName ?? _auditName,
  inspectionBy: inspectionBy ?? _inspectionBy,
  assetTagId: assetTagId ?? _assetTagId,
  name: name ?? _name,
  assetTag: assetTag ?? _assetTag,
  modelId: modelId ?? _modelId,
  modelName: modelName ?? _modelName,
  image: image ?? _image,
  assetImage: assetImage ?? _assetImage,
  purchaseDate: purchaseDate ?? _purchaseDate,
  warrantyMonths: warrantyMonths ?? _warrantyMonths,
  lastAuditDate: lastAuditDate ?? _lastAuditDate,
  location: location ?? _location,
  supplierName: supplierName ?? _supplierName,
  categoryName: categoryName ?? _categoryName,
  companyName: companyName ?? _companyName,
  auditParamsValues: auditParamsValues ?? _auditParamsValues,
  auditParamsTransaction: auditParamsTransaction ?? _auditParamsTransaction,
  status: status ?? status,
  insFrom: insFrom ?? insFrom,
  response: response ?? response,
);
  String? get maintenanceType => _maintenanceType;
  num? get auditSchduleId => _auditSchduleId;
  num? get auditId => _auditId;
  String? get auditStartDate => _auditStartDate;
  String? get auditEndDate => _auditEndDate;
  String? get scheduleExpireDate => _scheduleExpireDate;
  String? get auditInspectionDate => _auditInspectionDate;
  String? get auditStatus => _auditStatus;
  String? get auditResult => _auditResult;
  dynamic get escalatedAuditLevels => _escalatedAuditLevels;
  String? get auditName => _auditName;
  String? get inspectionBy => _inspectionBy;
  num? get assetTagId => _assetTagId;
  String? get name => _name;
  String? get assetTag => _assetTag;
  num? get modelId => _modelId;
  String? get modelName => _modelName;
  String? get image => _image;
  String? get assetImage => _assetImage;
  dynamic get purchaseDate => _purchaseDate;
  num? get warrantyMonths => _warrantyMonths;
  String? get lastAuditDate => _lastAuditDate;
  String? get location => _location;
  String? get supplierName => _supplierName;
  String? get categoryName => _categoryName;
  String? get companyName => _companyName;
  String? get auditParamsValues => _auditParamsValues;
  String? get auditParamsTransaction => _auditParamsTransaction;
  num? get status => _status;
  num? get insFrom => _insFrom;
  String? get response => _response;

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
    map['audit_result'] = _auditResult;
    map['escalated_audit_levels'] = _escalatedAuditLevels;
    map['audit_name'] = _auditName;
    map['inspection_by'] = _inspectionBy;
    map['asset_tag_id'] = _assetTagId;
    map['name'] = _name;
    map['asset_tag'] = _assetTag;
    map['model_id'] = _modelId;
    map['model_name'] = _modelName;
    map['image'] = _image;
    map['asset_image'] = _assetImage;
    map['purchase_date'] = _purchaseDate;
    map['warranty_months'] = _warrantyMonths;
    map['last_audit_date'] = _lastAuditDate;
    map['location'] = _location;
    map['supplier_name'] = _supplierName;
    map['category_name'] = _categoryName;
    map['company_name'] = _companyName;
    map['audit_params_values'] = _auditParamsValues;
    map['audit_params_transaction'] = _auditParamsTransaction;
    map['status'] = _status;
    map['insFrom'] = _insFrom;
    map['response'] = _response;
    return map;
  }

}