<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<c:set var="ss_cust_no" scope="session" value="${pageContext.request.userPrincipal.details.userNo}" />
<spring:eval expression="@environment.getProperty('image.root.path')" var="imageRootPath" />
<!DOCTYPE html>
<html lang="ko" ng-app="myApp">
<head>
  <link rel="icon" type="image/png" href="/images/favic/android-icon-192x192.png" sizes="192x192"/>
  <title>Seoul Auction</title>
  <%@include file="../../common/angular.jsp"%>
  <%@include file="../../common/commonJs.jsp"%>

  <link href="/css/old/common.css" rel="stylesheet">
  <link href="/css/old/sa.common.2.1.css" rel="stylesheet">
  <style type="text/css">
    .csE43CB777 {color:#000000;background-color:#000000;border-left-style: none;border-top-style: none;border-right-style: none;border-bottom-style: none;font-family:맑은 고딕; font-size:12px; font-weight:normal; font-style:normal; }
    .cs9EC8A45B {color:#000000;background-color:#E0E0E0;border-left-style: none;border-top:#000000 1px solid;border-right-style: none;border-bottom:#000000 1px solid;font-family:맑은 고딕; font-size:12px; font-weight:bold; font-style:normal; padding-top:4px;padding-left:4px;padding-right:4px;padding-bottom:4px;}
    .csCDAFFDC5 {color:#000000;background-color:transparent;border-left-style: none;border-top-style: none;border-right-style: none;border-bottom:#000000 1px solid;font-family:맑은 고딕; font-size:12px; font-weight:normal; font-style:normal; }
    .cs48872F7D {color:#000000;background-color:transparent;border-left-style: none;border-top-style: none;border-right-style: none;border-bottom:#000000 1px solid;font-family:맑은 고딕; font-size:12px; font-weight:normal; font-style:normal; padding-top:4px;padding-left:4px;padding-right:4px;padding-bottom:4px;}
    .csB9449DE8 {color:#000000;background-color:transparent;border-left-style: none;border-top-style: none;border-right-style: none;border-bottom:#000000 1px solid;font-family:맑은 고딕; font-size:9px; font-weight:bold; font-style:normal; padding-top:4px;padding-left:4px;padding-right:4px;padding-bottom:4px;}
    .cs579E398B {color:#000000;background-color:transparent;border-left-style: none;border-top-style: none;border-right-style: none;border-bottom-style: none;font-family:맑은 고딕; font-size:12px; font-weight:bold; font-style:normal; }
    .cs7B144C0A {color:#000000;background-color:transparent;border-left-style: none;border-top-style: none;border-right-style: none;border-bottom-style: none;font-family:맑은 고딕; font-size:12px; font-weight:bold; font-style:normal; padding-top:4px;padding-left:4px;padding-bottom:4px;}
    .cs2CCBAD20 {color:#000000;background-color:transparent;border-left-style: none;border-top-style: none;border-right-style: none;border-bottom-style: none;font-family:맑은 고딕; font-size:12px; font-weight:bold; font-style:normal; padding-top:4px;padding-left:4px;padding-right:4px;padding-bottom:4px;}
    .cs9315CC20 {color:#000000;background-color:transparent;border-left-style: none;border-top-style: none;border-right-style: none;border-bottom-style: none;font-family:맑은 고딕; font-size:12px; font-weight:normal; font-style:normal; }
    .cs50FD41EE {color:#000000;background-color:transparent;border-left-style: none;border-top-style: none;border-right-style: none;border-bottom-style: none;font-family:맑은 고딕; font-size:12px; font-weight:normal; font-style:normal; padding-top:4px;padding-left:4px;}
    .cs1C31FD56 {color:#000000;background-color:transparent;border-left-style: none;border-top-style: none;border-right-style: none;border-bottom-style: none;font-family:맑은 고딕; font-size:12px; font-weight:normal; font-style:normal; padding-top:4px;padding-left:4px;padding-bottom:4px;}
    .csD42E5FCF {color:#000000;background-color:transparent;border-left-style: none;border-top-style: none;border-right-style: none;border-bottom-style: none;font-family:맑은 고딕; font-size:12px; font-weight:normal; font-style:normal; padding-top:4px;padding-left:4px;padding-right:4px;padding-bottom:4px;}
    .csF53B5BB6 {color:#000000;background-color:transparent;border-left-style: none;border-top-style: none;border-right-style: none;border-bottom-style: none;font-family:맑은 고딕; font-size:21px; font-weight:bold; font-style:normal; padding-top:4px;padding-left:4px;padding-right:4px;padding-bottom:4px;}
    .cs489F85B5 {color:#000000;background-color:transparent;border-left-style: none;border-top-style: none;border-right-style: none;border-bottom-style: none;font-family:맑은 고딕; font-size:9px; font-weight:normal; font-style:normal; }
    .cs44826F2B {color:#808080;background-color:transparent;border-left-style: none;border-top-style: none;border-right-style: none;border-bottom-style: none;font-family:맑은 고딕; font-size:12px; font-weight:normal; font-style:normal; padding-left:2px;padding-right:2px;}
    .cs259368EE {color:#FF0000;background-color:transparent;border-left-style: none;border-top-style: none;border-right-style: none;border-bottom-style: none;font-family:맑은 고딕; font-size:12px; font-weight:bold; font-style:normal; padding-top:4px;padding-left:4px;padding-bottom:4px;}
    .csCEDFCE3E {color:#FF0000;background-color:transparent;border-left-style: none;border-top-style: none;border-right-style: none;border-bottom-style: none;font-family:맑은 고딕; font-size:12px; font-weight:bold; font-style:normal; padding-top:4px;padding-left:4px;padding-right:4px;padding-bottom:4px;}
    .csEF67D004 {color:#FFFFFF;background-color:#696969; border-left-style: none;border-top-style: none;border-right-style: none;border-bottom-style: none;font-family:맑은 고딕; font-size:12px; font-weight:bold; font-style:normal; }
    .cs3BEA41F9 {color:#FFFFFF;background-color:transparent;border-left-style: none;border-top-style: none;border-right-style: none;border-bottom-style: none;font-family:맑은 고딕; font-size:12px; font-weight:normal; font-style:normal; padding-left:2px;padding-right:2px;}
    .csF7D3565D {height:0px;width:0px;overflow:hidden;font-size:0px;line-height:0px;}

    /* 경매 결과 통보서 */
    .sa_report_wrap {
      width:717px;
      margin: 0px auto;
      overflow: hidden;
    }
    .sa_report_printbox {
      overflow: hidden;
      padding-bottom: 100px;
    }
    .sa_report_printbtn {
      width: 70px;
      border: 1px solid #696969;
      float: right;
      padding: 10px 0px;
    }
    .sa_report_printbox a {
      display: block;
    }
    .sa_report_contentwrap {
      overflow: hidden;
    }
    .sa_report_content {
      width: 50%;
      float: left;
      font-size: 12px;
    }
    .sa_report_content p {
      line-height: 22px;
      font-weight: bold;
    }
    .sa_report_numbox {
      text-align: left;
      padding: 10px 0;
    }
    .sa_report_buyerbox {
      float: right;
      padding: 5px 10px;
      background-color: #696969;
      color: #fff;
    }
    .h1_sa_report_box {
      padding: 50px 0;
    }
    .h1_sa_report {
      position: inherit;
      left: 0;
      top: 0;
      margin: 0;
      font-size: 21px;
      font-weight: bold;
      font-style: normal;
      letter-spacing: 7px;
    }
    table.sa_report_table tfoot.sa_report_notice {
      margin-top: 30px;
    }
    .sa_report_table_box {
      min-height: 430px;
    }
    .wrap_check > div input.number_popup_checkbox {
      margin-top:4px;
      margin-right: 5px;
    }
    @media print
    {
      .no-print, .no-print *
      {
        height: 0px !important;
        display: none !important;
      }
    }
  </style>
</head>
<body leftMargin=10 topMargin=10 rightMargin=10 bottomMargin=10 style="background-color:#FFFFFF" ng-controller="soldInvoiceCtl">
<center>
  <table  class="no-print" cellpadding="0" cellspacing="0" border="0" style="border-width:0px;empty-cells:show;width:717px;position:relative;">
    <tr>
      <td style="text-align: right; height:50px;"><a href="javascript:window.print();">인쇄</a></td>
    </tr>
  </table>

  <div class="sa_report_wrap">
    <div id="sa_report_contentwrap">
      <div class="sa_report_content">
        <div class="sa_report_numbox" style="line-height: 25px;">
          <p style="font-size: 12px; font-weight: normal;">
            Invoice&nbsp;Number
          </p>
          <p style="font-weight: 900;">
            {{InvoiceNumber}}
          </p>
        </div>
      </div>

      <div class="sa_report_content">
        <div class="sa_report_buyerbox">
          <div class="">
            <p>
              Successful&nbsp;Buyer
            </p>
            <p>
              {{invoice_dt}}
            </p>
          </div>
        </div>
      </div>

      <div class="clearfix"></div>

      <div class="h1_sa_report_box">
        <h1 class="h1_sa_report">
          <div>경매결과통보서</div>
        </h1>
      </div>

      <div class="sa_report_table_box">
        <table cellpadding="0" cellspacing="0" border="0" style="border-width:0px;empty-cells:show;width:717px; overflow: hidden;">
          <thead>
          <tr style="vertical-align:top;">
            <td style="height:33px;"></td>
            <td class="cs1C31FD56" colspan="6" style="width:97px;height:25px;line-height:16px;text-align:left;vertical-align:middle;">
              <nobr>■&nbsp;낙찰자&nbsp;:</nobr>
            </td>
            <td class="cs1C31FD56" colspan="18" style="width:585px;height:25px;line-height:16px;text-align:left;vertical-align:middle;"><nobr>{{INFO.LAST_CUST_NAME}}&nbsp;&nbsp;&nbsp;님</nobr></td>
            <td></td>
            <td></td>
          </tr>

          <tr style="vertical-align:top;">
            <td style="height:30px;"></td>
            <td class="cs9EC8A45B" colspan="13" style="width:322px;height:18px;line-height:16px;text-align:center;vertical-align:middle;">
              <nobr>작품정보</nobr>
            </td>
            <td class="cs9EC8A45B" colspan="4" style="width:104px;height:18px;line-height:16px;text-align:center;vertical-align:middle;">
              <nobr>낙찰가</nobr>
            </td>
            <td class="cs9EC8A45B" colspan="3" style="width:73px;height:18px;line-height:16px;text-align:center;vertical-align:middle;">
              <nobr>구매수수료</nobr>
            </td>
            <td class="cs9EC8A45B" colspan="2" style="width:66px;height:18px;line-height:16px;text-align:center;vertical-align:middle;">
              <nobr>기타비용</nobr>
            </td>
            <td class="cs9EC8A45B" colspan="3" style="width:85px;height:18px;line-height:16px;text-align:center;vertical-align:middle;">
              <nobr>수령금액</nobr>
            </td>
            <td></td>
            <td></td>
          </tr>
          </thead>

          <tbody ng-repeat="item in LIST" ng-init="$parent.tot_cnt = $parent.tot_cnt + 1;
					 $parent.tot_price = $parent.tot_price + item.LAST_PRICE;
					 $parent.tot_fee = $parent.tot_fee + item.PAYMENT_FEE;
					 $parent.tot_expe_fee = $parent.tot_expe_fee + item.PAYMENT_EXPE_FEE;
					 $parent.tot_all = $parent.tot_all + item.PAYMENT_TOT;">
          <tr style="vertical-align:top;">
            <td style="height:1px;"></td>
            <td class="csCDAFFDC5" colspan="2" rowspan="3" style="width:24px;height:50px;line-height:16px;text-align:center;vertical-align:middle;"><span>Lot.</span></td>
            <td class="csCDAFFDC5" rowspan="3" style="width:24px;height:50px;line-height:16px;text-align:center;vertical-align:middle;"><nobr>{{item.LOT_NO}}</nobr></td>
            <td class="cs9315CC20" style="width:2px;height:1px;"><!--[if lte IE 7]><div class="csF7D3565D"></div><![endif]--></td>
            <td class="cs9315CC20" colspan="2" style="width:69px;height:1px;"><!--[if lte IE 7]><div class="csF7D3565D"></div><![endif]--></td>
            <td class="cs9315CC20" style="width:1px;height:1px;"><!--[if lte IE 7]><div class="csF7D3565D"></div><![endif]--></td>
            <td class="csCDAFFDC5" rowspan="3" colspan="3" style="width:61px;height:50px;line-height:16px;text-align:center;vertical-align:middle;">
              <span>{{item.ARTIST_NAME}}</span>
            </td>
            <td class="csCDAFFDC5" colspan="3" rowspan="3" style="width:149px;height:50px;line-height:16px;text-align:center;vertical-align:middle;">
              <span>{{item.TITLE}}</span>
            </td>
            <td class="cs48872F7D" colspan="4" rowspan="3" style="width:104px;height:42px;line-height:16px;text-align:right;vertical-align:middle;"><span>{{item.LAST_PRICE | number}}</span></td>
            <td class="cs48872F7D" colspan="3" rowspan="3" style="width:73px;height:42px;line-height:16px;text-align:right;vertical-align:middle;"><span>{{item.PAYMENT_FEE | number}}</span></td>
            <td class="cs48872F7D" colspan="2" rowspan="3" style="width:66px;height:42px;line-height:16px;text-align:right;vertical-align:middle;"><span>{{item.PAYMENT_EXPE_FEE | number}}</span></td>
            <td class="cs48872F7D" colspan="3" rowspan="3" style="width:85px;height:42px;line-height:16px;text-align:right;vertical-align:middle;"><span>{{item.PAYMENT_TOT | number}}</span></td>
            <td></td>
            <td></td>
          </tr>
          <tr style="vertical-align:top;">
            <td style="height:47px;"></td>
            <td class="cs9315CC20" style="width:2px;height:47px;"><!--[if lte IE 7]><div class="csF7D3565D"></div><![endif]--></td>
            <td class="cs9315CC20" colspan="3" style="width:69px;height:47px;text-align:left;vertical-align:top;"><div style="overflow:hidden;width:69px;height:47px;">
              <div style="margin-left:4px;overflow:hidden;">
                <img alt="" ng-src="${imageRootPath}{{item.THUM_PATH}}" style="width:60px;height:47px;" /></div>
            </div>
            </td>
            <td class="cs9315CC20" style="width:1px;height:47px;"><!--[if lte IE 7]><div class="csF7D3565D"></div><![endif]--></td>
            <td></td>
            <td></td>
          </tr>
          <tr style="vertical-align:top;">
            <td style="height:3px;"></td>
            <td class="csCDAFFDC5" style="width:2px;height:2px;"><!--[if lte IE 7]><div class="csF7D3565D"></div><![endif]--></td>
            <td class="csCDAFFDC5" colspan="2" style="width:69px;height:2px;"><!--[if lte IE 7]><div class="csF7D3565D"></div><![endif]--></td>
            <td class="csCDAFFDC5" style="width:1px;height:2px;"><!--[if lte IE 7]><div class="csF7D3565D"></div><![endif]--></td>
            <td></td>
            <td></td>
          </tr>
          </tbody>

          <tfoot>
          <tr style="vertical-align:top;">
            <td style="height:32px;"></td>
            <td class="csB9449DE8" colspan="13" style="width:322px;height:23px;line-height:12px;text-align:center;vertical-align:middle;">
              <nobr>합계</nobr>
            </td>
            <td class="cs48872F7D" colspan="4" style="width:104px;height:23px;line-height:16px;text-align:right;vertical-align:middle;"><nobr>{{tot_price | number}}</nobr></td>
            <td class="cs48872F7D" colspan="3" style="width:73px;height:23px;line-height:16px;text-align:right;vertical-align:middle;"><nobr>{{tot_fee | number}}</nobr></td>
            <td class="cs48872F7D" colspan="2" style="width:66px;height:23px;line-height:16px;text-align:right;vertical-align:middle;"><nobr>{{tot_expe_fee | number}}</nobr></td>
            <td class="cs48872F7D" colspan="3" style="width:85px;height:23px;line-height:16px;text-align:right;vertical-align:middle;"><nobr>{{tot_all | number}}</nobr></td>
            <td></td>
            <td></td>
          </tr>

          <!-- 빈칸용 -->
          <tr style="vertical-align:top;">
            <td style="height:27px;"></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
          </tr> <!-- //빈칸용 -->
          </tfoot>
        </table>
      </div>


      <div class="sa_report_caption">
        <table>
          <tr style="vertical-align:top;">
            <td style="height:27px;"></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td class="cs7B144C0A" colspan="2" style="width:100px;height:19px;line-height:16px;text-align:left;vertical-align:middle;">
              <nobr>작품수</nobr>
            </td>
            <td class="cs2CCBAD20" colspan="4" style="width:110px;height:19px;line-height:16px;text-align:right;vertical-align:middle;"><nobr>{{tot_cnt | number}}</nobr></td>
            <td class="cs2CCBAD20" colspan="2" style="width:45px;height:19px;line-height:16px;text-align:center;vertical-align:middle;">
              <nobr>점</nobr>
            </td>
            <td></td>
            <td></td>
          </tr>
          <tr style="vertical-align:top;">
            <td style="height:27px;"></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td class="cs7B144C0A" colspan="2" style="width:100px;height:19px;line-height:16px;text-align:left;vertical-align:middle;">
              <nobr>낙찰가</nobr>
            </td>
            <td class="cs2CCBAD20" colspan="4" style="width:110px;height:19px;line-height:16px;text-align:right;vertical-align:middle;"><nobr>{{tot_price | number}}</nobr></td>
            <td class="cs2CCBAD20" colspan="2" style="width:45px;height:19px;line-height:16px;text-align:center;vertical-align:middle;"><nobr>KRW</nobr></td>
            <td></td>
            <td></td>
          </tr>
          <tr style="vertical-align:top;">
            <td style="height:27px;"></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td class="cs7B144C0A" colspan="2" style="width:100px;height:19px;line-height:16px;text-align:left;vertical-align:middle;">
              <nobr>수수료</nobr>
            </td>
            <td class="cs2CCBAD20" colspan="4" style="width:110px;height:19px;line-height:16px;text-align:right;vertical-align:middle;"><nobr>{{tot_fee | number}}</nobr></td>
            <td class="cs2CCBAD20" colspan="2" style="width:45px;height:19px;line-height:16px;text-align:center;vertical-align:middle;"><nobr>KRW</nobr></td>
            <td></td>
            <td></td>
          </tr>
          <tr style="vertical-align:top;">
            <td style="height:26px;"></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td class="cs259368EE" colspan="2" style="width:100px;height:18px;line-height:16px;text-align:left;vertical-align:middle;">
              <nobr>총구매금액</nobr>
            </td>
            <td class="csCEDFCE3E" colspan="4" style="width:110px;height:18px;line-height:16px;text-align:right;vertical-align:middle;"><nobr>{{tot_all | number}}</nobr></td>
            <td class="csCEDFCE3E" colspan="2" style="width:45px;height:18px;line-height:16px;text-align:center;vertical-align:middle;"><nobr>KRW</nobr></td>
            <td></td>
            <td></td>
          </tr>
          <tr style="vertical-align:top;">
            <td style="height:11px;"></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
          </tr>
          <!-- 빈칸용 -->
          <tr style="vertical-align:top;">
            <td style="height:27px;"></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
          </tr> <!-- //빈칸용 -->
        </table>
      </div>

      <footer>
        <table cellpadding="0" cellspacing="0" border="0" style="border-width:0px;empty-cells:show; overflow: hidden;">
          <tr style="vertical-align:top;">
            <td style="height:32px;"></td>
            <td></td>
            <td class="cs7B144C0A" colspan="12" style="width:335px;height:24px;line-height:16px;text-align:left;vertical-align:middle;"><nobr>■&nbsp;구매대금&nbsp;입금&nbsp;안내</nobr></td>
          </tr>
          <tr style="vertical-align:top;">
            <td style="height:25px;"></td>
            <td></td>
            <td class="cs50FD41EE" colspan="25" style="width:335px;height:17px;line-height:1.5;text-align:left;vertical-align:middle; padding: 10px 0; padding-left: 20px;">
              <span style="font-weight: bold;">* 결제방법</span><br>
              &nbsp;신용카드 및 가상계좌 : https://www.seoulauction.com 접속 후 → 로그인 → ACCOUNT → 온라인경매거래목록 → 구매내역 → 결제하기
            </td>
          </tr>
          <tr style="vertical-align:top;">
            <td style="height:26px;"></td>
            <td></td>
            <td class="cs259368EE" colspan="25" style="width:696px;height:18px;line-height:16px;text-align:left;vertical-align:bottom; padding-left: 20px;">
              구매하신&nbsp;작품(물품)의&nbsp;대금은&nbsp;{{INFO.PAY_LOW_DT | date : 'yyyy년 MM월 dd일'}}&nbsp;이내에&nbsp;완납해주시기&nbsp;바랍니다.
            </td>
          </tr>
          <tr style="vertical-align:top;">
            <td style="height:41px;"></td>
            <td></td>
            <td class="cs50FD41EE" colspan="25" style="width:696px;height:37px;line-height:16px;text-align:left;vertical-align:top; padding-left: 20px;">
              단,&nbsp;낙찰금액이&nbsp;{{INFO.CURR_CD}}&nbsp;{{INFO.PAY_DAYS_PRICE | number}}&nbsp;이상인&nbsp;경우&nbsp;총&nbsp;구매대금의&nbsp;30%를&nbsp;{{INFO.PAY_LOW_DT | date : 'yyyy년 MM월 dd일'}}까지&nbsp;선납하시고,<br/>70%는&nbsp;{{INFO.PAY_HIGH_DT | date : 'yyyy년 MM월 dd일'}}까지&nbsp;완납해주셔도&nbsp;됩니다.
            </td>
          </tr>
          <tr style="vertical-align:top;">
            <td style="height:42px;"></td>
            <td></td>
            <td class="cs50FD41EE" colspan="25" style="width:696px;height:38px;line-height:16px;text-align:left;vertical-align:top;">
              <nobr>■&nbsp;계산서/세금계산서는&nbsp;경매일자로&nbsp;발행됩니다.</nobr><br/><nobr>&nbsp;&nbsp;&nbsp;&nbsp;발행을&nbsp;희망하시는&nbsp;경우,&nbsp;담당자를&nbsp;통해&nbsp;{{INFO.PAY_LOW_DT | date : 'yyyy년 MM월 dd일'}}일까지&nbsp;신청해주셔야&nbsp;합니다.</nobr>
            </td>
          </tr>
          <tr style="vertical-align:top;">
            <td style="height:26px;"></td>
            <td></td>
            <td class="cs1C31FD56" colspan="25" style="width:696px;height:18px;line-height:16px;text-align:left;vertical-align:bottom;">
              <nobr>■&nbsp;구매작품(물품)이&nbsp;문화재보호법상의&nbsp;문화재에&nbsp;해당되는&nbsp;경우,&nbsp;해외반출이&nbsp;불가하오니&nbsp;이&nbsp;점&nbsp;유의하시기&nbsp;바랍니다.</nobr>
            </td>
          </tr>
          <tr style="vertical-align:top;">
            <td style="height:7px;"></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
          </tr>
          <tr style="vertical-align:top;">
            <td style="height:3px;"></td>
            <td></td>
            <td></td>
            <td class="cs9315CC20" colspan="23" style="width:690px;height:3px;"><!--[if lte IE 7]><div class="csF7D3565D"></div><![endif]--></td>
            <td></td>
          </tr>
          <tr style="vertical-align:top;">
            <td style="height:1px;"></td>
            <td></td>
            <td></td>
            <td class="csE43CB777" colspan="23" style="width:690px;height:1px;"><!--[if lte IE 7]><div class="csF7D3565D"></div><![endif]--></td>
            <td></td>
          </tr>
          <tr style="vertical-align:top;">
            <td style="height:3px;"></td>
            <td></td>
            <td></td>
            <td class="cs9315CC20" colspan="23" style="width:690px;height:3px;"><!--[if lte IE 7]><div class="csF7D3565D"></div><![endif]--></td>
            <td></td>
          </tr>
          <tr style="vertical-align:top;">
            <td style="height:41px;"></td>
            <td></td>
            <td></td>
            <td class="cs9315CC20" colspan="9" style="width:179px;height:41px;text-align:left;vertical-align:top;"><div style="overflow:hidden;width:179px;height:41px;">
              <div style="margin-top:6px;overflow:hidden;">
                <!--[if lt IE 7]><img alt="" src="경매결과통보서_files/4133685977.gif" style="width:179px;height:29px;filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(src='경매결과통보서_files/3394370369.png',sizingMethod='scale');" /><div style="display:none"><![endif]--><img alt="" src="https://www.seoulauction.com/nas_img/front/homepage/3394370369.png" style="width:179px;height:29px;" /><!--[if lt IE 7]></div><![endif]--></div>
            </div>
            </td>
            <td></td>
            <td></td>
            <td></td>
            <td class="cs44826F2B" colspan="9" rowspan="2" style="width:340px;height:46px;line-height:16px;text-align:right;vertical-align:top;"><nobr>24,&nbsp;Pyeongchang&nbsp;30-gil,&nbsp;Jongno-gu,&nbsp;Seoul,&nbsp;Korea,&nbsp;03004</nobr><br/><nobr>TEL&nbsp;+82&nbsp;2&nbsp;395&nbsp;0330&nbsp;&nbsp;FAX&nbsp;+82&nbsp;2&nbsp;395&nbsp;0338</nobr></td>
            <td></td>
            <td></td>
            <td></td>
          </tr>
          <tr style="vertical-align:top;">
            <td style="height:5px;"></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
          </tr>
        </table>
      </footer>
    </div>
  </div>
</center>

<script>
  app.value('locale', 'ko');
  app.value('ss_cust_no', '${ss_cust_no}');

  app.controller('soldInvoiceCtl', function($scope, consts, common, locale, ss_cust_no) {
    $scope.sale_no = '${param.sale_no}';
    $scope.cust_no = '${param.cust_no}';
    $scope.invoice_dt = '${param.invoice_dt}';

    //로그인 체크
    if(!checkLogin()) return;

    //로그인고객과 요청고객 일치여부 체크
    if($scope.cust_no != ss_cust_no){
      alert("요청하신 경매경과통보서의 고객정보가 일치하지 않습니다.");
      document.location.href='/';
      return;
    }

    $scope.loadData = function(){
      const url = '/api/auction/sold/invoice?sale_no='+$scope.sale_no+"&cust_no="+$scope.cust_no;
      axios.get(url).then(function(response) {
        const success = response.data.success;
        if (success) {
          $scope.LIST = response.data.data;
          $scope.INFO = $scope.LIST[0];
          if($scope.INFO){
            var tmp = {"main": "M", "hongkong": "HK", "online": "O", "online_zb": "ZB", "plan": "P", "exhibit": "EX", "private": "PS"};
            $scope.InvoiceNumber = $scope.INFO.ARTWORK_NO + "-" + (tmp[$scope.INFO.SALE_KIND_CD] || "E") + $scope.INFO.SALE_NO + "-" + (("000" + $scope.INFO.LOT_NO).slice(-3)) + "-" + $scope.invoice_dt;
          }
          $scope.$apply();
        }
      }).
      catch(function(error){
        console.log(error);
      });
    };

    $scope.loadData();
  });
</script>
</body>
</html>
