<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<div class="col-sm-8" style="font-size: 10px">
	<hr>

	<footer>
					<div class="container">



						<div class="col-lg-3">
							<div class="cuadro_intro_hover "
								style="background-color: #cccccc;">
								<p style="text-align: center; margin-top: 5px;">
									<img src="images/bottom_logo.PNG" class="img-responsive" alt="">
								</p>
								<div class="caption">
									<div class="blur"></div>
									<div class="caption-text">
										<p>주소: 경기도 수원시 영통구 원천동 광교산로 154-42</p>

										<a class=" btn btn-default"
											href="http://www.kyonggi.ac.kr/KyonggiUp.kgu"><span
											class="glyphicon glyphicon-plus"> INFO</span></a>
									</div>
								</div>
							</div>

						</div>


						<div class="col-lg-3 col-md-6">
							<h4>Categories:</h4>
							<ul>
								<li><a href=""><i class="fa fa-file"></i> 서울 경기대학교</a></li>
								<li><a href=""><i class="fa fa-android"></i> 수원 경기대학교</a></li>
							</ul>
						</div>

						<div class="col-lg-3 col-md-6">
							<h4>Contact:</h4>
							<p>연락처: 031-249-9114</p>
							<p>
								<a href="" title="Contact me!"><i class="fa fa-envelope"></i>
									Contact</a>
							</p>
							<h4>Follow:</h4>


							<a href="" id="gh" target="_blank" title="Twitter"><span
								class="fa-stack fa-lg"> <i
									class="fa fa-square-o fa-stack-2x"></i> <i
									class="fa fa-twitter fa-stack-1x"></i>
							</span> Twitter</a> <a href="" target="_blank" title="GitHub"><span
								class="fa-stack fa-lg"> <i
									class="fa fa-square-o fa-stack-2x"></i> <i
									class="fa fa-github fa-stack-1x"></i>
							</span> GitHub</a>






						</div>
						<br />
						<div id="fb-root"></div>
						<script>
							(function(d, s, id) {
								var js, fjs = d.getElementsByTagName(s)[0];
								if (d.getElementById(id))
									return;
								js = d.createElement(s);
								js.id = id;
								js.src = "//connect.facebook.net/hu_HU/sdk.js#xfbml=1&version=v2.0";
								fjs.parentNode.insertBefore(js, fjs);
							}(document, 'script', 'facebook-jssdk'));
						</script>

						<div class="fb-like" data-href="" data-layout="standard"
							data-action="like" data-show-faces="true" data-share="true"></div>

						<a href="https://twitter.com/share" class="twitter-share-button"
							data-url="">Tweet</a>
						<script>
							!function(d, s, id) {
								var js, fjs = d.getElementsByTagName(s)[0], p = /^http:/
										.test(d.location) ? 'http' : 'https';
								if (!d.getElementById(id)) {
									js = d.createElement(s);
									js.id = id;
									js.src = p
											+ '://platform.twitter.com/widgets.js';
									fjs.parentNode.insertBefore(js, fjs);
								}
							}(document, 'script', 'twitter-wjs');
						</script>

						<div class="g-plusone" data-annotation="inline" data-width="300"
							data-href=""></div>

						<!-- Helyezd el ezt a címkét az utolsó +1 gomb címke mögé. -->
						<script type="text/javascript">
							(function() {
								var po = document.createElement('script');
								po.type = 'text/javascript';
								po.async = true;
								po.src = 'https://apis.google.com/js/platform.js';
								var s = document.getElementsByTagName('script')[0];
								s.parentNode.insertBefore(po, s);
							})();
						</script>
						<br />

						<hr>
						<p>
							Copyright © Your Website | <a href="">Privacy Policy</a> | <a
								href="">Terms of Use</a>
						</p>
	</footer>
</div>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.js"></script>
</body>
</html>