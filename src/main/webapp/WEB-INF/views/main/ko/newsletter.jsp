<%--
  Created by IntelliJ IDEA.
  User: sjk
  Date: 2022/05/03
  Time: 4:32 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
뉴스레터
<script>
    //const data = { username: 'example' };
    fetch('/api/main/newsletters', {
        method: 'GET', // 또는 'PUT'
        headers: {
            'Content-Type': 'application/json',
        },
        //body: JSON.stringify(data),
    })
    .then((response) => response.json())
    .then((data) => {
        alert('성공:'+ data);
    })
    .catch((error) => {
        alert('실패:'+ error);
    });
</script>
</body>
</html>
