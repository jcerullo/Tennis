<?php
session_start();
//                                             Interface with my Home Assistant Florida thru MQTT  
require '/var/www/html/tennis/phpMQTT.php';   
$server = "10.0.0.243";           // points to the home assistant RPi
$port = 1883;                     
$username = "jcerullo";                  
$password = "jjc003";                  
$client_id = "phpMQTT-publisher"; // make sure this is unique for connecting to sever - you could use uniqid()
// $client_id .= uniqid();
$topic = "tennis/entity";         // default topic
$entityNbr = 0;
$maxNbr = 8;
$players = array();
$playtoday = "false";

$topics = array();                                // topics for each entity
$topics[0] =  $topic;                             // default entity topic
$topics[1] =  "tennis/entity/playdate";           // entity 1 topic 
$topics[2] =  "tennis/entity/playlocation";       // entity 2 topic
$topics[3] =  "tennis/entity/playstarttime";      // entity 3 topic 
$topics[4] =  "tennis/entity/player1";            // entity 4 topic
$topics[5] =  "tennis/entity/player2";            // etc.
$topics[6] =  "tennis/entity/player3";
$topics[7] =  "tennis/entity/player4";
$topics[8] =  "tennis/entity/player5";
$topics[9] =  "tennis/entity/player6";
$topics[10] = "tennis/entity/player7";
$topics[11] = "tennis/entity/player8"; 
$topics[12] = "tennis/entity/playleague"; 
$topics[13] = "tennis/entity/playtoday";          // values are true and false
$topics[14] = $topic; 
$topics[15] = $topic; 
$topics[16] = $topic;

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
        $mbrID =   $_SESSION["mbrID"];            // mbrID is set through login
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
	
	if ($_GET['mbrID'] != '') {
		$mbrID = $_GET['mbrID'];                   // mbrID is set in URL
	}
	else
	{
		$mbrID = "JohnC";
	}

	$monthNames = array("January", "February", "March", "April", "May", "June",
                     "July", "August", "September", "October", "November", "December", "January");
	$month = (int) date('m');
	$monthName = $monthNames[$month];
	$dateArray = array();
	$dateArray[0] = "0000-00-00";
	$ballSuppliers = array();
	
			
		                                                                 //  load up date array
	$todaysDate = date("Y-m-d");
	$todaysTime = date("H:i");
		
	   try 
	   {
        $con= new PDO("mysql:host=localhost;dbname=tennis", "root", "jjc003"); 
        $con->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
		                                                                          //set date and league of MY play
        $query = "SELECT date, assignment.leagueID as 'leagueID', assignment.facilityName as 'facilityName', mbrID 
		              FROM assignment
                      INNER JOIN facility ON assignment.facilityName = facility.facilityName AND assignment.leagueID = facility.leagueID				  
					  WHERE (assignment.date > '$todaysDate' AND assignment.mbrID = '$mbrID') 
					     OR (assignment.date = '$todaysDate' AND facility.endTime > '$todaysTime' AND assignment.mbrID = '$mbrID') 
					  ORDER BY date, facilityName ";  
    
        //first pass just gets the column names
        $result = $con->query($query);
        //return only the first row (we only need field names)
        $row = $result->fetch(PDO::FETCH_ASSOC);

        foreach ($row as $field => $value){
        } // end foreach
 
        //second pass gets the data
        $data = $con->query($query);
        $data->setFetchMode(PDO::FETCH_ASSOC);
		$n = -1;

        foreach($data as $row){
			$n++;
			foreach ($row as $name=>$value){ 
              if ($name == 'date') $dateArray[$n] = $value;
			  if ($name == 'leagueID' && $n == 0) $leagueID = $value;              // set league by next date of play
			  if ($name == 'facilityName' && $n == 0) $facilityName = $value;      // set facility by next date of play			  		  
			} // end field loop
        } // end record loop
		
		$_SESSION["leagueID"] = $leagueID;		// reset leagueID
		
		$result = $con->query("SELECT * FROM league WHERE leagueID = '$leagueID' ");
		$result->setFetchMode(PDO::FETCH_ASSOC);

		foreach ($result as $row) {
		  foreach ($row as $name =>$value ) {                         
			if ($name == 'leagueName') {
			  $leagueName = $value;
			}
			if ($name == 'moderatedBy') $moderatedBy = $value;
		  }		 		  
	    }  			
		
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
																			// loop though the dates; currently displaying only next date to play	
//	for ($n=0; $n < sizeof($dateArray); $n++)
	for ($n=0; $n < 1; $n++) 
	{
			
		    $timestamp = strtotime($dateArray[$n]);                          // get day name
            $dayName = date("l", $timestamp);

			$assignments .= "<p><br><span style='margin-left:4em'><strong> $dayName, $dateArray[$n] </strong></p>";																
	        $playDate = "$dayName, $dateArray[$n]";
	        $playdate = trim($playdate);
            $nextplay =  $dateArray[$n];			
	   try 
	   {
		$available = "";                                                    //  load up available members into $available string
        $con= new PDO('mysql:host=localhost;dbname=tennis', "root", "jjc003"); 
        $con->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
		
		$available = "";
        $query = "SELECT mbrID FROM available WHERE dates = '$dateArray[$n]' AND leagueID = '$leagueID' ";
        
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
	  
	  
    $assigned = "";	  //                                          load up assigned members into $assigned string
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
          if ($field == 'Courts' || $field == 'Players') {
			$assignments .= "<th><span style='margin-left:3em'><u>$field</u><span style='margin-left:3em'></th> \n";
		  }	  
        } // end foreach
        $assignments .= "  </tr> \n";
 
        //second pass gets the data
        $data = $con->query($query);
        $data->setFetchMode(PDO::FETCH_ASSOC);
		$courtChanged = false;
		$i = 0;
		$j = 0;

        foreach($data as $row){	
			
          $assignments .= "  <tr> \n";
		  
          foreach ($row as $name=>$value) {	
            if ($name == 'Courts' || $name == 'Players' ) $assignments .= "    <td> <span style='margin-left:3em; color:black;'>$value</td> \n";
			
			  if ($name == 'Courts' && $n = 1) {
				$playFacility = $value;
				$playFacility = trim($playFacility);
			  }

			if ($name == 'Players' ) {
			  $j = $j +1;
			  $player = $value;
              $players[$j] = trim($player);
            }
			
			if ($name == 'balls' && $value == 'Y') {
				$ballSuppliers[$i] = $player;
				$i = $i +1;
			}
          } // end field loop
		  
          $assignments .= "  </tr> \n";				  			
		  
        } // end record loop

        $assignments .= "</table> \n" ;
	                                                               // Second query is just for the member IDs
																   
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
                <span style='margin-left:2em'>My next scheduled tennis date is with:<br><br>
				<span style='margin-left:4em'><strong>$leagueName</strong> <br><br>
				<span style='margin-left:4em'>START TIME: <strong>$displayStartTime</strong>AM
                <span style='margin-left:3em'>$assignments  
				<span style='margin-left:3em'><img src='logo.jpg' alt= 'Coconut Logo'/>
				<a href='members.php'><u>Press here for contact information</u></a>
                "; 
		    $playleague = trim($leagueName);
			$playTime = trim($displayStartTime);
			if ($nextplay == $todaysDate) {
				$playtoday = "true";
			}
			else {
			    $playtoday = "false";
			}
		}
		else {
			$body = "<p></p>
                <p><span style='margin-left:2em'><strong>Your court assignments have not yet been posted online.</strong><br><br><br>
				<span style='margin-left:2em'><strong>Please check back later or</strong><br>
				<span style='margin-left:2em'><strong> call your league moderator.</strong><br>
				</p>
                ";
			$playleague = "None Scheduled";
            $playFacility = " ";
			$playDate = " ";
			$playTime = " ";
			$players[1] = " ";
			$players[2] = " ";
			$players[3] = " ";
			$players[4] = " ";
			$players[5] = " ";
			$players[6] = " ";
			$players[7] = " ";
			$players[8] = " ";
		}
			
		print (" <p> $body </p> ");
		
//                                    Publish the results for Home Assistant Florida

				  $client_id .= 1;
				  $mqtt = new phpMQTT($server, $port, $client_id);
                  $mqtt->connect(true, NULL, $username, $password); 				  
			      $mqtt->publish($topics[1], "$playDate", 0);
	              $mqtt->close();
		  
				  $client_id .= 2;
				  $mqtt = new phpMQTT($server, $port, $client_id);
                  $mqtt->connect(true, NULL, $username, $password); 				  
			      $mqtt->publish($topics[2], "$playFacility" ,0);
	              $mqtt->close();				  
				  
				  $client_id .= 3;
				  $mqtt = new phpMQTT($server, $port, $client_id);
                  $mqtt->connect(true, NULL, $username, $password); 				  
			      $mqtt->publish($topics[3], "$playTime", 0);
	              $mqtt->close();
				  
				  $client_id .= 4;
				  $mqtt = new phpMQTT($server, $port, $client_id);
                  $mqtt->connect(true, NULL, $username, $password); 				  
			      $mqtt->publish($topics[4], "$players[1]", 0);
	              $mqtt->close();
				  
				  $client_id .= 5;
				  $mqtt = new phpMQTT($server, $port, $client_id);
                  $mqtt->connect(true, NULL, $username, $password); 				  
			      $mqtt->publish($topics[5], "$players[2]", 0);
	              $mqtt->close();
				  
				  $client_id .= 6;
				  $mqtt = new phpMQTT($server, $port, $client_id);
                  $mqtt->connect(true, NULL, $username, $password); 				  
			      $mqtt->publish($topics[6], "$players[3]", 0);
	              $mqtt->close();
				  
				  $client_id .= 7;				  
				  $mqtt = new phpMQTT($server, $port, $client_id);
                  $mqtt->connect(true, NULL, $username, $password); 				  
			      $mqtt->publish($topics[7], "$players[4]", 0);
	              $mqtt->close();
				  
				  $client_id .= 8;
				  $mqtt = new phpMQTT($server, $port, $client_id);
                  $mqtt->connect(true, NULL, $username, $password); 				  
			      $mqtt->publish($topics[8], "$players[5]", 0);
	              $mqtt->close();				  
				  
				  $client_id .= 9;
				  $mqtt = new phpMQTT($server, $port, $client_id);
                  $mqtt->connect(true, NULL, $username, $password); 				  
			      $mqtt->publish($topics[9], "$players[6]", 0);
	              $mqtt->close();
				  
				  $client_id .= 10;
				  $mqtt = new phpMQTT($server, $port, $client_id);
                  $mqtt->connect(true, NULL, $username, $password); 				  
			      $mqtt->publish($topics[10], "$players[7]", 0);
	              $mqtt->close();
				  
				  $client_id .= 11;
				  $mqtt = new phpMQTT($server, $port, $client_id);
                  $mqtt->connect(true, NULL, $username, $password); 				  
			      $mqtt->publish($topics[11], "$players[8]", 0);
	              $mqtt->close();
				  
				  $client_id .= 12;
				  $mqtt = new phpMQTT($server, $port, $client_id);
                  $mqtt->connect(true, NULL, $username, $password); 				  
			      $mqtt->publish($topics[12], "$playleague", 0);
	              $mqtt->close();
				  
				  $client_id .= 13;
				  $mqtt = new phpMQTT($server, $port, $client_id);
                  $mqtt->connect(true, NULL, $username, $password); 				  
			      $mqtt->publish($topics[13], "$playtoday", 0);
	              $mqtt->close();				  
?>	
  </div>	

</body>
</html> 
