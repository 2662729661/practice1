<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output version="1.0" indent="yes" encoding="UTF-8" method="html"/>
	
	<xsl:template match="/document">  
		<html>
			<head>
				<title></title>
				<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
				<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous"/>
				<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.bundle.min.js"></script>
				<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
				<link rel="stylesheet" href="css/b.css" type="text/css"/>
			</head>
			<!--<style type="text/css">
				body{
				margin-top: auto;
				background-color: #f1f1f1;
				}
				.border{
				border-bottom:1px solid #F1F1F1;
				margin-bottom:10px;
				}
				.main-secction{
				box-shadow: 10px 10px 10px;
				}
				.image-section{
				padding: 0px;
				}
				.image-section img{
				width: 100%;
				height:250px;
				position: relative;
				}
				.user-image{
				position: absolute;
				margin-top:-50px;
				}
				.user-left-part{
				margin: 0px;
				}
				.user-image img{
				width:100px;
				height:100px;
				}
				.user-profil-part{
				padding-bottom:30px;
				background-color:#FAFAFA;
				}
				.follow{    
				margin-top:70px;   
				}
				.user-detail-row{
				margin:0px; 
				}
				.user-detail-section2 p{
				font-size:12px;
				padding: 0px;
				margin: 0px;
				}
				.user-detail-section2{
				margin-top:10px;
				}
				.user-detail-section2 span{
				color:#7CBBC3;
				font-size: 20px;
				}
				.user-detail-section2 small{
				font-size:12px;
				color:#D3A86A;
				}
				.profile-right-section{
				padding: 20px 0px 10px 15px;
				background-color: #FFFFFF;  
				}
				.profile-right-section-row{
				margin: 0px;
				}
				.profile-header-section1 h1{
				font-size: 25px;
				margin: 0px;
				}
				.profile-header-section1 h5{
				color: #0062cc;
				}
				.req-btn{
				height:30px;
				font-size:12px;
				}
				.profile-tag{
				padding: 10px;
				border:1px solid #F6F6F6;
				}
				.profile-tag p{
				font-size: 12px;
				color:black;
				}
				.profile-tag i{
				color:#ADADAD;
				font-size: 20px;
				}
				.image-right-part{
				background-color: #FCFCFC;
				margin: 0px;
				padding: 5px;
				}
				.img-main-rightPart{
				background-color: #FCFCFC;
				margin-top: auto;
				}
				.image-right-detail{
				padding: 0px;
				}
				.image-right-detail p{
				font-size: 12px;
				}
				.image-right-detail a:hover{
				text-decoration: none;
				}
				.image-right img{
				width: 100%;
				}
				.image-right-detail-section2{
				margin: 0px;
				}
				.image-right-detail-section2 p{
				color:#38ACDF;
				margin:0px;
				}
				.image-right-detail-section2 span{
				color:#7F7F7F;
				}

				.nav-link{
				font-size: 1.2em;    
				}
  
			</style>-->
			<body>
				<xsl:element name="div">
					<xsl:attribute name="class">container main-secction</xsl:attribute> 
					<xsl:element name="div" >	
						<xsl:attribute name="class">row</xsl:attribute> 
						<xsl:element name="div" >
							<xsl:attribute name="class">col-md-12 col-sm-12 col-xs-12 image-section</xsl:attribute> 
							<xsl:element name="img" >
								<xsl:attribute name="src">https://png.pngtree.com/thumb_back/fw800/back_pic/00/08/57/41562ad4a92b16a.jpg</xsl:attribute> 
							</xsl:element>
						</xsl:element>
						<xsl:element name="div" >
							<xsl:attribute name="class">row user-left-part</xsl:attribute> 
							<xsl:element name="div" >
								<xsl:attribute name="class">col-md-3 col-sm-3 col-xs-12 user-profil-part pull-left</xsl:attribute> 
								<xsl:element name="div" >
									<xsl:attribute name="class">row</xsl:attribute> 
									<xsl:element name="div" >
										<xsl:attribute name="class">col-md-12 col-md-12-sm-12 col-xs-12 user-image text-center</xsl:attribute> 
										<xsl:element name="img" >
											<xsl:attribute name="src">https://www.jamf.com/jamf-nation/img/default-avatars/generic-user-purple.png</xsl:attribute> 
											<xsl:attribute name="class">rounded-circle</xsl:attribute> 
										</xsl:element>
									</xsl:element>
									<xsl:element name="div" >
										<xsl:attribute name="class">col-md-12 col-sm-12 col-xs-12 user-detail-section1 text-center</xsl:attribute> 
										<xsl:element name="button" >
											<xsl:attribute name="id">btn-contact</xsl:attribute> 
											<xsl:attribute name="click">clearModal()</xsl:attribute> 
											<xsl:attribute name="data-toggle">modal</xsl:attribute> 
											<xsl:attribute name="data-target">#contact</xsl:attribute> 
											<xsl:attribute name="class">btn btn-success btn-block follow</xsl:attribute> 
											<xsl:text>跟我聯絡</xsl:text>
										</xsl:element>
										<xsl:element name="button" >
											<xsl:attribute name="class">btn btn-warning btn-block</xsl:attribute> 
											<xsl:text>關注他</xsl:text>
										</xsl:element>
									</xsl:element>
									<xsl:element name="div" >
										<xsl:attribute name="class">row user-detail-row</xsl:attribute>
										<xsl:element name="div" >
											<xsl:attribute name="class">col-md-12 col-sm-12 user-detail-section2 pull-left</xsl:attribute>
											<xsl:element name="div" >
												<xsl:attribute name="class">border</xsl:attribute>	
											</xsl:element>
											<xsl:element name="p" >
												<xsl:text>FOLLOWER</xsl:text>
											</xsl:element>
											<xsl:element name="span" >
												<xsl:text>320</xsl:text>
											</xsl:element>
										</xsl:element>
									</xsl:element>
								</xsl:element>
							</xsl:element>
							<xsl:element name="div" >
								<xsl:attribute name="class">col-md-9 col-sm-9 col-xs-12 pull-right profile-right-section</xsl:attribute>
								<xsl:element name="div" >
									<xsl:attribute name="class">row profile-right-section-row</xsl:attribute>
									<xsl:element name="div" >
										<xsl:attribute name="class">col-md-12 profile-header</xsl:attribute>
										<xsl:element name="div" >
											<xsl:attribute name="class">row</xsl:attribute>
											<xsl:element name="div" >
												<xsl:attribute name="class">col-md-8 col-sm-6 col-xs-6 profile-header-section1 pull-left</xsl:attribute>
												<xsl:element name="h1" >
													<xsl:text>Redan</xsl:text>
												</xsl:element>
												<xsl:element name="h5" >
													<xsl:text>明星賣家</xsl:text>
												</xsl:element>
											</xsl:element>
											<xsl:element name="div" >
												<xsl:attribute name="class">col-md-4 col-sm-6 col-xs-6 profile-header-section1 text-right pull-rigth</xsl:attribute>
												<xsl:element name="a" >
													<xsl:attribute name="href">/addFriend</xsl:attribute>
													<xsl:attribute name="class">btn btn-primary btn-block</xsl:attribute>
													<xsl:text>加他好友</xsl:text>
												</xsl:element>
											</xsl:element>
										</xsl:element>
									</xsl:element>
									<xsl:element name="div" >
										<xsl:attribute name="class">col-md-12</xsl:attribute>
										<xsl:element name="div" >
											<xsl:attribute name="class">row</xsl:attribute>
											<xsl:element name="div" >
												<xsl:attribute name="class">col-md-8</xsl:attribute>
												<xsl:element name="ul" >
													<xsl:attribute name="class">nav nav-tabs</xsl:attribute>	
													<xsl:attribute name="role">tablist</xsl:attribute>
													<xsl:element name="li" >
														<xsl:attribute name="class">nav-item</xsl:attribute>
														<xsl:element name="a" >
															<xsl:attribute name="class">nav-link active</xsl:attribute>	
															<xsl:attribute name="href">#profile</xsl:attribute>	
															<xsl:attribute name="role">tab</xsl:attribute>	
															<xsl:attribute name="rdata-toggle">tab</xsl:attribute>	
															<xsl:element name="i" >
																<xsl:attribute name="class">fas fa-user-circle</xsl:attribute>
															</xsl:element>
															<xsl:text>個人信息</xsl:text>
														</xsl:element>
													</xsl:element>
													<xsl:element name="li" >
														<xsl:attribute name="class">nav-item</xsl:attribute>
														<xsl:element name="a" >
															<xsl:attribute name="class">nav-link</xsl:attribute>	
															<xsl:attribute name="href">#buzz</xsl:attribute>	
															<xsl:attribute name="role">tab</xsl:attribute>	
															<xsl:attribute name="rdata-toggle">tab</xsl:attribute>	
															<xsl:element name="i" >
																<xsl:attribute name="class">fas fa-info-circle</xsl:attribute>
															</xsl:element>
															<xsl:text>商品</xsl:text>
														</xsl:element>
													</xsl:element>
												</xsl:element>
												<xsl:element name="div" >
													<xsl:attribute name="class">tab-content</xsl:attribute>
													<xsl:element name="div" >
														<xsl:attribute name="class">tab-pane fade show active</xsl:attribute>
														<xsl:attribute name="role">tabpanel</xsl:attribute>
														<xsl:attribute name="id">profile</xsl:attribute>

														<xsl:apply-templates select="ar/divs"/>
														
													</xsl:element>
													<xsl:element name="div" >
														<xsl:attribute name="class">tab-pane fade</xsl:attribute>
														<xsl:attribute name="role">tabpanel</xsl:attribute>
														<xsl:attribute name="id">buzz</xsl:attribute>
																
														<xsl:apply-templates select="ax/divs"/>
														
														<xsl:element name="div" >
															<xsl:attribute name="class">row</xsl:attribute>
															<xsl:element name="div" >
																<xsl:attribute name="class">col-md-12</xsl:attribute>
																<xsl:element name="label" >
																	<xsl:text>Your Bio</xsl:text>
																</xsl:element>	
																<xsl:element name="br" >
																</xsl:element>	
																<xsl:element name="p" >
																	<xsl:text>Your detail description</xsl:text>
																</xsl:element>	
															</xsl:element>
														</xsl:element>
													</xsl:element>
												</xsl:element>
											</xsl:element>
											<xsl:element name="div" >
												<xsl:attribute name="class">col-md-4 img-main-rightPart</xsl:attribute>	
												<xsl:element name="div" >
													<xsl:attribute name="class">row</xsl:attribute>	
													<xsl:element name="div" >
														<xsl:attribute name="class">col-md-12</xsl:attribute>
														<xsl:element name="div" >
															<xsl:attribute name="class">row image-right-part</xsl:attribute>
															<xsl:element name="div" >
																<xsl:attribute name="class">col-md-6 pull-left image-right-detail</xsl:attribute>
																<xsl:element name="h6" >
																	<xsl:text>PUBLICIDAD</xsl:text>
																</xsl:element>
															</xsl:element>
														</xsl:element>
													</xsl:element>
												</xsl:element>
												<xsl:element name="a" >
													<xsl:attribute name="href">http://camaradecomerciozn.com/</xsl:attribute>
													<xsl:element name="div" >
														<xsl:attribute name="class">col-md-12 image-right</xsl:attribute>
														<xsl:element name="img" >
															<xsl:attribute name="src">http://pluspng.com/img-png/bootstrap-png-bootstrap-512.png</xsl:attribute>
														</xsl:element>
													</xsl:element>
												</xsl:element>
												<xsl:element name="div" >
													<xsl:attribute name="class">col-md-12 image-right-detail-section2</xsl:attribute>
												</xsl:element>
											</xsl:element>
										</xsl:element>
									</xsl:element>
								</xsl:element>
							</xsl:element>
						</xsl:element>
					</xsl:element> 
				</xsl:element> 
				<xsl:element name="div" >
					<xsl:attribute name="class">modal fade</xsl:attribute>
					<xsl:attribute name="id">contact</xsl:attribute>
					<xsl:attribute name="tabindex">-1</xsl:attribute>
					<xsl:attribute name="role">dialog</xsl:attribute>
					<xsl:attribute name="aria-labelledby">exampleModalLabel</xsl:attribute>
					<xsl:attribute name="aria-hidden">true</xsl:attribute>
					<xsl:element name="div" >
						<xsl:attribute name="class">modal-dialog</xsl:attribute>
						<xsl:attribute name="role">document</xsl:attribute>
						<xsl:element name="div" >
							<xsl:attribute name="class">modal-content</xsl:attribute>
							<xsl:element name="div" >
								<xsl:attribute name="class">modal-header</xsl:attribute>
								<xsl:element name="h5" >
									<xsl:attribute name="class">modal-title</xsl:attribute>
									<xsl:attribute name="id">contact</xsl:attribute>
									<xsl:text>Contactarme</xsl:text>
								</xsl:element>
								<xsl:element name="button" >
									<xsl:attribute name="class">close</xsl:attribute>
									<xsl:attribute name="type">button</xsl:attribute>
									<xsl:attribute name="data-dismiss">modal</xsl:attribute>
									<xsl:attribute name="aria-label">Close</xsl:attribute>
									<xsl:element name="span" >
										<xsl:attribute name="aria-hidden">×</xsl:attribute>
									</xsl:element>
								</xsl:element>
							</xsl:element>
							<xsl:element name="div" >
								<xsl:attribute name="class">modal-body</xsl:attribute>
								<xsl:element name="div" >
									<xsl:attribute name="class">form-group</xsl:attribute>
									<xsl:element name="p" >
										<xsl:attribute name="for">msj</xsl:attribute>
										<xsl:text>Se enviará este mensaje a la persona que desea contactar, indicando que te quieres comunicar con el. Para esto debes de ingresar tu información personal.</xsl:text>
									</xsl:element>
								</xsl:element>
								<xsl:element name="div" >
									<xsl:attribute name="class">form-group</xsl:attribute>
									<xsl:element name="label" >
										<xsl:attribute name="for">txtFullname</xsl:attribute>
										<xsl:text>Nombre completo</xsl:text>
									</xsl:element>
									<xsl:element name="input" >
										<xsl:attribute name="type">text</xsl:attribute>
										<xsl:attribute name="id">txtFullname</xsl:attribute>
										<xsl:attribute name="class">form-control</xsl:attribute>
									</xsl:element>
								</xsl:element>
								<xsl:element name="div" >
									<xsl:attribute name="class">form-group</xsl:attribute>
									<xsl:element name="label" >
										<xsl:attribute name="for">txtEmail</xsl:attribute>
										<xsl:text>Email</xsl:text>
									</xsl:element>
									<xsl:element name="input" >
										<xsl:attribute name="type">text</xsl:attribute>
										<xsl:attribute name="id">txtEmail</xsl:attribute>
										<xsl:attribute name="class">form-control</xsl:attribute>
									</xsl:element>
								</xsl:element>
								<xsl:element name="div" >
									<xsl:attribute name="class">form-group</xsl:attribute>
									<xsl:element name="label" >
										<xsl:attribute name="for">txtPhone</xsl:attribute>
										<xsl:attribute name="text">Teléfono</xsl:attribute>
									</xsl:element>
									<xsl:element name="input" >
										<xsl:attribute name="type">text</xsl:attribute>
										<xsl:attribute name="id">txtPhone</xsl:attribute>
										<xsl:attribute name="class">form-control</xsl:attribute>
									</xsl:element>
								</xsl:element>
							</xsl:element>
							<xsl:element name="div" >
								<xsl:attribute name="class">modal-footer</xsl:attribute>
								<xsl:element name="button" >
									<xsl:attribute name="class">btn btn-secondary</xsl:attribute>
									<xsl:attribute name="type">button</xsl:attribute>
									<xsl:attribute name="data-dismiss">modal</xsl:attribute>
									<xsl:text>Cancelar</xsl:text>
								</xsl:element>
								<xsl:element name="button" >
									<xsl:attribute name="class">btn btn-primary</xsl:attribute>
									<xsl:attribute name="type">button</xsl:attribute>
									<xsl:attribute name="click">openModal()</xsl:attribute>
									<xsl:attribute name="data-dismiss">modal</xsl:attribute>
									<xsl:text>Guardar</xsl:text>
								</xsl:element>
							</xsl:element>	
						</xsl:element>	
					</xsl:element>
				</xsl:element>
			</body>
		</html>
	</xsl:template>
	
	<xsl:template match="divs">  
		<xsl:element name="div">
			<xsl:attribute name="class">row</xsl:attribute>
			<xsl:element name="div" >
				<xsl:attribute name="class">
					<xsl:value-of select="class1"/>
				</xsl:attribute>
				<xsl:element name="label" >
					<xsl:value-of select="div1"/>
				</xsl:element>	
			</xsl:element>	
			<xsl:element name="div" >
				<xsl:attribute name="class">
					<xsl:value-of select="class2"/>
				</xsl:attribute>
				<xsl:element name="P" >
					<xsl:value-of select="div2"/>
				</xsl:element>	
			</xsl:element>
		</xsl:element>	
	</xsl:template>  
</xsl:stylesheet>  