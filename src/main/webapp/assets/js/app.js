
function Emp_Registartion()
{
	var form_1;
	var form_2;
	var form_3;
	var form_4;
	var main_reg;
	var myform1 = $('#emp_registartion');
	var myform2 = $('#emp_registartion2');
	var myform3 = $('#emp_registartion3');
	var myform4 = $('#emp_registartion4');
	
	$("form[name='emp_registartion']").validate({
		rules: {
			inputEmpid : {
				required : true,
				number : true,
				checkempid : true
			},
			firstname : {
				required: true
			},
			middelname  : {
				required : true
			},
			lastname  : {
				required : true
			},
			email : {
				required : true,
				email: true
			},
			birthdt  : {
				required : true
			},
			inputReligion : {
				required : true
			},
			inputGender : {
				required : true
			},
			inputBloodgroup : {
				required : true
			},
			inputMaritalStatus : {
				required : true
			},
			inputEducation : {
				required : true
			},
			inputAadhar : {
				minlength: 12,
				number : true
			},
			inputPancard : {
				minlength: 10,
			},
			inputRefEmpid : {
				number : true
			},
			inputPrimaryContact : {
				required : true,
				number : true,
				minlength: 10
			},
			inputSecondaryContact : {
				number : true,
				minlength: 10
			}
			
		},
		messages : {
			inputAadhar : {
				minlength : "Please Enter valid Aadhar Number.",
				number : "Please Enter valid Aadhar Number."
			},
			inputPancard : {
				minlength : "Please Enter valid Pan Number."
			},
			inputEmpid : {
				number : "Please enter valid employee id."
			},
			inputRefEmpid : {
				number : "Please enter valid Ref. employee id."
			},
			inputPrimaryContact : {
				number : "Please enter Valid Contact Number.",
				minlength : "Please enter Valid Contact Number."
			},
			inputSecondaryContact : {
				number : "Please enter Valid Contact Number.",
				minlength : "Please enter Valid Contact Number."
			}
		},
		ignore: ""
	});
	
	$("form[name='emp_registartion2']").validate({
		rules: {
			inputPerAddress1 : {
				required : true
			},
			inputPerCountry : {
				required : true
			},
			inputPerState : {
				required : true
			},
			inputPerCity : {
				required : true
			},
			inputPerPincode : {
				required : true,
				number : true,
				minlength : 6
			},
			inputTempAddress1 : {
				required : true
			},
			inputTempCountry : {
				required : true
			},
			inputTempState : {
				required : true
			},
			inputTempCity : {
				required : true
			},
			inputTempPincode : {
				required : true,
				number : true,
				minlength : 6
			}
		},
		message : {
			inputPerPincode : {
				number : "Please enter valid Pin code.",
				minlength : "Please enter valid Pin code."
			},
			inputTempPincode : {
				number : "Please enter valid Pin code.",
				minlength : "Please enter valid Pin code."
			}
		},
		ignore: ""
	
	});
	jQuery.validator.addMethod("inputContractDepend", function(value, element) {
		if($("#inputContract").val() == "Y"){
			if(value==null || value=="")
			{
				return false;
			}else{
				return true;
			}
		}else{
			return true;
		}
	}, "This field is required.");
	$("form[name='emp_registartion3']").validate({
		rules: {
			inputConfirmDate : {
				required : true
			},
			inputJoinDate : {
				required : true
			},
			inputGrade : {
				required : true
			},
			inputDepartment : {
				required : true
			},
			inputDesignation : {
				required : true
			},
			inputSalaryAmount : {
				required : true,
				maxlength : 14
			},
			inputBranch : {
				required : true
			},
			inputContract : {
				required : true
			},
			inputContactType : {
				inputContractDepend : true
			},
			inputContactSignDate : {
				inputContractDepend : true
			}
		},
		ignore: ""
	
	});
	
	if(myform1.valid())
	{
		if(myform2.valid())
		{
			if(myform3.valid())
			{
				if(myform4.valid())
				{
					var disabled1 = myform1.find(':input:disabled').removeAttr('disabled');
					var disabled2 = myform2.find(':input:disabled').removeAttr('disabled');
					var disabled3 = myform3.find(':input:disabled').removeAttr('disabled');
					var disabled4 = myform4.find(':input:disabled').removeAttr('disabled');
					
					form_1=getFormData($("#emp_registartion"));
					form_2=getFormData($("#emp_registartion2"));
					form_3=getFormData($("#emp_registartion3"));
					form_4=JSON.stringify(getFormDataList(getFormData($("#emp_registartion4"))));
					
					disabled1.attr('disabled','disabled');
					disabled2.attr('disabled','disabled');
					disabled3.attr('disabled','disabled');
					disabled4.attr('disabled','disabled');
					var JsonValue = {};
					JsonValue["InsuranceDtlList"] = form_4;
					main_reg=$.extend(form_1, form_2,form_3,JsonValue);
					//alert(main_reg);
					showLoaderPage(true);
					CallAPI("emp_master",main_reg,onSuccessEmpreg,onErrorResponse);
				}else{
					document.getElementById('Insurancr-tab-justified').click();
				}
			}else{
				document.getElementById('contact-tab-justified').click();
			}
		}else{
			document.getElementById('profile-tab-justified').click();
		}
	}else{
		document.getElementById('home-tab-justified').click();
	}
		
}
function onSuccessEmpreg(data, textStatus, jqXHR)
{   
	showLoaderPage(false);
	if (data != "") 
	{
         var res = JSON.parse(data);
         if (res.STATUS_CD == "999") {
        	    var MSG = res.MESSAGE;
        	    //alert(MSG);
         		console.log(MSG);
         		MessageBox("Error", MSG, 'red', 'fa fa-warning');
         }else if (res.STATUS_CD == "99") {
        	   var MSG = res.MESSAGE;
        	   //alert(MSG);
        	   console.log(MSG);
        	   MessageBox("Error", MSG, 'red', 'fa fa-warning');
         }else if (res.STATUS_CD == "0") {
        	   //var MSG = res.MESSAGE;
      	   	   //alert(data);
      	   		MessageBox("Success", res.MESSAGE, 'green', 'fa fa-success');
      	   		if(res.ACTION == "NEW")
      	   		{
      	   			setTimeout(function(){ showLoaderPage(true); onloadpage('EMP_LIST'); }, 3000);
      	   		}
      	   		document.getElementById('home-tab-justified').click();
         }else if (res.STATUS_CD == "9") {
      	   	var MSG = res.MESSAGE;
      	   	//alert(MSG);
      	   	console.log(MSG);
    	   	MessageBox("Expire", res.MESSAGE, 'red', 'fa fa-warning');
      	 	SessionExpire();
         }
         else{
		       var MSG = res.MESSAGE;
         	   console.log(MSG);
         	  MessageBox("Error", MSG, 'red', 'fa fa-warning');
		}
	
}
}
function func_set_today_date(a_tx)
{
	var v_value = a_tx.value;
	var today = new Date();
	if(v_value == null || v_value == "")
	{
		today.setMinutes(today.getMinutes() - today.getTimezoneOffset());
		a_tx.valueAsDate = today;
	}
}
function addOption(inputid,ovalue,otext) { 
    optionText = otext; 
    optionValue = ovalue; 

    $('#'+inputid).append(new Option(optionText, optionValue)); 
} 

