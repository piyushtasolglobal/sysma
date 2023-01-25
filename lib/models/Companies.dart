import 'dart:convert';
/// api_status : 1
/// total : 7
/// api_message : "User found"
/// data : [{"user_id":"38","user_full_name":"Kamlesh Vyas","company_id":"3","company_name":"Zydus ZRC","domain_name":"https://staging.sysmatech.com/zydus/public/api/zydus/","asset_img_path":"https://staging.sysmatech.com/zydus/public/uploads/assets/","asset_insepction_img_path":"https://staging.sysmatech.com/zydus/public/asset_img/","asset_breakdwon_insepction_img_path":"https://staging.sysmatech.com/zydus/public/uploads/asset_img/","BearerToken":"eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiY2U3ZTQ3OGU5NjMzMjRiNDVlMjgyZTI0N2U2MjAyNWQzZTY1NTdkNjgwMjcwMzA4MDA5MWYwMWE4MDM3MDcwMDU4OTEyZWJiZDg3MmJhZDkiLCJpYXQiOjE2NTU0NzMxMDgsIm5iZiI6MTY1NTQ3MzEwOCwiZXhwIjoyMTI4ODU4NzA4LCJzdWIiOiIxIiwic2NvcGVzIjpbXX0.DzUN-wBQFlZG22ufwXDRWlfaH-CchTToDtGLzYkJ6KVAOL0Bapr69EcHuRERXaIunEnAdtqFXIFw7MXlpmWi6RrDfnV_SJb8YMT1fFjCSbESPv39bMrDjDvBNukjcaTNn3yKL15hA82ph16G8rVxw3NCETUFwY2wE2A3oemQNIWJAY7VNU5TCWhmuuR3SxqpnNdQ_a4X9prnRvxpS7WE-17DcEar1Pu7DTwKQRh43L2K-60c0tsIjfM0vFdEltafRNxBSUbXGy5b8gIGnXd_tuPJgZ5sUjikC-uEuxJ5dfUHFzPMoWmhJX7a6yDbVx69HlB8K8PWHayox11GlBGl9mknIm7Fe5eWbQ-o0WMEHpZPLliymK0kxNRgB_eAbi8krIdSi-1ztY-5I-DmzP17pUDPrGnbGVSD2B9ZwoubmFF9ILJXYAhsGJRCtnvje_NxC0wkD-vihILh4i2cDDYqOh2M52WQZ6DGIiTp5wsn0me1nm11DSGbcPepaC4iCatYd4-y3R4SY4It6n6E3CvRlq0GVQXoboyJWIfIL0VymebMegFD3HRq6nl_0DT6-W2Bu6I8efjZtXiN8-yJ4Det0r5xKHJRf5nXiEHnm4M2oyVeDeYJWtWl9aIuFObiUqVnSiEqWAEn3_nNwT3LNMv_X6oLdIADcNdzk0xZdXfPlug","audit_param_audio_path":null},{"user_id":"56","user_full_name":"Vidya Dairy K V","company_id":"14","company_name":"Vidya Dairy","domain_name":"https://uat.sysmatech.com/public/api/uat/","asset_img_path":"https://uat.sysmatech.com/public/uploads/assets/","asset_insepction_img_path":"https://uat.sysmatech.com/public/uploads/asset_img/","asset_breakdwon_insepction_img_path":"https://uat.sysmatech.com/public/uploads/asset_img/","BearerToken":"eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiI1IiwianRpIjoiNjQyZjczZThiYmUyZjA5OTJkMDEyYmJlN2JjOWIwYmYxN2Y0YzE2N2EyM2YyMWI0NzU5M2QyY2FjZDYxMjhkMWMyOWIxYjJhZjIzMzFhODAiLCJpYXQiOjE2NjI3MjgyNzMsIm5iZiI6MTY2MjcyODI3MywiZXhwIjoyMTM2MTEzODczLCJzdWIiOiIxIiwic2NvcGVzIjpbXX0.TusuVjzUs6zabejX_zgkRq1IMxA6zLLqYYvo1-PCalBxOCrp7_ZezSGJFTpd7nc60RGhAx6LV1IrAVRQ0DWAYcjrFoSMi_Mth7vlb5I_T7Hd6-70JFxhk-_1gir1AQGctOrA2im1EfQ0PxH6GUTN5S-YwaDirUW2kcMY-p9AabWjv_o4JFZ8QdtmLK1lFTqJuTLN63KyRo5vWzj3TFEuFMgB4K3r92OqI_7AVc3fmX_FCWg39P1z1KdFaZNiMD_9pSoRWraK6cjAVdIZfKRF0BYZ3YzdiaxuJtPD-oFbA1RCjVm-wGPx7zDOvmY8oFCuiEELs2dgenFyt8lYZa01BzhK-GLeO9en3AJGPT66d3ZIvTV8olk-RgTK4jYQA9WZ_iSw-tZWG6AvIVcE4xjkYuWzIe4tAoDUcC0dxtbiTfv7DvrLmaDMUigTlbV2YSinWLeuEXCVvFIWRv5Pnu8QRDfTHamFYzFg7F1Ek0vDu9dBKgYpDa8PfYjDU27JyRNAnxpMd3uWdQkxvQg2L72bxS75Z3YeEUdsr3mDg9Pmi5jCRjsbFZoVNlt71OFjtGa0xxsuPUwnQOdu1wb2YvJECtZ0vZc4Y4Pfvoc_bsLgexoLKvSRgZq7orxWk29ZRwfKw-BbvCYX-mKEJ1IcBN8QNerYhpt8XE0OhRzU6UrbcHM","audit_param_audio_path":"https://uat.sysmatech.com/public/uploads/audio/"},{"user_id":"55","user_full_name":"Kamlesh Vyas","company_id":"1","company_name":"Havmor-GIDC","domain_name":"https://havmor.sysmatech.com/public/api/havmor/","asset_img_path":"https://havmor.sysmatech.com/public/uploads/assets/","asset_insepction_img_path":"https://havmor.sysmatech.com/public/asset_img","asset_breakdwon_insepction_img_path":"https://havmor.sysmatech.com/public/uploads/asset_img/","BearerToken":"eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiI1IiwianRpIjoiNDk4ZGFhNTA0YjFjZTAwNTM3NWQ5MWZmZDc5MzJjYjczYWNiMDAxNGNhODgwNDQ3ZWFiZDZkNmNmN2E3NTc4Zjk5MjQ3YWEyYTNkMjJmZmIiLCJpYXQiOjE2NTg4MTI4ODksIm5iZiI6MTY1ODgxMjg4OSwiZXhwIjoyMTMyMTk4NDg5LCJzdWIiOiIxIiwic2NvcGVzIjpbXX0.SVp7zfehBlhvkzWYZrfvtmfs3SH92fqQ9ncsIOFSSfiheoM1TYHHCUgL7KHOptSr55xqJlJjluiv9A4B9C9UZ_pvUtuiaek75XrXad1528ng1hZWgCXjiIB9nK6vRHqRnoOFGgIzGCmIvnArvZpOTu7U6_DW8FCgdEFfmKnb01f_UnKXT__Qz2ja3byF2Yebz5ZzpptDkIj7D9hO4NBA0KFwaKLaNt-IVtQccBBA1qwOLSqy6nE8Ebnc9oGYhrY4QmNHnvfekvQeqdPHvSB2Rm01Y0Ij0Uz1vMs7U3UPcWHoRKw-bbUkLuqVxSh3TRQSkifUnJ30FgeE-a3a5PVC2AX1JhdFHdm1_0fx4Sxc5XtBNoaOUQ7bSVl7GPlefQy7ZOMwRaBxzpbGI12p4oU4dSpX5njFQIV8HQtn19_1F9udDEhUvszlWn3WGh6jZnczAH0pI5T14SbHdSrzyAHNfUf0GUDuXk7o2q5o7FY7N5r04diLrM41-yu6AoC3G6keyErC11sz1prvNBfnkJfncuFaVyi6n6grB2yIwJ2vDap8qog5Z6qSuRUpn1AaOZJqaLOFZLT_DAfHAqZSwNUZIvT4sTpOAkmWuEsHETYhkjWjYTE5J_BThJnMYnJK7_ZRGbxsB_0dckIxeFgbGZgLmTF3hfM1ewP4_NQ9et1f8vc","audit_param_audio_path":null},{"user_id":"38","user_full_name":"Kamlesh Vyas","company_id":"1","company_name":"Mica","domain_name":"https://mica.sysmatech.com/public/api/mica/","asset_img_path":"https://mica.sysmatech.com/public/uploads/assets/","asset_insepction_img_path":"https://mica.sysmatech.com/public/asset_img","asset_breakdwon_insepction_img_path":"https://mica.sysmatech.com/public/uploads/asset_img/","BearerToken":"eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiI1IiwianRpIjoiZTYyNzI1ZGI2NGY3NDJiODljN2JhYzlhZjRlMjMwZWY3Y2ZiODEzNzNhMTJhZjc0NDQ4ZWNkZWFjM2MzN2Y1NjQwOTZhYzY1ODZmZjRkMTAiLCJpYXQiOjE2NjEzMTc1OTksIm5iZiI6MTY2MTMxNzU5OSwiZXhwIjoyMTM0NzAzMTk4LCJzdWIiOiIxIiwic2NvcGVzIjpbXX0.Zo-FpKjmZn47umz29vJTRHSliakBXpJueFF-GsoHoewaYoHthS3Rm_fb88mxYrSWpTIwrGDhCenWy9krtdCh9F1NoA9qLOz7B-8sp7vgO8qn0FmoVgh9FHj7vRX5h_7HCGM2z1I01kETPx8pqBWfOK8eDjtBm7AJYhmQEic6F4o40nzJvZMeCauGdTBlp1bBA9Vuq9JBaCvkyJywnEQ6G1G02SPpbuNjewYekbhTmTf56mA-7MWP1RrYhJLYlW1j7nhG0VjVY1x7kB-eCvkJsKhl7vh3Tr2Gz3-RTw-LHZ6a3yQvnXybVOrWH-YrySMlvVf4g4v1hhOyHmVTWvFNPfyS5fMSEqfU2UTzWZG8JoeAh73S_bIDy17X8zDcc2B3u5svDxFGsqN4V4JQX9yU1dDAHEn9DtfzTlbS2bDNOxT4mjY3b6Dj9RZjGAfTNg4Rim0xbk19Mla-vYCItdy4WLWtb6P-zOpWOpce5bHLAeSh1ErUgC1XOOlV9cKdqzJxPEkyZO-rfmY3DFfDDu0i9Mz0KTpOsOVfQFILjmIEGODRQJEvQfcwHziUTtjiIcHPdDmtbFeOhRIY1vS-_dI-GqhUhgzHmR5BPdehZGm0g2-16Oc8yMpwnVuHITjxYVpaZysan0p730o8tiks99iORI5FrRuZODj1OKBC9eOyeoY","audit_param_audio_path":null},{"user_id":"37","user_full_name":"Kamlesh Vyas","company_id":"1","company_name":"Rajora","domain_name":"https://rsss.sysmatech.com/public/api/v1/","asset_img_path":"https://rsss.sysmatech.com/public/uploads/assets/","asset_insepction_img_path":"https://rsss.sysmatech.com/public/uploads/asset_img/","asset_breakdwon_insepction_img_path":"https://rsss.sysmatech.com/public/uploads/asset_img/","BearerToken":"eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiI1IiwianRpIjoiY2E5NmQ5MzdmZDljNmE4YWQ3ZGJiMTRlNjQyMjdlN2VmYmNjYjdiNWQyNDVkZGVjZmM2OTVkNmQwMGJmNzE2YWJiMDc0OTMwZGY0ZDkzNmIiLCJpYXQiOjE2NjI4MDQ0MDksIm5iZiI6MTY2MjgwNDQwOSwiZXhwIjoyMTM2MTkwMDA5LCJzdWIiOiIxIiwic2NvcGVzIjpbXX0.mn4WdZfMuqMph9x-ZBeoPf3fDRB3_hoSAO-dMw98s4SBVHvH7L_8WK_U72R6FUiw9cmf_jvh2DHBb7it4OromY3XaNbdvdgRrBbKuIZD09VPiyxj1V-UCuuMqe2IheSCx3AibB6QQPGmufng6hLE0hJ1QucnPZ2OHG165afjDiizwfG68XhVJEiRbpl9jmtvJUoNwJT9hE0NF1k20Y5pidIGVF_Iwkoj5eLPsIflR8_iLImZNnurfuFjSxZ2ilorcOIlVvr5AomCiyK2sIbOrgbrEq4W_M3SF2N2ldbWHuTg-L5liXEACZgBHY1_lMIyKVPKSKMfdyLO_oKM7TGIK2Pj7ymhvZPYVXXLeDIcjqbprtZjvnC5RywR9fS4XrDV_VroB43a2QwJJz86MTEjI6EurHfuJIHxnr4576G9wPmD0wb7O3Il0YKnDbM7uSYx2VyouiJyyJZsai7frc40AmWn9WscCJz_uPxUztos0kxwtPW5OVFNPl0odYSWcbLsIZZ6XLaeRQbnV5n65J5c-gXjOhrD86d2TmhFEXuOPc4aFe8I-enC2K7tXCzcF3S_GhdvAHFVkSs3uYegWxP6WFg0WxChlAB7-bU5tm6obfLqk-fdHEhd7EKzTlGLJ5dPYjuRarZtOozCMh5AZrhDbSFKWfJc3nCTytVmn_Qs-qU","audit_param_audio_path":"https://rsss.sysmatech.com/public/uploads/audio/"},{"user_id":"2","user_full_name":"Kamlesh Vyas","company_id":"1","company_name":"ZRC-UAT","domain_name":"http://zrcuat.sysmatech.com/public/api/v1/","asset_img_path":"http://zrcuat.sysmatech.com/public/uploads/assets/","asset_insepction_img_path":"http://zrcuat.sysmatech.com/public/uploads/asset_img/","asset_breakdwon_insepction_img_path":"http://zrcuat.sysmatech.com/public/uploads/asset_img/","BearerToken":"eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiI3IiwianRpIjoiYTc1M2I5ZjRkYzU1YmVjYzg5Y2IwNjA1ZWI2YjBmN2Y3Nzc0OTE1Y2I5OGY4NDJjN2MxNWZjN2YxYjdlMTE4NzdmOGQwOWFkMWQ0MzQ1YjYiLCJpYXQiOjE2Njk5ODU2NzksIm5iZiI6MTY2OTk4NTY3OSwiZXhwIjoyMTQzMzcxMjc5LCJzdWIiOiIxIiwic2NvcGVzIjpbXX0.K6slhPWYOXHevKHdPgijN8urY7j5WNi1rCfLd3k84XQ3y4P9wSlrz_l8Qx7XQw4xM2DuuW5n0NwvZqsI_dbmYRuPbIfqXVWbgk1BiwjS4_7Bwnx9b1oQTMmbRoruFsWNuwiZshx7iL_Tl4M9-xkcZmZ8jX1vt_0WH-P8NgNiXWDqjc9SQbO-C2-WcRIB1YZrxYrNPTDK71-rdDGDvM86HkqnFZ00zrHykY4G2nXHfqTNgFkFciPNwx6ClZ9JlMSa5m6X_7MkZTEqptXvepX7gl2pbR-qsbUSFAf1z1BkwlBmCsc6gk3sdmq2YbDciz2MepMFjkzOwf8nz2tMrMowMW-cjJ0w3CAMLXQIlqJ4Lzn5W9nQfa8JACi9a1SjsD9Jgf8Vu3-tszSATsgtYrV8MH_wmI0wafk4DPYfMuVa2DcnDx-kXxvi7GkjAeNkzIyISKcsvIOA8H2lpoDtSP13S7lg9KdKYM9QVspGEiRCPrJ48lCy-sqLhpndSsYJQOkqsoM-h7OLBJUVciVDEFCr3VlPb77UOTp2WG0fqrgMs1qKAYfv2UzCKyhCPe0JOQ7LHS0Pdl2Zba0mc5guIdYDHgnywc8IZiw5erCNBIWs6bexLLPKy4Nz9v-YHIHvAfigTqyMvT1pjAmqcENSCKyvi6Ynx1DfNF1TAcXteT3nKyA","audit_param_audio_path":"http://zrcuat.sysmatech.com/public/uploads/audio/"},{"user_id":"3","user_full_name":"Goonjan Tanna","company_id":"1","company_name":"ZRC","domain_name":"https://zrclive.sysmatech.com/api/v1/","asset_img_path":"https://zrclive.sysmatech.com/uploads/assets/","asset_insepction_img_path":"https://zrclive.sysmatech.com/uploads/asset_img/","asset_breakdwon_insepction_img_path":"https://zrclive.sysmatech.com/uploads/breadkdown_asset_img/","BearerToken":"eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiI1IiwianRpIjoiM2VhODljYWE4YzdjMWQ2YTgyNjAyYmE1MjA1NzI2NDQ0MmZiNTNhNjczMDU4Zjg1MTIyYTVjMmU0YzA0YWVlNzBkMjdjMDNlMWM1MjBmNjUiLCJpYXQiOjE2NjgxNDgxMzEsIm5iZiI6MTY2ODE0ODEzMSwiZXhwIjoyMTQxNTMzNzMxLCJzdWIiOiIxIiwic2NvcGVzIjpbXX0.ITj6NaujUQSBjUyNssb9eakuXSiqQaGqRbrCWywp0yLykiZCVOllVpM1zIi5R6H218sa8uPY8TKVhn32nIvoAHfBmBl4qnBvrmnuJVHkVSfYC6qqBBuU3bXRw6kK5e7IhDtORJcHNxuEXpz8uu8DjsbMln2fnz6rxuI7af7579-cyyfvkBP-GMU9-wecV2jaiyXZHIy1B_N6DKQ7IakQ-X96F2qNU1hNEYpWQDu756DI17LN-GQ6GeHK5JAaWY3Vc52a3pDdJpDFk7-eFLBomOKok5rQO4TUoLxa4_rUAblGASNNXYijtXYGntjyiw_ma2UDfoavZ4s0G_o3x86Mq3Wx-o9xIUGGPU4bqLFNX7APdezSmULEnnH7LDuJlrFN1wBP49gWFxs6q7I3s44XveLtHQEc_nrlhkkju_VYIOBGjsxTiXGOoRuFBUaJ4rXHsP4sWCNDwohugzaW1REk35gEDYBKX4toxGPi6QN0WK109IaLEufU8o8hct8-2OoIPRFkIv9IE--lqqYMXogxJ_F6bVjzsIONZ3xBGrWXzyQ8JBbvbpxKKbe1ZDooA8qFN7s_DqdRmOS88x7WZi6r5raVHKycpMGkmcNwo2VjMEiHC4nVA_AEEB9L457Z83-GO2KMiRWejesVZrGrZPWE2muA0gnq2NPGLaqy-gfIn9s","audit_param_audio_path":"https://zrclive.sysmatech.com/uploads/audio/"}]
/// debug_logs : null

