<?php
  session_start();
	$leagueID = $_SESSION["leagueID"];                                // set league info
	
	try {                                                
        $con= new PDO('mysql:host=localhost;dbname=tennis', "root", "jjc003");
        $con->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
		
        $result = $con->query("SELECT * FROM league WHERE leagueID = '$leagueID' ");
		$result->setFetchMode(PDO::FETCH_ASSOC);

		foreach ($result as $row) {
		  foreach ($row as $name =>$value ) {                         
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
  <meta charset="utf-8"/>
  <link rel="stylesheet" href="bootstrap.css">
  <link href='https://fonts.googleapis.com/css?family=Roboto:300,400,700' rel='stylesheet' type='text/css'>
  <link rel="stylesheet" type="text/css" href="main.css"> 
	       
</head>
<body>
<?php

	if (isSet ($_SESSION["mbrID"])) 
	{
        $mbrID =   $_SESSION["mbrID"];
	    $isMbr =   $_SESSION["isMbr"];
	    $isAdmin = $_SESSION["isAdmin"];
		$status =  $_SESSION["status"];
		$isActive =  $_SESSION["isActive"];
		$myEmailAddr = $_SESSION["myEmailAddr"];
	}
	else 
	{
		$mbrID = "Guest";
		$isMbr = false;
		$isAdmin = false;
		$isActive = false;
		$status = "";
		$myEmailAddr = "";
	}
	
	$monthNames = array("January", "February", "March", "April", "May", "June",
                     "July", "August", "September", "October", "November", "December");
	$month = (int) date('m');
	$monthName = $monthNames[$month];
	$dateArray = array();
	$dateArray[0] = "0000-00-00";
	$ballSuppliers = array();
	
			
		                                                                 //  load up date array
	$todaysDate = date("Y-m-d");
		
	   try 
	   {
        $con= new PDO('mysql:host=localhost;dbname=tennis', "root", "jjc003"); 
        $con->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
		
        $query = "SELECT date FROM assignment WHERE date >= '$todaysDate' AND leagueID = '$leagueID' GROUP BY date ";  //collect dates
        
        //first pass just gets the column names

        $result = $con->query($query);
        //return only the first row (we only need field names)
        $row = $result->fetch(PDO::FETCH_ASSOC);

        foreach ($row as $field => $value){
        } // end foreach
 
        //second pass gets the data
        $data = $con->query($query);
        $data->setFetchMode(PDO::FETCH_ASSOC);
		$n = 0;

        foreach($data as $row){
			foreach ($row as $name=>$value){ 
              $dateArray[$n] = $value;
			  $n++;
			} // end field loop
        } // end record loop
		
      } catch(PDOException $e) {
          echo 'ERROR: ' . $e->getMessage();
      } // end try
																		// loop though the dates	
	for ($n=0; $n < sizeof($dateArray); $n++)
	{
		$timestamp = strtotime($dateArray[$n]);                          // get day name
        $dayName = date("l", $timestamp);

		$assignments .= "<p><br><span style='margin-left:4em'><strong> $dayName, $dateArray[$n] </strong></p>";																
	  
	                                                                     //  load up available members into $available string	
	   try 
	   {
		$available = "";
        $con= new PDO('mysql:host=localhost;dbname=tennis', "root", "jjc003"); 
        $con->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
		
		$available = "";
        $query = "SELECT mbrID FROM available WHERE dates = '$dateArray[$n]' AND leagueID = '$leagueID' ";  // collect avaulable members
        
        //first pass just gets the column names

        $result = $con->query($query);
        //return only the first row (we only need field names)
        $row = $result->fetch(PDO::FETCH_ASSOC);

        foreach ($row as $field => $value){
        } // end foreach
 
        //second pass gets the data
        $data = $con->query($query);
        $data->setFetchMode(PDO::FETCH_ASSOC);

        foreach($data as $row){
			foreach ($row as $name=>$value){ 
              $available .= $value . ",";
			} // end field loop
        } // end record loop

        $available .= "";
		
      } catch(PDOException $e) {
          echo 'ERROR: ' . $e->getMessage();
      } // end try
	  
	  
    $assigned = "";	                                     //         load up assigned members into $assigned string
      try {
        $con= new PDO('mysql:host=localhost;dbname=tennis', "root", "jjc003");
        $con->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

        $query = "SELECT facilityName as 'Courts', 
		                 mbrID as 'Players',
						 balls 
						 FROM assignment 
						 WHERE date = '$dateArray[$n]' AND leagueID = '$leagueID'
                         ORDER BY facilityName	 ";
        
        //first pass just gets the column names
		
		$assignments .= "<table> \n";

        $result = $con->query($query);
        //return only the first row (we only need field names)
        $row = $result->fetch(PDO::FETCH_ASSOC);
		
        $assignments .= "  <tr> \n";
        foreach ($row as $field => $value){
          if ($field == 'Courts' || $field == 'Players') $assignments .= "<th><span style='margin-left:3em'><u>$field</u><span style='margin-left:3em'></th> \n";
        } // end foreach
        $assignments .= "  </tr> \n";
 
        //second pass gets the data
        $data = $con->query($query);
        $data->setFetchMode(PDO::FETCH_ASSOC);
		$courtChanged = false;
		$i = 0;
        foreach($data as $row){	
			
          $assignments .= "  <tr> \n";
		  
          foreach ($row as $name=>$value) {	
            if ($name == 'Courts' || $name == 'Players' ) $assignments .= "    <td> <span style='margin-left:3em; color:black;'>$value</td> \n";
			if ($name == 'Courts' ) $facilityName = $value; 
			if ($name == 'Players' ) $player = $value; 
			if ($name == 'balls' && $value == 'Y') {
				$ballSuppliers[$i] = $player;
				$i = $i +1;
			}
          } // end field loop
		  
          $assignments .= "  </tr> \n";				  			
		  
        } // end record loop

        $assignments .= "</table> \n" ;
		
	                                                                                                                 // set the member IDs
																   
	    $query = "SELECT mbrID FROM assignment WHERE date = '$dateArray[$n]' AND leagueID = '$leagueID' ";
        
        //first pass just gets the column name again

        $result = $con->query($query);
        //return only the first row (we only need field names)
        $row = $result->fetch(PDO::FETCH_ASSOC);

        foreach ($row as $field => $value){
        } // end foreach
 
        //second pass gets the IDs
        $data = $con->query($query);
        $data->setFetchMode(PDO::FETCH_ASSOC);

        foreach($data as $row){
          foreach ($row as $name=>$value) {
            $assigned .= $value . ",";			                
          } // end field loop
		$assigned  .= "\n";
        } // end record loop

      } catch(PDOException $e) {
          echo 'ERROR: ' . $e->getMessage();
      } // end try
	                                                              // load up ball suppliers
	  if ($ballSuppliers[0] != "") {
		$assignments .= "<br><p><span style='margin-left:3em'><strong> Ball Suppliers:   </strong> " ; 
		for ($i = 0; $i < sizeof($ballSuppliers); $i++) {
			$assignments .= "\t" . $ballSuppliers[$i] . "\t" ;
		}
		$assignments .= "</p>";
	  }	

	  $availableArray = explode(",", $available);
	  $assignedArray  = explode(",", $assigned);
      $unassignedArray = array();                                  // load up unassigned array for subs
	  	  
	  $i = 0;  $k =0;
      while ($i < sizeof($availableArray)-1){
		$j = 0;
		$availableAssigned = false;
		while ($j < sizeof($assignedArray)-1){
		  if( trim($availableArray[$i]) == trim($assignedArray[$j]) ) {			  
			$availableAssigned = true;
			break;
		  }
		  $j++;
		}
	    if ($availableAssigned == false) {
          $unassignedArray[$k] = $availableArray[$i];
          $k++;		  
        }		
		
	    $i++;
      }
	                                                              // show subs
	  if ($unassignedArray[0] != "") {
		$assignments .= "<p> <span style='margin-left:3em'><strong> Subs:   </strong> " ; 
		for ($i = 0; $i < sizeof($unassignedArray); $i++) {
			$assignments .= "\t" . $unassignedArray[$i] . "\t" ;
		}
		$assignments .= "<br></p>";
	  }	
	  
	} // end for (dates)

	   try 
	  {		
		$query = "SELECT startTime FROM facility WHERE leagueID = '$leagueID' AND facilityName = '$facilityName' ";  // set start time
        
        //first pass just gets the column names

        $result = $con->query($query);
        //return only the first row (we only need field names)
        $row = $result->fetch(PDO::FETCH_ASSOC);

        foreach ($row as $field => $value){
        } // end foreach
 
        //second pass gets the data
        $data = $con->query($query);
        $data->setFetchMode(PDO::FETCH_ASSOC);
		$n = 0;

        foreach($data as $row){
			foreach ($row as $name=>$value){ 
			  if ($name == 'startTime' && $n == 0) $startTime = $value; 
              $n++;			  
			} // end field loop
        } // end record loop		
		
      } catch(PDOException $e) {
          echo 'ERROR: ' . $e->getMessage();
      } // end try

	  
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
  
  <style type = "text/css">
		  
	#memberList {
		margin: 100px;
		font-size:200%;
	} 
  </style>
  <div id = "memberList"> 
<?php
		if ($dateArray[0] != "0000-00-00") {
			$displayStartTime = substr($startTime,0,5);
			$body = "
                <span style='margin-left:4em'><strong>$leagueName</strong> <br><br>
				<span style='margin-left:4em'>START TIME: <strong>$displayStartTime</strong>AM
                <span style='margin-left:3em'>$assignments  
				<span style='margin-left:3em'><img src='logo.jpg' alt= 'Coconut Logo'/>
				<a href='members.php'><u>Press here for contact information</u></a>
                ";
		}
		else {
			$body = "<p></p>
                <p><span style='margin-left:2em'><strong>Upcoming court assignments have not yet been posted.</strong><br><br><br>
				<span style='margin-left:2em'><strong>Please check back later.</strong></p>
                ";
		}
			
		print (" <p> $body </p> ");
 
?>	
  </div>	

</body>
</html> 
