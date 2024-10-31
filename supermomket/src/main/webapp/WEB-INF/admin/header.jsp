<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<!DOCTYPE html>
		<html>

		<head>
			<meta charset="UTF-8">
			<meta name="viewport" content="width=device-width, initial-scale=1.0">
			<title>supermomket 관리자</title>

			<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.js"></script>
			<script src="https://kit.fontawesome.com/4dde698614.js" crossorigin="anonymous"></script>

			<style>
				* {
					margin: 0;
					padding: 0;
					box-sizing: border-box;
				}

				aside {
					position: fixed;
					top:0;
					left:0;
					width: 250px;
					height: 100vh;
					float: left;
					text-align: center;
					background: gray;
				}

				aside .logo-box {
					width: 100%;
					border: solid 1px red;
				}

				aside .logo-box img {
					width: 100%;
				}

				aside nav {
					margin-top: 60px;
				}

				aside nav ul {
					width: 100%;
					height: fit-content;
				}

				aside nav ul li {
					height: 50px;
					font-size: 18px;
					line-height: 50px;
					border: solid 1px red;
				}

				main {
					width: calc(100% - 300px) !important;
					float: right !important;
				}
			</style>
		</head>