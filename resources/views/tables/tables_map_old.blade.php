<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<meta name="author" content="Darko Bunic"/>
		<meta name="description" content="Drag and drop table content with JavaScript"/>
		<meta name="viewport" content="width=device-width, user-scalable=no"/><!-- "position: fixed" fix for Android 2.2+ -->
		<link rel="stylesheet" href="{{ URL::to('js/redips/example26/style.css') }}" type="text/css" media="screen"/>
		<script type="text/javascript" src="{{ URL::to('js/redips/header.js') }}"></script>
		<script type="text/javascript" src="{{ URL::to('js/redips/redips-drag-min.js') }}"></script>
		<script type="text/javascript" src="{{ URL::to('js/redips/example26/script.js') }}"></script>
		<!-- load jQuery -->
		<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
		<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.9.2/jquery-ui.min.js"></script>
		<link rel="stylesheet" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.9.2/themes/base/jquery-ui.css"/>
		<title>Table schema</title>
	</head>
	<body>
		<!-- drag container -->
		<div id="redips-drag">
			<!-- table1 -->
                        <input type="button" id="show_coord" value="Show">
			<table id="table1">
				<colgroup>
					<col width="100"/>
					<col width="100"/>
					<col width="100"/>
				</colgroup>
				<tbody>
					<!-- clone 2 elements + last element -->
					<tr>
						<td><div id="first" class="redips-drag orange redips-clone">A</div></td>
						<td><div id="second" class="redips-drag blue redips-clone">B</div></td>
						<td><div id="third" class="redips-drag blue redips-clone"><img width="50px" height="40px" src="http://files.softicons.com/download/web-icons/vector-stylish-weather-icons-by-bartosz-kaszubowski/png/64x64/sun.rays.small.png"></div></td>
						<td class="redips-trash redips-drag">Trash</td>
					</tr>
				</tbody>
			</table>
			<!-- table2 -->
			<table id="table2">
				<colgroup>
					<col width="100"/>
					<col width="100"/>
					<col width="100"/>
					<col width="100"/>
				</colgroup>
				<tbody>
					<tr><td></td><td></td><td></td><td></td></tr>
					<tr><td></td><td></td><td></td><td></td></tr>
					<tr><td></td><td></td><td></td><td></td></tr>
					<tr><td></td><td></td><td></td><td></td></tr>
					<tr><td></td><td></td><td></td><td></td></tr>
					<tr><td></td><td></td><td></td><td></td></tr>
					<tr><td></td><td></td><td></td><td></td></tr>
					<tr><td></td><td></td><td></td><td></td></tr>
					<tr><td></td><td></td><td></td><td></td></tr>
					<tr><td></td><td></td><td></td><td></td></tr>
					<tr><td></td><td></td><td></td><td></td></tr>
					<tr><td></td><td></td><td></td><td></td></tr>
					<tr><td></td><td></td><td></td><td id="lastCell"></td></tr>
				</tbody>
			</table>
		</div>
		<!-- jQuery dialog -->
		<div id="dialog" title="jQuery dialog">Please choose action!</div>
		<!-- instructions -->
		<div class="instructions">
			Example shows how to choose drop mode after DIV element is dropped to the table.
			In combination with jQuery to display modal popup, user will have three options: shift, switch and overwrite.
			Popup will be displayed in case when target cell is not empty otherwise it will be normal drag and drop.
			Switch mode is enabled only when DIV is dragged from bottom table.
			If DIV element is cloned from upper table, clicking on switch button will be ignored.
		</div>
                
                
                <script>
                    
                    $("#show_coord").on('click', function(){
//                        var table_content = $.parseJSON(REDIPS.drag.saveContent('table2'));
                        var table_content = REDIPS.drag.saveContent('table2');
                        console.log(table_content);
 
                    });
                    

                    
                </script>
                
                
                
	</body>
</html>