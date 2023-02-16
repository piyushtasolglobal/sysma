class Workorder3 {
  int? total;
  List<Rows>? rows;

  Workorder3({
    total,
    rows,
    ticketId,
    title,
    due_date,
    description,
    priority_id,
    priority,
    category_id,
    category,
    assignee_id,
    assignee_name,
    status_id,
    status_text,
    asset_id,
    asset_name,
    asset_working_status,
    location,
    created_at,
    updated_at,

  });

  Workorder3.fromJson(Map<String, dynamic> json)
  {
    total = json['total'];
    if (json['rows'] != null) {
      rows = <Rows>[];
      json['rows'].forEach((v) {
        rows!.add(new Rows.fromJson(v));
      });
    }
  }


  List<Rows>? get totalrows => rows;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    if (this.rows != null) {
      data['rows'] = this.rows!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Rows {
  int? id;
  String? ticketId;
  String? title;
  DueDate? dueDate;
  String? description;
  String? priority;
  String? category;
  String? location;
  String? creator;
  String? creatorUrl;
  String? assignee;
  List<String>? supportee;
  String? status;
  String? priorityId;
  String? rejectionComment;
  SelectedCategory? selectedCategory;
  List<SelectedInspectables>? selectedInspectables;
  SelectedCategory? selectedAssignee;
  List<SelectedSupportees>? selectedSupportees;
  List<SelectedCauses>? selectedCauses;
  SelectedCategory? selectedLocation;
  SelectedCategory? selectedStatus;
  List<Media>? media;
  Checklist? checklist;
  CreatedAt? createdAt;
  CreatedAt? updatedAt;
  AvailableActions? availableActions;

  Rows(
      {this.id,
        this.ticketId,
        this.title,
        this.dueDate,
        this.description,
        this.priority,
        this.category,
        this.location,
        this.creator,
        this.creatorUrl,
        this.assignee,
        this.supportee,
        this.status,
        this.priorityId,
        this.rejectionComment,
        this.selectedCategory,
        this.selectedInspectables,
        this.selectedAssignee,
        this.selectedSupportees,
        this.selectedCauses,
        this.selectedLocation,
        this.selectedStatus,
        this.media,
        this.checklist,
        this.createdAt,
        this.updatedAt,
        this.availableActions});

  Rows.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    ticketId = json['ticket_id'];
    title = json['title'];
    dueDate = json['due_date'] != null
        ? new DueDate.fromJson(json['due_date'])
        : null;
    description = json['description'];
    priority = json['priority'];
    category = json['category'];
    location = json['location'];
    creator = json['creator'];
    creatorUrl = json['creator_url'];
    assignee = json['assignee'];
    supportee = json['supportee'].cast<String>();
    status = json['status'];
    priorityId = json['priority_id'];
    rejectionComment = json['rejection_comment'];
    selectedCategory = json['selected_category'] != null
        ? new SelectedCategory.fromJson(json['selected_category'])
        : null;
    if (json['selected_inspectables'] != null) {
      selectedInspectables = <SelectedInspectables>[];
      json['selected_inspectables'].forEach((v) {
        selectedInspectables!.add(new SelectedInspectables.fromJson(v));
      });
    }
    selectedAssignee = json['selected_assignee'] != null
        ? new SelectedCategory.fromJson(json['selected_assignee'])
        : null;
    if (json['selected_supportees'] != null) {
      selectedSupportees = <SelectedSupportees>[];
      json['selected_supportees'].forEach((v) {
        selectedSupportees!.add(new SelectedSupportees.fromJson(v));
      });
    }
    if (json['selected_causes'] != null) {
      selectedCauses = <SelectedCauses>[];
      json['selected_causes'].forEach((v) {
        selectedCauses!.add(new SelectedCauses.fromJson(v));
      });
    }
    selectedLocation = json['selected_location'] != null
        ? new SelectedCategory.fromJson(json['selected_location'])
        : null;
    selectedStatus = json['selected_status'] != null
        ? new SelectedCategory.fromJson(json['selected_status'])
        : null;
    if (json['media'] != null) {
      media = <Media>[];
      json['media'].forEach((v) {
        media!.add(new Media.fromJson(v));
      });
    }
    checklist = json['checklist'] != null
        ? new Checklist.fromJson(json['checklist'])
        : null;
    createdAt = json['created_at'] != null
        ? new CreatedAt.fromJson(json['created_at'])
        : null;
    updatedAt = json['updated_at'] != null
        ? new CreatedAt.fromJson(json['updated_at'])
        : null;
    availableActions = json['available_actions'] != null
        ? new AvailableActions.fromJson(json['available_actions'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['ticket_id'] = this.ticketId;
    data['title'] = this.title;
    if (this.dueDate != null) {
      data['due_date'] = this.dueDate!.toJson();
    }
    data['description'] = this.description;
    data['priority'] = this.priority;
    data['category'] = this.category;
    data['location'] = this.location;
    data['creator'] = this.creator;
    data['creator_url'] = this.creatorUrl;
    data['assignee'] = this.assignee;
    data['supportee'] = this.supportee;
    data['status'] = this.status;
    data['priority_id'] = this.priorityId;
    data['rejection_comment'] = this.rejectionComment;
    if (this.selectedCategory != null) {
      data['selected_category'] = this.selectedCategory!.toJson();
    }
    if (this.selectedInspectables != null) {
      data['selected_inspectables'] =
          this.selectedInspectables!.map((v) => v.toJson()).toList();
    }
    if (this.selectedAssignee != null) {
      data['selected_assignee'] = this.selectedAssignee!.toJson();
    }
    if (this.selectedSupportees != null) {
      data['selected_supportees'] =
          this.selectedSupportees!.map((v) => v.toJson()).toList();
    }
    if (this.selectedCauses != null) {
      data['selected_causes'] =
          this.selectedCauses!.map((v) => v.toJson()).toList();
    }
    if (this.selectedLocation != null) {
      data['selected_location'] = this.selectedLocation!.toJson();
    }
    if (this.selectedStatus != null) {
      data['selected_status'] = this.selectedStatus!.toJson();
    }
    if (this.media != null) {
      data['media'] = this.media!.map((v) => v.toJson()).toList();
    }
    if (this.checklist != null) {
      data['checklist'] = this.checklist!.toJson();
    }
    if (this.createdAt != null) {
      data['created_at'] = this.createdAt!.toJson();
    }
    if (this.updatedAt != null) {
      data['updated_at'] = this.updatedAt!.toJson();
    }
    if (this.availableActions != null) {
      data['available_actions'] = this.availableActions!.toJson();
    }
    return data;
  }

}

class SelectedSupportees {
  String ? id;
  String ? name;

  SelectedSupportees({this.id,  this.name});

  SelectedSupportees.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;

    return data;
  }
}


class DueDate {
  String? diffForHuman;
  String? date;
  String? formatted;

  DueDate({this.diffForHuman, this.date, this.formatted});

  DueDate.fromJson(Map<String, dynamic> json) {
    diffForHuman = json['diff_for_human'];
    date = json['date'];
    formatted = json['formatted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['diff_for_human'] = this.diffForHuman;
    data['date'] = this.date;
    data['formatted'] = this.formatted;
    return data;
  }
}

class SelectedCategory {
  String? id;
  String? text;

  SelectedCategory({this.id, this.text});

  SelectedCategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['text'] = this.text;
    return data;
  }
}

class SelectedInspectables {
  String? id;
  String? text;
  String? displayText;
  String? linkUrl;
  int? workingStatus;

  SelectedInspectables(
      {this.id, this.text, this.displayText, this.linkUrl, this.workingStatus});

  SelectedInspectables.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    text = json['text'];
    displayText = json['display_text'];
    linkUrl = json['link_url'];
    workingStatus = json['working_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['text'] = this.text;
    data['display_text'] = this.displayText;
    data['link_url'] = this.linkUrl;
    data['working_status'] = this.workingStatus;
    return data;
  }
}

class SelectedCauses {
  int? id;
  String? text;
  String? causeName;

  SelectedCauses({this.id, this.text, this.causeName});

  SelectedCauses.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    text = json['text'];
    causeName = json['cause_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['text'] = this.text;
    data['cause_name'] = this.causeName;
    return data;
  }
}

class Media {
  int? id;
  String? name;
  String? url;
  String? size;
  CreatedAt? createdAt;
  int? woId;

  Media({this.id, this.name, this.url, this.size, this.createdAt, this.woId});

  Media.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    url = json['url'];
    size = json['size'];
    createdAt = json['created_at'] != null
        ? new CreatedAt.fromJson(json['created_at'])
        : null;
    woId = json['wo_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['url'] = this.url;
    data['size'] = this.size;
    if (this.createdAt != null) {
      data['created_at'] = this.createdAt!.toJson();
    }
    data['wo_id'] = this.woId;
    return data;
  }
}




class CreatedAt {
  String? diffForHuman;
  String? datetime;
  String? formatted;

  CreatedAt({this.diffForHuman, this.datetime, this.formatted});

  CreatedAt.fromJson(Map<String, dynamic> json) {
    diffForHuman = json['diff_for_human'];
    datetime = json['datetime'];
    formatted = json['formatted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['diff_for_human'] = this.diffForHuman;
    data['datetime'] = this.datetime;
    data['formatted'] = this.formatted;
    return data;
  }
}

class Checklist {
  int? auditParamsId;
  String? auditParamsName;
  String? status;
  List<Parameters>? parameters;

  Checklist(
      {this.auditParamsId, this.auditParamsName, this.status, this.parameters});

  Checklist.fromJson(Map<String, dynamic> json) {
    auditParamsId = json['audit_params_id'];
    auditParamsName = json['audit_params_name'];
    status = json['status'];
    if (json['parameters'] != null) {
      parameters = <Parameters>[];
      json['parameters'].forEach((v) {
        parameters!.add(new Parameters.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['audit_params_id'] = this.auditParamsId;
    data['audit_params_name'] = this.auditParamsName;
    data['status'] = this.status;
    if (this.parameters != null) {
      data['parameters'] = this.parameters!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Parameters {
  int? id;
  String? paramDispName;
  String? paramType;
  bool? isInspected;
  ParamConfig? paramConfig;

  Parameters(
      {this.id,
        this.paramDispName,
        this.paramType,
        this.isInspected,
        this.paramConfig});

  Parameters.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    paramDispName = json['param_disp_name'];
    paramType = json['param_type'];
    isInspected = json['is_inspected'];
    paramConfig = json['param_config'] != null
        ? new ParamConfig.fromJson(json['param_config'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['param_disp_name'] = this.paramDispName;
    data['param_type'] = this.paramType;
    data['is_inspected'] = this.isInspected;
    if (this.paramConfig != null) {
      data['param_config'] = this.paramConfig!.toJson();
    }
    return data;
  }
}

class ParamConfig {
  String? benchmarkRangeLow;
  String? benchmarkRangeHigh;
  String? dropdownValuesAcceptPhotosValidation;
  String? dropdownValuesAcceptCommentValidation;
  String? dropdownValuesRejectPhotosValidation;
  String? dropdownValuesRejectCommentValidation;

  ParamConfig(
      {this.benchmarkRangeLow,
        this.benchmarkRangeHigh,
        this.dropdownValuesAcceptPhotosValidation,
        this.dropdownValuesAcceptCommentValidation,
        this.dropdownValuesRejectPhotosValidation,
        this.dropdownValuesRejectCommentValidation});

  ParamConfig.fromJson(Map<String, dynamic> json) {
    benchmarkRangeLow = json['benchmark_range_low'];
    benchmarkRangeHigh = json['benchmark_range_high'];
    dropdownValuesAcceptPhotosValidation =
    json['dropdown_values_accept_photos_validation'];
    dropdownValuesAcceptCommentValidation =
    json['dropdown_values_accept_comment_validation'];
    dropdownValuesRejectPhotosValidation =
    json['dropdown_values_reject_photos_validation'];
    dropdownValuesRejectCommentValidation =
    json['dropdown_values_reject_comment_validation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['benchmark_range_low'] = this.benchmarkRangeLow;
    data['benchmark_range_high'] = this.benchmarkRangeHigh;
    data['dropdown_values_accept_photos_validation'] =
        this.dropdownValuesAcceptPhotosValidation;
    data['dropdown_values_accept_comment_validation'] =
        this.dropdownValuesAcceptCommentValidation;
    data['dropdown_values_reject_photos_validation'] =
        this.dropdownValuesRejectPhotosValidation;
    data['dropdown_values_reject_comment_validation'] =
        this.dropdownValuesRejectCommentValidation;
    return data;
  }
}

class AvailableActions {
  bool? update;
  bool? delete;
  bool? acceptReject;

  AvailableActions({this.update, this.delete, this.acceptReject});

  AvailableActions.fromJson(Map<String, dynamic> json) {
    update = json['update'];
    delete = json['delete'];
    acceptReject = json['accept_reject'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['update'] = this.update;
    data['delete'] = this.delete;
    data['accept_reject'] = this.acceptReject;
    return data;
  }
}
