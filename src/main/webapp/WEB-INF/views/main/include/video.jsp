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
                        <img src="{{video.image}}" alt="video" class="m-ver">
                        <span class="video-icon" ng-class="{'youtube':'video-icon-you', 'instagram':'video-icon-in'}[video.content_type]"></span>
                    </figure>
                    <p class="video-thmbtit text-over">
                        {{video.content.media_title}}
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
    async function isNativeCheck(url) {
        let result = await isNativeApp();
        if (result) {
            await openWebBrowser(url);
        } else {
            window.open(url, 'instagram', 'width=1150,height=880,toolbar=0,resizable=yes,status=0,scrollbars=0');
        }
    }

    app.value('locale', 'ko');
    app.controller('videoCtl', function($scope, consts, common, locale) {
        $scope.loadVideo = function() {
            common.callGetAPI('/api/main/videos', {"media_type" : "video", "size" : 12}, function (data, status) {
                $scope.videoList = data.data;
                $scope.videoList.map(item => {
                    item.content = JSON.parse(item.content)[document.documentElement.lang];
                });
            });
        }

        $scope.showVideo = function(content_type, url) {
            if(content_type === 'instagram') {
                isNativeCheck(url);
            } else if(content_type === 'youtube') {
                url = "https://youtube.com/embed"+url.slice(url.lastIndexOf("/"));
                $("#videoLayerPopup div div.video-play").html('<iframe width="560" height="315" src="'+ url +'" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>');
                $("#videoLayerPopup").show();
            }
        }

        $scope.$on('ngRepeatFinished', function () {
            /* video */
            const videoSwiper = new Swiper(".video-swiper", {
                slidesPerView: 6,
                spaceBetween: 20,
                loop: true,
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
                        loopFillGroupWithBlank: false,
                    },
                }
            });
        });
    });
</script>