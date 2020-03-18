<?php
//Send utf-8 header before any output
header('Content-Type: text/html; charset=utf-8'); 
?>
<!DOCTYPE html>
<html>
	<head>
		<title>Php Picture Table Example</title>
	</head>	
	<body>
		<h4>Select empno,title, ename, degree,job,mgr,hiredate,currency_symbol,salary,comm, deptno, last_update, picture, picture_path from emp </h4>
		<table border="1">		
			<tr>
				<td><h2>Empno</h2></td>
				<td><h2>Title</h2></td>
				<td><h2>Ename</h2></td>
				<td><h2>Degree</h2></td>
				<td><h2>Job</h2></td>
				<td><h2>Mgr</h2></td>
				<td><h2>Hiredate</h2></td>
				<td><h2>Currency</h2></td>
				<td><h2>Salary</h2></td>
				<td><h2>Comm</h2></td>
				<td><h2>Deptno</h2></td>
				<td><h2>Last_update</h2></td>
				<td><h2>Picture</h2></td>
				<td><h2>Picture_path</h2></td>
			</tr>
			<?php			
				$host = "localhost";
				$user = "root";
				$password = "";
				$database = "g00359990";				
				
				$query = "Select empno,title, ename, degree,job,mgr,hiredate,currency_symbol,salary,comm, deptno, last_update, picture, picture_path from emp";
				//Connect to the database
				$connect = mysqli_connect($host,$user,$password,$database) or die("Problem connecting.");
				//Set connection to UTF-8
				mysqli_query($connect,"SET NAMES utf8");
				//Select data
				$result = mysqli_query($connect,$query) or die("Bad Query.");
				mysqli_close($connect);

				while($row = $result->fetch_array())
				{		
					echo "<tr>";
					echo "<td><h2>" .$row['empno'] . "</h2></td>";
					echo "<td><h2>" .$row['title'] . "</h2></td>";
					echo "<td><h2>" .$row['ename'] . "</h2></td>";
					echo "<td><h2>" .$row['degree'] . "</h2></td>";
					echo "<td><h2>" .$row['job'] . "</h2></td>";
					echo "<td><h2>" .$row['mgr'] . "</h2></td>";
					echo "<td><h2>" .$row['hiredate'] . "</h2></td>";
					echo "<td><h2>" .$row['currency_symbol'] . "</h2></td>";
					echo "<td><h2>" .$row['salary'] . "</h2></td>";
					echo "<td><h2>" .$row['comm'] . "</h2></td>";
					echo "<td><h2>" .$row['deptno'] . "</h2></td>";
					echo "<td><h2>" .$row['last_update'] . "</h2></td>";
					echo "<td><h2><img src=image_emp.php?empno=".$row['empno']." width=80 height=80/></h2></td>";
					echo "<td><h2><img src=HTTP://".$host.$row['picture_path'] . " width=60 height=60/></h2></td>";
				    echo "</tr>";
				}
			?>
		<table>
	</body>
</html>