Companies companiesFromJson(String str) => Companies.fromJson(json.decode(str));
String companiesToJson(Companies data) => json.encode(data.toJson());
class Companies {
  Companies({
      this.apiStatus, 
      this.total, 
      this.apiMessage, 
      this.data, 
      this.debugLogs,});

  Companies.fromJson(dynamic json) {
    apiStatus = json['api_status'];
    total = json['total'];
    apiMessage = json['api_message'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(CompanyResults.fromJson(v));
      });
    }
    debugLogs = json['debug_logs'];
  }
  num? apiStatus;
  num? total;
  String? apiMessage;
  List<CompanyResults>? data;
  dynamic debugLogs;
Companies copyWith({  num? apiStatus,
  num? total,
  String? apiMessage,
  List<CompanyResults>? data,
  dynamic debugLogs,
}) => Companies(  apiStatus: apiStatus ?? this.apiStatus,
  total: total ?? this.total,
  apiMessage: apiMessage ?? this.apiMessage,
  data: data ?? this.data,
  debugLogs: debugLogs ?? this.debugLogs,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['api_status'] = apiStatus;
    map['total'] = total;
    map['api_message'] = apiMessage;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    map['debug_logs'] = debugLogs;
    return map;
  }

}

/// user_id : "38"
/// user_full_name : "Kamlesh Vyas"
/// company_id : "3"
/// company_name : "Zydus ZRC"
/// domain_name : "https://staging.sysmatech.com/zydus/public/api/zydus/"
/// asset_img_path : "https://staging.sysmatech.com/zydus/public/uploads/assets/"
/// asset_insepction_img_path : "https://staging.sysmatech.com/zydus/public/asset_img/"
/// asset_breakdwon_insepction_img_path : "https://staging.sysmatech.com/zydus/public/uploads/asset_img/"
/// BearerToken : "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiY2U3ZTQ3OGU5NjMzMjRiNDVlMjgyZTI0N2U2MjAyNWQzZTY1NTdkNjgwMjcwMzA4MDA5MWYwMWE4MDM3MDcwMDU4OTEyZWJiZDg3MmJhZDkiLCJpYXQiOjE2NTU0NzMxMDgsIm5iZiI6MTY1NTQ3MzEwOCwiZXhwIjoyMTI4ODU4NzA4LCJzdWIiOiIxIiwic2NvcGVzIjpbXX0.DzUN-wBQFlZG22ufwXDRWlfaH-CchTToDtGLzYkJ6KVAOL0Bapr69EcHuRERXaIunEnAdtqFXIFw7MXlpmWi6RrDfnV_SJb8YMT1fFjCSbESPv39bMrDjDvBNukjcaTNn3yKL15hA82ph16G8rVxw3NCETUFwY2wE2A3oemQNIWJAY7VNU5TCWhmuuR3SxqpnNdQ_a4X9prnRvxpS7WE-17DcEar1Pu7DTwKQRh43L2K-60c0tsIjfM0vFdEltafRNxBSUbXGy5b8gIGnXd_tuPJgZ5sUjikC-uEuxJ5dfUHFzPMoWmhJX7a6yDbVx69HlB8K8PWHayox11GlBGl9mknIm7Fe5eWbQ-o0WMEHpZPLliymK0kxNRgB_eAbi8krIdSi-1ztY-5I-DmzP17pUDPrGnbGVSD2B9ZwoubmFF9ILJXYAhsGJRCtnvje_NxC0wkD-vihILh4i2cDDYqOh2M52WQZ6DGIiTp5wsn0me1nm11DSGbcPepaC4iCatYd4-y3R4SY4It6n6E3CvRlq0GVQXoboyJWIfIL0VymebMegFD3HRq6nl_0DT6-W2Bu6I8efjZtXiN8-yJ4Det0r5xKHJRf5nXiEHnm4M2oyVeDeYJWtWl9aIuFObiUqVnSiEqWAEn3_nNwT3LNMv_X6oLdIADcNdzk0xZdXfPlug"
/// audit_param_audio_path : null

