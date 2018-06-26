var formValues = JSON.parse(localStorage.getItem('formValues')) || {};
var $checkboxes = $("#table :checkbox");
var $button = $("#checkAll");
var lstIdCkeck = [];

function allChecked(){
  return $checkboxes.length === $checkboxes.filter(":checked").length;
}

function updateButtonStatus(){
  $button.text(allChecked()? "Uncheck all" : "Check all");
}

function handleButtonClick(){
  $checkboxes.prop("checked", allChecked()? false : true)
}

function updateStorage(){
  $checkboxes.each(function(){
    formValues[this.id] = this.checked;

  });

  formValues["buttonText"] = $button.text();
  localStorage.setItem("formValues", JSON.stringify(formValues));
}

$button.on("click", function() {
  handleButtonClick();
  updateButtonStatus();
  updateStorage();
});

$checkboxes.on("change", function(){
  updateButtonStatus();
  updateStorage();
});

// On page load
$.each(formValues, function(key, value) {
  $("#" + key).prop('checked', value);
});

$button.text(formValues["buttonText"]);

function pushLstCK()
{
	var lstIdCkeck = [];

	var arr = [];
	arr= document.querySelector("#table .check");
	var size = arr.length;
	var ck = true;
	var dem = 0;
	for(var i = 0;i<size;i++)
	{
		if(arr[i].ckecked == true)
		{
			lstIdCkeck.push(arr[i].value);
		}
		else
		{
			dem= dem+1;
		}
	}
	if(dem == size)
	{
		ck=false;
	}
	if(ck==true)
	{
		//document.getElementById("lstid").value = arr.toString();
		alert(lstIdCkeck.toString());
	}
	else
	{
		alert("Chưa lựa chọn sản phẩm");
	}
	
}


$(document).ready(function(){
	$("#smit").click(function(){
		var items =[];
	$("#table input[type=checkbox]:checked").each(function(){
		items.push($(this).val());
	});
	//console.log(items);
	//document.getElementById("lstid").value = items.toString();
	//alert(document.getElementById("lstid").value);
        
	if(items.length==0)
	{
		alert("Chưa lựa chọn sản phẩm");
	}
	else
	{
		document.getElementById("lstid").value = items.toString();
		alert(document.getElementById("lstid").value);
	}
	});
	
});