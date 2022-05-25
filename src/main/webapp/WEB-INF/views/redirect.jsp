<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script>
const message = "${message}";
const returnUrl = "${returnUrl}";

if(message) {
    alert(message);
}
if(returnUrl) {
    window.location.href = returnUrl;
}
</script>