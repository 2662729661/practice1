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
				<link rel="stylesheet" href="css/pers.css" type="text/css"/>
			</head>
			<body>
				<xsl:element name="div">
					<xsl:attribute name="class">container</xsl:attribute> 
					<xsl:element name="div">
						<xsl:attribute name="class">row</xsl:attribute>
						<xsl:element name="div">
							<xsl:attribute name="class">col-md-12 col-sm-12 col-xs-12 image-section</xsl:attribute>
							<xsl:element name="img">
								<xsl:attribute name="src">https://png.pngtree.com/thumb_back/fw800/back_pic/00/08/57/41562ad4a92b16a.jpg</xsl:attribute> 
							</xsl:element>  
						</xsl:element> 
						<xsl:element name="div">
							<xsl:attribute name="class">row user-left-part</xsl:attribute>
							<xsl:element name="div">
								<xsl:attribute name="class">col-md-3 col-sm-3 col-xs-12 user-profil-part pull-left</xsl:attribute>
								<xsl:element name="div">
									<xsl:attribute name="class">row</xsl:attribute>
									<xsl:element name="div">
										<xsl:attribute name="class">col-md-12 col-md-12-sm-12 col-xs-12 user-image text-center</xsl:attribute>
										<xsl:element name="img">
											<xsl:attribute name="src">https://www.jamf.com/jamf-nation/img/default-avatars/generic-user-purple.png</xsl:attribute> 
											<xsl:attribute name="class">rounded-circle</xsl:attribute>
										</xsl:element> 
									</xsl:element> 
									<xsl:element name="div">
										<xsl:attribute name="class">col-md-12 col-sm-12 col-xs-12 user-detail-section1 text-center</xsl:attribute>
										<xsl:element name="button">
											<xsl:attribute name="id">btn-contact</xsl:attribute>
											<xsl:attribute name="click">clearModal()</xsl:attribute>
											<xsl:attribute name="data-toggle">modal</xsl:attribute>
											<xsl:attribute name="data-target">#contact</xsl:attribute>
											<xsl:attribute name="class">btn btn-success btn-block follow</xsl:attribute>
											<xsl:text>加他好友</xsl:text>
										</xsl:element> 
										<xsl:element name="button">
											<xsl:attribute name="class">btn btn-warning btn-block</xsl:attribute>
											<xsl:text>關注他</xsl:text>
										</xsl:element> 
									</xsl:element>
									<xsl:element name="div">
										<xsl:attribute name="class">d-flex justify-content-center</xsl:attribute>
										<xsl:element name="div">
											<xsl:attribute name="class">col-md-12 col-sm-12 user-detail-section2 pull-left</xsl:attribute>
											<xsl:element name="p">
												<xsl:text>追蹤者</xsl:text>
											</xsl:element> 
											<xsl:element name="span">
												<xsl:value-of select="tracker"/>
											</xsl:element> 
										</xsl:element> 
									</xsl:element> 
									<xsl:element name="div">
										<xsl:attribute name="class">d-flex justify-content-center</xsl:attribute>
										<xsl:element name="div">
											<xsl:attribute name="class">col-md-12 col-sm-12 user-detail-section2</xsl:attribute>
											<xsl:element name="p">
												<xsl:text>貼文</xsl:text>
											</xsl:element> 
											<xsl:element name="span">
												<xsl:value-of select="postscript"/>
											</xsl:element> 
										</xsl:element> 
									</xsl:element> 
									<xsl:element name="div">
										<xsl:attribute name="class">d-flex justify-content-center</xsl:attribute>
										<xsl:element name="div">
											<xsl:attribute name="class">col-md-12 col-sm-12 user-detail-section2 pull-right</xsl:attribute>
											<xsl:element name="p">
												<xsl:text>追蹤中</xsl:text>
											</xsl:element> 
											<xsl:element name="span">
												<xsl:value-of select="tracking"/>
											</xsl:element> 
										</xsl:element> 
									</xsl:element> 
									<xsl:element name="div">
										<xsl:attribute name="class">d-flex justify-content-center</xsl:attribute>
										<xsl:value-of select="introduce"/>
									</xsl:element> 
								</xsl:element>  
							</xsl:element> 
							<xsl:element name="div">
								<xsl:attribute name="class">col-md-9 col-sm-9 col-xs-12 pull-right profile-right-section</xsl:attribute>
								<xsl:element name="div">
									<xsl:attribute name="class">row profile-right-section-row</xsl:attribute>
									<xsl:element name="div">
										<xsl:attribute name="class">col-md-12 profile-header</xsl:attribute>
										<xsl:element name="div">
											<xsl:attribute name="class">row</xsl:attribute>
											<xsl:element name="div">
												<xsl:attribute name="class">col-md-8 col-sm-6 col-xs-6 profile-header-section1</xsl:attribute>
												<xsl:element name="h1">
													<xsl:value-of select="name"/>
												</xsl:element>	
												<xsl:element name="h5">
													<xsl:value-of select="situation"/>
												</xsl:element>	
											</xsl:element>
											<xsl:element name="div">
												<xsl:attribute name="class">col-md-8 col-sm-6 col-xs-6</xsl:attribute>
													
												<xsl:apply-templates select="commodity"/>
												
											</xsl:element>	
										</xsl:element>	
									</xsl:element>	
								</xsl:element> 	
							</xsl:element> 
						</xsl:element>
					</xsl:element>
				</xsl:element>
			</body>
		</html>
	</xsl:template> 
	
	<xsl:template match="commodity"> 
		<xsl:element name="div">
			<xsl:attribute name="class">row mt-1</xsl:attribute>
			<xsl:apply-templates select="column"/>
		</xsl:element>
	</xsl:template>
	
	<xsl:template match="column"> 
		<xsl:element name="div">
			<xsl:attribute name="class">col-sm-4</xsl:attribute>
			<xsl:element name="div">
				<xsl:attribute name="class">thumbnail</xsl:attribute>
				<xsl:element name="a">
					<xsl:attribute name="href">
						<xsl:value-of select="href"/>
					</xsl:attribute>
					<xsl:attribute name="class"></xsl:attribute>
					<xsl:element name="img">
						<xsl:attribute name="src">
							<xsl:value-of select="src"/>
						</xsl:attribute>
						<xsl:attribute name="alt">...</xsl:attribute>
						<xsl:attribute name="class"></xsl:attribute>
					</xsl:element>
				</xsl:element>
			</xsl:element>
		</xsl:element>
	</xsl:template>
</xsl:stylesheet>  