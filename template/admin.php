<?php
require_once( PATH_MODELS . 'navigation/clNavigation.php' );
$oNavigation = new clNavigation();
if( empty($_SESSION['userId']) ) {
	$oRouter = clRegistry::get( 'clRouter' );
	$oRouter->redirect( '/admin/login' );
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">

	<script defer src="https://use.fontawesome.com/releases/v5.0.7/js/all.js"></script>
	<script
		src="https://code.jquery.com/jquery-3.3.1.min.js"
		integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
		crossorigin="anonymous"></script>
	<link href="https://fonts.googleapis.com/css?family=Lato:400,700|Open+Sans:400,600|Roboto" rel="stylesheet">
	<link rel="stylesheet" href="/css/admin.css">
	<link rel="stylesheet" href="/css/UI.css">

	{top}

</head>
<body class="">
	<div id="content-wrapper" class="">
		<header>
			<div class="left"><a href="/admin"><img src="/images/views/admin/logo.png" class="logo"></a></div>
			<div class="middle"></div>
			<div class="right">
				<div class="content">
					<a href="/" target="_blank"><i class="fas fa-home"></i>Front-page</a>
					<?php echo !empty($_SESSION['userId']) ? '<a href="/admin/logout" class="logout"><i class="fas fa-sign-out-alt"></i>Logout</a>': ''; ?>
				</div>
			</div>
		</header>
		<aside>
		<?php
			echo $oNavigation->buildMenu(0, 1, 'admin' );
		?>
		</aside>
		<div id="content">
			{content}
		</div>
	</div>
	{bottom}
</body>
</html>