function getFormDataList($form){
	var activities = [];
	$.map($form, function(n, i){
		  var index = parseInt(i.substr((i.length)-1,1))-1;
		  var key = i.substr(0,(i.length)-1);
		  var value= n;
		  var Jobj = {};
		  var jsonVariable = {};
		  jsonVariable[key]=value;
		  if(activities[index]==undefined){
			 activities[index] = jsonVariable; 
		  }else{
			 Jobj = activities[index];
			 activities[index] = $.extend(Jobj,jsonVariable);
		  }
	    });
	return activities;
}
function getFormData($form){
    var unindexed_array = $form.serializeArray();
    var indexed_array = {};
    $.map(unindexed_array, function(n, i){
        indexed_array[n['name']] = n['value'];
    });

    return indexed_array;
}
function readFile(input,setval) {
    var regex = /\.(doc|pdf)$/i;
    if (regex.test(input.value.toLowerCase())) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
                var base64 = e.target.result;
                base64 = base64.split(",")[1];
                if (base64 == null) {
                    base64 = e.target.result;
                }
                $('#'+setval).val(base64);
            };
            reader.readAsDataURL(input.files[0]);
        } else {
            //alert("Sorry - you're browser doesn't support the FileReader API");
            MessageBox("Error", "Sorry - you're browser doesn't support the FileReader API", 'red', 'fa fa-warning');
        }
    } else {
        //alert("Please select a valid file with .doc|.pdf extension.");
        MessageBox("Validation Failed", "Please select a valid file with .doc|.pdf extension.", 'red', 'fa fa-warning');
    }
}
function readFileIMG(input,setval) {
    var regex = /\.(jpg|png|jpeg)$/i;
    if (regex.test(input.value.toLowerCase())) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
                var base64 = e.target.result;
                base64 = base64.split(",")[1];
                if (base64 == null) {
                    base64 = e.target.result;
                }
                $('#'+setval).val(base64);
            };
            reader.readAsDataURL(input.files[0]);
        } else {
            //alert("Sorry - you're browser doesn't support the FileReader API");
            MessageBox("Error", "Sorry - you're browser doesn't support the FileReader API", 'red', 'fa fa-warning');
        }
    } else {
        //alert("Please select a valid file with .doc|.pdf extension.");
        MessageBox("Validation Failed", "Please select a valid file with .jpg|.png|.jpeg extension.", 'red', 'fa fa-warning');
    }
}
function isAlphaNumeric(t) {
	var e=t.which?t.which:t.keyCode;
	if((e>=48 && e<=57) || e==32||(e>=65 && e<=90)||(e>=97 && e<=122))
	{
		return true;
	}
	return false;
}
function isNumeric(t) {
	var e=t.which?t.which:t.keyCode;
	if((e>=48 && e<=57) || e==45 || e==43)
	{
		return true;
	}
	return false;
}
function isAmount(t) {
	var e=t.which?t.which:t.keyCode;
	if((e>=48 && e<=57) || e==45 || e==43 || e==46)
	{
		return true;
	}
	return false;
}
function limitDecimalPlaces(e, count) {
  if (e.target.value.indexOf('.') == -1) { return; }
  if ((e.target.value.length - e.target.value.indexOf('.')) > count) {
    e.target.value = parseFloat(e.target.value).toFixed(count);
  }
}
function SameAddress(a_value) {
	if(a_value.checked)
	{
		copyAddress();
		$("#inputTempAddress1").attr("readonly",true);
		$("#inputTempAddress2").attr("readonly",true);
		$("#inputTempAddress3").attr("readonly",true);
		$("#inputTempCountry").attr("disabled",true);
		$("#inputTempState").attr("disabled",true);
		$("#inputTempCity").attr("disabled",true);
		$("#inputTempPincode").attr("readonly",true);
	}else
		{
		$("#inputTempAddress1").attr("readonly",false);
		$("#inputTempAddress2").attr("readonly",false);
		$("#inputTempAddress3").attr("readonly",false);
		$("#inputTempCountry").attr("disabled",false);
		$("#inputTempState").attr("disabled",false);
		$("#inputTempCity").attr("disabled",false);
		$("#inputTempPincode").attr("readonly",false);
		}
}
function copyAddress(){
	if($('#inputSameAddress').is(':checked')){
	$("#inputTempAddress1").val($("#inputPerAddress1").val());
	$("#inputTempAddress2").val($("#inputPerAddress2").val());
	$("#inputTempAddress3").val($("#inputPerAddress3").val());
	$("#inputTempCountry").html($("#inputPerCountry").html());
	$("#inputTempCountry").val($("#inputPerCountry").val());
	$("#inputTempState").html($("#inputPerState").html());
	$("#inputTempState").val($("#inputPerState").val());
	$("#inputTempCity").html($("#inputPerCity").html());
	$("#inputTempCity").val($("#inputPerCity").val());
	$("#inputTempPincode").val($("#inputPerPincode").val());
}
}
function ofInputListData(res,inputID,SelValue){
 var i=0;
 var rm=$('#'+inputID).children('option:not(:first)').remove();
 for(i=0;i<res.length;i++)
 {
	 addOption(inputID,res[i].ID,res[i].NAME); 
 }
 if(i>0 && SelValue != null & SelValue != "")
 {
	 $('#'+inputID).val(SelValue);
 }
}
function ofGetListData(action_id,v,inputID,SelValue)
{
	$.ajax({
	    url: "getdatalist",
	    method: "POST",
	    data: {"action":action_id,"action_data":v},	  	    
	     success: function(data){
	    	 	if (data != "") 
	    		{
	    	         var res = JSON.parse(data);
	    	         if (res.STATUS_CD == "999") {
    	        	    var MSG = res.MESSAGE;
    	         		console.log(MSG);
    	         		MessageBox("Expire", res.MESSAGE, 'red', 'fa fa-warning');
	    	         }else if (res.STATUS_CD == "99") {
    	        	    var MSG = res.MESSAGE;
    	         		console.log(MSG);
    	         		MessageBox("Expire", res.MESSAGE, 'red', 'fa fa-warning');
	    	         }else if (res.STATUS_CD == "9") { ///Session Expire
	    	        	 MessageBox("Expire", res.MESSAGE, 'red', 'fa fa-warning');
	    	        	 SessionExpire();
		    	      }
	    	         else if(res.STATUS_CD == "0"){
	    	        	 ofInputListData(res.RESPONSE,inputID,SelValue);
	    	         }
	    	         else{
 				        var MSG = res.MESSAGE;
    	         		console.log(MSG);
	 				}
	 			
	 		}
	    	 
	     },
	     error: onErrorResponse
	});
}
function ofGetListDataFromMisc(action_id,v,inputID,SelValue)
{
	$.ajax({
	    url: "getdatalist",
	    method: "POST",
	    data: {"action":"GET_P_MISC_MST","action_value":action_id,"action_data":v},	  	    
	     success: function(data){
	    	 	if (data != "") 
	    		{
	    	         var res = JSON.parse(data);
	    	         if (res.STATUS_CD == "999") {
    	        	    var MSG = res.MESSAGE;
    	         		console.log(MSG);
    	         		MessageBox("Error", res.MESSAGE, 'red', 'fa fa-warning');
	    	         }else if (res.STATUS_CD == "99") {
    	        	    var MSG = res.MESSAGE;
    	         		console.log(MSG);
    	         		MessageBox("Expire", res.MESSAGE, 'red', 'fa fa-warning');
	    	         }else if (res.STATUS_CD == "9") { ///Session Expire
	    	        	 MessageBox("Expire", res.MESSAGE, 'red', 'fa fa-warning');
	    	        	 SessionExpire();
		    	      }
	    	         else if(res.STATUS_CD == "0"){
	    	        	 ofInputListData(res.RESPONSE,inputID,SelValue);
	    	         }
	    	         else{
 				        var MSG = res.MESSAGE;
    	         		console.log(MSG);
	 				}
	 			
	 		}
	    	 
	     },
	     error: onErrorResponse
	});
}
function onErrorResponse(request, type, errorThrown)
{
	showLoaderPage(false);
	var message = "There was an error with the request.\n";
switch (type) {
    case 'timeout':
        message += "The request timed out.";
        break;
    case 'notmodified':
        message += "The request was not modified but was not retrieved from the cache.";
        break;
    case 'parsererror':
        message += "XML/Json format is bad.";
        break;
    default:
        message += errorThrown;
}
MessageBox("Error", message, 'red', 'fa fa-warning');
//alert(message);
$('#error_msg').html(GetErrorMessage(message));
//MessageBox('Error', message, 'red', 'fa fa-warning');

}
function GetErrorMessage(msg)
{
	return "<label class='error'>"+msg+"</label>";
}
function CallAPI(urlText,data,Onsusfunc,Onerror)
{
	$.ajax({
	    url: urlText,
	    method: "POST",
	    data: data,	  	    
	    success: Onsusfunc, 
	    error: Onerror
	});
}
function SessionExpire()
{
	setTimeout(function(){ window.location.href='Login'; }, 3000);	
}
function LogoutUser(){
	showLoaderPage(true);
	CallAPI("getdatalist",{"action":"LOGOUT","user_id":""},onLogoutResponseSuccess,onLogoutResponseError);
}
function onLogoutResponseError(request, type, errorThrown){
	setTimeout(function(){ showLoaderPage(false);window.location.href='Login'; }, 1000);	
}
function onLogoutResponseSuccess(data, textStatus, jqXHR){
	setTimeout(function(){ showLoaderPage(false); window.location.href='Login'; }, 1000);	
}
