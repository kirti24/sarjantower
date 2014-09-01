<%@page session="false" %>
<div class="row">
	<div class="col-lg-4">
		<form method="post" action="event">
			<fieldset>
				<legend>Voting</legend>
				<input type="submit" name="eventname" class="btn btn-primary"
					value="Solo Dance"><br /> <br /> 
				<input type="submit"
					name="eventname" class="btn btn-primary" value="Group Dance" disabled><br /> <br />
				
				<%if(request.getSession(false).getAttribute("user").toString().equalsIgnoreCase("admin")){ %>
				<input type="submit"
					name="eventname" class="btn btn-primary" value="Group Dance"><br /> <br />
				<%} %>
				<input type="submit"
					name="eventname" class="btn btn-primary" value="Fancy Dress"
					disabled>
				<br /> <br />
			</fieldset>
		</form>
	</div>
	<div class="col-lg-6">
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
				</tbody>
			</table>
		</div>
	</div>
</div>