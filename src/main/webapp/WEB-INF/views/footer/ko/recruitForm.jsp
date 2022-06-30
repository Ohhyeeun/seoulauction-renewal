<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@include file="../../include/ko/header.jsp"%>
<body class="">
    <div class="wrapper">
        <div class="sub-wrap pageclass">

            <!-- header -->
            <%@include file="../../include/ko/nav.jsp"%>
            <!-- //header -->

            <!-- container -->
            <div id="container">
                <div id="contents" class="contents">

                    <!-- page title -->
                    <section class="page_title-section">
                        <div class="section-inner full_size">
                            <div class="center-box">
                                <h2 class="page_title"><span class="th1">채용공고</span></h2>
                            </div>
                        </div>
                    </section>
                    <section class="basis-section bbs-section">
                        <div class="section-inner">
                            <div class="content-panel type_panel-board">
                                <div class="panel-header">
                                    <div class="title">
                                        <span class="tt2">서울옥션에 지원해주셔서 <br class="only-mb">감사합니다.</span>
                                    </div>
                                    <div class="desc">
                                        <span class="tb1">아래 양식을 작성하여 지원하시면 검토 후 7일 이내에 <br class="only-mb">답변을 드릴 예정입니다.</span>
                                    </div>
                                </div>
                                <div class="panel-body">
                                    <div class="table-wrap">
                                        <table class="table_base form-table incruit_apply-table">
                                            <tbody>
                                                <tr>
                                                    <th>이름<i>*</i></th>
                                                    <td>
                                                        <input id="recruit_form_name" type="text" class="textType" value="${member.userNm}">
                                                        <p class="form_alert">
                                                            ※ 이름을 정확하게 입력해 주세요.
                                                        </p>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th>이메일 <i>*</i></th>
                                                    <td><input id="recruit_form_email" type="email" class="textType" value="${member.email}">
                                                        <p class="form_alert">
                                                            ※ 이메일 주소를 정확하게 입력해 주세요.
                                                        </p>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th>휴대폰 <i>*</i></th>
                                                    <td>
                                                        <div>
                                                            <input id="recruit_form_phone" type="text" class="textType" value="${member.hp}">
                                                        </div>
                                                        <!-- <p class="form_alert" style="display: block;">
																※ 휴대폰 번호 인증에 성공하였습니다.
															</p> -->
                                                    </td>
                                                </tr>
                                                <tr class="file_row">
                                                    <th>첨부파일 <i>*</i></th>
                                                    <td>
                                                        <div id="file_box" class="trp file-box">
                                                            <label for="fileName" class="screen-reader-text">파일 선택</label>
                                                            <input type="text" id="fileName" class="trp-Filetext">
                                                            <input  type="button" class="btn btn_light_gray_line" value="파일첨부">
                                                            <input id="recruit_file" type="file" class="trp-Filehidden" title="Insert Attachment">
                                                        </div>

                                                        <div class="file-box-list">
                                                            <p class="label">
                                                                <i class="icon_down"></i>
                                                                <span class="tb1">Attached_filename.jpg </span>
                                                                <a href="#none" class="btn_del"><span class="icon-del"></span></a>
                                                            </p>
                                                        </div>

                                                        <div id="current_file"></div>
                                                        <div class="mark_list-wrap">
                                                            <ul class="mark_dot-list">
                                                                <li>20 MB 이하의 1개 파일 첨부가 가능합니다.</li>
                                                                <li>업로드 가능파일: hwp, doc, docx, ppt, pptx, xls, xlsx, pdf, txt, zip, alz</li>
                                                                <li style="text-decoration: underline;">이력서 및 포트폴리오를 압축파일로 첨부해주세요.</li>
                                                            </ul>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>

                                    <div class="policy table-wrap">
                                        <ul class="accordion-list policy">
                                            <li>
                                                <div class="header-area">
                                                    <div class="accordion_name">
                                                        <div class="trp checkbox-box">
                                                            <input id="info_check" class="" type="checkbox" name="">
                                                            <i></i>
                                                            <label for="info_check"><span class="required">개인정보수집 및 이용동의(필수)</label>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="con-area">
                                                    <div class="policy_cont">
                                                        <div class="mark_list-wrap">
                                                            <ol class="mark_num-list">
                                                                <li>목적<br>
                                                                    지원자 개인 식별, 지원의사 확인, 지원자와의 원활한 의사소통</li>
                                                                <li>항목<br>
                                                                    이름, 이메일주소, 휴대폰번호, 지원파일</li>
                                                                <li>보유기간<br>
                                                                    지원이력 정보는 채용공고 마감일로부터 180일 후 파기합니다.</li>
                                                            </ol>
                                                        </div>
                                                    </div>
                                                </div>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="panel-footer">
                                    <article class="button-area">
                                        <div class="btn_set-float tac">
                                            <a class="btn btn_gray_line btn_lg" href="/footer/recruit/${id}" role="button"><span>취소</span></a>
                                            <a id="recruit_btn" class="btn btn_point btn_lg"  role="button"><span>지원</span></a>
                                        </div>
                                    </article>
                                </div>
                            </div>
                        </div>
                    </section>

                    <section class="basis-section last-section">
                        <div class="section-inner">
                            <div class="content-panel">
                                <div class="panel-header"></div>
                                <div class="panel-body">
                                </div>
                                <div class="panel-footer"></div>
                            </div>
                        </div>
                    </section>

                </div>
            </div>
            <!-- //container -->

            <!-- footer -->
            <jsp:include page="../../include/ko/footer.jsp" flush="false"/>
            <!-- //footer -->

            <!-- stykey -->

            <div class="scroll_top-box">
                <div class="box-inner">
                    <a href="#" class="btn-scroll_top js-scroll_top"><i class="icon-scroll_top"></i></a>
                </div>
            </div>
            <!-- // stykey -->

        </div>
    </div>


    <script type="text/javascript" src="/js/plugin/jquery.min.js"></script>
    <!--[if lt IE 9]> <script src="/js/plugin/html5shiv.js"></script> <![endif]-->
    <script type="text/javascript" src="/js/plugin/prefixfree.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="/js/plugin/jquerylibrary.js" type="text/javascript"></script>
    <script>
        $(function(){

            let fileVal;
            let current_file;

            $("#recruit_file").on('change',function (){

                current_file = $(this);
                fileVal = current_file.val();

                if(fileVal !=='') {
                    let ext = fileVal.split('.').pop().toLowerCase();
                    let fileName = fileVal.split('\\').pop().toLowerCase();

                    if ($.inArray(ext, ['hwp', 'doc', 'docx', 'ppt', 'pptx', 'xls', 'xlsx', 'pdf', 'txt', 'zip', 'alz']) == -1) {
                        alert('hwp , doc, docx, ppt, pptx, xls, xlsx, pdf, txt, zip, alz 파일만 \n업로드 할수 있습니다.');
                        return;
                    }
                    $("#current_file").html('첨부 파일 : ' + fileName);
                }

            });

            $("#recruit_btn").on('click',function (){
                form();
            });

            function form(){

                let form_name = $("#recruit_form_name").val();
                let form_email = $("#recruit_form_email").val();
                let form_phone = $("#recruit_form_phone").val();

                let checkboxCheck = $("#info_check").is(':checked');


                //valid
                if(!form_name){
                    alert('이름을 입력해주세요.');
                    return;
                }

                if(!form_email){
                    alert('이메일을 입력해주세요.');
                    return;
                }

                if(!form_phone){
                    alert('휴대폰을 입력해주세요.');
                    return;
                }

                let regEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;
                if(!regEmail.test(form_email)){
                    alert('이메일 형식이 아닙니다.');
                    return;
                }

                // if(form_phone.length !== 11){
                //     alert('휴대폰 11자리를 입력해주세요.');
                //     return;
                // }
                if(!current_file){
                    alert('파일을 등록해주세요.');
                    return;
                }

                if(!checkboxCheck){
                    alert('개인정보 동의를 해주세요.')
                    return;
                }

                let obj = {};
                obj.name = form_name;
                obj.email = form_email;
                obj.phone_number = form_phone;


                const frm = new FormData()
                frm.append('file', current_file[0].files[0]);
                frm.append('key', new Blob([JSON.stringify(obj)] , { type: "application/json" }));

                    axios.post('/api/footer/recruits/${id}/form',frm ,{
                        headers: {
                            'Content-Type': 'multipart/form-data'
                        }
                    })
                    .then(function(response) {
                        const data = response.data;
                        let success = data.success;
                        if(success){

                            alert('정상 접수 되었습니다. \n지원해주셔서 감사합니다.');
                            location.href= '/footer/recruit';
                        } else {
                            alert('서버에서 오류가 발생 하였습니다.');
                        }
                    })
                    .catch(function(error) {
                        console.log(error);
                    });
            }
        });
    </script>
    <%--angular 관련은 미리 로딩--%>
    <%@include file="../../common/angular.jsp"%>
    <%@include file="../../common/commonJs.jsp"%>
    <%@include file="../../common/commonJSNotMain.jsp"%>

</body>

</html>
