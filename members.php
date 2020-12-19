<?php
  session_start();
  $leagueID = $_SESSION["leagueID"];                                         // set league info
	try {                                                
        $con= new PDO('mysql:host=localhost;dbname=tennis', "root", "jjc003");
        $con->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
		
        $result = $con->query("SELECT * FROM league WHERE leagueID = '$leagueID' ");
		$result->setFetchMode(PDO::FETCH_ASSOC);

		foreach ($result as $row) {
		  foreach ($row as $name =>$value ) {                              // populate values
			if ($name == 'leagueName')  $leagueName = $value;
			if ($name == 'moderatedBy') $moderatedBy = $value;
		  }		 		  
	    }           		
    }		 //end of try
 	
    catch(PDOException $e) {
        echo 'ERROR: ' . $e->getMessage();
    }
?>
<!DOCTYPE html>
<html>
<head>
  <title>Tennis</title>
  <meta charset = "UTF-8" />
  
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"
     integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
  <link href='https://fonts.googleapis.com/css?family=Roboto:300,400,700' rel='stylesheet' type='text/css'>
  <link rel="stylesheet" type="text/css" href="main.css">

  <link rel = "stylesheet"
        type = "text/css"
        href = "jquery-ui-1.10.3.custom.css" />

  <style type = "text/css">

    h1 {
      text-align: center;
    }
    #selectable .ui-selecting {
      background-color: gray;
    }
    #selectable .ui-selected {
      background-color: black;
      color: white;
    }
	
	img {
	  float: left;
	}

	
  </style>
  <script type = "text/javascript"
          src = "jquery-1.9.1.js"></script>
  <script type = "text/javascript"
          src = "jquery-ui-1.10.3.custom.min.js"></script>
  <script type = "text/javascript">

    $(init);
    function init(){
      $("h1").addClass("ui-widget-header");
      $("#tabs").tabs();
      $("#datePicker").datepicker();
      $("#slider").slider()
      .bind("slide", reportSlider);
      $("#selectable").selectable();
      $("#sortable").sortable();
	  
      $("#dialog").dialog({
		  autoOpen : false,         		  
	  }); 
	  
    } // end init
	
	var mbrID = " ";
	var line1 = " ";
	var line2 = " ";
	var line3 = " ";
	var line4 = " ";
	
    function reportSlider(){
      var sliderVal = $("#slider").slider("value");
      $("#slideOutput").html(sliderVal);
    } // end reportSlider
	
    function openDialog()
	{		
       $("#dialog").dialog("open");	   
    } // end openDialog
	
    function closeDialog(){
      $("#dialog").dialog("close");
    } // end closeDialog
	
	function showPhoto(mbrID, line1, line2, line3, line4)	
	{	
        HTMLdata = 	"<img src = " + "'" + mbrID + ".jpg'" + 
		            " height = 100 width = 100" + 
					" alt = 'member photo'> " +
					" <p></p> " + "<span style='margin-left:.5em'>" +
					 line1 + " " + 
					 line2 + "<br>" + "<span style='margin-left:.5em'>" + 
					 line3 + "<br>" + "<span style='margin-left:.5em'>" +
					 line4 + "<br>";
	   $("#dialog").html(HTMLdata);
       $("#dialog").dialog("open");	   
    } // end showPhoto

    </script>
</head>
<body>

