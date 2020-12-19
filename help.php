<!DOCTYPE html>
<html>
<head>
  <title>Tennis</title>
  <meta charset="utf-8"/>
  <link rel="stylesheet" type="text/css" href="bootstrap.css">
  <link href='https://fonts.googleapis.com/css?family=Roboto:300,400,700' rel='stylesheet' type='text/css'>
  <link rel="stylesheet" type="text/css" href="main.css">
</head>
<body>

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
		<li><a href="#">Help &raquo;</a>
			<ul>
				<li><a href="settings.php">Settings</a></li>
				<li><a href="help.php">User Guide</a></li>				
			</ul>				
		</li>
	</ul>
</nav>

</div><!--end wrapper-->
</header>

<body>

<section class="col-md-6">
      <h4><u>Login help page</u></h4>
	  <h5>A member ID and temporary password are assigned to you by a club administrator.  The member ID is a unique identifier, <strong>case 
	  sensitive</strong>, usually your capitalized first name and last name initial, e.g. DickM or JohnC.  After entering your assigned password, 
	  the member profile screen is auto displayed so that you can change the password and submit your personal identifying information.
	  If the password field is not displayed on the screen, then the administrator has temporarily turned off security and all members have administrator rights
	  simply be entering a valid member ID.
	   <br><br>
	   Only active members will be notified of upcoming events and only active members can submit their availability for those events. (Active and Inactive member status 
	   is set on the member profile screen.)
	    <br><br>
	   That said, everyone is invited to login for information that the administrators have made public.  Currently, public information is restricted 
	   to a member's name and phone number via the MemberInfo/MemberRoster screen. Other personal information concerning the members (optionally entered 
	   for the use of the club administrator)
	   is not available even to other club members.  Members and passwords that are not recognized are logged in as <strong> Guest </strong>. If a member 
	   accidently logs in as Guest, he or she must select Login from the memu at the top of the page and reenter their member ID and password.  The first 
	   press of Login displays login status; a second press allows login reentry.
	  </h5>
	  <br>
	  
	  <h4><u>Member Availability Page</u></h4>
	  <h5>
	  You enter your availability dates (i.e. the days that you're available to play tennis) one month at a time.  The default is to enter your availability 
	  for the following month from today’s date.  
	  You will notice that when you display the calendar, you can only display future months (by pressing the tabs at the top of the calendar).  
	  In order to display the current month or past months, you have to first press the ChangeMonth menu option at the top of the page.

	  <br><br>Important:  if you have entered your availability dates and later decide to add or change a date,
	  it’s necessary to re-enter ALL of your dates.  That’s why you should only enter one month at a time.
	  </h5><br>
	  
	  <h4><u>Daily Court Assignment Page</u></h4>
	  <h5>
	  Court assignments are normally entered by the club administrator. 
	  First, a day is selected. Then an available player and court is selected for that day. Multiple players and courts can be entered by holding down
	  the ctrl key (assuming Windows) while making selections.

      <br><br>The current state of all court assignments for the selected day appears at the bottom of the page.<br><br>
	  
	  <h4><u>Weekly Court Assignment Page and Format Email Page</u></h4>
	  <h5>
	  Court assignments for a single day are displayed in the Daily Court Assignment Page as described above. 
	  Court assignments for multiple days can be displayed from the Weekly Court Assignment page or the FormatEmail page. 
	  In the FormatEmail page select ‘Notification of court assignments’ from the drop-down list in the Subject field. 
	  Then enter all of the dates in the date field that you want to display. Then press the submit button.
	  </h5><br>
	  
	  <h4><u>Member Roster Page</u></h4>
	  <h5>
	  The Weekly Court Assignment and Member Roster pages are available to everyone, even users who do not log in. 
	  In case of bad weather or no-shows, these are the reference pages to use.  They are optimized for smartphone use.
	  </h5><br>
	  
	  <h4><u>Member Photos</u></h4>
	  <h5>
	  Do you sometimes have difficulty matching names with faces? 
	  We will be hosting a website for those in your tennis group who would like to see photos of their fellow players.
      But the website is useless without strong participation. So please add your photo to the tennis group roster by sending 
	  an email with your first name and a photo attachment to:  photosatthevillages@gmail.com
	  </br></br>
	  Be advised that your submitted photo belongs to you alone.  You can replace or delete the photo any time you wish.
	  Instructions for maintaining your photo will be sent to you via email after your photo is received.
	  </h5>
	  
</section>

</body>
</html>  
