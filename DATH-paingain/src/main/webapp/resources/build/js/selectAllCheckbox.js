var formValues = JSON.parse(localStorage.getItem('formValues')) || {};
var $checkboxes = $("#tablex :checkbox");
var $button = $("#checkAll");

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


$(document).ready(function(){
	$("#smit").click(function(){
		var items =[];
	$("#tablex input[type=checkbox]:checked").each(function(){
		items.push($(this).val());
	});
	//console.log(items);
	//document.getElementById("lstid").value = items.toString();
	//alert(document.getElementById("lstid").value);
        
	if(items.length==0)
	{
		alert("Chưa lựa chọn sản phẩm");
		window.location.reload();
	}
	else
	{
		document.getElementById("lstid").value = items.toString();
		//alert(document.getElementById("lstid").value);
	}
	});
	
});