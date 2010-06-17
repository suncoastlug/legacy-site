<?php
require_once('template.php');
page_header('Linux Jobs');
echo <<<END
<div id="content3">
<p>
(If you have a job you'd like to offer to Linux users in the Tampa Bay area,
go <a href="./jobpost.php">here</a>.)
<p>
One of the services that SLUG provides to members is a listing of Linux-related
jobs in the Tampa Bay area. If you're out of work or looking for a better
opportunity, this is where you go. SLUG accepts job offers at the link above.
We look them over, and then post them to this page.
<p>
Please note: SLUG does not and cannot guarantee that jobs posted here are
legitimate jobs for legitimate companies. If you choose to contact the people
who offer jobs here, you do so at your own risk. However, we ask that if you
find a job offer to be bogus, please contact us. We will either remove the
posting or revise the posting with the correct data.
<!-- DATA GOES HERE -->
END;
include('jobs.txt');
print "</div>\n";
page_footer();
?>