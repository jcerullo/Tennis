<?php
      session_start();
	  $leagueID = $_SESSION["leagueID"];

      try {
        $con= new PDO('mysql:host=localhost;dbname=tennis', "root", "jjc003");
        $con->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

        $query = "SELECT *
		                 FROM member  
						 WHERE status = 'A' AND leagueID = '$leagueID'
						 ORDER BY mbrID ";
        
        //first pass just gets the column names

        $result = $con->query($query);
        $row = $result->fetch(PDO::FETCH_ASSOC);
        print " <option value = '*All' > *All </option> ";
        foreach ($row as $field => $value){ 		  
        } // end foreach
 
        //second query gets the data
        $data = $con->query($query);
        $data->setFetchMode(PDO::FETCH_ASSOC);		

        foreach($data as $row){
          foreach ($row as $name=>$value){              

		    if ($name=='mbrID') {
			  $mbrID = $value;
			  print <<<HERE
			<option value = "$mbrID"> $mbrID </option> 
HERE;
            }

          } // end field loop

        } // end record loop

      } catch(PDOException $e) {
          echo 'ERROR: ' . $e->getMessage();
      } // end try
	  
?>