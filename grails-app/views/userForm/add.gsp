<%@ page import="userinfo.Country" contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<head>
    <title></title>
    <script
            src="https://code.jquery.com/jquery-3.5.1.js"
            integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
            crossorigin="anonymous"></script>
    <style>
    body {
        background-color: #10213b;
        text-align: center;
        color: white;
        font-family: Arial, Helvetica, sans-serif;
    }
    </style>
</head>

<body>
<h1>User Registration Form</h1>
<br><br>
<div>
    <label>Name</label>
    <g:textField name = "name" value = "" id = "name" />
    <br><br>
    <label>Age</label>
    <g:textField name = "age" value = "" id = "age"/>
    <br><br>
</div>
<div>
    <label>Country:</label>
    <g:select id="country" name="country.id" from="${Country.listOrderByName()}"
              optionKey="id" noSelection="['':'-Choose Country-']"
              onchange="countryDropDown(this.value)"
    />
</div>
<div>
    <label>State</label>
    <span id="subContainer"></span>
</div>
<div>
    <br><br>
    <label>Division</label>
    <g:textField name = "divisionName" value = "" id = "divisionName" />
    <br><br>
</div>
<div>
    <form action="" method="post" id="my_form" novalidate>
        <input type="checkbox" name="showField" id="showField" value="yes" onchange="myFunction()">Enter your current location<br/>
        <span id="locationField">Your Current Location:<input type="text" name="yourLocation" id="yourLocation" required="true"></span>
    </form>
</div>
<div>
    <br><br>
    <button id = "submitButton" name = "submitButton" onClick = "addAjax()">Submit</button>
    <g:form name = "myform" url = "[controller: 'UserForm', action: 'index']">
        <g:submitButton name = "cancelButton" value = "Cancel" />
    </g:form>
</div>

<script>

    $('#locationField').css('display','none'); // Hide the location input box in default
    function myFunction() {
        if ($('#showField').prop('checked')) {
            $('#locationField').css('display','block');
        }
        else {
            $('#locationField').css('display','none');
        }
    }

    function countryDropDown(countryId) { //function for dynamic dropdown
        jQuery.ajax({type:'POST',data:'countryId='+countryId, url:'${createLink(controller:'userForm',action:'countryDropDown')}',success:function(data,textStatus){jQuery('#subContainer').html(data);},error:function(XMLHttpRequest,textStatus,errorThrown){}});
    }

    function addAjax() {
        $(document).ready(function() {
            var name = $('#name').val();
            var age = $('#age').val();
            var countryName = $('#countryName').val();
            var stateName = $('#stateName').val();
            var divisionName = $('#divisionName').val();
            var yourLocation = $('#yourLocation').val();


            //Check if name field is empty
            if (name == "") {
                alert('Enter your name');
                return false;
            }

            //Check if age field is empty
            if (age == "") {
                alert('Enter your age');
                return false;
            }

            //Check if country field is empty
            if (countryName == "-Choose Country-") {
                alert('Select a country');
                return false;
            }

            //Check if state field is empty
            if (stateName == "-Choose State-") {
                alert('Select a state');
                return false;
            }

            //Check if division field is empty
            if (divisionName == "") {
                alert('Enter your division');
                return false;
            }

            //Check if currentLocationTextBox field is empty
            if (yourLocation == "") {
                alert('Enter your current location.');
                return false;
            }

            var conv_to_num = Number(age);  //Convert age string to number

            //Check if the age is an integer
            if (isNaN(conv_to_num) || !Number.isInteger(conv_to_num)) {
                alert("Age should be integer");
                return false;
            }



            var URL="${createLink(controller:'userForm', action:'addSuccess')}"

            $.ajax({
                url: URL,
                type: "POST",
                datatype: "html",
                data:{name:name, age:age, countryName:countryName, stateName:stateName, divisionName:divisionName, currentLocationTextBox:currentLocationTextBox},
                success:function(data)
                {
                    alert(data);
                }
            })

        })
    }

</script>
</body>
</html>