CompanyResults dataFromJson(String str) => CompanyResults.fromJson(json.decode(str));
String dataToJson(CompanyResults data) => json.encode(data.toJson());
class CompanyResults {
  CompanyResults({
      this.userId, 
      this.userFullName, 
      this.companyId, 
      this.companyName, 
      this.domainName, 
      this.assetImgPath, 
      this.assetInsepctionImgPath, 
      this.assetBreakdwonInsepctionImgPath, 
      this.bearerToken, 
      this.auditParamAudioPath,});

  CompanyResults.fromJson(dynamic json) {
    userId = json['user_id'];
    userFullName = json['user_full_name'];
    companyId = json['company_id'];
    companyName = json['company_name'];
    domainName = json['domain_name'];
    assetImgPath = json['asset_img_path'];
    assetInsepctionImgPath = json['asset_insepction_img_path'];
    assetBreakdwonInsepctionImgPath = json['asset_breakdwon_insepction_img_path'];
    bearerToken = json['BearerToken'];
    auditParamAudioPath = json['audit_param_audio_path'];
  }
  String? userId;
  String? userFullName;
  String? companyId;
  String? companyName;
  String? domainName;
  String? assetImgPath;
  String? assetInsepctionImgPath;
  String? assetBreakdwonInsepctionImgPath;
  String? bearerToken;
  dynamic auditParamAudioPath;
CompanyResults copyWith({  String? userId,
  String? userFullName,
  String? companyId,
  String? companyName,
  String? domainName,
  String? assetImgPath,
  String? assetInsepctionImgPath,
  String? assetBreakdwonInsepctionImgPath,
  String? bearerToken,
  dynamic auditParamAudioPath,
}) => CompanyResults(  userId: userId ?? this.userId,
  userFullName: userFullName ?? this.userFullName,
  companyId: companyId ?? this.companyId,
  companyName: companyName ?? this.companyName,
  domainName: domainName ?? this.domainName,
  assetImgPath: assetImgPath ?? this.assetImgPath,
  assetInsepctionImgPath: assetInsepctionImgPath ?? this.assetInsepctionImgPath,
  assetBreakdwonInsepctionImgPath: assetBreakdwonInsepctionImgPath ?? this.assetBreakdwonInsepctionImgPath,
  bearerToken: bearerToken ?? this.bearerToken,
  auditParamAudioPath: auditParamAudioPath ?? this.auditParamAudioPath,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['user_id'] = userId;
    map['user_full_name'] = userFullName;
    map['company_id'] = companyId;
    map['company_name'] = companyName;
    map['domain_name'] = domainName;
    map['asset_img_path'] = assetImgPath;
    map['asset_insepction_img_path'] = assetInsepctionImgPath;
    map['asset_breakdwon_insepction_img_path'] = assetBreakdwonInsepctionImgPath;
    map['BearerToken'] = bearerToken;
    map['audit_param_audio_path'] = auditParamAudioPath;
    return map;
  }

}