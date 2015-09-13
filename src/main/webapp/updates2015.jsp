<div class="row">
	<div class="col-md-2">
		<div class="pallete-item">
			<dl class="palette palette-wet-asphalt">
				<dt>
					<a href="2014.jsp" style="text-decoration: none; color: white;">2014</a>
				</dt>
				<!-- <dd>&nbsp;</dd> -->
			</dl>
		</div>

		<div class="pallete-item">
			<dl class="palette palette-wet-asphalt">
				<dt>
					<a href="#" onclick="load('schedule2015.jsp')"
						style="text-decoration: none; color: white;">Schedule</a>
				</dt>
				<!-- <dd>&nbsp;</dd> -->
			</dl>
		</div>


		<div class="pallete-item">
			<dl class="palette palette-wet-asphalt">
				<dt>Voting</dt>
				<!-- <dd>&nbsp;</dd> -->
			</dl>
		</div>

		<div class="pallete-item">
			<dl class="palette palette-wet-asphalt">
				<dt>Photo Gallery</dt>
				<!-- <dd>&nbsp;</dd> -->
			</dl>
		</div>

	</div>
	<div class="col-md-10" id="update2015">
		<div id="update2015">
			<!-- need to remove later -->
			<jsp:include page="schedule2015.jsp"></jsp:include>
		</div>
	</div>
</div>
<script type="text/javascript">
	function load(page) {
		$('#update2015').load(page);
	}
</script>