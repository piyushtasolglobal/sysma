
import 'package:adani/controllar/data_manager.dart';

const baseUrl = 'https://uat.sysmatech.com/public/api';
//const baseUrl1 = 'https://uat.sysmatech.com/public/api/v1';


const loginHeader = {
  "Authorization":"Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiI1IiwianRpIjoiNjQyZjczZThiYmUyZjA5OTJkMDEyYmJlN2JjOWIwYmYxN2Y0YzE2N2EyM2YyMWI0NzU5M2QyY2FjZDYxMjhkMWMyOWIxYjJhZjIzMzFhODAiLCJpYXQiOjE2NjI3MjgyNzMsIm5iZiI6MTY2MjcyODI3MywiZXhwIjoyMTM2MTEzODczLCJzdWIiOiIxIiwic2NvcGVzIjpbXX0.TusuVjzUs6zabejX_zgkRq1IMxA6zLLqYYvo1-PCalBxOCrp7_ZezSGJFTpd7nc60RGhAx6LV1IrAVRQ0DWAYcjrFoSMi_Mth7vlb5I_T7Hd6-70JFxhk-_1gir1AQGctOrA2im1EfQ0PxH6GUTN5S-YwaDirUW2kcMY-p9AabWjv_o4JFZ8QdtmLK1lFTqJuTLN63KyRo5vWzj3TFEuFMgB4K3r92OqI_7AVc3fmX_FCWg39P1z1KdFaZNiMD_9pSoRWraK6cjAVdIZfKRF0BYZ3YzdiaxuJtPD-oFbA1RCjVm-wGPx7zDOvmY8oFCuiEELs2dgenFyt8lYZa01BzhK-GLeO9en3AJGPT66d3ZIvTV8olk-RgTK4jYQA9WZ_iSw-tZWG6AvIVcE4xjkYuWzIe4tAoDUcC0dxtbiTfv7DvrLmaDMUigTlbV2YSinWLeuEXCVvFIWRv5Pnu8QRDfTHamFYzFg7F1Ek0vDu9dBKgYpDa8PfYjDU27JyRNAnxpMd3uWdQkxvQg2L72bxS75Z3YeEUdsr3mDg9Pmi5jCRjsbFZoVNlt71OFjtGa0xxsuPUwnQOdu1wb2YvJECtZ0vZc4Y4Pfvoc_bsLgexoLKvSRgZq7orxWk29ZRwfKw-BbvCYX-mKEJ1IcBN8QNerYhpt8XE0OhRzU6UrbcHM",
  "Accept":"application/json"
};
var header = {
  "Authorization":"Bearer ${DataManager.getInstance().getCompanyToken()}",
  "Accept":"application/json"
};
var header1 = {
  "Authorization":"Bearer ${DataManager.getInstance().getCompanyToken()}",
  "Content-type": "multipart/form-data"
};
