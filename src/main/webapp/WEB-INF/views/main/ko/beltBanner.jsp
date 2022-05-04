<%--
  Created by IntelliJ IDEA.
  User: csy
  Date: 2022/05/04
  Time: 1:31 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<body>
<%--<jsp:include page="../../include/ko/header.jsp" />--%>

<section class="platform">
    <div class="swiper-container platform-swiper">
        <div class="swiper-wrapper">
            <div class="swiper-slide platform-bg">
                <a href="#" class="platform-img" >
                    <img src="https://seoulauction-public.s3.ap-northeast-2.amazonaws.com/resources/images/banner/MidBanner_1204x180.png" />
                </a>
            </div>
        </div>
        <!-- Add Arrows -->
        <div class="swiper-button-next platformBtn-right pc-ver"></div>
        <div class="swiper-button-prev platformBtn-left pc-ver"></div>
    </div>
    <!-- Add Pagination -->
    <div class="swiper-pagination platform-pagination m-ver"></div>
</section>

<%--<script src="/js/main/main.js" type="text/javascript"></script>--%>
<%--<jsp:include page="../../include/ko/footer.jsp" />--%>

<%--<script>--%>
<%--    window.onload = function(){--%>
<%--        loadBeltBanner();--%>
<%--    }--%>

<%--    const loadBeltBanner = async () => {--%>

<%--        await fetch('/api/main/beltBanners')--%>
<%--            .then(res => res.json())--%>
<%--            .then(res => {--%>
<%--                if (res.success) {--%>
<%--                    console.log(res);--%>
<%--                    const bannerList = res.data();--%>

<%--                    bannerList.map(item => {--%>
<%--                        return `<div class="swiper-slide platform-bg">--%>
<%--                                    <a href="#" class="platform-img" >--%>
<%--                                        <img src="https://seoulauction-public.s3.ap-northeast-2.amazonaws.com/resources/images/banner/MidBanner_1204x180.png" />--%>
<%--                                    </a>--%>
<%--                                </div>`--%>
<%--                    })--%>



<%--                }--%>
<%--            });--%>
<%--    }--%>
<%--</script>--%>
</body>
</html>