<?php
	$isAdmin = $_SESSION["isAdmin"];
	$mbrID = $_SESSION["mbrID"];
	
    if (filter_has_var(INPUT_POST, "addMbr")){
        $addMbr = filter_input(INPUT_POST, "addMbr");	
	  if ($addMbr != "") {
        try {
        
        $con= new PDO('mysql:host=localhost;dbname=tennis', "root", "jjc003");
        $con->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
		
                                                           // then update SQL record
			 
	        $result = $con->prepare("INSERT INTO member 
			            (mbrID,
						firstName,
						lastName,
						phonePrimary,
						phoneSecondary,
						village,
						streetAddr,
						cityAddr,
						zipAddr,
						emailAddr,
						status,
						password,
						tennisRanking,
						assignedRanking,
						displayPhoto,
						leagueID)			
			     VALUES
			            ('$addMbr',
						' ',
						' ',
						' ',
						' ',
						' ',
						' ',
						' ',
						' ',
						' ',
						'I',
						'password',
						' ',
						' ',
						' ',
						'$leagueID') ");

			$result->execute();
					 
        }		 //end of try
 	
        catch(PDOException $e) {
          echo 'ERROR: ' . $e->getMessage();
	    }
	  } //end if
    }   //end if
 	
    if (filter_has_var(INPUT_POST, "deleteMbr")){
        $deleteMbr = filter_input(INPUT_POST, "deleteMbr");
		
        try {
        
        $con= new PDO('mysql:host=localhost;dbname=tennis', "root", "jjc003");
        $con->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
		
                                                           // then update SQL record
			 
	        $result = $con->prepare("DELETE FROM member 
			   WHERE mbrID = '$deleteMbr' AND leagueID = '$leagueID' ");
			   
			$result->execute();
					 
        }		 //end of try
 	
        catch(PDOException $e) {
          echo 'ERROR: ' . $e->getMessage();
	    }
		
    } //end if
	
	if (filter_has_var(INPUT_POST, "inactivateMbr")){
        $inactivateMbr = filter_input(INPUT_POST, "inactivateMbr");
		
        try {
        
        $con= new PDO('mysql:host=localhost;dbname=tennis', "root", "jjc003");
        $con->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
		
                                                           // then update SQL record
			 
	        $result = $con->prepare("UPDATE member 
			   SET  status = 'I'
			   WHERE mbrID = '$inactivateMbr' AND leagueID = '$leagueID' ");
			   
			$result->execute();
					 
        }		 //end of try
 	
        catch(PDOException $e) {
          echo 'ERROR: ' . $e->getMessage();
	    }
		
    } //end if
	
	if (filter_has_var(INPUT_POST, "activateMbr")){
        $activateMbr = filter_input(INPUT_POST, "activateMbr");
		
        try {
        
        $con= new PDO('mysql:host=localhost;dbname=tennis', "root", "jjc003");
        $con->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
		
                                                           // then update SQL record
			 
	        $result = $con->prepare("UPDATE member 
			   SET  status = 'A'
			   WHERE mbrID = '$activateMbr' AND leagueID = '$leagueID' ");
			   
			$result->execute();
					 
        }		 //end of try
 	
        catch(PDOException $e) {
          echo 'ERROR: ' . $e->getMessage();
	    }
		
    } //end if
?>

<header class="container">
<div id="wrapper">

<nav id="nav">
	<ul id="navigation">
		<li><a href="indexProcess.php">Login</a></li>
		<li><a href="#">Member Info &raquo;</a>
			<ul>
				<li><a href="members.php">MemberRoster</a></li>
				<li><a href="mbrProfile.php">MemberProfile</a></li>
				<li><a href="availability.php">MemberAvailability</a></li>
				<li><a href="groupAvailability.html">GroupAvailability</a></li>
				<li><a href="mbrRanking.php">Tennis Rankings</a></li>
				<li><a href="sumResults.html">MemberStats</a></li>				
			</ul>
		</li>
		<li><a href="#">Court Info &raquo;</a>
			<ul>
				<li><a href="facilities.php">Facilities</a></li>
				<li><a href="facility.php">CourtAvailability</a></li>
				<li><a href="assignments.html">DailyCourtAssignments</a></li>
				<li><a href="schedule.php">WeeklyCourtAssignments</a></li>				
			</ul>				
		</li>
		<li><a href="#">Play Results &raquo;</a>
			<ul>
				<li><a href="setResults.html">ResultsEntry</a></li>
				<li><a href="sumResults.html">ResultsSummary</a></li>				
			</ul>				
		</li>
		<li><a href="changeMonth.php">Change Month</a></li>
		<li><a href="sendEmail.php">Format Email</a></li>
		<li><a href="help.php">Help</a></li><br>
	</ul>
</nav>

</div><!--end wrapper-->
</header>
  
<?php
if ($isAdmin && $mbrID != "Guest" && $mbrID != "") {
print <<<HERE
  <div class = "member"> 
  <style type = "text/css">
            fieldset {
            width: 600px;
            background-color: #eeeeee;
            margin-left: auto;
            margin-right: auto;
            box-shadow: 5px 5px 5px gray;
          }
          label {
            float: left;
            clear: left;
            width: 250px;
            text-align: right;
            padding-right: 1em;
          }
                   
          input {
            float: left;
          }
		  
		  select {
			  float:left;
		  }
          
          :required {
            border: 1px solid red;
          }
          
          :invalid {
            color: white;
            background-color: red;
          }
          
          button {
            display: block;
            margin-left: auto;
            margin-right: auto;
            clear: both;
          }
		  
		  p {
			margin-left: 100px;
		  }
		  
		  #submit {
			margin-left: 330px;
		    background-color: lightyellow;
		  }
  </style>
  
    <form action = "" method= "post">
      <fieldset> <br>
	  
        <label>Add this member</label>
        <input type="text" value="" id="txt_addMbr" name="addMbr" pattern="[A-Za-z0-9/]{1,20}"> <br>
		<label>Delete this member</label>
        <input type="text" value="" id="txt_deleteMbr" name="deleteMbr" pattern="[A-Za-z0-9/]{1,20}"> <br>
		<label>Inactivate this member</label>
        <input type="text" value="" id="txt_inactivateMbr" name="inactivateMbr" pattern="[A-Za-z0-9/]{1,20}"> <br>
		<label>Activate this member</label>
        <input type="text" value="" id="txt_activateMbr" name="activateMbr" pattern="[A-Za-z0-9/]{1,20}"> <br>
        <input type="submit" value = "submit" id = "submit"/> <br>
      </fieldset>
    </form>
	
    </div>
HERE;
}         // end if
?>
  
  <div id = "memberList"> 
  <style type = "text/css">
		  
	#memberList {
		margin: 100px;
		font-size:190%;
	}
  </style>
  
<?php
print"	  <h2><strong>Active members of $leagueName are: </strong> </h2>"; 
print"    <p> "; 
      try {
        $con= new PDO('mysql:host=localhost;dbname=tennis', "root", "jjc003");
        $con->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

        $query = "SELECT mbrID, 
                         phonePrimary,
						 emailAddr,
						 village,
						 tennisRanking,
						 firstName, 
					     lastName,
						 displayPhoto
		                 FROM member WHERE status = 'A' AND leagueID = '$leagueID'
						 ORDER BY mbrID ";
        
        //first pass just gets the column names
        print "<table> \n";

        $result = $con->query($query);
        //return only the first row (we only need field names)
        $row = $result->fetch(PDO::FETCH_ASSOC);

        print "  <tr> \n";
        foreach ($row as $field => $value){
		  if ($field == mbrID) print " <th> Member ID <span style='margin-left:6em'></th> ";
          if ($field == phonePrimary) print " <th> Phone <span style='margin-left:6em'> </th> "; 
          if ($field == lastName) print " <th> </th> \n";		  
        } // end foreach
        print "  </tr> \n";
 
        //second query gets the data
        $data = $con->query($query);
        $data->setFetchMode(PDO::FETCH_ASSOC);		

        foreach($data as $row){
          print "  <tr> \n";
		       
          $showRanking = '"' . ' ' . '"';
          $showFirstName = '"' . ' ' . '"';
          $showLastName = '"' . ' ' . '"';
		  $showVillage = '"' . ' ' . '"';

          foreach ($row as $name=>$value){              
		    if ($name=='mbrID') {
			  print "    <td>$value</td> \n";
			  $mbrID = $value;
			  $fileConnected = fopen("$mbrID.jpg", "r");
			  $showPhoto = false;
			  $isMore = false;
			  if ($fileConnected == true) {
				$saveID = $mbrID;
		    	$isMore = true;
				fclose($fileConnected);
              }
            }
			
			if ($name=='lastName') {
			  print "    <td>$value</td> \n";			  
            }
						
			if ($name == 'phonePrimary') print "<td>$value</td> \n";
			if ($name == 'village' && $value != ' ') $showVillage =  '"' . 'Village of ' . $value . '"';
			if ($name == 'tennisRanking' && $value != ' ') $showRanking = '"' . $value . '"';
			if ($name == 'firstName' && $value != ' ') $showFirstName = '"' . $value . '"';
			if ($name == 'lastName' && $value != ' ') $showLastName = '"' . $value . '"';
			if ($name == 'displayPhoto' && $value == 'Y') $showPhoto = true;
			
			
          } // end field loop
		  
		  if ($isMore && $showPhoto) {
			  $showID = '"' . $saveID . '"';
			  print "<td style='font-size:50%'><strong><input type = 'button'
                     value = 'Photo'
                     onclick = 'showPhoto($showID, $showFirstName, $showLastName, $showVillage, $showRanking)' /></strong></td> \n";
		  }
          print "  </tr> \n";
        } // end record loop

        print "</table> \n";

      } catch(PDOException $e) {
          echo 'ERROR: ' . $e->getMessage();
      } // end try
print"  </p> "; 
?>
      
<?php
      try {
        $con= new PDO('mysql:host=localhost;dbname=tennis', "root", "jjc003");
        $con->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

        $query = "SELECT mbrID as 'Member ID', phonePrimary as 'Phone',
                    emailAddr as 'Email Address' 		
		            FROM member 
					WHERE status = 'I' AND leagueID = '$leagueID'
					ORDER BY mbrID ";
							
        //first pass just gets the column names
        print "<table> \n";

        $result = $con->query($query);
        //return only the first row (we only need field names)
        $row = $result->fetch(PDO::FETCH_ASSOC);
        print "  <tr> \n";
        foreach ($row as $field => $value){
            print "    <th>$field <span style='margin-left:6em'></th> \n";
        } // end foreach
        print "  </tr> ";
        
        //second query gets the data
        $data = $con->query($query);
        $data->setFetchMode(PDO::FETCH_ASSOC);
		$i = 0;
		
        foreach($data as $row){
          print "  <tr> \n";
          foreach ($row as $name=>$value){
            if ($i == 0)  print "<h2><strong> Other members are: </strong></h2>";
            $i++;			
            print "    <td>$value</td> \n"; 
          } // end field loop	

          print "  </tr> \n";
        } // end record loop

        print "</table> \n";

      } catch(PDOException $e) {
          echo 'ERROR: ' . $e->getMessage();
      } // end try

?>

   </div> 
   
<?php
print <<<HERE
<div id = "dialog"
    title = "Tennis League" >

</div>	
HERE;
?>
   
</body>
</html>
