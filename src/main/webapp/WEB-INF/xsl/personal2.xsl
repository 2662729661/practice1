<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output version="1.0" indent="yes" encoding="UTF-8" method="html"/>
	
	<xsl:template match="/document">  
		<html>
			<head>
				<title></title>
				<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
			</head>
			<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous"/>
			<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.bundle.min.js"></script>
			<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
			<script src="js/personal2.js"></script>
			<link rel="stylesheet" href="css/pers.css" type="text/css"/>
			<body>
				<div class="container">
					<div class="row">
						<div class="col-md-12 col-sm-12 col-xs-12 image-section">
							<img src="{coverImgUrl/@src}"/>
						</div>
						<div class="row user-left-part">
							<div class="col-md-3 col-sm-3 col-xs-12 user-profil-part pull-left">
								<div class="row ">
									<div class="col-md-12 col-md-12-sm-12 col-xs-12 user-image text-center">
										<img src="{profileImgUrl/@src}" class="rounded-circle"/>
									</div>
									<div class="col-md-12 col-sm-12 col-xs-12 user-detail-section1 text-center">
										<button id="btn-contact" click="clearModal()" data-toggle="modal" data-target="#contact" class="btn btn-success btn-block follow">加他好友</button>
										<button class="btn btn-warning btn-block">關注他</button>
									</div>
									<div class="d-flex justify-content-center">
										<div class="col-md-12 col-sm-12 user-detail-section2 pull-left">
											<p>追蹤者</p>
											<span>
												<xsl:value-of select="followerCount"/>
											</span>
										</div>
									</div>
									<div class="d-flex justify-content-center">
										<div class="col-md-12 col-sm-12 user-detail-section2 ">
											<p>貼文</p>
											<span>
												<xsl:value-of select="userStoryCount"/>
											</span>
										</div>
									</div>
									<div class="d-flex justify-content-center">
										<div class="col-md-12 col-sm-12 user-detail-section2 pull-right">
											<p>追蹤中</p>
											<span>320</span>
										</div>
									</div>
									<div class="d-flex justify-content-center">
										<xsl:value-of select="profileText"/>
									</div>
								</div>
							</div>
							<div class="col-md-9 col-sm-9 col-xs-12 pull-right profile-right-section">
								<div class="row profile-right-section-row">
									<div class="col-md-12 profile-header">
										<div class="row">
											<div class="col-md-8 col-sm-6 col-xs-6 profile-header-section1">
												<h1>
													<xsl:value-of select="nickname"/>
												</h1>
												<h5>明星賣家</h5>
												<!--<h5>每行<select onchange="getId({id})" id="select">
													<option selected=""></option>
													<option value="1">1</option>
													<option value="2">2</option>
													<option value="3">3</option>
													<option value="4">4</option>
													<option value="5">5</option>
												</select>条</h5>-->
											</div>
											<div class="col-md-8 col-sm-6 col-xs-6 " id="divs">
												<xsl:apply-templates select="userStory/storyImages"/>	
											</div>                               
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>  
			</body>
		</html>
	</xsl:template>	
	<xsl:template match="storyImages"> 
		<div class="row mt-1">
			<xsl:apply-templates select="storyImage"/>	                                  
		</div>
	</xsl:template>
	
	<xsl:template match="storyImage"> 
		<div class="col-sm-4">
			<div class="thumbnail">                         
				<a href="#" class="">                               
					<img src="{@imgUrl}" alt="..." class="image-imUrl"/>
				</a>                                                
			</div>
		</div> 
	</xsl:template>
</xsl:stylesheet>  