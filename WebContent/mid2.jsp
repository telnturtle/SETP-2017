<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<div class="container">
	<div class="col-sm-8" style="border: 1px solid; height: 700px;">
		<div id="content">
			center
			<div class="container"
				style="width: 400px; height: 300px; overflow: hidden">
				<div id="myCarousel" class="carousel slide" data-ride="carousel">
					<ol class="carousel-indicators">
						<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
						<li data-target="#myCarousel" data-slide-to="1"></li>
						<li data-target="#myCarousel" data-slide-to="2"></li>

					</ol>
					<div class="carousel-inner">
						<div class="item active">
							<img src=images/1.jpg style="width: auto; height: 300px;">
						</div>
						<div class="item">
							<img src=images/2.jpg style="width: auto; height: 300px;">
						</div>
						<div class="item">
							<img src=images/3.jpg style="width: auto; height: 300px;">
						</div>
					</div>
					<a class="left carousel-control " href="#myCarousel"
						data-slide="prev"> <span
						class="glyphicon glyphicon-chevron-left"></span>
					</a> <a class="right carousel-control " href="#myCarousel"
						data-slide="next"> <span
						class="glyphicon glyphicon-chevron-right"></span>
					</a>
				</div>
			</div>

		</div>
	</div>
</div>

