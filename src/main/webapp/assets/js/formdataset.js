function SetEmployeeData(res)
{
	$("#inputBranch").val(res.RESPONSE[0].BRANCH_CD);
	$("#inputEmpid").val(res.RESPONSE[0].EMP_ID);
	$("#inputentrydt").val(res.RESPONSE[0].ENTRY_DT);
	$("#inputActiveStatus").val(res.RESPONSE[0].ACTIVE_STATUS);
	$("#inactivedt").val(res.RESPONSE[0].INACTIVE_DT);
	$("#firstname").val(res.RESPONSE[0].FIRST_NM);
	$("#middelname").val(res.RESPONSE[0].MIDDLE_NM);//MIDDEL_NM
	$("#lastname").val(res.RESPONSE[0].LAST_NM);
	$("#email").val(res.RESPONSE[0].EMIAL_ID);//EMAIL_ID
	$("#birthdt").val(res.RESPONSE[0].BIRTH_DT);
	$("#inputReligion").val(res.RESPONSE[0].RELIGION_CD);
	$("#inputGender").val(res.RESPONSE[0].GENDER);
	$("#inputBloodgroup").val(res.RESPONSE[0].BLOOD_GROUP);
	$("#inputMaritalStatus").val(res.RESPONSE[0].MARRITAL_STATUS);
	$("#inputEducation").val(res.RESPONSE[0].HIGHEST_EDU);
	$("#inputAadhar").val(res.RESPONSE[0].UNIQUE_ID);
	$("#inputPancard").val(res.RESPONSE[0].PAN_NO);
	$("#inputRefEmpid").val(res.RESPONSE[0].REF_EMP_ID);
	$("#inputRefRemarks").val(res.RESPONSE[0].REF_REMARKS);
	$("#inputempRemarks").val(res.RESPONSE[0].REMARKS);
	$("#inputPrimaryContact").val(res.RESPONSE[0].PRIMARY_CONTACT);
	if(res.RESPONSE[0].SECONDARY_CONTACT == "0")
		$("#inputSecondaryContact").val("");
	else
		$("#inputSecondaryContact").val(res.RESPONSE[0].SECONDARY_CONTACT);
	$("#inputResumeBase64").val(res.RESPONSE[0].RESUME);
	$("#inputConfirmDate").val(res.RESPONSE[0].CONFIRMATION_DT);
	$("#inputJoinDate").val(res.RESPONSE[0].JOINIG_DT);
	$("#inputActive").val(res.RESPONSE[0].ACTIVE);
	$("#inputRetirementdate").val(res.RESPONSE[0].RETIREMENT_DT);
	$("#inputLeavingDate").val(res.RESPONSE[0].LEAVING_DT);
	$("#inputGrade").val(res.RESPONSE[0].GRADE_CD);
	$("#inputDepartment").val(res.RESPONSE[0].DEPARTMENT_ID);
	$("#inputDesignation").val(res.RESPONSE[0].DESIGNATION_ID);
	$("#inputSalaryAmount").val(res.RESPONSE[0].SALARY_AMOUNT);
	$("#inputReasonRemarks").val(res.RESPONSE[0].LEAVING_REASON);
	$("#inputRemarks").val(res.RESPONSE[0].COMP_REMARKS);
	$("#inputContract").val(res.RESPONSE[0].CONTRACT_APPLICABLE);
	$("#inputContactType").val(res.RESPONSE[0].CONTRACT_TYPE);
	$("#inputContactSignDate").val(res.RESPONSE[0].CONTRACT_SIGNED_DATE);
	$("#inputPerAddress1").val(res.RESPONSE[0].PER_ADD_LINE_1);
	$("#inputPerAddress2").val(res.RESPONSE[0].PER_ADD_LINE_2);
	$("#inputPerAddress3").val(res.RESPONSE[0].PER_ADD_LINE_3);
	$("#inputPerCountry").val(res.RESPONSE[0].PER_COUNTRY_CD);
	$("#inputPerState").val(res.RESPONSE[0].PER_STATE_CD);
	$("#inputPerCity").val(res.RESPONSE[0].PER_CITY_CD);
	$("#inputPerPincode").val(res.RESPONSE[0].PER_PIN_CODE);
	$("#inputTempAddress1").val(res.RESPONSE[0].TEMP_ADD_LINE_1);
	$("#inputTempAddress2").val(res.RESPONSE[0].TEMP_ADD_LINE_2);
	$("#inputTempAddress3").val(res.RESPONSE[0].TEMP_ADD_LINE_3);
	$("#inputTempCountry").val(res.RESPONSE[0].TEMP_COUNTRY_CD);
	$("#inputTempState").val(res.RESPONSE[0].TEMP_STATE_CD);
	$("#inputTempCity").val(res.RESPONSE[0].TEMP_CITY_CD);
	$("#inputTempPincode").val(res.RESPONSE[0].TEMP_PIN_CODE);
	$("#inputSwift").val(res.RESPONSE[0].SHIFT_ID);
}
function SetEmployeeListData(res)
{
	$("#inputDesignation").val(res.RESPONSE[0].DESIGNATION_ID);
	$("#inputPerState").val(res.RESPONSE[0].PER_STATE_CD);
	$("#inputTempState").val(res.RESPONSE[0].TEMP_STATE_CD);
	$("#inputPerCity").val(res.RESPONSE[0].PER_CITY_CD);
	$("#inputTempCity").val(res.RESPONSE[0].TEMP_CITY_CD);
	$("#inputContactType").val(res.RESPONSE[0].CONTRACT_TYPE);
}
function SetUserData(res)
{
	$("#inputActiveStatus").val(res.RESPONSE[0].ACTIVE_STATUS);
	$("#inputBlockDate").val(res.RESPONSE[0].BLOCKED_DATE);
	$("#inputBlockStatus").val(res.RESPONSE[0].BLOCK_STATUS);
	$("#inputContact").val(res.RESPONSE[0].CONTACT1);
	$("#inputEmailID").val(res.RESPONSE[0].EMAIL);
	$("#inputEmpId").val(res.RESPONSE[0].REF_ID);
	$("#inputInactiveDate").val(res.RESPONSE[0].INACTIVE_DATE);
	$("#inputUserId").val(res.RESPONSE[0].USER_ID);
	$("#inputUserType").val(res.RESPONSE[0].USER_LEVEL_CD);
	$("#inputPassword").val("H%24m@Mh");
	$("#inputConfirmPass").val("H%24m@Mh");
}
function SetContractData(res)
{
	$("#inputStartDt").val(res.RESPONSE[0].CON_START_DT);
	$("#inputInactiveDt").val(res.RESPONSE[0].CONTRACT_INACTIVE_DT);
	$("#inputContractStatus").val(res.RESPONSE[0].CONTRACT_STATUS);
	$("#inputContraTypeId").val(res.RESPONSE[0].ID);
	$("#inputEndDt").val(res.RESPONSE[0].CON_END_DT);
	$("#inputSalaryTemp").val(res.RESPONSE[0].SALARY_TEMP_CD);
	$("#inputContractName").val(res.RESPONSE[0].NAME);
}
function SetInsuranceData(res)
{
	$("#InsuranceId").val(res.RESPONSE[0].INSU_ID);
	$("#InsuranceName").val(res.RESPONSE[0].INSU_NAME);
	$("#InsuranceType").val(res.RESPONSE[0].INSU_TYPE);
	$("#InsuranceCustNo").val(res.RESPONSE[0].INSU_CUST_NO);
	$("#InsurancePre").val(res.RESPONSE[0].INSU_PREMIUM);
	$("#inputInsuranceStatus").val(res.RESPONSE[0].INSU_STATUS);
	$("#inputInactiveDt").val(res.RESPONSE[0].INSU_INACTIVE_DT);
	$("#inputStartDt").val(res.RESPONSE[0].INSU_START_DT);
	$("#inputEnddate").val(res.RESPONSE[0].INSU_END_DT);
	$("#InsuranceAgency").val(res.RESPONSE[0].INSU_AGENCY);
	$("#InsuranceAgencyId").val(res.RESPONSE[0].INSU_AGENCY_ID);
}
function SetShiftData(res){
	$("#shiftId").val(res.RESPONSE[0].SHIFT_ID);
	$("#shiftname").val(res.RESPONSE[0].SHIFT_NAME);
	$("#inputStartDt").val(res.RESPONSE[0].SHIFT_START_TIME);
	$("#inputEndDt").val(res.RESPONSE[0].SHIFT_END_TIME);
	$("#inputStatus").val(res.RESPONSE[0].SHIFT_STATUS);
	$("#inputInactiveDt").val(res.RESPONSE[0].SHIFT_INACTIVE_DT);
	$("#inputremarks").val(res.RESPONSE[0].REMARKS);
}
function SetDesignationData(res){
	$("#designationId").val(res.RESPONSE[0].DESIG_ID);
	$("#desginationName").val(res.RESPONSE[0].NAME);
	$("#department").val(res.RESPONSE[0].DEPART_ID);
	$("#inputStatus").val(res.RESPONSE[0].ACTIVE_STATUS);
	$("#inputInactiveDt").val(res.RESPONSE[0].INACTIVE_DT);
}
function SetGradeData(res){
	$("#gradeId").val(res.RESPONSE[0].ID);
	$("#gradeName").val(res.RESPONSE[0].NAME);
	$("#inputStatus").val(res.RESPONSE[0].ACTIVE_STATUS);
	$("#inputInactiveDt").val(res.RESPONSE[0].GRADE_INACTIVE_DT);
}//
function SetDepartmentData(res){
	$("#departmentId").val(res.RESPONSE[0].DEPART_ID);
	$("#departmentName").val(res.RESPONSE[0].NAME);
	$("#inputStatus").val(res.RESPONSE[0].ACTIVE_STATUS);
	$("#inputInactiveDt").val(res.RESPONSE[0].GRADE_INACTIVE_DT);
}
function SetBranchData(res)
{
	$("#branchId").val(res.RESPONSE[0].BRANCH_CD);
	$("#branchName").val(res.RESPONSE[0].BRANCH_NM);
	$("#openingDate").val(res.RESPONSE[0].BRANCH_OPENING_DT);
	$("#branchManagerName").val(res.RESPONSE[0].BRANCH_MANAGER);
	$("#banchContact").val(res.RESPONSE[0].BRANCH_CONTACT);
	$("#branchEmail").val(res.RESPONSE[0].BRANCH_EMAIL);
	$("#contactperson").val(res.RESPONSE[0].CONTACT_PERSON);
	$("#ADD_1").val(res.RESPONSE[0].ADDRESS_1);
	$("#ADD_2").val(res.RESPONSE[0].ADDRESS_2);
	$("#ADD_3").val(res.RESPONSE[0].ADDRESS_3);
	$("#inputCountry").val(res.RESPONSE[0].CONTRAY_CD);
	$("#inputState").val(res.RESPONSE[0].STATE_CD);
	$("#inputCity").val(res.RESPONSE[0].CITY_CD);
	$("#inputPincode").val(res.RESPONSE[0].PIN_CODE);
	$("#inputStatus").val(res.RESPONSE[0].ACTIVE_STATUS);
	$("#inputInactiveDt").val(res.RESPONSE[0].INACTIVE_DATE);
	$("#inceptionDate").val(res.RESPONSE[0].INACTIVE_DT);
}
