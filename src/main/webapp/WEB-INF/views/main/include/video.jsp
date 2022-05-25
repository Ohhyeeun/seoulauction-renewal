<%--
  Created by IntelliJ IDEA.
  User: sjk
  Date: 2022/05/10
  Time: 7:15 PM
  To change this template use File | Settings | File Templates.
--%>
<article class="video">
    <h1 class="main-sectiontit video-tit">
        Video
    </h1>

    <div class="swiper-container video-swiper" ng-controller="videoCtl" data-ng-init="loadVideo()">
        <div class="swiper-wrapper video-contents">
            <div class="swiper-slide video-slide" ng-repeat="video in videoList" on-finish-render-filters>
                <a ng-click="showVideo(video.content_type, video.url)"; class="video-btn">
                    <figure class="video-thumb">
                        <span class="video-thumbHover"></span>
                        <img src="{{video.image}}" alt="video" class="pc-ver">
                        <img src="/images/mobile/thumbnail/VideoBanner_03_300x300.png" alt="video" class="m-ver">
                        <span class="video-icon" ng-class="{'youtube':'video-icon-you', 'instagram':'video-icon-in'}[video.content_type]"></span>
                    </figure>
                    <p class="video-thmbtit text-over">
                        {{video.content['ko'].media_title}}
                    </p>
                </a>
            </div>
        </div>
        <div class="swiper-button-prev videoBtn-left">
            <span></span>
        </div>
        <div class="swiper-button-next videoBtn-right">
            <span></span>
        </div>
    </div>
</article>

<script>
    app.value('locale', 'ko');
    app.controller('videoCtl', function($scope, consts, common, locale) {
        console.log("videoCtl");
        $scope.loadVideo = function() {
            console.log("loadVideo");
            common.callGetAPI('/api/main/videos', {"media_type" : "video", "size" : 12}, function (data, status) {
                $scope.videoList = data.data;
                console.log($scope.videoList);
                $scope.videoList.map(item => {
                    item.content = JSON.parse(item.content);
                });
            });
        }

        $scope.showVideo = function(content_type, url) {
            if(content_type === 'instagram') {
                window.open(url, 'instagram', 'width=1150,height=880,toolbar=0,resizable=yes,status=0,scrollbars=0');
            } else if(content_type === 'youtube') {
                $("#videoLayerPopup div div.video-play").html('<iframe width="560" height="315" src="'+ url +'" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>');
                $("#videoLayerPopup").show();
            }
        }

        $scope.$on('ngRepeatFinished', function () {
            console.log("ngRepeatFinished");
            /* video */
            const videoSwiper = new Swiper(".video-swiper", {
                slidesPerView: 6,
                spaceBetween: 20,
                loopFillGroupWithBlank: true,
                navigation: {
                    nextEl: ".videoBtn-right",
                    prevEl: ".videoBtn-left",
                },
                breakpoints: {
                    1919: {
                        slidesPerView: 4,
                        spaceBetween: 20,
                    },
                    1279: {
                        slidesPerView: 3,
                        spaceBetween: 20,
                    },
                    1023: {
                        slidesPerView: 'auto',
                        spaceBetween: 20,
                        loopedSlides: 1,
                        loop: false,
                        loopFillGroupWithBlank: false,
                    },
                }
            });
        });
    });
</script>