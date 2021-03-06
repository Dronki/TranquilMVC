<?php

require_once( PATH_MODELS . 'infoContent/clInfoContent.php' );

$oRouter = clRegistry::get( 'clRouter' );
$oTemplate = clRegistry::get( 'clTemplate' );

$oInfoContent = new clInfoContent();

$aData = $oRouter->getIdByRoute( $oRouter->getRoutePath() );

if( !empty($aData) ) {
	$aContentData = $oInfoContent->read( $aData['routeViewId'] );
	if( $aContentData['contentStatus'] != 'active' ) {
		if( empty($_SESSION['userId']) && $_SESSION['userStatus'] != 'admin' ) {
			$oRouter->redirect( '/' );
		}
	}
	$oTemplate->setTitle( $aContentData['contentTitle'] );
	$oTemplate->setKeywords( $aContentData['contentMetaKeywords'] );
	$oTemplate->setDescription( $aContentData['contentMetaDescription'] );
	$oTemplate->setCanonicalUrl( $aContentData['contentMetaCanonicalUrl'] );
	
	echo $aContentData['contentText'];
}