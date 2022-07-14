<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<c:set var="ss_cust_no" scope="session" value="${pageContext.request.userPrincipal.details.userNo}" />
<spring:eval expression="@environment.getProperty('image.root.path')" var="imageRootPath" />
<!DOCTYPE html>
<html lang="ko" ng-app="myApp">
<head>
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
            <td style="text-align: right; height:50px;"><a href="javascript:window.print();">Print</a></td>
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
                    <div style="letter-spacing:normal;">Invoice for Successful Buyer</div>
                </h1>
            </div>

            <div class="sa_report_table_box">
                <table cellpadding="0" cellspacing="0" border="0" style="border-width:0px;empty-cells:show;width:717px; overflow: hidden;">
                    <thead>
                    <tr style="vertical-align:top;">
                        <td style="height:33px;"></td>
                        <td class="cs1C31FD56" colspan="6" style="width:97px;height:25px;line-height:16px;text-align:left;vertical-align:middle;">
                            <nobr>■&nbsp;Buyer&nbsp;:</nobr>
                        </td>
                        <td class="cs1C31FD56" colspan="18" style="width:585px;height:25px;line-height:16px;text-align:left;vertical-align:middle;"><nobr>{{INFO.LAST_CUST_NAME}}</nobr></td>
                        <td></td>
                        <td></td>
                    </tr>

                    <tr style="vertical-align:top;">
                        <td style="height:30px;"></td>
                        <td class="cs9EC8A45B" colspan="13" style="width:322px;height:18px;line-height:16px;text-align:center;vertical-align:middle;">
                            <nobr>Title</nobr>
                        </td>
                        <td class="cs9EC8A45B" colspan="4" style="width:104px;height:18px;line-height:16px;text-align:center;vertical-align:middle;">
                            <nobr>Hammer Price</nobr>
                        </td>
                        <td class="cs9EC8A45B" colspan="3" style="width:73px;height:18px;line-height:16px;text-align:center;vertical-align:middle;">
                            <nobr>Commission</nobr>
                        </td>
                        <td class="cs9EC8A45B" colspan="2" style="width:66px;height:18px;line-height:16px;text-align:center;vertical-align:middle;">
                            <nobr>Other<br>Expenses</nobr>
                        </td>
                        <td class="cs9EC8A45B" colspan="3" style="width:85px;height:18px;line-height:16px;text-align:center;vertical-align:middle;">
                            <nobr>Total</nobr>
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
                            <span>{{item.ARTIST_NAME_EN}}</span>
                        </td>
                        <td class="csCDAFFDC5" colspan="3" rowspan="3" style="width:149px;height:50px;line-height:16px;text-align:center;vertical-align:middle;">
                            <span>{{item.TITLE_EN}}</span>
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
                            <nobr>Total</nobr>
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
                            <nobr>Art Works</nobr>
                        </td>
                        <td class="cs2CCBAD20" colspan="4" style="width:110px;height:19px;line-height:16px;text-align:right;vertical-align:middle;"><nobr>{{tot_cnt | number}}</nobr></td>
                        <td class="cs2CCBAD20" colspan="2" style="width:45px;height:19px;line-height:16px;text-align:center;vertical-align:middle;">
                            <nobr></nobr>
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
                            <nobr>Hammer Price</nobr>
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
                            <nobr>Commission</nobr>
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
                            <nobr>Purchase Price</nobr>
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
                        <td class="cs7B144C0A" colspan="12" style="width:335px;height:24px;line-height:16px;text-align:left;vertical-align:middle;"><nobr>■&nbsp;Account&nbsp;information</nobr></td>
                    </tr>
                    <tr style="vertical-align:top;">
                        <td style="height:25px;"></td>
                        <td></td>
                        <td class="cs50FD41EE" colspan="25" style="width:335px;height:17px;line-height:1.5;text-align:left;vertical-align:middle; padding: 10px 0; padding-left: 20px;">
                            <span style="font-weight: bold;">*How to pay</span><br>
                            &nbsp;Credit card / Virtual account : https://www.seoulauction.com →ID Login→Account Menu→Online Auction→Orders→Payment
                        </td>
                    </tr>
                    <tr style="vertical-align:top;">
                        <td style="height:26px;"></td>
                        <td></td>
                        <td class="cs259368EE" colspan="25" style="width:696px;height:18px;line-height:16px;text-align:left;vertical-align:bottom; padding-left: 20px;">
                            A successful bidder shall make full payments, including the amount of the purchased items plus commission by{{INFO.PAY_LOW_DT | date : ' dd/MM/yyyy'}}
                        </td>
                    </tr>
                    <tr style="vertical-align:top;">
                        <td style="height:41px;"></td>
                        <td></td>
                        <td class="cs50FD41EE" colspan="25" style="width:696px;height:37px;line-height:16px;text-align:left;vertical-align:top; padding-left: 20px;">
                            However, when the successful bid price is higher than or equal to {{INFO.CURR_CD}}&nbsp;{{INFO.PAY_DAYS_PRICE | number}}, the purchaser shall prepay 30% of its total price by {{INFO.PAY_LOW_DT | date : 'dd/MM/yyyy'}}, and remainder by {{INFO.PAY_HIGH_DT | date : 'dd/MM/yyyy'}}. Payment should be made by Korean Won.
                        </td>
                    </tr>
                    <tr style="vertical-align:top;">
                        <td style="height:42px;"></td>
                        <td></td>
                        <td class="cs50FD41EE" colspan="25" style="width:696px;height:38px;line-height:16px;text-align:left;vertical-align:top;">
                            <nobr>■&nbsp;If the purchased items are protected by the Cultural Properties Protection Act, it may be prohibited to export.</nobr>
                        </td>
                    </tr>
                    <tr style="vertical-align:top;">
                        <td style="height:26px;"></td>
                        <td></td>
                        <td class="cs1C31FD56" colspan="25" style="width:696px;height:18px;line-height:16px;text-align:left;vertical-align:bottom;">
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
            alert("Customer information does not match.");
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
