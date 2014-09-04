<%@page session="false"%>
<div class="row">
	<div class="col-lg-4">
		<form method="post" action="event">
			<fieldset>
				<legend>Voting</legend>
				<input type="submit" name="eventname" class="btn btn-primary"
					value="Solo Dance"><br /> <br /> <input type="submit"
					name="eventname" class="btn btn-primary" value="Group Dance"><br />
				<br /> <input type="submit" name="eventname"
					class="btn btn-primary" value="Fancy Dress" disabled> <br />
				<br />
			</fieldset>
		</form>
	</div>
	<div class="col-lg-6">

		<div class="row">
			<h3>Treasure Hunt Scores</h3>

			<%
				if (request.getSession(false).getAttribute("user").toString()
						.equalsIgnoreCase("admin")) {
			%>
			<h4>
				<a href="#" onclick="toggle('TreasureHuntWinners')">Click to
					show/hide winners list</a>
			</h4>
			<div id="TreasureHuntWinners" style="display: none">
				<table class="table table-bordered">
					<tbody>
						<tr>
							<td colspan="3"><b>Treasure Hunt Winners List</b></td>
						</tr>
						<tr>
							<td>Kirti Agarwal</td>
							<td>Deepika Chaudhary</td>
							<td>Mayank Agarwal</td>
						</tr>
						<tr>
							<td>Sumit Biyani</td>
							<td>Manish Bajaj</td>
							<td>Shubhangi Bajoria</td>
						</tr>
						<tr>
							<td>Navin Somani</td>
							<td>Darshan Chaubey</td>
							<td>Mr. JP Biyala</td>
						</tr>
						<tr>
							<td>Mr. Vijay Rathi</td>
							<td>Nakshatra Chopde</td>
							<td>Naman Bajaj</td>
						</tr>
						<tr>
							<td>Pratik Rathi</td>
							<td>Raj Agarwal</td>
							<td>Advik</td>
						</tr>
						<tr>
							<td>Kshama Dhanuka</td>
							<td>Pooja Dhanuka</td>
							<td>Prerna</td>
						</tr>
						<tr>
							<td>Yashika Agarwal</td>
							<td>Mr. Kamal</td>
							<td>Ayush</td>
						</tr>
						<tr>
							<td>Mrs. Alpa Gupta</td>
							<td>Naitik</td>
							<td></td>
						</tr>
					</tbody>
				</table>
			</div>
			<%
				}
			%>
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>#</th>
						<th>Team A</th>
						<th>Team B</th>
						<th>Team C</th>
						<th>Team D</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>Mascott Round</td>
						<td>40</td>
						<td>50</td>
						<td>30</td>
						<td>20</td>
					</tr>
					<tr>
						<td>Social Media Code</td>
						<td>-</td>
						<td>-</td>
						<td>20</td>
						<td>20</td>
					</tr>
					<tr>
						<td>QR Code</td>
						<td>20</td>
						<td>30</td>
						<td>40</td>
						<td>50</td>
					</tr>
					<tr>
						<td>Water Task - Make a word</td>
						<td>20</td>
						<td>40</td>
						<td>30</td>
						<td>50</td>
					</tr>
					<tr>
						<td>Questionnaire</td>
						<td>10</td>
						<td>10</td>
						<td>10</td>
						<td>10</td>
					</tr>
					<tr class="info">
						<td><b>Total</b></td>
						<td><b>90</b></td>
						<td><b>130</b></td>
						<td><b>130</b></td>
						<td><b>150</b></td>
					</tr>
				</tbody>
			</table>
		</div>


		<div class="row">
			<h3>Antakshri Scores</h3>
			<%
				if (request.getSession(false).getAttribute("user").toString()
						.equalsIgnoreCase("admin")) {
			%>
			<h4>
				<a href="#" onclick="toggle('AntakshriWinners')">Click to
					show/hide winners list</a>
			</h4>
			<div id="AntakshriWinners" style="display: none">
				<table class="table table-bordered">
					<tbody>
						<tr>
							<td colspan="3"><b>Antakshri Winners List</b></td>
						</tr>
						<tr>
							<td>Mrs. Suman Biyala</td>
							<td>Mrs. Mantri</td>
							<td>Mrs. Anita Mantri</td>
						</tr>
						<tr>
							<td>Sushmita Agarwal</td>
							<td>Akrati Biyala</td>
							<td>Shreya Malsariya</td>
						</tr>
						<tr>
							<td>Sneha Somani</td>
							<td>Varun Agarwal</td>
							<td>Gaurav Bagaria</td>
						</tr>
						<tr>
							<td>Hemant Tulsiyan</td>
							<td>Ashish Parasrampuria</td>
							<td>Mrs. Deepa Toshniwal</td>
						</tr>
						<tr>
							<td>Radhika Jhunjhunwala</td>
							<td>Mrs. Sarda</td>
							<td>Mr. Rajpurohit</td>
						</tr>
						<tr>
							<td>Mrs. Chanda</td>
							<td>Aditya Jhunjhunwala</td>
							<td>Priyanshu Mondal</td>
						</tr>
						<tr>
							<td>Jyoti Keyal</td>
							<td>Rashmi Sharma</td>
							<td></td>
						</tr>
					</tbody>
				</table>
			</div>
			<%
				}
			%>


			<table class="table table-bordered">
				<thead>
					<tr>
						<th>#</th>
						<th>Team A</th>
						<th>Team B</th>
						<th>Team C</th>
						<th>Team D</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>1</td>
						<td>20</td>
						<td>20</td>
						<td>20</td>
						<td>20</td>
					</tr>
					<tr>
						<td>2</td>
						<td>60</td>
						<td>60</td>
						<td>60</td>
						<td>60</td>
					</tr>
					<tr>
						<td>3</td>
						<td>20</td>
						<td>0</td>
						<td>20</td>
						<td>20</td>
					</tr>
					<tr>
						<td>4</td>
						<td>60 + 10</td>
						<td>60</td>
						<td>30</td>
						<td>30</td>
					</tr>
					<tr>
						<td>5</td>
						<td>60 + 10</td>
						<td>60</td>
						<td>30</td>
						<td>60</td>
					</tr>
					<tr>
						<td>6</td>
						<td>40</td>
						<td>0</td>
						<td>80 + 25</td>
						<td>40</td>
					</tr>
					<tr>
						<td>7</td>
						<td>20</td>
						<td>60 + 10 - 5</td>
						<td>40 + 10</td>
						<td>40 + 10 + 10</td>
					</tr>

					<tr class="info">
						<td><b>Total</b></td>
						<td><b>300</b></td>
						<td><b>265</b></td>
						<td><b>315</b></td>
						<td><b>290</b></td>
					</tr>

				</tbody>
			</table>
		</div>

		<div class="row">
			<h3>Scavenger Hunt Scores (as of 29-Aug)</h3>
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>Item</th>
						<th>Team A</th>
						<th>Team B</th>
						<th>Team C</th>
						<th>Team D</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>Picture of Team Member praying to parents</td>
						<td>5</td>
						<td>10</td>
						<td>3</td>
						<td>-</td>
					</tr>
					<tr>
						<td>Railway pass expiring in Dec 2013</td>
						<td>3</td>
						<td>-</td>
						<td>10</td>
						<td>5</td>
					</tr>
					<tr>
						<td>School calendar with a page full of remarks</td>
						<td>3</td>
						<td>10</td>
						<td>5</td>
						<td>-</td>
					</tr>
					<tr>
						<td>Nokia 6600</td>
						<td>-</td>
						<td>-</td>
						<td>-</td>
						<td>-</td>
					</tr>
					<tr>
						<td>Zara company T-Shirt</td>
						<td>-</td>
						<td>-</td>
						<td>-</td>
						<td>10</td>
					</tr>
					<tr>
						<td>Webster Dictionary</td>
						<td>-</td>
						<td>-</td>
						<td>-</td>
						<td>-</td>
					</tr>
					<tr>
						<td>Jai Hind College ID</td>
						<td>-</td>
						<td>10</td>
						<td>-</td>
						<td>-</td>
					</tr>

					<tr class="info">
						<td><b>Total</b></td>
						<td><b>11</b></td>
						<td><b>30</b></td>
						<td><b>18</b></td>
						<td><b>15</b></td>
					</tr>

				</tbody>
			</table>
		</div>
		<div class="row">
			<h3>Quiz Results</h3>
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>#</th>
						<th>Date</th>
						<th>Name</th>
						<th>Time</th>
						<th>Correct</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>1</td>
						<td>29-Aug</td>
						<td>Manish Bajaj</td>
						<td>9:27 PM</td>
						<td><i class="glyphicon glyphicon-ok"></i></td>
					</tr>
					<tr>
						<td>2</td>
						<td>29-Aug</td>
						<td>Ishaan Jalan</td>
						<td>10:39 PM</td>
						<td><i class="glyphicon glyphicon-remove"></i></td>
					</tr>
					<tr class="active">
						<td>3</td>
						<td>30-Aug</td>
						<td>Neha Agarwal</td>
						<td>11:38 PM</td>
						<td><i class="glyphicon glyphicon-ok"></i></td>
					</tr>
					<tr>
						<td>4</td>
						<td>01-Sep</td>
						<td>Rishi Singh</td>
						<td>9:51 PM</td>
						<td><i class="glyphicon glyphicon-remove"></i></td>
					</tr>
					<tr>
						<td>5</td>
						<td>01-Sep</td>
						<td>Kovid Prabhakar</td>
						<td>9:52 PM</td>
						<td><i class="glyphicon glyphicon-remove"></i></td>
					</tr>
					<tr>
						<td>6</td>
						<td>01-Sep</td>
						<td>Sushmita Agarwal</td>
						<td>9:54 PM</td>
						<td><i class="glyphicon glyphicon-ok"></i></td>
					</tr>
					<tr>
						<td>7</td>
						<td>01-Sep</td>
						<td>Mayank Agarwal</td>
						<td>9:56 PM</td>
						<td><i class="glyphicon glyphicon-ok"></i></td>
					</tr>
					<tr>
						<td>8</td>
						<td>01-Sep</td>
						<td>Ashish Parasrampuria</td>
						<td>9:58 PM</td>
						<td><i class="glyphicon glyphicon-ok"></i></td>
					</tr>
					<tr>
						<td>9</td>
						<td>01-Sep</td>
						<td>Akrati Biyala</td>
						<td>10:02 PM</td>
						<td><i class="glyphicon glyphicon-ok"></i></td>
					</tr>
					<tr>
						<td>10</td>
						<td>01-Sep</td>
						<td>Saloni Deorah</td>
						<td>10:03 PM</td>
						<td><i class="glyphicon glyphicon-ok"></i></td>
					</tr>
					<tr>
						<td>11</td>
						<td>01-Sep</td>
						<td>Saloni Agarwal</td>
						<td>10:05 PM</td>
						<td><i class="glyphicon glyphicon-ok"></i></td>
					</tr>
					<tr>
						<td>12</td>
						<td>01-Sep</td>
						<td>Harsha Agarwal</td>
						<td>10:06 PM</td>
						<td><i class="glyphicon glyphicon-ok"></i></td>
					</tr>
					<tr class="active">
						<td>13</td>
						<td>02-Sep</td>
						<td>Kirti Agarwal</td>
						<td>10:09 PM</td>
						<td><i class="glyphicon glyphicon-remove"></i></td>
					</tr>
					<tr class="active">
						<td>14</td>
						<td>02-Sep</td>
						<td>Kovid Prabhakar</td>
						<td>10:11 PM</td>
						<td><i class="glyphicon glyphicon-remove"></i></td>
					</tr>
					<tr class="active">
						<td>15</td>
						<td>02-Sep</td>
						<td>Sushmita Agarwal</td>
						<td>10:12 PM</td>
						<td><i class="glyphicon glyphicon-remove"></i></td>
					</tr>
					<tr class="active">
						<td>16</td>
						<td>02-Sep</td>
						<td>Vijay Rathi</td>
						<td>10:12 PM</td>
						<td><i class="glyphicon glyphicon-remove"></i></td>
					</tr>
					<tr class="active">
						<td>17</td>
						<td>02-Sep</td>
						<td>Nidhi Rajpurohit</td>
						<td>10:42 PM</td>
						<td><i class="glyphicon glyphicon-remove"></i></td>
					</tr>
					<tr class="active">
						<td>18</td>
						<td>03-Sep</td>
						<td>Drex Franco</td>
						<td>08:43 AM</td>
						<td><i class="glyphicon glyphicon-ok"></i></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>


<script type="text/javascript">
	function toggle(id) {
		var e = document.getElementById(id);
		if (e.style.display == 'block')
			e.style.display = 'none';
		else
			e.style.display = 'block';
	}
</script>
