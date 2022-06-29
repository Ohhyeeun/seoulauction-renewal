<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="en">
    <head>
	    <meta charset="UTF-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0,minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
	    <title>Seoul Auction</title>
	</head>
	<body ng-controller="joinFormCtl" data-ng-init="init()" ng-cloak>
	<div class="wrapper">
		<div class="sub-wrap pageclass">
			<jsp:include page="../../include/en/header.jsp" flush="false" />
			<div id="container">
				<div id="contents" class="contents">
		            <section class="basis-section last-section back_gray">
		                <div class="section-inner">
		                    <div class="content-panel type_panel-member">
		                        <div class="panel-header">
		                            <div class="title txt_input">
		                                <span class="tt2">Sign up</span>
		                            </div>
		                            <div class="required">
		                                <span class="tb2"><i>*</i> Required</span>
		                            </div>
		                        </div>
		                        
								<form id="joinForm" enctype='multipart/form-data'>
		                        <div class="panel-body">
		                            <ul class="form_list">
		                                <li>
		                                    <div class="form_label">
		                                        <label for="login_id" class="mem_txt">Account ID</label>
		                                        <i>*</i>
		                                    </div>
		                                    <div class="form_body">
		                                    	<input type="hidden" id="social_login_id" name="social_login_id" ng-model="form_data.social_login_id" />
												<input type="hidden" id="social_email" name="social_email" ng-model="form_data.social_email" />
		                                        <input 
		                                        	autofocus="autofocus"
		                                        	tabindex="1"
		                                        	ng-hide="isSocial()" 
		                                        	type="text" 
		                                        	id="login_id" 
		                                        	name="login_id" 
		                                        	ng-model="form_data.login_id" 
		                                        	ng-blur="idValidCheckBlur()"
		                                        	ng-change="idValidCheckChange()"  
		                                        	class="form-control" 
		                                        	placeholder="">
		                                        <div class="id_name_box" ng-show="isSocial()">
		                                            <span class="tb1">${socialLoginId }</span>
		                                            <span class="sns-icon"><img ng-src="/images/common/icon-sns_{{getSocialName()}}.png" alt=""></span>
		                                        </div>
		                                        <p class="error_text tb2">{{login_id_msg}}</p>
		                                    </div>
		                                </li>
		                                <li ng-hide="isSocial()">
		                                    <div class="form_label">
		                                        <label for="passwd" class="mem_txt">Password</label>
		                                        <i>*</i>
		                                    </div>
		                                    <div class="form_body">
		                                        <div class="pw_mask_box">
		                                            <input type="password" tabindex="2" ng-change="passwdValidChange()" class="" id="passwd" name="passwd" ng-model="form_data.passwd" placeholder="Enter password">
		                                            <span class="input-side">
		                                                <button type="button" ng-click="togglePasswd()" class="btn_pw_mask js-pw_mask">비밀번호 마스킹 해제하기</button>
		                                            </span>
		                                        </div>
		                                        <p class="error_text tb2">{{passwd_msg}}</p>
		                                    </div>
		                                </li>
		                                <li>
		                                    <div class="form_label">
		                                        <label for="cust_name" class="mem_txt">Name</label>
		                                        <i>*</i>
		                                    </div>
		                                    <div class="form_body">
		                                        <input type="text" tabindex="3" ng-change="nameValidCheck()" ng-model="form_data.cust_name" name="cust_name" id="cust_name" class="form-control" placeholder="">
		                                    </div>
		                                </li> 
		                                
		                                <li>
		                                    <div class="form_label ">
		                                        <label for="email" class="mem_txt">E-mail</label>
		                                        <i>*</i>
		                                    </div>
		                                    <div class="form_body">
												<input type="text" tabindex="4" ng-change="emailValidCheck()" ng-model="form_data.email" name="email" id="email" class="form-control" placeholder="">
												<button class="btn btn_light_gray_line mt10" type="button" ng-click="emailDuplCheck()"><span>Check Availability</span></button>
		                                        <p class="error_text tb2">{{email_msg}}</p>
												<ul class="mark_dot-list">
													<li class="tb2">After application. In order to enjoy all of the benefits of your online account, please complete a one-time validation of your email address.</li>
												</ul>
		                                    </div>
		                                </li>
		                                
		                                <li>
		                                    <div class="form_label">
		                                        <label for="select_nation" class="mem_txt">Country</label>
		                                        <i>*</i>
		                                    </div>
		                                    <div class="form_body">
		                                        <div class="select-box">
		                                        	<select class="select2Basic" id="select_nation" ng-model="select_nation" tabindex="5" name="select_nation" ng-required="langType == 'en'" onchange="angular.element(this).scope().changeNation()">
														<option value="">Select your country</option>
														<option ng-repeat="nation in nationList" value="{{nation.CD_ID}}|{{nation.CD_VAL3}}">{{nation.CD_NM}} +{{nation.CD_VAL3}}</option>
													</select>
		                                        </div>
		                                    </div>
		                                </li>
		                                
		                                <li>
		                                    <div class="form_label">
		                                        <label for="hp" class="mem_txt">Mobile Number</label>
		                                    </div>
		                                    <div class="form_body nation_hpbox">
<!-- 												<div ng-show="nationMobile != '' && nationMobile != undefined">+{{nationMobile}}</div> -->
												<input type="text" tabindex="6" onkeyup="onlyNumber(this, 'number');" ng-model="form_data.hp" name="hp" id="hp" class="form-control" placeholder="">
		                                    </div>
		                                </li>
		                                
		                                <li>
		                                    <div class="form_label ">
		                                        <label for="zipno" class="mem_txt">Address</label>
		                                        <i>*</i>
		                                    </div>
		                                    <div class="form_body">
		                                        <div class="search-add">
													<p class="add_txt tb1">Postal Code</p>
		                                            <input ng-blur="addrValidBlur()" type="text" tabindex="7" ng-model="form_data.zipno" name="zipno" id="zipno" class="form-control" placeholder="">
													<p class="add_txt tb1">Address Line</p>
		                                            <input ng-blur="addrValidBlur()" type="text" tabindex="8" ng-model="form_data.addr" name="addr" id="addr" class="form-control" placeholder="">
													<p class="add_txt tb1">Province / state. City</p>
		                                            <input ng-blur="addrValidBlur()" type="text" tabindex="9" ng-model="form_data.addr_dtl" name="addr_dtl" id="addr_dtl" class="form-control" placeholder="">
		                                        </div>
		                                    </div>
		                                </li>
		                                
		                                <li>
		                                    <div class="form_label">
		                                        <label for="bidRadio" class="mem_txt">Fill the bidding registration</label>
		                                        <i>*</i>
		                                    </div>
		                                    <div class="form_body">
												<span class="trp radio-box">
		                                    		<input id="radio1-1" type="radio" tabindex="10" value="Y" name="bidRadio" id="bid" ng-click="bidValidCheck('Y')">
													<i></i>
													<label for="radio1-1">Yes</label>
												</span>
												<span class="trp radio-box">
		                                    		<input id="radio1-2" type="radio" tabindex="11" value="N" name="bidRadio" ng-click="bidValidCheck('N')">
													<i></i>
													<label for="radio1-2">No</label>
												</span>
												<ul class="mark_dot-list">
													<li class="tb2">To be able to participate in online auctions, you must check “Yes” under “Bidding Registration” when applying for membership.</li>
													<li class="tb2">The bidding button will become available for use one or two business days after selecting “Yes.”</li>
													<li class="tb2">If the bidding button does not become available, please send an email inquiry to info@seoulauction.com.</li>
													<li class="tb2">If you register for membership near the closing time of an auction and make an email or phone inquiry related to bidding, Seoul Auction will provide all necessary assistance.</li>
												</ul>
		                                    </div>
		                                </li>
		                                
		                                <li ng-show="form_data.fore_bid_req_yn == 'Y'">
		                                    <div class="form_label">
		                                        <label for="fore_id_file" class="mem_txt">ID card attached</label>
		                                        <i>*</i>
		                                    </div>
		                                    <div class="form_body">
												<p class="tb2 warning_text">When attaching an ID, be sure to mask personal information other than your name/date of birth/nationality.</p>
												<div class="passport-wrap">
													<img src="/images/pc/member/passport_pc.png" class="only-pc">
													<img src="/images/mobile/member/passport_mo.png" class="only-mb">
												</div>
		                                        <div class="trp file-box">
		                                            <label for="fileName" class="screen-reader-text">Select File</label>
		                                            <input type="text" id="fileName" class="trp-Filetext">
		                                            <input type="button" class="btn btn_light_gray_line" value="Select File">
<!-- 		                                            <input type="file" class="trp-Filehidden" name="fore_id_file" id="fore_id_file" onchange="javascript: document.getElementById('fileName').value = this.value" title="Insert Attachment"> -->
													<input type="file" tabindex="13" class="trp-Filehidden" ng-model="form_data.fore_id_file" name="fore_id_file" id="fore_id_file" onchange="angular.element(this).scope().fileValidCheck('fore_id_file')" title="Insert Attachment">
		                                        </div>
		                                        <p class="error_text tb2">{{fore_id_msg}}</p>
		                                        <div class="file-box-list" ng-hide="fore_id_filename == '' || fore_id_filename == undefined">
		                                            <p class="label">
														<i class="icon_down"></i>
		                                                <span class="tb1">{{fore_id_filename}}</span>
		                                                <a href="#none" class="btn_del" ng-click="fileDelete('fore_id_file')"><span class="icon-del"></span></a>
		                                            </p>
		                                        </div>
												<ul class="mark_dot-list tb2 mt5">
													<li>Files of 5 MB or less can be attached</li>
													<li>Upload only jpg, jpeg, png, gif</li>
												</ul>
		                                    </div>
		                                </li>
		                                
		                                <li ng-show="form_data.fore_bid_req_yn == 'Y'">
		                                    <div class="form_label">
		                                        <label for="fore_doc_file" class="mem_txt">Supporting Documents</label>
		                                        <i>*</i> 
		                                    </div>
		                                    <div class="form_body">
												<p class="tb2 warning_text">Please attach a copy of your credit card or bankbook</p>
		                                        <div class="trp file-box">
		                                            <label for="fileName" class="screen-reader-text">Select File</label>
		                                            <input type="text" id="fileName" class="trp-Filetext">
		                                            <input type="button" class="btn btn_light_gray_line" value="Select File">
<!-- 		                                            <input type="file" class="trp-Filehidden" name="fore_doc_file" id="fore_doc_file" onchange="javascript: document.getElementById('fileName').value = this.value" title="Insert Attachment"> -->
													<input type="file" tabindex="14" class="trp-Filehidden" ng-model="form_data.fore_doc_file" name="fore_doc_file" id="fore_doc_file" onchange="angular.element(this).scope().fileValidCheck('fore_doc_file')" title="Insert Attachment">
		                                        </div>
		                                        <p class="error_text tb2">{{fore_doc_msg}}</p>
		                                        <div class="file-box-list" ng-hide="fore_doc_filename == '' || fore_doc_filename == undefined">
		                                            <p class="label">
		                                                <i class="icon_down"></i>
		                                                <span class="tb1">{{fore_doc_filename}}</span>
		                                                <a href="#none" class="btn_del" ng-click="fileDelete('fore_doc_file')"><span class="icon-del"></span></a>
		                                            </p>
		                                        </div>

												<ul class="mark_dot-list tb2 mt5">
													<li>Files of 5 MB or less can be attached</li>
													<li>Upload only jpg, jpeg, png, gif</li>
												</ul>
		                                    </div>
		                                </li>
		                            </ul>
		
									
		                            <div class="policy_accordion">
		                                <div class="check_all-wrap js_all-1">
											<p class="tt3 checkbox_title">Agreement to terms and conditions</p>
		                                    <div class="all_check">
		                                        <span class="trp checkbox-box">
		                                            <input id="checkbox_all" tabindex="15" class="js_all" ng-click="checkAllPerson()" ng-checked="allCheckPerson" type="checkbox" name="">
		                                            <i></i>
		                                            <label for="checkbox_all">All Agree</label>
		                                        </span>
		                                    </div>
		
		                                    <ul class="accordion-list policy js-accordion_policy">
		                                        <li class="trp_acitem" data-index="0">
		                                            <div class="header-area">
		                                                <div class="accordion_name eng_accordion">
															<div class="trp checkbox-box">
		                                                        <input id="checkbox_all1" tabindex="16" class="js_item" type="checkbox" name="chk_per" ng-change="onChangeCheckbox_P()"ng-model="form_data.personOnlineAgree">
		                                                        <i></i>
		                                                        <label for="checkbox_all1"><span class="required">[Required]</span> Agree to online auction terms and conditions</label>
		                                                    </div>
		                                                </div>
		                                                <a href="#" class="acc_btn">
		                                                    <i class="icon-accordion_arrow_down"></i>
		                                                </a>
		                                            </div>
		                                            <div class="con-area">
														<div class="policy_cont scroll-type">
															<p class="tb1 title_txt">Please carefully review the provisions of these Auction Terms.<br>
																Offline auctions and purchase contracts of Seoul Auction are implemented pursuant to the following, and you are consenting to being bound by these Auction Terms by participating in the auction or the contract.
															</p>
															<h4>Article 1 Purpose</h4>
															<p class="tb1">
																The purpose of the precautions included in the terms of the auction or the related Auction Catalogue is to stipulate the following:<br>
																1.1 Procedures and all standards of the online auction conducted by Seoul Auction on Seoul Auction’s website (www.seoulauction.com) and the rights and obligations of the related persons;<br>
																1.2 Procedures and all standards of the purchase contract pursuant to methods other than the auctions conducted by Seoul Auction on Seoul Auction’s website (www.seoulauction.com)and the rights and obligations of the related persons
															</p>
															<h4>Article 2 Definitions</h4>
															<p class="tb1">
																2.1 "Auction" means an online auction conducted by Seoul Auction from time to time in accordance with these Auction Terms, the Auction Catalogues and/or elsewhere.<br>
																2.2 “Purchase Contract Pusuant to Methods Other than the Auction” means a general purchase contract (hereinafter referred to as the “General Purchase Contract”) executed by Seoul Auction pursuant to these terms and/or Auction Catalogue.<br>
																2.3 "Object" means all goods or rights in any form that may be subjected to an Auction or General Purchase Contract, such as artwork, and "Lot" means all objects offered at the Auction by Seoul Auction or subjected to a sale pre or post the Auction.<br>
																2.4 "Auction Catalogue" means, in relation to an Auction, the catalogue (including e-catalogue) published by Seoul Auction containing descriptions and information on the Lots scheduled to be sold at such Auction. "Auction Catalogue and/or elsewhere" means but not restricted to, every material produced by Seoul auction (including, but not limited to, materials on the Seoul Auction official website, e-mail, SMS, smartphone application, listbook, brochure, condition report, Lot recommendation, research study, screen display at Auction, marketing and promotional printouts).<br>
																2.5 “Auction Closing Date” means, in relation to an Auction, the date on which the Auction Period of the Lot(s) shall end. “Auction Closing Time” means, in relation to an Auction, the time at which the Auction Period of each Lot is scheduled to end. “Final Auction Closing Time” means, in relation to an Auction, the actual time at which the Auction Period of each Lot has ended.<br>
																2.6 "Auction Period" means, in relation to an Auction, the date(s) on which such Auction is held.<br>
																2.7 "Bidder" means, in relation to an Auction, any person who has applied to Seoul Auction to place bids in such Auction and accepted by Seoul Auction or, if applicable, has received written confirmation of such application from Seoul Auction in accordance with these Auction Terms, the Auction Catalogues and/or elsewhere.<br>
																2.8 "Business Day" means a calendar day which is not a Saturday, a Sunday or a public holiday in Korea.<br>
																2.9 "Buyer" means, with respect to any Lot, the Bidder who is declared by the auctioneer to be the Bidder who has made the highest bid for such Lot in accordance with these Auction Terms.<br>
																2.10 "Buyer Withdrawal Fee" means, with respect to any Lot, the charge to be imposed upon cancellation of a winning bid, at an amount equal to 30% of the Hammer Price of the relevant Lot and payable by the Buyer to Seoul Auction.<br>
																2.11 "Buyer's Expenses" means, with respect to any Lot, any taxes, costs, charges or expenses including, but not limited to, any currency conversion costs, storage charges, packaging, delivery and transit insurance costs, incurred by any of Seoul Auction, its directors, officers, employees and/or agents in connection with the sale of such Lot pursuant to these Auction Terms, the Auction Catalogues and/or elsewhere and payable by the Buyer to Seoul Auction.<br>
																2.12 "Buyer's Premium" means, with respect to any Lot, the premium payable by the Buyer to Seoul Auction in accordance with these Auction Terms in connection with the Consignment Agreement and such Lot.<br>
																2.13 "Consignor" means, with respect to any Lot, the person who has consigned such Lot to Seoul Auction to be sold at an Auction by entering into a consignment agreement with Seoul Auction prior to the start date of such Auction.<br>
																2.14 "Estimated Price" means, with respect to any Lot, the estimated value of such Lot, determined by Seoul Auction at its sole and absolute discretion as is delegated, as reflects the nature of sale through auction, to it.<br>
																2.15 “Hammer Price" means, with respect to any Lot, the sale price of such Lot, being the amount equal to the highest bid accepted by the auctioneer by striking his/her hammer and calling the paddle number of the relevant Bidder in accordance with these Auction Terms.<br>
																2.16 "Purchase Price" means, with respect to any Lot, an amount equal to the sum of the Hammer Price and the Buyer's Premium of such Lot.<br>
																2.17 "Reserve Price" means, with respect to any Lot, the minimum selling price of such Lot agreed in writing between the Seller and Seoul Auction (if the Consignor is the Seller), or determined by Seoul Auction (if Seoul Auction is the Seller), as the case may be, prior to the sale of such Lot.<br>
																2.18 "Seller" means, with respect to any Lot, the counterparty to the contract of sale of such Lot, which shall be Seoul Auction or the Consignor.<br>
																2.19 “Puprchaser” means a person who has purchased or is intending to purchase an Object through a General Purchase Contract with Seoul Auction.<br>
																2.20 Affiliate" means Seoul Auction and/or its holding company, office, subsidiary or a corporate entity controlled by or is under a common control with Seoul Auction.<br>
																2.21 "Online Bidding" means, with respect to an Auction, online bids accepted by Seoul Auction’s website or any computer network provided by Seoul Auction.
															</p>
															<h4>Article 3 Seoul Auction as an Agent or as the Seller</h4>
															<p class="tb1">
																Except with respect to any Lot of which Seoul Auction is the Seller, Seoul Auction shall act as an agent of the Consignor (being the Seller) in selling the Consignor's Lot in an Auction. The contract for such a Lot shall be made between the Seller and the Buyer.
															</p>
															<h4>Article 4 Previews</h4>
															<p class="tb1">
																4.1 Seoul Auction shall hold preview(s) of the Lots scheduled to be sold at an Auction, offered for sale after the Auction or offered for sale continuously and irrespective of the Auction Period(s). Such preview(s) shall be open to the public and free of charge, provided however, that Seoul Auction may, at its sole and absolute discretion as is delegated, as reflects the nature of the sale through an Auction, to it, require proof of identity satisfactory to it prior to admitting any person to any preview and/or refuse admission of any person to any preview.<br>
																4.2 Seoul Auction may give notice of the place, date, time and duration of any preview in the relevant Auction Catalogue and/or elsewhere. Seoul Auction may, at its sole and absolute discretion as is delegated, as reflects the nature of the sale through an Auction, to it, cancel or change the place, date, time and/or duration of any preview without prior notice. Seoul Auction may, at its sole and absolute discretion as is delegated, as reflects the nature of the sale through an Auction, to it, determine not to sell any Lot exhibited at a preview in the relevant Auction or in any other Auction.
															</p>
															<h4>Article 5 Bidder Registration</h4>
															<p class="tb1">
																Unless otherwise agreed to in writing with Seoul Auction prior to the start date of the relevant Auction Period, prospective Bidders, including first-time prospective Bidders, shall register and/or apply to place bids in an Auction by completing and sending to Seoul Auction the relevant registration form and any supplementary document specified in such registration form and/or requested by Seoul Auction in accordance with the Auction Catalogues and/or elsewhere. Registration of the prospective Bidders and application to place bids in person, in writing, by telephone, or by online live-bidding (hereinafter referred to as "Each Bid") shall be conducted as prescribed in the relevant Auction Catalogues and/or elsewhere. However, if a possessor of a mobile phone registered to a domestic mobile carrier has completed mobile phone identity verification with a domestic mobile carrier through a Seoul Auction’s Online Auction System, he/she will be considered as having applied to register as a prospective Bidder. Seoul Auction shall use reasonable efforts to process any registration and/or any application to place each bid. However, as reflects the nature of the sale through an Auction, the prospective Bidders shall agree that Seoul Auction shall not be held responsible or liable for any failure or delay in processing such registration and/or application, or for any error and/or omission by Seoul Auction, its directors, officers, employees and/or agents in processing such registration and/or application, howsoever caused.
															</p>
															<h4>Article 3 Estimated Price</h4>
															<p class="tb1">
																6.1 Seoul Auction may provide a low Estimated Price and/or a high Estimated Price for each Lot in Korean Won, US Dollar, Hong Kong Dollar and/or Chinese Yuan in the relevant Auction Catalogue and/or elsewhere during the relevant Auction Period. Seoul Auction may, at its sole and absolute discretion as is delegated, as reflects the nature of the sale through an Auction, to it, change at any time before and up to the time of the sale of any Lot the Estimated Price(s) of such Lot without prior notice. The Estimated Price(s) shall not include the Buyer's Premium and/or any Buyer's Expenses payable by the Buyer to Seoul Auction. The Estimated Price(s) provided by Seoul Auction are for reference only and shall not serve as definitive indicators of the market value or the Hammer Price of the relevant Lot. Seoul Auction shall not be held responsible or liable by the Bidder for any Estimated Price being quoted in public.<br>
																6.2 Except as otherwise expressly provided in these Auction Terms, the Auction Catalogues and/or elsewhere, the Estimated Price shown in US Dollar, Hong Kong Dollar and/or Chinese Yuan in any Auction Catalogue and/or elsewhere shall be for reference only and all bids and payments shall be in Korean Won. With respect to the Estimated Price provided in an Auction Catalogue, the relevant Auction Catalogue and/or elsewhere shall contain the exchange rates used in converting the Estimated Price expressed in Korean Won into US Dollar, Hong Kong Dollar or Chinese Yuan. Such exchange rates shall be the most recently obtained on a practicable date prior to the printing of the relevant Auction Catalogue and may have changed thereafter. No representation is made that any of the US Dollar, Hong Kong Dollar or Chinese Yuan amounts shown in any Auction Catalogue and/or elsewhere could have been or could be converted into Korean Won (or vice versa) at the specified rates, at any particular rates or at all. The exchange rates provided by Seoul Auction in the Auction Catalogues and/or elsewhere are for reference only, and the prospective Bidders shall be responsible for calculating the precise exchange rates. Seoul Auction shall not be responsible for any error or omission, howsoever caused, arising from or in connection with, conversion of the Estimated Price expressed in Korean Won into US Dollar, Hong Kong Dollar or Chinese Yuan.
															</p>
															<h4>Article 7 Conducting the Auction and Conclusion of the Sale of a Lot</h4>
															<p class="tb1">
																7.1 Seoul Auction may give notice of the scheduled date, time, duration and place of an Auction in the relevant Auction Catalogue and/or elsewhere, provided however, that Seoul Auction may, at its sole and absolute discretion as is delegated, as reflects the nature of sale through auction, to it, cancel or change the Auction Period, Auction Closing Date, Auction Closing Time and/or place of, any Auction at any time without prior notice.<br>
																7.2 Seoul Auction may, at its sole and absolute discretion as is delegated, as reflects the nature of sale through auction, to it, refuse participation of any person in any Auction and/or reject any bid placed in any Auction.<br>
																7.3 The Auction shall proceed in the order of the Lot numbers listed in the Auction Catalogue, and the bidding increments and Auction Closing Time of the relevant Lot shall be displayed on the bidding web page of such Lot. Each Lot shall be sold subject to the Reserve Price of such Lot and Seoul Auction shall not accept any bids below such Reserve Price in principle. Seoul Auction shall keep the Reserve Price confidential. The Reserve Price of each Lot shall not exceed the low Estimate Price on the date of the sale of such Lot.<br>
																7.4 A Bidder may place bids subject to and in accordance with, these Auction Terms and/or the Important Notices. All Bids placed may be recorded or documented and Bidders shall be deemed to have consented to the recording and documentation of their conversations by placing bids.<br>
																7.5 Provided that the following shall be subject to Clauses 7.6 and 7.7: in relation to any Auction taking place on Seoul Auction’s website, the Bidder shall bid by selecting a desired Bid amount and clicking on the “Bid” or “Automatic Bid” button on the bidding web page of the relevant Lot prior to the Final Auction Closing Time of such Lot.<br>
																7.6 With respect to a Lot, Seoul Auction shall use reasonable endeavours to receive the aforementioned bids. However, as reflects the nature of sale through auction, prospective Bidders agree that Seoul Auction shall not be held responsible or liable for any failure or delay in receiving such bids, or for any error and/or omission by Seoul Auction, its directors, officers, employees and/or agents in receiving such bid, howsoever caused.<br>
																7.7 If, with respect to a Lot, any bid is received by Seoul Auction in accordance with these Auction Terms and/or the Important Notices, Seoul Auction shall use reasonable endeavours to place such bid. However, as reflects the nature of sale through auction, Seoul Auction shall not be held responsible or liable for any failure or delay in doing so, or for any error and/or omission by Seoul Auction, its directors, officers, employees and/or agents in placing such bid, howsoever caused.<br>
																7.8 With respect to a Lot, if two or more Automatic Bids have the same bid price and are the highest bid, the Bidder of the Automatic Bid first received by Seoul Auction will be declared the Buyer of such Lot.<br>
																7.9 Seoul Auction may, at its sole and absolute discretion as is delegated, as reflects the nature of sale through auction, to it, (i) withdraw any Lot at any time before the scheduled Auction Closing Date or Auction Closing Time without prior notice; (ii) combine any two or more Lots without prior notice; (iii) re-commence during the relevant Auction Period without prior notice, the auction of any Lot which was previously offered for sale but not sold during such Auction Period; (iv) in the event of any error arising in relation to, or any dispute among the Bidders over the validity of, bids placed with respect to a Lot, determine the Buyer of, continue the bidding process of, cancel the Auction of and/or recommence the Auction of, such Lot; and/or (v) in the event that any dispute over the authenticity of any Object, or the validity of the sale of any Object, has arisen or may, in Seoul Auction's sole opinion, arise, refuse to place such Object in an Auction, discontinue the bidding process and/or cancel the sale. In the event that the bidding process or the sale of a Lot is discontinued or cancelled in accordance with Clause 7.9, the Buyer's sole and exclusive remedy against Seoul Auction and/or the Seller, as the case may be, shall be the refund of the Purchase Price if said Purchase Price has already been paid by the Buyer for such Lot. Neither Seoul Auction nor the Seller shall be liable for any special, indirect or consequential loss including, but not limited to, loss of profits or loss of interest. For the avoidance of doubt, Seoul Auction shall not be liable to pay any interest or indemnify any loss incurred as a result of any foreign exchange rate fluctuation or otherwise.<br>
																7.10 Without prejudice to Clause 7.2, the contract between the Seller and the Buyer for any Lot shall be considered formed immediately upon confirmation by Seoul Auction of the highest bid as the Hammer Price of the relevant Lot at the Final Auction Closing Time of such Lot in relation to any Auction taking place on Seoul Auction’s website. Failure by the Buyer of such Lot to expressly communicate any objection immediately upon receiving the Successful Bid Confirmation form in person or by electronic means (including but not limited to social networking service platforms, etc) will be considered an acceptance of and agreement with the terms of the Successful Bid Confirmation form.<br>
																7.11 Risk associated with, and responsibility for, a Lot will pass to the Buyer from the earlier of (i) the expiration of seven calendar days from, but not including, the date of the sale of such Lot, and (ii) the date of collection of such Lot by the Buyer. Title to the Lot, however, will not pass to the Buyer until all amounts payable by the Buyer to Seoul Auction (for itself and/or on behalf of the Consignor) under these Auction Terms and/or the Important Notices have been received by Seoul Auction in good cleared funds.<br>
																7.12 Except as expressly provided in Clause 7.3, a Consignor shall not, directly or indirectly, place bids on his/her Lots in an Auction.
															</p>
															<h4>Article 8 Marketing Materials</h4>
															<p class="tb1">
																The copyright in all images, illustrations and/or written material produced by or for Seoul Auction relating to any Lot, including the contents of any Auction Catalogue and/or elsewhere, shall be and shall remain at all times the property of Seoul Auction and shall not be used by the Buyer, nor by any other person, at any time without Seoul Auction's prior written consent. Neither Seoul Auction nor the Seller makes any representation or warranty that the Buyer of a Lot will acquire any copyright or other reproduction rights in it.
															</p>
															<h4>Article 9 Buyer's Premium</h4>
															<p class="tb1">
																9.1 With respect to any Lot, the Buyer's Premium shall be 18% (excluding VAT) of the Hammer Price. However, Seoul Auction may adjust the rate of the Buyer’s Premium with a prior notice in the website or the Auction Catalogue and/or elsewhere depending on the nature of the Lot.<br>
																9.2 If any Buyer’s Expenses should arise, the Buyer shall pay the Buyer’s Expenses in addition to the Buyer’s Premium to Seoul Auction.<br>
																9.3 The seller’s commission shall adhere to the terms of the Consignment Agreement. If no formal Consignment Agreement has been executed, the seller’s commission shall be 10% (excluding VAT) of the Hammer Price, and all expenses listed in these Auction Terms shall be considered as agreed to and accepted by the Consignor.<br>
																9.4 The Consignor shall accept that certain Lots may be subject to VAT, income tax and/or all other applicable taxes as stipulated by the relevant taxation laws (hereafter referred to as the "Applicable Taxes") and shall agree to pay the Applicable Taxes and/or to allow Seoul Auction to withhold and pay the Applicable Taxes on behalf of the Consignor to relevant authorities. However, final responsibility regarding the payment of the Applicable Taxes shall rest with the Buyer or the Consignor, and the Consignor shall be responsible for reviewing the existence and scope of all relevant taxation laws and for paying Applicable Taxes.<br>
																9.5 The Consignor shall be responsible to verify the issuance of the tax invoice or the cash payment receipt for the Hammer Price of the Lot. Seoul Auction shall not be responsible or liable for any and all consequences resulting from failure on the part of the Bidder to confirm the possibility of the issuance of tax receipts and/or cash receipts prior to placing a bid, and said consequences shall under no circumstances enable the Buyer to cancel or withdraw a winning bid.
															</p>
															<h4>Article 10 Payments of the Purchase Price and Delivery of Lots</h4>
															<p class="tb1">
																10.1 Seoul Auction shall provide to the Buyer, directly or through an electronic communications network (e-mail, text message, sns, etc.) an invoice indicating the Hammer Price, the Buyer’s Premium and all Buyer’s Expenses due from the Buyer to Seoul Auction pursuant to the list of the Lots, these Auction Terms and the Auction Catalogues and/or elsewhere on the date of the purchase or as soon as possible from the purchase date.<br>
																10.2 With respect to Lot(s) purchased by the Buyer, the Buyer shall pay to Seoul Auction (for itself and/ or on behalf of the Consignor) in accordance with these Auction Terms, the Auction Catalogues and/or elsewhere. The ownership of the artwork shall not transfer until Seoul Auction receives full amount of each of the following:<br>
																10.2.1 the full invoiced amount; and<br>
																10.2.2 any other Buyer's Expenses incurred after the invoice(s) has/have been sent to the Buyer, with all payments to be completed in full within seven calendar days (or within 21 days from the date of the sale of the Lot(s) if the Hammer Price is over 300 million KRW; provided however, 30% of the Purchase Price is paid to Seoul Auction within 7 calendar days from the date of the sale) from, but not including, the date of the sale of the Lot(s). If the Buyer has not remitted all aforementioned payments in full to Seoul Auction by the payment deadline, interest shall be charged at a rate of up to 2% per month on the unpaid amount due up to and including the date of payment. However, Seoul Auction may, at its discretion, waive the interest amount in part or in full, and Seoul Auction and the Buyer may, prior to the sale of the relevant Lot, agree in writing for the Purchase Price of such Lot to be paid in installments.<br>
																10.3 Unless otherwise agreed in writing between the Buyer and Seoul Auction: (i) the Buyer shall be personally liable to pay to Seoul Auction (for itself and/or on behalf of the Consignor) in accordance with these Auction Terms, the Auction Catalogues and/or elsewhere the Purchase Price and/or any Buyer's Expenses payable by the Buyer with respect to any Lot; and (ii) Seoul Auction will not accept any payment due to it (for itself and/or on behalf of the Consignor) from any other party other than the relevant Buyer.<br>
																10.4 If, with respect to any Lot, Seoul Auction (for itself and/or on behalf of the Consignor) does not receive the full amounts payable by the Buyer under this Clause 10 within seven calendar days from, but not including, the date of the sale of such Lot, Seoul Auction may, at its sole and absolute discretion as is delegated,take any of the following measures unless agreed in writing between the Buyer and Seoul Auction:<br>
																10.4.1 cancel the sale of such Lot and charge the Buyer the Buyer Withdrawal Fee which shall be due and payable by the Buyer on demand;<br>
																10.4.2 put up such Lot for resale in another Auction at Seoul Auction;<br>
																10.4.3 disclose any personal information on the Buyer to the relevant Consignor to the extent necessary for that Consignor to claim against the Buyer;<br>
																10.4.4 set off against or pay any amounts which Seoul Auction or any of its Affiliates may owe or be owed by the Buyer in any other transactions, the outstanding amount remaining unpaid by the Buyer; and/or<br>
																10.4.5 take such other action as Seoul Auction deems necessary or appropriate, without prejudice to any other rights or remedies available to Seoul Auction by law.<br>
																10.5 The Buyer may cancel his/her purchase of any Lot within seven calendar days from the Sale date, if agreed previously by Seoul Auction in writing;<br>
																10.5.1 by giving written notice of cancellation to Seoul Auction; and<br>
																10.5.2 paying to Seoul Auction the Buyer Withdrawal Fee, within seven calendar days from, but not including, the date of the sale of such Lot. The sale will be cancelled immediately upon receipt by Seoul Auction of such written notice and the Buyer Withdrawal Fee.<br>
																10.6 Unless otherwise agreed in writing between Seoul Auction and the Buyer, Seoul Auction shall only release the Lot(s) purchased by the Buyer to the Buyer or its authorized representative in accordance with this Clause 10.6. The Buyer shall collect, or procure the collection of, the Lot(s) purchased by him/her at his/her risk and expense within seven calendar days from, but not including, the date of the sale of the Lot(s), provided however, that Seoul Auction shall not be obliged to release any Lot:<br>
																10.6.1 until full payment of all amounts payable by the Buyer to Seoul Auction pursuant to this Clause 10 is duly received by Seoul Auction; or<br>
																10.6.2 without being provided with proof of identity of the collector and (in the case of an authorized representative) proof of authorization, satisfactory to Seoul Auction.<br>
																10.7 If agreed in writing between the Buyer and Seoul Auction, Seoul Auction shall arrange packaging, delivery and transit insurance of the Lot(s) purchased by the Buyer at the Buyer's expense and risk. Seoul Auction shall not be responsible for any damage to, or the loss of, such Lot during packaging and/or the transit period of such Lot, howsoever caused.<br>
																10.8 Seoul Auction shall keep the Lot(s) sold in an Auction at no charge until the expiry of seven calendar days from, but not including, the date of the sale of such Lot(s), after which the Lot(s) will be stored by Seoul Auction at the Buyer's risk. If the Buyer fails to collect any Lot within such time period regardless of whether such failure is caused by Seoul Auction's refusal to release such Lot due to not having received from the Buyer the full amounts due from the Buyer to Seoul Auction (for itself and/or on behalf of the Consignor) with respect to such Lot or not having received proof of identity and/or authorization pursuant to Clause 10.6, the Buyer shall pay to Seoul Auction the full amount of any and all costs including, but not limited to, the storage charge (calculated based on the storage charge per day of the storage facility operated by Seoul Auction) from the date of expiry of the aforementioned time period until the date of collection of such Lot(s) by the Buyer or his/her authorized representative, costs associated with transporting such Lot(s) to the storage facility, insurance fees and any and all other applicable fees. However, Seoul Auction may, at its discretion, waive the aforementioned amount in part or in full.<br>
																10.9 If any Lot is not collected by the Buyer or its authorized representative within 21 calendar days from, but not including, the date of the sale of such Lot for whatever reason, Seoul Auction shall not be liable for any damage to, or the loss of, such Lot(s), howsoever caused.
															</p>
															<h4>Article 11 Export and/or Import Licences</h4>
															<p class="tb1">
																The Buyer shall be responsible for obtaining any relevant export/import licences and/or permits (the "Licences") required for the export/import of the purchased Lot(s). Seoul Auction may, at the written request of the Buyer, introduce to Buyer a shipper to assist in obtaining the necessary Licences at the Buyer's expense and risk. Seoul Auction shall not be responsible whatsoever with respect to such introduction. Denial of the Licences and/or delay in obtaining the Licences with respect to any Lot shall not be a ground for the Buyer to cancel the sale of such Lot or refuse or delay payment of the full amounts payable by the Buyer to Seoul Auction (for itself and/or on behalf of the Consignor) pursuant to Clause 10.
															</p>
															<h4>Article 12 Sale After the Auction</h4>
															<p class="tb1">
																12.1 If any Lot (an "After Sale Lot") is not sold in an Auction because no bid matched or exceeded the Reserve Price at such Auction, Seoul Auction may take any of the following measures;
																12.1.1 receive bids in writing for such After Sale Lot subject to the relevant Reserve Price; and<br>
																12.1.2 accept the highest bid placed in accordance with this Clause 12, provided however, that Seoul Auction shall not be obliged to accept any bid if it deems, at its sole and absolute discretion as is delegated, as reflects the nature of sale through auction, to it, that the relevant Bidder has not provided all documents as may be requested by Seoul Auction pursuant to Clause 12.2 to its satisfaction.<br>
																12.2 A Bidder shall, when placing bids for any After Sale Lot, provide Seoul Auction with any supplementary document as may be requested by Seoul Auction in written notice within the time specified by Seoul Auction in such notice.<br>
																12.3 The Auction for any After Sale Lot shall be established on the date of the invoice from Seoul Auction to the Bidder notifying Seoul Auction's acceptance of his/her bid. The invoice will list the Lot(s) purchased by the Buyer, the Hammer Price, the Buyer's Premium and/or any Buyer's Expenses, due from the Buyer to Seoul Auction pursuant to the Lot purchased by the Buyer, the Auction Terms, the Auction Catalogue and/or elsewhere.<br>
																12.4 Clauses 1, 2, 3, 6, 7, 8, 9, 10, 11, 13, 14, 15, 16, 17, 18 and 19 of these Auction Terms and/or the relevant provisions in the Auction Catalogue and/or elsewhere shall apply with respect to the sale of any After Sale Lot in accordance with this Clause 12.
															</p>
															<h4>Article 13 No Representations, Warranties nor Liabilities</h4>
															<p class="tb1">
																13.1 A Bidder agrees and acknowledges that all statements with respect to any Lot including, but not limited to, statements on authorship, title, medium and/or size, contained in any Auction Catalogue and/or elsewhere in writing or made orally by any of Seoul Auction, its directors, officers, employees and/or agents and/or the Seller at any time, are statements of opinion and not statements of fact. Insofar as is permitted by law and except as otherwise expressly provided in this Clause 13, Clause 14 and/or Clause 15, all representations, warranties, conditions, guarantees and stipulations, express or implied, statutory, customary or otherwise with respect to any Lot are and shall be expressly excluded (including, but without limitation, warranties, conditions as to title, rights to dispose, quiet possession, freedom from encumbrances, merchantable or satisfactory quality, fitness for purpose, description, size, quality, attribution, authenticity, medium, provenance or whether such Lot is subject to copyright and/or whether the Consignor and/or the Buyer acquires copyright in such Lot).<br>
																13.2 Insofar as is permitted by law, the Lots shall be sold on an "as is" basis as at the time of sale of the Lots (whether or not the Buyers are in attendance in person at the Auction). Descriptions in the Auction Catalogue and/or elsewhere may on occasion make reference to particular defects or deficiencies of a Lot but the absence of any such description with respect to any Lot shall not mean that such Lot is without defects or deficiencies. The Bidder shall be responsible to conduct his/her own research and satisfying himself/herself of the conditions of the Lots, including, but not limited to, damages and/or restorations of the Lots and with respect to any entries provided in the Auction Catalogues and/or elsewhere. Seoul Auction shall only accept a bid from a Bidder with respect to a Lot on the assumption that the Bidder has satisfied himself/herself of the conditions of such Lot and with respect to any entries provided in the Auction Catalogues and/or elsewhere. Seoul Auction shall not be responsible for damaged frames, howsoever caused.<br>
																13.3 Insofar as is permitted by law and except as otherwise expressly provided in these Auction Terms, the Auction Catalogues and/or elsewhere, neither Seoul Auction nor the Seller shall be liable, with the exception of cases of willful misconduct or gross negligence, to any Bidder or Buyer for the following: 13.3.1 errors or omissions in information, whether oral or written, provided by any of Seoul Auction, its directors, officers, employees and/or agents and/or the Seller, howsoever caused; 13.3.2 acts or omissions by any of Seoul Auction, its directors, officers, employees and/or agents and/or the Seller in relation to the conduct of any Auction and/or for any matter relating to the sale of any Lot, howsoever caused.
															</p>
															<h4>Article 14 Limited Warranties</h4>
															<p class="tb1">
																14.1 Seoul Auction warrants that the headline printed in BOLD BLACK with respect to such Lot on the first line in the Auction Catalogue (the "Headline") (as may be amended by any saleroom notice displayed in the auction hall or Seoul Auction official website during the relevant Auction Period) is true and accurate as at the date of the sale of such Lot (hereinafter referred to as the “Limited Warranty”). Provided however, Seoul Auction my limit the warranties on some Headline after a prior notice provided in the Auction Catalogue or the Auction Catalogues and/or elsewhere.<br>
																14.2 Seoul Auction shall not be liable for breach of the Limited Warranty with respect to any Lot unless a claim letter (defined below) with respect to such Lot is given by the Buyer to Seoul Auction in accordance with this Clause 14 before the expiry of three years from, but not including, the date of the sale of such Lot (hereinafter referred to as the "Warranty Period").<br>
																14.3 Subject to Clause 14.2, any Buyer wishing to claim under the Limited Warranty with respect to any Lot shall (i) send to Seoul Auction a letter (hereinafter referred to as the "Claim Letter") stipulating the date of the sale of such Lot, the Lot number and the grounds for his/her claim under the Limited Warranty within three months from, but not including, the date on which he/she became aware of a possible/actual breach of the Limited Warranty; and (ii) return to Seoul Auction the relevant Lot in the same condition as at the time of the sale of such Lot.<br>
																14.4 In the event of a dispute between the Buyer and Seoul Auction with respect to the grounds of the Buyer's claim under the Limited Warranty, Seoul Auction may require the Buyer to obtain, at the Buyer's expense, written opinions of two experts in the field mutually acceptable to Seoul Auction and the Buyer. Seoul Auction shall not be bound by such written opinions provided by the Buyer and may seek additional advice from other experts in the field at its own cost.<br>
																14.5 The Buyer shall not be entitled to claim under the Limited Warranty with respect to any Lot if:<br>
																14.5.1 the relevant Headline corresponded to the generally accepted opinion of scholars or experts at the time of the sale of such Lot;<br>
																14.5.2 the Auction Catalogue description, saleroom notice or Seoul Auction official website indicated that there were possibilities of dissenting opinion(s) from scholar(s) or a group of experts on the relevant Headline; or<br>
																14.5.3 the breach of the Limited Warranty can be proved only by means of either a scientific process not generally accepted for use until after publication of the relevant Auction Catalogue or a process which at the date of publication of the relevant Auction Catalogue was unreasonably expensive or impractical or likely to have caused damage to the Lot.<br>
																14.6 In the case of a breach of the Limited Warranty with respect to a Lot, Seoul Auction shall cancel the sale of such Lot and refund to the Buyer the Purchase Price paid by the Buyer in relation to the Lot.<br>
																14.7 In the event of a breach of the Limited Warranty with respect to a Lot, the Buyer's sole and exclusive remedy against Seoul Auction and/or the Seller shall be the cancellation of the sale and refund of the Purchase Price paid by the Buyer for such Lot. Neither Seoul Auction nor the Seller shall be liable for any special, indirect, consequential loss including, but not limited to, loss of profits or interests. For avoidance of any doubt, Seoul Auction shall not be liable to pay any interest or indemnify any loss incurred as a result of any foreign exchange rate fluctuation or otherwise.<br>
																14.8 The Buyer shall not assign nor transfer the benefits of the Limited Warranty. Unless agreed in writing between Seoul Auction and the Buyer, only the Buyer of the relevant Lot, as shown on the invoice issued by Seoul Auction, shall be eligible to claim under the Limited Warranty, provided that such Buyer shall have remained the owner of the Lot without disposing of any interest to any third party.<br>
																14.9 In the event that Seoul Auction assumes, in the stead of the Consignor, the liability for a breach of the Limited Warranty or any other such liability, the Consignor shall return to Seoul Auction all monies received from Seoul Auction with respect to the relevant Lots and indemnify Seoul Auction for all other consequential losses.<br>
																14.10 In the event that Seoul Auction receives from the Consignor documentation regarding authenticity and/or appraisal and provides the Buyer with any of the aforementioned documentation, Seoul Auction shall warrant only that such documentation provided to the Buyer is identical to such documentation received from the Consignor. Seoul Auction makes no warranties regarding the authenticity or validity of any documentation received from the Consignor or the contents thereof.
															</p>
															<h4>15 Limited Liability</h4>
															<p class="tb1">
																15.1 Without prejudice to Clauses 13 and/or 14 above, a Bidder's or Buyer's sole and exclusive remedy to any claim made by it against Seoul Auction and/or the Seller arising out of, or in connections with these Auction Terms, the Auction Catalogues and/or elsewhere with respect to any Lot shall be damages up to the Purchase Price of such Lot. Neither Seoul Auction nor the Seller shall be liable for any special, indirect, consequential loss including, but not limited to, loss of profits or loss of interest. For avoidance of any doubt, Seoul Auction shall not be liable to pay any interest or indemnify any loss incurred as a result of any foreign exchange rate fluctuation or otherwise.<br>
																15.2 These Auction Terms in no part shall exclude or limit Seoul Auction's liability with respect to any fraud, death or personal injury arising out of, or in connection with, any action or inaction by any of Seoul Auction, its officers, employees and/or agents in relation to the conduct of any Auction and/or sale of Lots.<br>
															</p>
															<h4>Article 16 Amendments to the Auction Terms and the Auction Catalogue</h4>
															<p class="tb1">
																16.1 Seoul Auction may, at its discretion and at any time, amend the provisions of these Auction Terms. Any such amendments shall be posted on the first page of Seoul Auction’s official website at least seven calendar days prior to the effective date of any amendments relating to general terms, or at least thirty calendar days prior to the effective date of any amendments relating to key provisions or amendments disadvantageous to the client, and the relevant information shall be modified in the Auction Catalogue and/or elsewhere.<br>
																16.2 Seoul Auction may, at its discretion and at any time, amend any information in an Auction Catalogue and/or elsewhere including, but not limited to, the Auction Catalogue and/or elsewhere, and any such amendments shall be posted on Seoul Auction’s official website during the relevant Auction Period.
															</p>
															<h4>Article 17 Information Protection</h4>
															<p class="tb1">
																17.1 Prospective Bidders, Bidders and/or Buyers may be required to provide personal information in connection with placing bids for, and purchasing of, Lots at the Auction, and by agreeing to these Auction Terms, Consignors, Prospective Bidders, Bidders and/or Buyers agree to the collection and use of such personal information. All personal information may be used for the following purposes:<br>
																(i) all matters connected to the management and operation of Seoul Auction's business and the marketing and supply of Seoul Auction's services;<br>
																(ii) the transfer of such information to any place in and outside of Korea; and/or<br>
																(iii) any purpose relating to or in connection with compliance with any law, regulation, court order or order of a regulatory body.<br>
																17.2 All personal information shall be kept confidential, and Consignors, Prospective Bidders, Bidders and/or Buyers shall be deemed to have agreed. However, subject to the provisions of any applicable laws, the information may be disclosed to or used by any of the following companies or persons:<br>
																(i) Seoul Auction, its Affiliates and/or the Group;<br>
																(ii) any director, officer or employee of the Group, but only when carrying out the business of the Group;<br>
																(iii) any agent, contractor, third party service provider or other person authorised by the Group to provide administrative, telecommunications, computer or insurance, shipping or any other services to the Group in connection with the operation of its business;<br>
																(iv) credit reference agencies and, in the event of default, debt collection agencies;<br>
																(v) any other person under a duty of confidentiality to the Group; and/or<br>
																(vi) any person to whom the Group is under an obligation to make disclosure under the requirements of any law, regulation, court order or order of a regulatory body.<br>
																17.3 In general, and subject to certain exemptions, Prospective Bidders, Bidders and/or Buyers shall be entitled to claim the following measures:<br>
																(i) request access to his/her personal information, which shall be provided within 40 days;<br>
																(ii) request the correction or deletion of his/her personal information, which shall be made within 40 days; and/or<br>
																(iii) be given reasons if a request for access, correction or deletion is refused or unable to be complied with within 40 days.<br>
																17.4 Any request for access to and/or correction of Prospective Bidders, Bidders and/or Buyers' personal information, or for information regarding Seoul Auction's information protection policies and practices and the kinds of personal information held by Seoul Auction, shall be sent to Seoul Auction in accordance with Clause 18.6. Seoul Auction shall have the right to charge a reasonable fee for the processing of any request to access information.<br>
																17.5 If a Prospective Bidder, Bidder or Buyer is a corporate entity, Seoul Auction shall not use the personal information of such entity's data subjects for any purpose other than the purposes for which such entity notified its data subjects at the time of the collection of the information by such entity or a purpose directly related to that purpose (except where Seoul Auction has obtained the written consent of the data subject). The corporate prospective Bidder, Bidder or Buyer by signing the relevant registration form, confirms that (i) it has notified its data subjects that their personal information may be used for the purposes specified in Clause 17.1 and (ii) it agrees to indemnify Seoul Auction in relation to any loss or damage suffered by Seoul Auction as a result of its failure to notify its data subjects as set out in (i) above.
															</p>
															<h4>18. Application for the General Purchase Contract</h4>
															<p class="tb1">
																In case Seoul Auction is entrusted with an artwork to sell a Lot through General Purchase Contract or sells a Lot through a General Purchase Contract, the provisions of Clause 1 (Purpose), Clause 2 (Definitions), Clause 3 (Seoul Auction as an Agent or as the Seller), Clause 6 (Estimated Price), Clause 8 (Promotional Materials), Clause 9 (Buyer’s Premium), Clause 10 (Payment of the Purchase Price and Delivery of the Lot), Clause 11 (Export/ Import Licenses), Clause 13 (No Representations, Warranties and Responsibilities), Clause 14 (Limited Warranty), Clause 15 (Limited Liabilities), Clause 16 (Amendments to the Auction Terms and Auction Catalogues), Clause 17 (Information Protection), Clause 19 (Miscellaneous) and Clause 20 (Jurisdiction and Governing Laws) shall apply, unless otherwise agreed between the Consignor, Seller and Purchaser and not against the nature of the General Purchase Contract. In such a case, ‘Auction’ shall be ‘purchase contract,’ ‘Lot’ shall be ‘object of sales,’ ‘Auction Catalogue’ shall be ‘all documents in any form provided by Seoul Auction in relation to the concerned purchase contract (including but not limited to website, e-mail, text message, smart-phone application, listbook, brochure, condition report, proposal, research data, promotional material, advertisements, printouts, etc.), ’Bid’ and ‘successful Bid’ shall be ‘execution or establishment of a purchase contract,’ ‘Bidder’ and ‘Buyer’ shall be ‘Purchaser,’ ‘Bid Date’ shall be ‘purchase contract date,’ ‘Bid Price’ or ‘Bid Amount’ shall be ‘purchase price,’ ‘Bid Withdrawal Fee’ shall be ‘purchase contract withdrawal fee,’ and ‘Headline’ shall be ‘terms on the warranty.’
															</p>
															<h4>Article 19 Miscellaneous</h4>
															<p class="tb1">
																19.1 In the following case, Seoul Auction may occupy the Objects of the Consignor and Buyer under the management of Seoul Auction until the concerned time:<br>
																19.1.1 Until the Consignor or the Buyer makes full payment of the amount payable to Seoul Auction or its affiliated companies;<br>
																19.1.2 Until a reasonable time, in case Seoul Auction becomes aware of a person asserting ownership or other rights on the Lot or upon reasonable suspicion on the authenticity of the Lot;<br>
																19.1.3 Until a client verification and registration procedure is completed to a level satisfactory to Seoul Auction; and/or<br>
																19.1.4 Until the time necessary when Seoul Auction is deemed to retain the concerned Object pursuant to relevant laws or due to government investigation. In such a case, Seoul Auction may levy storage fee or insurance fee to the concerned Consignor or the Buyer or Seoul Auction may transfer the Object to a warehouse of a third party or Seoul Auction and levy transportation fee, storage fee and insurance fee.<br>
																19.2 In case the Consignor or the Buyer needs to pay a certain amount to Seoul Auction or its affiliated company, Seoul Auction may sell the Objects of the Consignor or the Buyer retained by Seoul Auction in a reasonable method under as determined by Seoul Auction.<br>
																19.3 The Consignor or the Buyer permits Seoul Auction or its affiliated company to use the amounts payable to the Consignor or the Buyer for the following:<br>
																19.3.1 Payment of the amount payable to Seoul Auction by the Consignor or the Buyer;<br>
																19.3.2 Payment of the amount payable to its affiliated company on behalf of the Consignor or the Buyer.<br>
																19.4 Any and all payments due under these Auction Terms, the Auction Catalogues and/or elsewhere shall be payable in Korean Won. If the Buyer and Seoul Auction agree in writing for the Buyer to pay any amount due to Seoul Auction (for itself and/or on behalf of the Consignor), or for Seoul Auction to pay any amount due to it, in any currency other than Korean Won, the Buyer shall be liable to pay any additional expenses including, but not limited to, bank commissions and/or charges incurred by Seoul Auction in converting the Korean Won into such other currency. Any currency conversion shall be determined by Seoul Auction based on the rate for Korean Won provided by Seoul Money Brokerage Service on the date of payment or the specific date determined by Seoul Auction and Seoul Auction's decision as to such rate shall be conclusive. For avoidance of any doubt, Seoul Auction shall not be liable to indemnify any loss incurred as a result of any foreign exchange rate fluctuation or otherwise.<br>
																19.5 Any and all payments under these Auction Terms, the Auction Catalogues and/or elsewhere shall be made in cash or equivalent, including electronic remittance, cashiers checks and/or bank money orders in good cleared funds and in accordance with the these Auction Terms, the Auction Catalogues and/or elsewhere. With respect to any payment under these Auction Terms, the Auction Catalogues and/or elsewhere, if the payment due date is not a Business Day, then the immediately following Business Day shall be deemed to be the payment due date.<br>
																19.6 If any part of these Auction Terms, the Auction Catalogues and/or elsewhere is found by any court to be invalid, illegal or unenforceable, that part may be discounted and the rest of these Auction Terms, the Auction Catalogues and/or elsewhere shall continue to be valid and enforceable to the fullest extent permitted by law.<br>
																19.7 All notices, requests, claims, demands and other communications to Seoul Auction under these Auction Terms, the Auction Catalogues and/or elsewhere shall be in Korean or English in writing and shall be given or made (and shall be deemed to have been duly given or made upon receipt) by delivery in person, by registered mail, by facsimile with receipt confirmed (followed by delivery of an original via registered mail), by email with receipt confirmed by Seoul Auction (followed by delivery of an original via registered mail) or by registered mail to Seoul Auction at the following address:<br>
																<br>
																Seoul Auction Co. Ltd.,<br>
																11, Pyeongchang 31-gil, Jongno-gu, Seoul, Korea<br>
																Tel +82 (0)2 395 0330<br>
																Fax +82 (0)2 395 0338<br>
																E: info@seoulauction.com<br>
																<br>
																Notices to Consignors, Bidders and Buyers shall be provided to the address specified in the relate registration form or through the electronic communications network (e-mail, text message, SNS, etc.) to the following address. The relevant person shall notify Seoul Auction, in writing, in case of any changes to the address or contact information. If the relevant person is negligent in providing the notice and Seoul Auction’s notice, etc. is not delivered, he/she shall not raise any objections when the delivery is deemed to have been made on the date the notice from Seoul Auction typically would have arrived.<br>
																<br>
																19.8 Time shall be of the essence of these Auction Terms, the Auction Catalogues and/or elsewhere both as regards any dates, times and periods mentioned and as regards any dates, times and periods which may be substituted for them in accordance with these Auction Terms or by agreement in writing between the parties.<br>
																19.9 No waiver by or on behalf of Seoul Auction of any requirement of or any rights under these Auction Terms, the Auction Catalogues and/or elsewhere shall release any other party(ies) from the full performance of its/their remaining obligations under these Auction Terms, the Auction Catalogues and/or elsewhere. No single or partial exercise of or failure or delay in exercising, on the part of Seoul Auction, any right, power or remedy under these Auction Terms, the Auction Catalogues and/or elsewhere or the granting of time by Seoul Auction shall prejudice, affect or restrict the rights, powers and remedies of Seoul Auction under these Auction Terms, the Auction Catalogues and/or elsewhere, nor shall any waiver by Seoul Auction of any breach of these Auction Terms, the Auction Catalogues and/or elsewhere operate as a waiver of or in relation to any subsequent or any continuing breach of these Auction Terms, the Auction Catalogues and/or elsewhere.<br>
																19.10 These Auction Terms, the Auction Catalogues and/or elsewhere as amended from time to time in accordance with these Auction Terms set out the entire agreement and understanding between the parties relating to the subject matter hereof to the exclusion of any terms implied by law which may be excluded by contract and supersedes any previous written or oral agreement between the parties in relation to the matters dealt with in these Auction Terms, the Auction Catalogues and/or elsewhere as amended from time to time in accordance with these Auction Terms. It is agreed that no party has been induced to enter into these Auction Terms, the Auction Catalogues and/or elsewhere by any representation, warranty or undertaking not expressly incorporated in.<br>
																19.11 In the case of any ambiguity or discrepancy between the English, Chinese and/or Korean version of these Auction Terms, the Korean version shall prevail.
															</p>
															<h4>Article 20 Jurisdiction and Governing Law</h4>
															<p class="tb1">
																These Auction Terms shall be governed by the laws of Korea. The Seoul Central District Court shall have exclusive jurisdiction to settle any disputes which may arise out of or in connection with these Auction Terms, the Auction Catalogues and/or elsewhere. All Consignors, Bidders and Buyers irrevocably consent to the service of process or any other documents in connection with proceedings in any court by facsimile transmission, delivery in person, delivery by mail or in any other manner permitted by Korean law, at the law of the place of service or the law of jurisdiction where proceedings are instituted, at the last address of the Consignors, Bidders or the Buyers known to Seoul Auction or any other usual address
															</p>

															<h4>3 Seoul Auction as agent or as the Seller</h4>
															<p class="tb1">
																Except in respect of any lot of which Seoul Auction is the Seller, Seoul Auction shall act as agent of
																the Consignor (being the Seller) in selling the Consignor’s lot in an Auction. The contract for the sale
																of a lot shall be made between the Seller and the Buyer.
															</p>

															<h4>4 Previews</h4>
															<p class="tb1">
																4.1 Seoul Auction will hold preview(s) of lots scheduled to be sold at an Auction which will be
																open to the public and free of charge, provided however, that Seoul Auction may, in its sole
																and absolute discretion, require proof of identity satisfactory to it before admitting any person
																to any preview and/or refuse admission of any person to any preview.<br>
																4.2 Seoul Auction will give notice of the place, date, time and duration of any preview on its
																website and/or in the relevant Auction Catalogue. Seoul Auction may, in its sole and absolute
																discretion, cancel, or change the place, date, time and/or duration of, any preview without prior
																notice. Seoul Auction may, in its sole and absolute discretion, determine not to sell any lot
																exhibited at a preview in the relevant Auction or any Auction at all.
															</p>

															<h4>5 Bidder registration</h4>
															<p class="tb1">
																Unless otherwise agreed in writing with Seoul Auction prior to the start date of the relevant Auction
																Period, prospective Bidders, including first-time prospective Bidders, shall register and/or apply to place
																bids in an Auction by completing and sending to Seoul Auction the relevant registration form and any
																supplementary document specified in such registration form and/or requested by Seoul Auction in
																accordance with the Important Notices. Registration of prospective Bidders and application to place
																bids in writing or by telephone will be conducted as prescribed in the relevant Important Notices.<br>
																Seoul Auction shall use reasonable endeavours to process any registration and/or any application to
																place bids, provided however, that Seoul Auction shall not be responsible for any failure to do so or
																delay in doing so, or for any error and/or omission by Seoul Auction, its directors, officers, employees
																and/or agents in processing such registration and/or application, howsoever caused.
															</p>

															<h4>6 Estimate Prices</h4>
															<p class="tb1">
																6.1 Seoul Auction will provide a lower Estimate Price and a higher Estimate Price for each lot
																in Hong Kong Dollars, US Dollars and Korean Won in the relevant Auction Catalogue, in
																its advertisements and other publications and/or during the relevant Auction Period. Seoul
																Auction may, in its sole and absolute discretion, change at any time before and up to the time
																of the sale of any lot the Estimate Prices of such lot without prior notice. Estimate Prices will
																not include the Buyer’s Premium and/or any Buyer’s Expenses payable by the Buyer to Seoul
																Auction. Estimate Prices provided by Seoul Auction will be for reference only and shall not be
																an indication of the value or the Hammer Price of the relevant lot. Seoul Auction shall not be
																responsible for any Estimate Price being quoted in the public.<br>
																6.2 Except as otherwise expressly provided in these Auction Terms and/or the Important
																Notices, the Estimate Prices shown in US Dollars and Korean Won, Chinese Yuan in any
																Auction Catalogue or elsewhere will be for reference only and all bids and payment shall
																be in Hong Kong Dollars. In respect of Estimate Prices provided in an Auction Catalogue,
																the relevant Important Notices will contain the rates of exchange used for converting the
																Estimate Prices expressed in Hong Kong Dollars into US Dollars and Korean Won, Chinese
																Yuan in such Auction Catalogue. Such rates of exchange will be obtained at the latest
																practicable date prior to the printing of the relevant Auction Catalogue and may change
																at any time thereafter. No representation is made that any of the US Dollar or the Korean
																Won, Chinese Yuan amounts shown in any Auction Catalogue and/or elsewhere could have
																been or could be converted into Hong Kong Dollars (or vice versa) at the specified rates, at
																any particular rates or at all. Seoul Auction shall not be responsible for any error or omission,
																however caused, arising from, or in connection with, conversion of Estimate Prices expressed
																in Hong Kong Dollars into US Dollars and Korean Won, Chinese Yuan.
															</p>

															<h4>7 Conduct of Auction and conclusion of the sale of a lot</h4>
															<p class="tb1">
																7.1 Seoul Auction will give notice of the scheduled date, time, duration and place of an Auction
																on its website and/or in the relevant Auction Catalogue, provided however, that Seoul Auction
																may, in its sole and absolute discretion, cancel, or change the date, time, duration and/or place
																of, any Auction at any time before the scheduled start date of such Auction without prior
																notice.<br>
																7.2 Each of Seoul Auction and the auctioneer may, in its sole and absolute discretion, refuse
																admission of any person to any Auction and/or reject any bid (whether made in person, in
																writing or by telephone) placed in any Auction.<br>
																7.3 Each lot shall be sold subject to the Reserve Price of such lot and the auctioneer shall not accept
																any bid below such Reserve Price. The auctioneer shall keep the Reserve Price confidential. The
																Reserve Price of any lot shall not exceed the lower Estimate Price of such lot as at the date
																of the sale. The auctioneer may place bids on behalf of the Seller below the Reserve Price by
																either placing consecutive bids or entering bids in response to bids placed in person, in writing
																or by telephone (as the case may be). The auctioneer may, in its sole and absolute discretion,
																start the bidding of any lot below the Reserve Price of such lot. The auctioneer shall not place
																any bid on behalf of the Seller at or above the Reserve Price. The auctioneer shall not be
																obliged to specifically identify bids placed on behalf of the Seller.<br>
																7.4 A Bidder may place bids in person, in writing or by telephone, subject to, and in accordance with,
																these Auction Terms and the Important Notices. Bids placed by telephone may be recorded
																and Bidders shall be deemed to have consented to the recording of their conversations by
																placing bids by telephone.<br>
																7.5 Subject to Clauses 7.6 and 7.7:<br>
																7.5.1 in the case of bids placed in person, the Bidder shall place his/her bid by raising his/her
																paddle after the auctioneer’s call in the auction hall;<br>
																7.5.2 in the case of written bids, the auctioneer will call out such bids in the auction hall before
																commencing to receive bids placed in person or by telephone; and/or<br>
																7.5.3 in the case of bids placed by telephone, Seoul Auction’s staff will place bids on behalf of
																the Bidder in the auction hall.<br>
																7.6 In respect of a lot, Seoul Auction shall use reasonable endeavours to receive any written bid
																or telephone bid, provided however, that Seoul Auction shall not be responsible for any failure
																to do so or delay in doing so, or for any error and/or omission by Seoul Auction, its directors,
																officers, employees and/or agents in receiving such bid, howsoever caused.<br>
																7.7 If, in respect of a lot, any written bid or telephone bid is received by Seoul Auction in
																accordance with these Auction Terms and the Important Notices, Seoul Auction shall use
																reasonable endeavours to place such bid, provided however, that Seoul Auction shall not be
																responsible for any failure to do so or delay in doing so, or for any error and/or omission by
																Seoul Auction, its directors, officers, employees and/or agents in placing such bid, howsoever
																caused.<br>
																7.8 In respect of a lot, if a written bid and a bid in person, or a written bid and a bid by telephone,
																have the same bid price, the Bidder who placed the written bid will be declared to be the
																Buyer subject to, and in accordance with, these Auction Terms. If two written bids for a lot
																have the same bid price, the Bidder of the written bid first received by Seoul Auction will be
																declared the Buyer subject to, and in accordance with, these Auction Terms.<br>
																7.9 Seoul Auction may, in its sole and absolute discretion,
																(i) withdraw any lot at any time before the scheduled time of sale of such lot without prior
																notice;<br>
																(ii) combine any two or more lots without prior notice;<br>
																(iii) re-commence during the relevant Auction Period, the auction of any lot which was
																previously put up for sale during such Auction Period but not sold without prior notice;<br>
																(iv) in the event of any error arising in relation to, or any dispute among the Bidders over the
																validity of, bids placed in respect of a lot, determine the Buyer of, continue the bidding
																process of, cancel the sale of, and/or put up for resale, such lot; and/or<br>
																(v) in the event that any dispute over the authenticity of any lot, or the validity of the sale of
																any lot, has arisen or may, in Seoul Auction’s sole opinion, arise, refuse to place such lot in
																an Auction, discontinue the bidding process and/or cancel the sale.<br>
																In the event that the bidding process or the sale of a lot is discontinued or cancelled in accordance
																with this Clause 7.9, the Buyer’s sole and exclusive remedy against Seoul Auction and/or the Seller,
																as the case may be, shall be the refund of the Purchase Price paid by the Buyer for such lot (if any).
																Neither Seoul Auction nor the Seller shall be liable for any special, indirect or consequential loss
																including, but not limited to, loss of profits or loss of interest. For the avoidance of doubt, Seoul
																Auction shall not be liable to pay any interest or indemnify any loss incurred as a result of any foreign
																exchange rate fluctuation or otherwise.<br>
																7.10 Without prejudice to Clause 7.2, the sale of any lot between the Seller and the Buyer shall
																occur immediately upon the auctioneer accepting the highest bid by striking his/her hammer
																and calling out the paddle number of the relevant Bidder. The Buyer shall sign a Successful
																Bidding Confirmation confirming the purchase by him/her of a lot on the date of the sale of
																such lot (where the Buyer made his/her bid in person and is present in the auction hall on the
																date of the sale) or as soon as practicable (where the Buyer did not make his/her bid in person
																or is not present in the auction hall on the date of the sale).<br>
																7.11 Risk associated with, and responsibility for, a lot will pass to the Buyer from the earlier of (i) the
																expiration of seven calendar days from, but not including, the date of the sale of such lot, and
																(ii) the date of collection of such lot by the Buyer or its authorised representative. Title to the
																or<br>
																(for itself and/or on behalf of the Consignor) under these Auction Terms and/or the Important
																Notices have been received by Seoul Auction in good cleared funds.<br>
																7.12 Except as expressly provided in Clause 7.3, a Seller shall not, directly or indirectly, place bids on
																his/her lots in an Auction.
															</p>

															<h4>8 Marketing materials</h4>
															<p class="tb1">
																The copyright in all images, illustrations and/or written material produced by or for Seoul Auction
																relating to any lot, including the contents of any Auction Catalogue, shall be and shall remain at all
																times the property of Seoul Auction and shall not be used by the Buyer, nor by any other person,
																at any time without Seoul Auction’s prior written consent. Neither Seoul Auction nor the Seller
																makes any representation or warranty that the Buyer of a lot will acquire any copyright or other
																reproduction rights in it.
															</p>

															<h4>9 Buyer’s Premium</h4>
															<p class="tb1">
																9.1 In respect of any lot, the Buyer’s Premium shall be:
																The buyer’s premium is 18% of the Hammer Price.
																<br>
																9.2 The Buyer’s Premium shall be exclusive of any Buyer’s Expenses payable by the Buyer to Seoul
																Auction.
															</p>

															<h4>10 Payments of the Purchase Price and Delivery of lots</h4>
															<p class="tb1">
																10.1 Seoul Auction will provide to the Buyer an invoice or invoices of the amounts due from the
																Buyer to Seoul Auction (for itself and/or on behalf of the Consignor) under these Auction
																Terms and/or the Important Notices listing the lot(s) purchased by the Buyer in an Auction,
																the Hammer Price, the Buyer’s Premium and/or any Buyer’s Expenses:
																<br>
																(i) in person within 24 hours of the sale of the lot(s) (where the Buyer made his/her bid in
																person and is present in the auction hall on the date of the sale); or
																<br>
																(ii) by fax or by post to the billing address provided by the Buyer in his/her registration form
																within two Business Days from, but not including, the date of the sale of the lot(s) (where
																the Buyer did not make his/her bid in person or is not present in the auction hall on the
																date of the sale).
																<br>
																10.2 In respect of lot(s) purchased by the Buyer, the Buyer shall pay to Seoul Auction (for itself and/
																or on behalf of the Consignor) in accordance with these Auction Terms and the Important
																Notices:
																<br>
																10.2.1 the full invoiced amount; and
																<br>
																10.2.2 any other Buyer’s Expenses incurred after the invoice(s) has/have been sent to the
																Buyer,
																within seven calendar days (or within 21 calendar days if the Hammer Price is higher than or equal
																to HKD2,500,000, provided however, that the Buyer shall pay to Seoul Auction 30% of the Purchase
																Price within seven calendar days) from, but not including, the date of the sale of the lot(s). Seoul
																Auction and a Buyer may, prior to the sale of the relevant lot, agree in writing for the Purchase Price
																of such lot to be paid in instalments.
																<br>
																10.3 Unless otherwise agreed in writing between the Buyer and Seoul Auction:
																<br>
																(i) the Buyer shall be personally liable to pay to Seoul Auction (for itself and/or on behalf of
																the Consignor) in accordance with these Auction Terms and the Important Notices the
																Purchase Price and/or any Buyer’s Expenses payable by the Buyer in respect of any lot; and
																<br>
																(ii) Seoul Auction will not accept any payment due to it (for itself and/or on behalf of the
																Consignor) from any other party other than the relevant Buyer.
																<br>
																10.4 If, in respect of any lot, Seoul Auction (for itself and/or on behalf of the Consignor) does not
																receive the full amounts payable by the Buyer under this Clause 10 within seven calendar
																days from, but not including, the date of the sale of such lot, Seoul Auction may, in its sole and
																absolute discretion, and unless agreed in writing between the Buyer and Seoul Auction:
																<br>
																10.4.1 cancel the sale of such lot and charge the Buyer the Buyer Withdrawal Fee which shall
																be due and payable by the Buyer on demand;
																<br>
																10.4.2 put up for resale such lot in another Auction;
																<br>
																10.4.3 disclose any personal information on the Buyer to the relevant Consignor to the extent
																necessary for that Consignor to claim against the Buyer; and/or
																<br>
																10.4.4 take such other action as Seoul Auction deems necessary or appropriate,
																without prejudice to any other rights or remedies available to Seoul Auction by law.
																<br>
																10.5 The Buyer may cancel his/her purchase of any lot by:
																<br>
																10.5.1 giving written notice of cancellation to Seoul Auction; and
																<br>
																10.5.2 paying to Seoul Auction the Buyer Withdrawal Fee,
																within seven calendar days from, but not including, the date of the sale of such lot. The
																sale will be cancelled immediately upon receipt by Seoul Auction of such written notice
																and the Buyer Withdrawal Fee.
																<br>
																10.6 Unless otherwise agreed in writing between Seoul Auction and the Buyer, Seoul Auction will
																only release the lot(s) purchased by the Buyer to the Buyer or its authorised representative
																in accordance with this Clause 10.6. The Buyer shall collect, or procure the collection of, the
																lot(s) purchased by him/her at his/her risk and expense within seven calendar days from, but
																not including, the date of the sale of the lot(s), provided however, that Seoul Auction shall not
																be obliged to release any lot:
																<br>
																10.6.1 until full payment of all amounts payable by the Buyer to Seoul Auction (for itself and/or
																on behalf of the Consignor) pursuant to this Clause 10 is duly received by Seoul; and
																<br>
																10.6.2 without being provided with proof of identity of the collector and (in the case of an
																authorised representative) proof of authorisation, satisfactory to Seoul Auction.
																<br>
																10.7 If agreed in writing between the Buyer and Seoul Auction, Seoul Auction will arrange packaging,
																delivery and transit insurance of the lot(s) purchased by the Buyer at the Buyer’s expense and
																risk. Seoul Auction shall not be responsible for any damage to, or the loss of, such lot during
																packaging and/or the transit period of such lot, howsoever caused.
																<br>
																10.8 Seoul Auction will keep the lot(s) sold in an Auction at a designated logistic company’s
																warehouse at no charge exception to logistic handling charges and fee until the expiry of
																seven calendar days from, but not including, the date of the sale of such lot(s), after which the
																lot(s) will be stored at Seoul Auction’s warehouse at the Buyer’s risk. If the Buyer fails to collect
																any lot within such time period regardless of whether such failure is caused by Seoul Auction’s
																refusal to release such lot due to not having received from the Buyer the full amounts due from
																the Buyer to Seoul Auction (for itself and/or on behalf of the Consignor) in respect of such
																lot or not having received proof of identity and/or authorisation pursuant to Clause 10.6, the
																Buyer shall pay to Seoul Auction a daily storage charge of HKD50 per lot.
																<br>
																10.9 If any lot is not collected by the Buyer or its authorised representative within 21 calendar days
																from, but not including, the date of the sale of such lot for whatever reason, Seoul Auction shall
																not be liable for any damage to, or the loss of, such lot(s), howsoever caused.
															</p>

															<h4>11 Export and/or import licences</h4>
															<p class="tb1">
																The Buyer shall be responsible for obtaining any relevant export/import licences and/or permits (the
																“Licences”) required for the export/import of the purchased lot(s). Seoul Auction may, at the written
																request of the Buyer, introduce to Buyer a shipper to assist in obtaining the necessary Licences at the
																Buyer’s expense and risk. Seoul Auction does not accept any responsibility whatsoever in respect of
																such introduction. Denial of the Licences and/or delay in obtaining the Licences in respect of any lot
																shall not be a ground for the Buyer to cancel the sale of such lot or refuse or delay payment of the
																full amounts payable by the Buyer to Seoul Auction (for itself and/or on behalf of the Consignor)
																pursuant to Clause 10.
															</p>

															<h4>12 Sale after the Auction</h4>
															<p class="tb1">
																12.1 If any lot (an “After Sale Lot”) is not sold in an Auction because no bid matched or exceeded
																the Reserve Price at such Auction, Seoul Auction may, during the period commencing after the
																end date of the relevant Auction Period and ending 7 Business Days after the end date of such
																Auction Period:
																<br>
																12.1.1 receive bids in writing for such After Sale Lot subject to the relevant Reserve Price;
																and
																<br>
																12.1.2 accept the highest bid placed in accordance with this Clause 12,
																provided however, that Seoul Auction shall not be obliged to accept any bid if it deems, in its
																sole and absolute discretion, that the relevant Bidder has not provided all documents as may
																be required by Seoul Auction pursuant to Clause 12.2 to its satisfaction.
																<br>
																12.2 A Bidder shall, when placing bids for any After Sale Lot, send to Seoul Auction any supplementary
																document as may be requested by Seoul Action in written notice from time to time within the
																time specified by Seoul Auction in such notice.
																<br>
																12.3 The sale of any After Sale Lot shall occur on the date of the invoice from Seoul Auction to
																the Bidder notifying Seoul Auction’s acceptance of his/her bid. The invoice will list the lot(s)
																purchased by the Buyer, the Hammer Price, the Buyer’s Premium and/or any Buyer’s Expenses,
																due from the Buyer to Seoul Auction (for itself and/or on behalf of the Consignor).
																<br>
																12.4 Clauses 1, 2, 3, 6, 7.2, 7.3, 7.6 to 7.9, 7.11, 7.12, 8, 9, 10.2 to 10.9, 11, 13 to 19 of these Auction
																Terms and the relevant provisions in the Important Notices shall apply in respect of the sale
																of any After Sale Lot in accordance with this Clause 12 as applicable and with the necessary
																amendments.
															</p>

															<h4>13 No representations, warranties and liabilities</h4>
															<p class="tb1">
																13.1 A Bidder agrees and acknowledges that all statements in respect of any lot including, but
																not limited to, statements on authorship, title, medium and/or size, contained in any Auction
																Catalogue and/or elsewhere in writing or made orally by any of Seoul Auction, its directors,
																officers, employees and/or agents and/or the Seller at any time, are statements of opinion and
																not statements of fact. So far as is permitted by law and except as otherwise expressly provided
																in this Clause 13, Clause 14 and/or Clause 15, all representations, warranties, conditions,
																guarantees and stipulations, express or implied, statutory, customary or otherwise in respect
																of any lot are and shall be expressly excluded (including, but without limitation, warranties,
																conditions as to title, rights to dispose, quiet possession, freedom from encumbrances,
																merchantable or satisfactory quality, fitness for purpose, description, size, quality, attribution,
																authenticity, medium, provenance or whether such lot is subject to copyright and/or whether
																the Buyer acquires copyright in such lot).
																<br>
																13.2 So far as is permitted by law, the lots shall be sold on an “as is” basis as at the time of sale of the
																lots (whether or not the Buyers are in attendance in person at the Auction). Descriptions in
																the Auction Catalogues may on occasion make reference to particular defects or deficiencies
																of a lot but the absence of any such description in respect of any lot shall not mean that such
																lot is without defects or deficiencies. The Bidder shall be responsible for conducting his/her
																own research and satisfying himself/herself of the condition of the lots, including, but not limited
																to, damage and/or restoration of the lots and in respect of any entries provided in the Auction
																Catalogue or elsewhere. Seoul Auction will only accept a bid from a Bidder in respect of a lot
																on the assumption that the Bidder has satisfied himself/herself of the condition of such lot and
																in respect of any entries provided in the Auction Catalogue or elsewhere.
																<br>
																13.3 So far as is permitted by law and except as otherwise expressly provided in these Auction
																Terms and/or the Important Notices, neither Seoul Auction nor the Seller shall be liable to any
																Bidder or Buyer for:
																<br>
																13.3.1 errors or omissions in information, whether oral or written, provided by any of Seoul
																Auction, its directors, officers, employees and/or agents and/or the Seller, howsoever
																caused;
																<br>
																13.3.2 acts or omissions by any of Seoul Auction, its directors, officers, employees and/or
																agents and/or the Seller in relation to the conduct of any Auction and/or for any matter
																relating to the sale of any lot, howsoever caused.
															</p>

															<h4>14 Limited Warranty</h4>
															<p class="tb1">
																14.1 In respect of any lot, Seoul Auction warrants that the headline printed in BOLD BLACK in
																respect of such lot on the first line in the Auction Catalogue (the “Headline”) (as may be
																amended by any sale room notice displayed in the auction hall during the relevant Auction
																Period) is true and accurate as at the date of the sale of such lot (the “Limited Warranty”).
																<br>
																14.2 Seoul Auction shall not be liable for breach of the Limited Warranty in respect of any lot unless
																a Claim Letter (defined below) in respect of such lot is given by the Buyer to Seoul Auction
																in accordance with this Clause 14 before the expiry of three years from, but not including, the
																date of the sale of such lot (the “Warranty Period”).
																<br>
																14.3 Subject to Clause 14.2, any Buyer wishing to claim under the Limited Warranty in respect of
																any lot shall (i) send to Seoul Auction a letter (the “Claim Letter”) stipulating the date of the
																sale of such lot, the lot number and the grounds for his/her claim under the Limited Warranty
																within three months from, but not including, the date on which he/she became aware of a
																possible/actual breach of the Limited Warranty; and (ii) return to Seoul Auction the relevant
																lot in the same condition as at the time of the sale of such lot.
																<br>
																14.4 In the event that there is a dispute between the Buyer and Seoul Auction in respect of the
																grounds of the Buyer’s claim under the Limited Warranty, Seoul Auction may require the
																Buyer to obtain, at the Buyer’s expense, written opinions of two experts in the field mutually
																acceptable to Seoul Auction and the Buyer. Seoul Auction shall not be bound by such written
																opinions provided by the Buyer and may seek additional advice from other experts in the field
																at its own cost.
																<br>
																14.5 The Buyer shall not be entitled to claim under the Limited Warranty in respect of any lot if:
																<br>
																14.5.1 the relevant Headline corresponded to the generally accepted opinion of scholars or
																experts at the time of the sale of such lot;
																<br>
																14.5.2 the catalogue description or sale room notice indicated that there were possibilities of
																dissenting opinion(s) from scholar(s) or a group of experts on the relevant Headline;
																or 14.5.3 the breach of the Limited Warranty can be proved only by means of either a scientific
																<br>
																18.2 Any and all payments due under these Auction Terms and/or the Important Notices shall be
																Catalogue or a process which at the date of publication of the relevant Auction
																Catalogue was unreasonably expensive or impractical or likely to have caused damage
																to the lot.
																<br>
																14.6 In the case of a breach of the Limited Warranty in respect of a lot, Seoul Auction shall cancel
																the sale of such lot and refund to the Buyer the Purchase Price paid by the Buyer in relation to
																the lot.
																<br>
																14.7 In the event of a breach of the Limited Warranty in respect of a lot, the Buyer’s sole and
																exclusive remedy against Seoul Auction and/or the Seller shall be the cancellation of the sale
																and refund of the Purchase Price paid by the Buyer for such lot. Neither Seoul Auction nor the
																Seller shall be liable for any special, indirect, consequential loss including, but not limited to, loss
																of profits or loss of interest. For the avoidance of doubt, Seoul Auction shall not be liable to pay
																any interest or indemnify any loss incurred as a result of any foreign exchange rate fluctuation
																or otherwise.
																<br>
																14.8 The Buyer shall not assign or transfer the benefits of the Limited Warranty. Unless agreed in
																writing between Seoul Auction and the Buyer, only the Buyer of the relevant lot as shown on
																the invoice issued by Seoul Auction or his/her successor shall be eligible to claim under the
																Limited Warranty, provided that such Buyer or successor must have remained the owner of the
																lot without disposing of any interest in it to any third party.
															</p>

															<h4>15 Limited Liability</h4>
															<p class="tb1">
																15.1 Without prejudice to Clauses 13 and/or 14 above, a Bidder’s or Buyer’s sole and exclusive
																remedy to any claim made by it against Seoul Auction and/or the Seller arising out of, or in
																connections with these Auction Terms and/or the Important Notices in respect of any lot shall
																be damages up to the Purchase Price of such lot. Neither Seoul Auction nor the Seller shall
																be liable for any special, indirect, consequential loss including, but not limited to, loss of profits
																or loss of interest. For the avoidance of doubt, Seoul Auction shall not be liable to pay any
																interest or indemnify any loss incurred as a result of any foreign exchange rate fluctuation or
																otherwise.
																<br>
																15.2 Nothing under these Auction Terms shall exclude or limit Seoul Auction’s liability in respect of
																any fraud, death or personal injury arising out of, or in connection with, any action or inaction
																by any of Seoul Auction, its officers, employees and/or agents in relation to the conduct of any
																Auction and/or sale of lots.
															</p>

															<h4>16 Amendment to these Auction Terms and the Auction Catalogue</h4>
															<p class="tb1">
																16.1 Seoul Auction may, at any time, and in its sole and absolute discretion, amend the provisions
																of these Auction Terms and any such amendments shall be posted on the first page of Seoul
																Auction’s website for a period commencing seven calendar days prior to, and ending one
																calendar day prior to, the effective date of such amendments.
																<br>
																16.2 Seoul Auction may, at any time, and in its sole and absolute discretion, amend any information
																in an Auction Catalogue including, but not limited to, the Important Notices and any such
																amendments shall be posted in a sale room notice during the relevant Auction Period.
															</p>

															<h4>17 Data Protection</h4>
															<p class="tb1">
																17.1 Prospective Bidders, Bidders and/or Buyers may be required to supply personal data in
																connection with placing bids for, and purchasing of, lots an the Auction. All personal data
																may be used for the following purposes: (i) all matters connected to the management and
																operation of Seoul Auction’s business and the marketing and supply of Seoul Auction’s services;
																(ii) the transfer of such data to any place in and outside of Hong Kong; and/or (iii) any purpose
																relating to or in connection with compliance with any law, regulation, court order or order of
																a regulatory body.
																<br>
																17.2 All personal data will be kept confidential but, subject to the provision of any applicable law, may
																be disclosed to or used by any of the following companies or persons, whether in or outside
																of Hong Kong: (i) Seoul Auction and/or any of its branches, subsidiaries, holding company,
																associated companies or affiliates of, or companies controlled by, or under common control
																with, Seoul Auction (each an “Affiliate”) (together the “Group”); (ii) any director, officer or
																employee of the Group, but only when carrying out the business of the Group; (iii) any agent,
																contractor, third party service provider or other person authorised by the Group to provide
																administrative, telecommunications, computer or insurance, shipping, or any other services
																to the Group in connection with the operation of its business; (iv) credit reference agencies
																and, in the event of default, debt collection agencies; (v) any other person under a duty of
																confidentiality to the Group; and/or (vi) any person to whom the Group is under an obligation
																to make disclosure under the requirements of any law, regulation, court order or order of a
																regulatory body.
																<br>
																17.3 In general, and subject to certain exemptions, prospective Bidders, Bidders and/or Buyers shall
																be entitled to: (i) request access to his/her personal data, which shall be provided within 40
																days; (ii) request the correction of his/her personal data, which shall be made within 40 days;
																and/or (iii) be given reasons if a request for access or correction is refused or unable to be
																complied with within 40 days.
																<br>
																17.4 Any request for access to and/or correction of prospective Bidders, Bidders and/or Buyers’
																personal data, or for information regarding Seoul Auction’s data protection policies and
																practices and the kinds of personal data Seoul Auction hold, shall be sent to Seoul Auction in
																accordance with Clause 18.6. Seoul Auction will have the right to charge a reasonable fee for
																the processing of any data access request.
																<br>
																17.5 If a prospective Bidder, Bidder or Buyer is a corporate entity, Seoul Auction shall not use the
																personal data of such entity’s data subjects for any purpose other than the purposes for which
																such entity notified its data subjects at the time of the collection of the data by such entity
																or a purpose directly related to that purpose (except where Seoul Auction has obtained the
																written consent of the data subject). The corporate prospective Bidder, Bidder or Buyer by
																signing the relevant registration form, confirms that (i) it has notified its data subjects that
																their personal data may be used for the purposes specified in Clause 17.1; and (ii) it agrees to
																indemnify Seoul Auction in relation to any loss or damage suffered by Seoul Auction as a result
																of its failure to notify its data subjects as set out in (i) above.
															</p>

															<h4>18 Miscellaneous</h4>
															<p class="tb1">
																18.1 In the case of any failure by the Buyer to pay to Seoul Auction any amount due to it (for itself
																or on behalf of the Consignor) by the relevant due date, an interest of up to 2% per month (as
																determined from time to time by Seoul Auction in its sole and absolute discretion) shall accrue
																to the default amount on a daily basis from, but excluding, the date such payment is due to, and
																including, the date of actual payment of the default amount and any interest accrued.
																<br>
																18.2 Any and all payments due under these Auction Terms and/or the Important Notices shall be
																payable in Hong Kong Dollars. If the Buyer and Seoul Auction agrees in writing for the Buyer
																Bidders or the Buyers known to Seoul Auction or any other usual address.
																Seoul Auction to pay any amount due to it, in any currency other than Hong Kong Dollars, the
																Buyer shall be liable to pay any currency costs including, but not limited to, bank commissions
																and/or charges incurred by Seoul Auction in converting the Hong Kong Dollar amounts into
																such other currency. Any currency conversion shall be made using the rate for Hong Kong
																Dollars quoted to Seoul Auction by The Hongkong Shanghai Banking Corporation Limited on
																the date of payment and Seoul Auction’s certificate as to such rate will be conclusive. For the
																avoidance of doubt, Seoul Auction shall not be liable to indemnify any loss incurred as a result
																of any foreign exchange rate fluctuation or otherwise.
																<br>
																18.3 Any and all payments under these Auction Terms and/or Important Notices shall be made in
																cash or equivalent, including electronic remittance, cashier cheques and/or bank money orders
																in good cleared funds and in accordance with the these Auction Terms and the Important
																Notices. In respect of any payment under these Auction Terms and/or the Important Notices,
																if the payment due date is not a Business Day, then the immediately following Business Day will
																be deemed to be the payment due date.
																<br>
																18.4 All sums payable by the Buyer to Seoul Auction are exclusive of any goods or service tax or
																other value added tax (whether imposed in Hong Kong or otherwise). The Buyer shall be
																responsible for paying such tax at the rate and time as required by the relevant law.
																<br>
																18.5 If any part of these Auction Terms and/or the Important Notices is found by any court to be
																invalid, illegal or unenforceable, that part may be discounted and the rest of these Auction
																Terms and/or the Important Notices shall continue to be valid and enforceable to the fullest
																extent permitted by law.
																<br>
																18.6 All notices, requests, claims, demands and other communications to Seoul Auction under these
																Auction Terms and/or the Important Notices shall be in English and in writing and shall be given
																or made (and shall be deemed to have been duly given or made upon receipt) by delivery in
																person, by overnight courier service, by facsimile with receipt confirmed (followed by delivery
																of an original via overnight courier service), by email with receipt confirmed by a reply email
																from Seoul Auction (followed by delivery of an original via overnight courier service) or by
																registered or certified mail (postage prepaid, return receipt requested) to Seoul Auction at the
																following address:
																<br>
																SA+<br>
																11F H Queen’s 80 Queen's Road Central,<br>
																Central, Hong Kong<br>
																Tel (852) 2537 1880<br>
																Fax (852) 2537 2810<br>
																Email: saplus@seoulauction.com<br>
																Notices to Bidders and Buyers shall be addressed to the address specified by them in the
																relevant registration form.
																<br>
																18.7 Time shall be of the essence of these Auction Terms and the Important Notices both as
																regards any dates, times and periods mentioned and as regards any dates, times and periods
																which may be substituted for them in accordance with these Auction Terms or by agreement
																in writing between the parties.
																<br>
																18.8 No waiver by or on behalf of Seoul Auction of any requirement of or any rights under these
																Auction Terms and/or the Important Notices shall release any other party(ies) from the full
																performance of its/their remaining obligations under these Auction Terms and/or the Important
																Notices. No single or partial exercise of or failure or delay in exercising, on the part of Seoul
																Auction, any right, power or remedy under these Auction Terms and/or the Important Notices
																or the granting of time by Seoul Auction shall prejudice, affect or restrict the rights, powers
																and remedies of Seoul Auction under these Auction Terms and/or the Important Notices, nor
																shall any waiver by Seoul Auction of any breach of these Auction Terms and/or the Important
																Notices operate as a waiver of or in relation to any subsequent or any continuing breach of
																these Auction Terms and/or the Important Notices.
																<br>
																18.9 These Auction Terms and the Important Notices as amended from time to time in accordance
																with these Auction Terms set out the entire agreement and understanding between the parties
																relating to the subject matter hereof to the exclusion of any terms implied by law which may
																be excluded by contract and supersedes any previous written or oral agreement between
																the parties in relation to the matters dealt with in these Auction Terms and the Important
																Notices as amended from time to time in accordance with these Auction Terms (except in
																respect of the rights and obligations of the Consignor and Seoul Auction against each other
																in relation to the consignment of lots by the Consignor to Seoul Auction which shall be
																regulated by the relevant consignment agreement). It is agreed that no party has been induced
																to enter into these Auction Terms and the Important Notices by any representation, warranty
																or undertaking not expressly incorporated it.
																<br>
																18.10 In the case of any ambiguity or discrepancy between the English, Chinese and/or Korean
																version of these Auction Terms, the English version shall prevail.
															</p>

															<h4>19 Jurisdiction and governing law</h4>
															<p class="tb1">
																These Auction Terms shall be governed by the laws of Hong Kong. The courts of Hong Kong shall
																have exclusive jurisdiction to settle any disputes which may arise out of or in connection with these
																Auction Terms and/or the Important Notices and the parties to these Auction Terms (except Seoul
																Auction) irrevocably submits to the jurisdiction of such courts and waive any objection to proceedings
																in any such court on the ground of venue or on the ground that proceedings have been brought in
																an inconvenient forum. Seoul Auction shall have the right to bring proceedings in any court other
																than the Hong Kong courts. All Bidders and Buyers irrevocably consent to the service of process or
																any other documents in connection with proceedings in any court by facsimile transmission, personal
																service, delivery by mail or in any other manner permitted by Hong Kong law, at the law of the
																place of service or the law of jurisdiction where proceedings are instituted, at the last address of the
																Bidders or the Buyers known to Seoul Auction or any other usual address.
															</p>

															<p class="title_txt tb1">Terms of Hong Kong Sale</p>
															<h4>1 Purpose</h4>
															<p class="tb1">
																expiration of seven calendar days from, but not including, the date of the sale of such lot, and
																(the “Important Notices”) contained in the relevant Auction Catalogue (defined below)
																contain all the terms and conditions on which:<br>
																1.1.1 Seoul Auction Hong Kong Limited (“Seoul Auction”) shall conduct an Auction (defined below);<br>
																1.1.2 prospective Bidders shall register and/or apply to place, and Bidders shall place, bids in such Auction; and<br>
																1.1.3 Seoul Auction and the Seller shall contract with the Buyer in connection with the sale of any lot in such Auction.<br>
															</p>

															<h4>2 Definitions</h4>
															<p class="tb1">
																2.1 “Auction” means an auction conducted by Seoul Auction from time to time in accordance with
																these Auction Terms and the Important Notices.<br>
																2.2 “Auction Catalogue” means, in relation to an Auction, the catalogue published by Seoul Auction
																containing descriptions and information on the lots scheduled to be sold at such Auction.<br>
																2.3 “Auction Date” means, in respect of any lot, the date on which such lot is scheduled to be sold
																at an Auction.<br>
																2.4 “Auction Period” means, in relation to an Auction, the date(s) on which such Auction is held.<br>
																2.5 “Bidder” means, in relation to an Auction, any person who has registered and/or applied to
																Seoul Auction to place bids in such Auction and, if applicable, has received written confirmation
																of such registration and/or application from Seoul Auction in accordance with these Auction
																Terms and the Important Notices.<br>
																2.6 “Business Day” means a calendar day which is not a Saturday, a Sunday or a public holiday in
																Hong Kong.<br>
																2.7 “Buyer” means, in respect of any lot, the Bidder who is declared by the auctioneer to be the
																Bidder who has made the highest bid for such lot in accordance with these Auction Terms.<br>
																2.8 “Buyer Withdrawal Fee” means, in respect of any lot, an amount equal to 30% of the Hammer
																Price of such lot.<br>
																2.9 “Buyer’s Expenses” means, in respect of any lot, any taxes, costs, charges or expenses including,
																but not limited to, any currency conversion costs, storage charges, packaging, delivery and
																transit insurance costs, incurred by any of Seoul Auction, its directors, officers, employees and/
																or agents in connection with the sale of such lot pursuant to these Auction Terms and/or the
																Important Notices and payable by the Buyer to Seoul Auction.<br>
																2.10 “Buyer’s Premium” means, in respect of any lot, the premium payable by the Buyer to Seoul
																Auction in accordance with these Auction Terms in connection with the sale and purchase of
																such lot.<br>
																2.11 “Consignor” means, in respect of any lot, the person who has consigned such lot to Seoul
																Auction to be sold at an Auction by entering into a consignment agreement with Seoul
																Auction prior to the start date of such Auction.<br>
																2.12 “Estimate Price” means, in respect of any lot, the estimated value of such lot as determined by
																Seoul Auction in its sole and absolute discretion.<br>
																2.13 “Hammer Price” means, in respect of any lot, the sale price of such lot, being the amount
																equal to the highest bid accepted by the auctioneer by striking his/her hammer and calling the
																paddle number of the relevant Bidder in accordance with these Auction Terms.<br>
																2.14 “Purchase Price” means, in respect of any lot, an amount equal to the sum of the Hammer Price
																and the Buyer’s Premium of such lot.<br>
																2.15 “Reserve Price” means, in respect of any lot, the minimum selling price of such lot agreed in
																writing between the Seller and Seoul Auction (if the Consignor is the Seller), or determined by
																Seoul Auction (if Seoul Auction is the Seller), as the case may be, prior to the sale of such lot.<br>
																2.16 “Seller” means, in respect of any lot, the counterparty to the contract of sale of such lot, which
																shall be Seoul Auction if a lot is marked with the symbol “Δ” next to its lot number in the
																relevant Auction Catalogue, or the Consignor if a lot is not marked with such symbol in the
																relevant Auction Catalogue.<br>
															</p>


															<h3>IMPORTANT NOTICES (Hong Kong Sale)</h3>
															<h4>AUCTION TERMS</h4>
															<p class="tb1">
																application to place bids, placing of bids and sale of lots in the Auction shall be regulated
																by the Auction Terms and these Important Notices. In the event of any ambiguity or any
																discrepancy between the Auction Terms and these Important Notices, the Auction Terms
																will prevail. Prospective Bidders should read the Auction Terms and these Important
																Notices carefully and contact Seoul Auction at (852) 2537 1880 (telephone) or (852)
																2537 2810 (fax) should they have any queries.<br>
																Any capitalised terms used but not defined in these Important Notices have the meaning
																set out against such terms in the Auction Terms. References to a ‘lot’ include any Premium
																Lot unless otherwise stated.<br>
																PLEASE READ CAREFULLY CLAUSES 13, 14 and 15 OF THE AUCTION TERMS
																WHICH SET OUT SEOUL AUCTION’S DISCLAIMER REGARDING THE LOTS, THE
																CONDUCT OF THE AUCTION AND THE SALE OF THE LOTS AND THE LIMITED
																WARRANTY PROVIDED BY SEOUL AUCTION IN RESPECT OF THE LOTS.
																DIMENSIONS ARE APPROXIMATE FIGURES
																Dimensions in this catalogue are approximate figures only.</p>

															<h4>ESTIMATE PRICES AND RATES OF EXCHANGE</h4>
															<p class="tb1">Estimate Prices provided by Seoul Auction in respect of any lot are for reference only and
																are not indications of the value or the actual Hammer Price of such lot. Estimate Prices of
																any lot may change at any time before and up to the time of the sale of such lot without
																prior notice. Estimate Prices of a lot do not include the Buyer’s Premium and any Buyer’s
																Expenses payable by the Buyer to Seoul Auction.<br>
																Seoul Auction will provide Estimate Prices for each lot in Hong Kong Dollars, US Dollars,
																Korean Won in this catalogue, on a screen in the auction hall during the Auction Period
																and/or in its advertisements and other publications. Please note that all amounts in US
																Dollars (USD), Korean Won (KRW) shown in this catalogue, on the screen during the
																Auction Period or elsewhere are for reference only and all bids and payment will be
																in Hong Kong Dollars (HKD), except as otherwise expressly provided in the Auction
																Terms and/or these Important Notices. The rates of exchange used for Estimate Prices
																in US Dollars, Korean Won in this catalogue are:<br>
																HKD[7.8] = USD[1]<br>
																HKD[1] = KRW[152]<br>
																Such rates of exchange were obtained at the latest practicable date prior to the printing of
																this catalogue and may have changed by the time of the Auction Period. No representation
																is made that any of the US Dollar or the Korean Won amounts shown in this catalogue,
																on the screen during the Auction Period and/or elsewhere could have been or could be
																converted into Hong Kong Dollars (or vice versa) at the specified rates, at any particular
																rates or at all. Seoul Auction is not responsible for any error or omission, however caused,
																arising from, or in connection with, conversion of Estimate Prices expressed in Hong Kong
																Dollars into in US Dollars, Korean Won. Please note that if any amount is to be paid
																to, or by, Seoul Auction in US Dollars or Korean Won, the rates of exchange used for
																conversion of such amount from Hong Kong Dollars into US Dollars or Korean Won
																may be different from the above rates.
															</p>

															<h4>PREVIEWS</h4>
															<p class="tb1">Seoul Auction will hold previews of lots scheduled to be sold at the Auction at the place,
																date and time and for such duration as stated in this catalogue and/or on its website,
																provided however, that Seoul Auction may, in its sole and absolute discretion, cancel,
																or change the place, date, time and/or duration of, any preview without prior notice.
																Previews are open to the public and are free of charge provided however, that Seoul
																Auction may, in its sole and absolute discretion, require proof of identity satisfactory to it
																before admitting any person to any preview and/or refuse admission of any person to any
																preview. Prospective Bidders are strongly encouraged to attend the previews.
															</p>

															<h4>REGISTRATION FOR LOTS</h4>
															<p class="tb1">Unless otherwise agreed in writing between Seoul Auction and a prospective Bidder, in
																order to bid for a lot which is not a Premium Lot, a prospective Bidder, including a first
																time prospective Bidder with Seoul Auction, must register by completing and returning to
																Seoul Auction in the manner provided in the Bidder Registration Form:<br>
																(i) the Bidder Registration Form;<br>
																(ii) a copy of a form of identification with his/her photo satisfactory to Seoul Auction such
																as his/her government-issued identification card, passport or driver’s licence; and<br>
																(iii) any other document as may be required by Seoul Auction.
																The Bidder Registration Form and the relevant document should be received by Seoul
																Auction by not later than one Business Day prior to the start date of the Auction Period.<br>
																If a prospective Bidder is a first-time prospective Bidder with Seoul Auction, he/she must
																also provide to Seoul Auction together with the Bidder Registration Form a copy of the
																most recent bank statement and a copy of his/her credit card (Visa/MasterCard). It is
																strongly recommended that the prospective Bidder contact Seoul Auction at (852)
																2537 1880 (telephone) or (852) 2537 2810 (fax) at least one Business Day prior to
																the start of the Auction Period and arrange bidder registration and the required credit
																approval process to avoid any delay on the relevant Auction Date. Upon registration the
																prospective Bidder will, unless he/she has applied to Seoul Auction to place bids in writing
																or by telephone, be issued with a numbered paddle at the beginning of each relevant
																Auction Date. The Bidder Registration Form is available in this catalogue or online at www.
																seoulauction.com.
															</p>

															<h4>WRITTEN BIDS AND TELEPHONE BIDS</h4>
															<p class="tb1">
																It is recommended that prospective Bidders attend the Auction and place bids in person.
																A prospective Bidder may, however, apply to place bids in writing or by telephone by
																completing and returning to Seoul Auction in the manner required in the Absentee Bid
																Form:<br>
																(i) the Absentee Bid Form;<br>
																(ii) the Bidder Registration Form or the Premium Lot Pre-Registration Application Form
																(as the case may be); and<br>
																(iii) any other documents as may be required by Seoul Auction.<br>
																The Absentee Bid Form and the relevant documents should be received by Seoul Auction
																by not later than one Business Day prior to the start date of the Auction Period. Seoul
																Auction will send to the relevant prospective Bidder a written confirmation of its receipt
																of his/her Absentee Bid Form by fax or by post to his/her billing address as specified in the
																Absentee Bid Form. A prospective Bidder should not assume that his/her Absentee Bid
																Form has been registered before he/she receives Seoul Auction’s written confirmation
																and he/she should contact Seoul Auction at (852) 2537 1880 (telephone) or (852) 2537
																2810 (fax) if he/she has not received such written confirmation by two Business Days
																before the start date of the Auction Period. The Absentee Bid Form is available in this
																catalogue or online at www.seoulauction.com .<br>
																Seoul Auction shall use reasonable endeavours to enable Bidders to place bids in person, in
																writing or by telephone, but Seoul Auction does not accept any responsibility for failure to
																do so or delay in doing so or for any error and/or omission by Seoul Auction, its directors,
																officers, employees and/or agents in processing any registration and/or application to
																place bids, receiving and/or placing written or telephone bids, howsoever caused. Results
																of written bids will be sent by post after the Auction to the Bidders’ billing address, as
																specified in the relevant registration form. Bids placed by telephone may be recorded and
																Bidders, by placing bids by telephone, are deemed to have consented to the recording of
																their conservations.
															</p>

															<h4>BIDDING AND RESERVE PRICE</h4>
															<p class="tb1">The Reserve Price is the minimum Hammer Price the Seller will accept in respect of a lot.
																The auctioneer shall keep the Reserve Price confidential. Any bid below the Reserve Price
																shall not be accepted by the auctioneer. The Reserve Price of a lot shall not exceed the
																lower Estimate Price of such lot as at the date of the sale. The auctioneer may, in respect
																of any lot, place bids on behalf of the Seller below the Reserve Price of such lot, either by
																placing consecutive bids or entering bids in response to other bids. The auctioneer may,
																in its sole and absolute discretion, start the bidding of any lot below the Reserve Price of
																such lot. The auctioneer, however, shall not place any bid for any lot on behalf of the Seller
																at or above the Reserve Price of such lot. The auctioneer shall not be obliged to specifically
																identify bids placed on behalf of the Seller.
															</p>

															<h4>SALE OF LOTS AND INVOICE</h4>
															<p class="tb1">The sale of a lot shall be between the Seller and the Buyer at the Hammer Price of such
																lot. The sale of a lot between the Seller and the Buyer shall occur when the auctioneer
																accepts the highest bid by striking his/her hammer and calling the paddle number of the
																highest Bidder (i.e. the Buyer). The Buyer will be asked to confirm his/her purchase by
																signing the Successful Bidding Confirmation Form on the date of the sale (where the Buyer
																made his/her bid in person and is present in the auction hall on the date of the sale) or as
																soon as practicable (where the Buyer did not make his/her bid in person or is not present
																in the auction hall on the date of the sale).<br>
																Invoice(s) listing the lot(s) purchased by the Buyer, the Hammer Price, the Buyer’s Premium
																and/or any Buyer’s Expenses will be provided to the Buyer in person within 24 hours of
																the date of the sale (where the Buyer made his/her bid in person and is present in the
																auction hall on the date of the sale) or by fax or post sent to his/her billing address as
																specified in the relevant registration form within two Business Days of the date of the sale
																of the lot(s) (where the Buyer did not make his/her bid in person or is not present in the
																auction hall on the date of the sale).<br>
																In respect of any lot, the Buyer shall pay to Seoul Auction (for itself and/or on behalf of the
																Consignor) in accordance with the Auction Terms and these Important Notices the full
																invoiced amount and any Buyer’s Expenses incurred after the invoice is sent:<br>
																(i) within seven calendar days from, but not including, the date of the sale of such lot (if the
																Hammer Price is less than HKD2,500,000); or<br>
																(ii) within 21 calendar days from, but not including, the date of the sale of such lot (if the
																Hammer Price is equal to or higher thanHKD2,500,000, provided however, that the Buyer
																shall pay to Seoul Auction 30% of the Purchase Price within seven calendar days from, but
																not including, the date of the sale of such lot).<br>
																Unless otherwise agreed in writing between a Buyer and Seoul Auction, the Buyer
																shall be personally liable to pay to Seoul Auction (for itself and/or on behalf of the
																Consignor) the Purchase Price and/or any Buyer’s Expenses in accordance with these
																Auction Terms and the Important Notices. Unless otherwise agreed in writing between
																the Buyer and Seoul Auction, Seoul Auction will not accept any payment due to it (for
																itself and/or on behalf of the Consignor) from any other party other than the relevant
																Buyer.<br>
																The Buyer shall bear the risk associated with, and the responsibility for, the lot purchased
																by him/her from the earlier of:<br>
																(i) the expiration of seven calendar days from, but not including, the date of the sale of
																such lot; and<br>
																(ii) the date of collection of such lot by the Buyer or its authorised representative.
																However, title to the lot will not pass to the Buyer until all amounts due from the Buyer
																to Seoul Auction (for itself and/or on behalf of the Consignor) in respect of the lot
																under the Auction Terms and/or these Important Notices are received by Seoul Auction
																in good cleared funds. Please refer to the Auction Terms for further details.
															</p>

															<h4>PAYMENT IN OTHER CURRENCIES</h4>
															<p class="tb1">All bids, sale and payment will be in Hong Kong Dollars. If the Buyer and Seoul Auction
																agrees in writing for the Buyer to pay any amount due to Seoul Auction (for itself and/
																or on behalf of the Consignor), or for Seoul Auction to pay any amount due to it, in any
																currency other than Hong Kong Dollars, the Buyer shall be liable to pay any currency
																costs, including, but not limited to, any bank commissions and/or charges, incurred by
																Seoul Auction in converting the Hong Kong Dollar amounts into such other currency. Any
																currency conversion will be made using the rate for Hong Kong Dollars quoted to Seoul
																Auction by Hongkong Shanghai Banking Corporation Limited on the date of payment
																and Seoul Auction’s certificate as to such rate will be conclusive. Seoul Auction shall not
																be liable to pay any interest or indemnify any loss occurred as a result of the any foreign
																exchange rate fluctuation or otherwise.<br>
																Bank transfers should be made to:<br>
																Bank Name: WOORI BANK<br>
																Account Name: Seoul Auction Hong Kong Limited<br>
																Account No. : 1081-400-549376<br>
																SWIFT code: HVBKKRSEXXX<br>
																Address: WOORI BANK PYONGCHANG DONG BR.<br>
																Subject to the Auction Terms, in case any payment is made by personal or company
																cheque, please note that the relevant lot(s) will not be released, and title to such lot(s)
																will not pass, to the Buyer until such cheque has been cleared. Subject to the Auction
																Terms, payment by cash or banker’s draft will enable immediate release of, and transfer
																of title of, such lot(s) to the Buyer. Travellers’ cheques or payment by credit card will not
																be accepted.
															</p>

															<h4>BUYER’S PREMIUM</h4>
															<p class="tb1">In respect of any lot, the Buyer’s Premium shall be:<br>
																The buyer’s premium is 18% of the Hammer Price.</p>
															<h4> EXPORT/IMPORT PERMITS</h4>
															<p class="tb1">
																Lot(s) sold at the Auction may be subject to laws governing export from Hong Kong and
																import restrictions of the relevant countries. It is the Buyer’s sole responsibility to obtain any
																relevant Licences required for the export/import of the purchased lot(s). If requested by the
																Buyer in writing, Seoul Auction may introduce to the Buyer a shipper to assist in obtaining
																the necessary Licences at the Buyer’s expense and risk. Seoul Auction does not accept any
																responsibility whatsoever in respect of such introduction. The denial of the Licences or any
																delay in obtaining the Licences shall not be a ground for the Buyer to cancel the sale of such
																lot or refuse or delay payment of the full amounts payable by the Buyer to Seoul Auction
																(for itself and/or on behalf of the Consignor) pursuant to the Auction Terms.
															</p>

															<h4>COLLECTION AND STORAGE</h4>
															<p class="tb1">It is the Buyer’s responsibility to arrange for collection of the lot(s), by himself/herself or by
																an authorised representative. Unless otherwise agreed in writing between Seoul Auction
																and the Buyer, Seoul Auction will only release the lot(s) to the Buyer or its authorised
																representative. Seoul Auction will only release the lot(s) upon receiving (i) proof of identity
																and authorisation (in the case of an authorised representative collecting) satisfactory to
																Seoul Auction and (ii) the full amounts payable by the Buyer to Seoul Auction (for itself
																and/or on behalf of the Consignor) in respect of the lot(s) pursuant to the Auction Terms.<br>
																If agreed in writing between the Buyer and Seoul Auction, Seoul Auction will arrange
																packaging, delivery and transit insurance of such lot(s) at the Buyer’s expense and risk.
																Seoul Auction shall not be responsible for any damage to, or the loss of, such lot(s) during
																packaging and/or the transit period of such lot(s), howsoever caused.<br>
																All items from the sale will be transferred to BALtrans International Moving Ltd. where
																they will incur storage charge one month after the date of the auction at the following
																rate:<br>
																Storage charge: HK$600 per lot per month.<br>
																To arrange shipping and collection, please contact
																Seoul Auction at (852)2537-1880 saplus@seoulauction.com<br>
																or<br>
																BALtrans International Moving Limited<br>
																Unit A, 1/F, Sunshine Kowloon Bay Cargo Centre<br>
																59 Tai Yip Street, Kowloon Bay,<br>
																Kowloon, Hong Kong<br>
																Contact: Mr. Chester Lai<br>
																Tel: +852-2756-2882<br>
																Fax: +852-2759-9772<br>
															</p>

															<h4>TAX</h4>
															<p class="tb1">All sums payable by the Buyer to Seoul Auction are exclusive of any goods or service tax
																or other value added tax (whether imposed in Hong Kong or otherwise). The Buyer shall
																be responsible for paying such tax at the rate and time as required by the relevant law.
															</p>

															<h4>TRANSLATION</h4>
															<p class="tb1">In the case of any ambiguity or discrepancy between the English, Chinese and/or Korean
																text in this catalogue, the English version shall prevail.
															</p>

															<h4>CONTACT INFORMATION</h4>
															<p class="tb1">Tel: (852) 2537 1880<br>
																Fax: (852) 2537 2810<br>
																Email: info@seoulauction.com
															</p>
														</div>
		                                            </div>
		                                        </li>
												<li class="trp_acitem" data-index="1">
		                                            <div class="header-area">
														<!--[0516]-->
														<div class="accordion_name eng_accordion">
		                                                    <div class="trp checkbox-box">
		                                                        <input id="checkbox_all2" tabindex="17" class="js_item" type="checkbox" name="chk_per" ng-change="onChangeCheckbox_P()"ng-model="form_data.personOfflineAgree">
		                                                        <i></i>
		                                                        <label for="checkbox_all2"><span class="required">[Required]</span> Agree to the offline<br class="only-pc"> auction terms and conditions</label>
		                                                    </div>
		                                                </div>
		                                                <a href="#" class="acc_btn">
															<i class="icon-accordion_arrow_down"></i>
		                                                </a>
		                                            </div>
		                                            <div class="con-area">
														<div class="policy_cont scroll-type">
															<p class="tb1">Please carefully review the provisions of these Auction Terms.
																Offline auctions and purchase contracts of Seoul Auction are implemented pursuant to the following, and you are consenting to being bound by these Auction Terms by participating in the auction or the contract.</p>
															<h4>Article 1 Purpose</h4>
															<p class="tb1">
																The purpose of the precautions included in the terms of the auction or the related Auction Catalogue is to stipulate the following:<br>
																1.1 Procedures and all standards of the offline auction conducted by Seoul Auction and the rights and obligations of the related persons;<br>
																1.2 Procedures and all standards of the purchase contract pursuant to methods other than the auctions conducted by Seoul Auction and the rights and obligations of the related persons.
															</p>
															<h4>Article 2 Definitions</h4>
															<p class="tb1">
																2.1 "Auction" means an offline auction conducted by Seoul Auction from time to time in accordance with these Auction Terms, the Auction Catalogues and/or elsewhere.<br>
																2.2 “Purchase Contract Pusuant to Methods Other than the Auction” means a general purchase contract (hereinafter referred to as the “General Purchase Contract”) executed by Seoul Auction pursuant to these terms and/or Auction Catalogue.<br>
																2.3 "Object" means all goods or rights in any form that may be subjected to an Auction or General Purchase Contract, such as artwork, and "Lot" means all objects offered at the Auction by Seoul Auction or subjected to a sale pre or post the Auction.<br>
																2.4 "Auction Catalogue" means, in relation to an Auction, the catalogue (including e-catalogue) published by Seoul Auction containing descriptions and information on the Lots scheduled to be sold at such Auction. "Auction Catalogue and/or elsewhere" means but not restricted to, every material produced by Seoul auction (including, but not limited to, materials on the Seoul Auction official website, e-mail, SMS, smartphone application, listbook, brochure, condition report, Lot recommendation, research study, screen display at Auction, marketing and promotional printouts).<br>
																2.5 "Auction Date" means, with respect to any Lot, the date on which such Lot is scheduled to be sold at an Auction.<br>
																2.6 "Auction Period" means, in relation to an Auction, the date(s) on which such Auction is held.<br>
																2.7 "Bidder" means, in relation to an Auction, any person who has applied to Seoul Auction to place bids in such Auction and accepted by Seoul Auction or, if applicable, has received written confirmation of such application from Seoul Auction in accordance with these Auction Terms, the Auction Catalogues and/or elsewhere.<br>
																2.8 "Business Day" means a calendar day which is not a Saturday, a Sunday or a public holiday in Korea.<br>
																2.9 "Buyer" means, with respect to any Lot, the Bidder who is declared by the auctioneer to be the Bidder who has made the highest bid for such Lot in accordance with these Auction Terms.<br>
																2.10 "Buyer Withdrawal Fee" means, with respect to any Lot, the charge to be imposed upon cancellation of a winning bid, at an amount equal to 30% of the Hammer Price of the relevant Lot and payable by the Buyer to Seoul Auction.<br>
																2.11 "Buyer's Expenses" means, with respect to any Lot, any taxes, costs, charges or expenses including, but not limited to, any currency conversion costs, storage charges, packaging, delivery and transit insurance costs, incurred by any of Seoul Auction, its directors, officers, employees and/or agents in connection with the sale of such Lot pursuant to these Auction Terms, the Auction Catalogues and/or elsewhere and payable by the Buyer to Seoul Auction.<br>
																2.12 "Buyer's Premium" means, with respect to any Lot, the premium payable by the Buyer to Seoul Auction in accordance with these Auction Terms in connection with the Consignment Agreement and such Lot.<br>
																2.13 "Consignor" means, with respect to any Lot, the person who has consigned such Lot to Seoul Auction to be sold at an Auction by entering into a consignment agreement with Seoul Auction prior to the start date of such Auction.<br>
																2.14 "Estimated Price" means, with respect to any Lot, the estimated value of such Lot, determined by Seoul Auction at its sole and absolute discretion as is delegated, as reflects the nature of sale through auction, to it.<br>
																2.15 “Hammer Price" means, with respect to any Lot, the sale price of such Lot, being the amount equal to the highest bid accepted by the auctioneer by striking his/her hammer and calling the paddle number of the relevant Bidder in accordance with these Auction Terms.<br>
																2.16 "Purchase Price" means, with respect to any Lot, an amount equal to the sum of the Hammer Price and the Buyer's Premium of such Lot.<br>
																2.17 "Reserve Price" means, with respect to any Lot, the minimum selling price of such Lot agreed in writing between the Seller and Seoul Auction (if the Consignor is the Seller), or determined by Seoul Auction (if Seoul Auction is the Seller), as the case may be, prior to the sale of such Lot.<br>
																2.18 "Seller" means, with respect to any Lot, the counterparty to the contract of sale of such Lot, which shall be Seoul Auction or the Consignor.<br>
																2.19 “Puprchaser” means a person who has purchased or is intending to purchase an Object through a General Purchase Contract with Seoul Auction.<br>
																2.20 Affiliate" means Seoul Auction and/or its holding company, office, subsidiary or a corporate entity controlled by or is under a common control with Seoul Auction.<br>
																2.21 "Online Bidding" means, with respect to an Auction, online bids accepted by Seoul Auction’s website or any computer network provided by Seoul Auction.
															</p>
															<h4>Article 3 Seoul Auction as an Agent or as the Seller</h4>
															<p class="tb1">Except with respect to any Lot of which Seoul Auction is the Seller, Seoul Auction shall act as an agent of the Consignor (being the Seller) in selling the Consignor's Lot in an Auction. The contract for such a Lot shall be made between the Seller and the Buyer.</p>
															<h4>Article 4 Previews</h4>
															<p class="tb1">4.1 Seoul Auction shall hold preview(s) of the Lots scheduled to be sold at an Auction, offered for sale after the Auction or offered for sale continuously and irrespective of the Auction Period(s). Such preview(s) shall be open to the public and free of charge, provided however, that Seoul Auction may, at its sole and absolute discretion as is delegated, as reflects the nature of the sale through an Auction, to it, require proof of identity satisfactory to it prior to admitting any person to any preview and/or refuse admission of any person to any preview.<br>
																4.2 Seoul Auction may give notice of the place, date, time and duration of any preview in the relevant Auction Catalogue and/or elsewhere. Seoul Auction may, at its sole and absolute discretion as is delegated, as reflects the nature of the sale through an Auction, to it, cancel or change the place, date, time and/or duration of any preview without prior notice. Seoul Auction may, at its sole and absolute discretion as is delegated, as reflects the nature of the sale through an Auction, to it, determine not to sell any Lot exhibited at a preview in the relevant Auction or in any other Auction.</p>
															<h4>Article 5 Bidder Registration</h4>
															<p class="tb1">Unless otherwise agreed to in writing with Seoul Auction prior to the start date of the relevant Auction Period, prospective Bidders, including first-time prospective Bidders, shall register and/or apply to place bids in an Auction by completing and sending to Seoul Auction the relevant registration form and any supplementary document specified in such registration form and/or requested by Seoul Auction in accordance with the Auction Catalogues and/or elsewhere. Registration of the prospective Bidders and application to place bids in person, in writing, by telephone, or by online live-bidding (hereinafter referred to as "Each Bid") shall be conducted as prescribed in the relevant Auction Catalogues and/or elsewhere. Seoul Auction shall use reasonable efforts to process any registration and/or any application to place each bid. However, as reflects the nature of the sale through an Auction, the prospective Bidders shall agree that Seoul Auction shall not be held responsible or liable for any failure or delay in processing such registration and/or application, or for any error and/or omission by Seoul Auction, its directors, officers, employees and/or agents in processing such registration and/or application, howsoever caused.</p>
															<h4>Article 6 Estimated Price</h4>
															<p class="tb1">6.1 Seoul Auction may provide a low Estimated Price and/or a high Estimated Price for each Lot in Korean Won, US Dollar, Hong Kong Dollar and/or Chinese Yuan in the relevant Auction Catalogue and/or elsewhere during the relevant Auction Period. Seoul Auction may, at its sole and absolute discretion as is delegated, as reflects the nature of the sale through an Auction, to it, change at any time before and up to the time of the sale of any Lot the Estimated Price(s) of such Lot without prior notice. The Estimated Price(s) shall not include the Buyer's Premium and/or any Buyer's Expenses payable by the Buyer to Seoul Auction. The Estimated Price(s) provided by Seoul Auction are for reference only and shall not serve as definitive indicators of the market value or the Hammer Price of the relevant Lot. Seoul Auction shall not be held responsible or liable by the Bidder for any Estimated Price being quoted in public.<br>
																6.2 Except as otherwise expressly provided in these Auction Terms, the Auction Catalogues and/or elsewhere, the Estimated Price shown in US Dollar, Hong Kong Dollar and/or Chinese Yuan in any Auction Catalogue and/or elsewhere shall be for reference only and all bids and payments shall be in Korean Won. With respect to the Estimated Price provided in an Auction Catalogue, the relevant Auction Catalogue and/or elsewhere shall contain the exchange rates used in converting the Estimated Price expressed in Korean Won into US Dollar, Hong Kong Dollar or Chinese Yuan. Such exchange rates shall be the most recently obtained on a practicable date prior to the printing of the relevant Auction Catalogue and may have changed thereafter. No representation is made that any of the US Dollar, Hong Kong Dollar or Chinese Yuan amounts shown in any Auction Catalogue and/or elsewhere could have been or could be converted into Korean Won (or vice versa) at the specified rates, at any particular rates or at all. The exchange rates provided by Seoul Auction in the Auction Catalogues and/or elsewhere are for reference only, and the prospective Bidders shall be responsible for calculating the precise exchange rates. Seoul Auction shall not be responsible for any error or omission, howsoever caused, arising from or in connection with, conversion of the Estimated Price expressed in Korean Won into US Dollar, Hong Kong Dollar or Chinese Yuan.</p>
															<h4>Article 7 Conducting the Auction and Conclusion of the Sale of a Lot</h4>
															<p class="tb1">7.1 Seoul Auction shall provide a notice of the scheduled date, time, duration and place of an Auction in the relevant Auction Catalogue and/or elsewhere; provided however, Seoul Auction may, at its sole and absolute discretion as is delegated, as reflects the nature of the sale through an Auction, to it, cancel or change the date, time, duration and/or place of, any Auction at any time without prior notice.<br>
																7.2 Each of Seoul Auction and the auctioneer may, at its/his/her sole and absolute discretion as is delegated, as reflects the nature of the sale through an Auction, to it/him/her, refuse admission of any person to any Auction and/or reject any bid (regardless of the type of bid, such as public, written, telephone or online bids) placed in any Auction.
																7.3 All Lots shall be sold subject to the Reserve Price of such Lot and the auctioneer shall not accept any bid below such Reserve Price. The auctioneer shall keep the Reserve Price confidential. The auctioneer may place bids on behalf of a Seller below the Reserve Price as a response to consecutive bids, written bids, telephone bids or online bids. The auctioneer may, at his/her sole and absolute discretion as is delegated, as reflects the nature of the sale through an Auction, to him/her, start the bidding of any Lot below the Reserve Price of such Lot and may accept bids below the Reserve Price. The auctioneer shall not place any bid on behalf of a Seller at or above the Reserve Price. The auctioneer shall not be obliged to specifically identify bids placed on behalf of a Seller.<br>
																7.4 A Bidder may place each bid subject to and in accordance with these Auction Terms, the Auction Catalogues and/or elsewhere. All Bids placed may be recorded, filmed, and/or otherwise documented (including through computerized records) (hereinafter referred to as the "Bidding Records"), and the Bidders, by placing bids, are deemed to have consented that the Bidding Records shall be stored by Seoul Auction and that, in case of any objection or dispute over the validity of the bids placed with respect to a Lot, such Bidding Records shall be considered the absolute and final records as evidentiary material in the dispute resolution.<br>
																7.5 Provided that the following shall be subjected to Clauses 7.6 and 7.7:<br>
																7.5.1 In the case of bids placed in person, the Bidder shall place his/her bid by raising his/her paddle after the auctioneer's call in the auction hall.<br>
																7.5.2 In the case of written bids, the auctioneer shall call out such bids in the auction hall prior to accepting bids placed in person, by telephone, or by online live-bidding.<br>
																7.5.3 In the case of bids placed by telephone, an employee of Seoul Auction shall place the bids on behalf of the Bidder in the auction hall. The bids placed by telephone may be recorded, and the Bidder shall be deemed to have consented to the recording by making the telephone bids.<br>
																7.5.4 In the case of online live-bidding, the Bidder shall use Seoul Auction’s website or any computer network provided by Seoul Auction to place bids online on the desired Lot by (i) selecting the desired bid price and clicking on the "Bid" or "Automatic Bid" button to express his/her intent to making a bid, or by (ii) entering the desired bid price and clicking on the "Bid" button (if such a method is available) to express his/her intent to making a bid. Online live-bidding may be different from the offline auction, and Seoul Auction’s online Auction Terms shall apply, unless otherwise against such nature.<br>
																7.6 With respect to a Lot, Seoul Auction shall use reasonable efforts to receive each bid. However, prospective Bidders agree that Seoul Auction shall not be held responsible nor liable for any failure or delay in receiving each bid, without regards to the reason thereof, unless with an intentional or gross negligence on the part of Seoul Auction, its directors, officers, employees and/or agents in receiving such bid.<br>
																7.7 If, with respect to a Lot, each bid is received by Seoul Auction in accordance with these Auction Terms, the Auction Catalogues and/or elsewhere, Seoul Auction shall use reasonable efforts to place each bid. However, prospective Bidders agree that Seoul Auction shall not be held responsible nor liable for any failure or delay in doing so, or for any error and/or omission by Seoul Auction, its directors, officers, employees and/or agents in placing such bid, howsoever caused.<br>
																7.8 With respect to a Lot, if each bid price is the same price, a priority shall be given to the written bid. If two or more written bids for a Lot have the same bid price, the Bidder of the written bid first received by Seoul Auction shall be declared the Buyer subjected to and in accordance with the Auction Terms. The auctioneer may, at his/her sole and absolute discretion as is delegated, and reflective of the nature of the sale through an Auction, to Seoul Auction and to him/her, announce the order of priority of bids and decide if additional bids may be accepted before accepting the highest bid pursuant to Clause 7.10.<br>
																7.9 Seoul Auction may, at its sole and absolute discretion, may implement the following:<br>
																(i) withdraw any Lot at any time before the scheduled time of the sale of such Lot without a prior notice;<br>
																(ii) combine any two or more Lots without a prior notice;<br>
																(iii) re-commence during the relevant Auction Period without a prior notice, the auction of any Lot which was previously offered for sale but not sold during such Auction Period;<br>
																(iv) in the event of any error arising in relation to, or any dispute among the Bidders over the validity of, bids placed with respect to a Lot, determine the Buyer of, continue the bidding process of, cancel the Auction of and/or recommence the Auction of, such Lot; and/or<br>
																(v) in the event that any dispute over the authenticity of any Object, or the validity of the sale of any Object, has arisen or may, in Seoul Auction's sole opinion, arise, refuse to place such Object in an Auction, discontinue the bidding process and/or cancel the sale.<br>
																In the event that the bidding process or the sale of a Lot is discontinued or cancelled in accordance with Clause 7.9, the Buyer's sole and exclusive remedy against Seoul Auction and/or the Seller, as the case may be, shall be the refund of the Purchase Price if the said Purchase Price has already been paid by the Buyer for such Lot. Neither Seoul Auction nor the Seller shall be liable for any special, indirect or consequential loss including, but not limited to, loss of profit or interest. For the avoidance of doubt, Seoul Auction shall not be liable to pay any interest or indemnify any loss incurred as a result of any foreign exchange rate fluctuation or otherwise.<br>
																7.10 Without prejudice to Clause 7.2, the contract between the Seller and the Buyer for any Lot shall be considered established immediately upon the auctioneer accepting the highest bid by striking his/her hammer and calling out the paddle number of the relevant Bidder. The Buyer shall sign a Successful Bid Confirmation form confirming the purchase by him/her of the Lot on the date of the sale of such Lot (in cases in which the Buyer has made his/her bid in person and is present in the auction hall on the date of the sale) or as soon as practicable (in cases in which the Buyer did not make his/her bid in person or is not present in the auction hall on the date of the sale). Failure by the Buyer of such Lot to expressly communicate any objection immediately upon receiving the Successful Bid Confirmation form in person or by electronic means (including but not limited to social networking service platforms) will be considered an acceptance of and agreement with the terms of the Successful Bid Confirmation form.<br>
																7.11 Risk associated with, and responsibility for, a Lot will pass to the Buyer from the earlier of (i) the expiration of seven calendar days from, but not including, the date of the sale of such Lot, and (ii) the date of collection of such Lot by the Buyer or its authorized representative. Title to the Lot, however, will not pass to the Buyer until all amounts payable by the Buyer to Seoul Auction (for itself and/or on behalf of the Consignor) under these Auction Terms, the Auction Catalogues and/or elsewhere have been received by Seoul Auction in good cleared funds<br>
																7.12 A Consignor shall not, directly or indirectly, place bids on his/her Lots in an Auction, under the condition of not effecting Clause 7.3.</p>
															<h4>Article 8 Marketing Materials</h4>
															<p class="tb1">The copyright in all images, illustrations and/or written material produced by or for Seoul Auction relating to any Lot, including the contents of any Auction Catalogue and/or elsewhere, shall be and shall remain at all times the property of Seoul Auction and shall not be used by the Buyer, nor by any other person, at any time without Seoul Auction's prior written consent. Neither Seoul Auction nor the Seller makes any representation or warranty that the Buyer of a Lot will acquire any copyright or other reproduction rights in it.</p>
															<h4>Article 9 Buyer's Premium</h4>
															<p class="tb1">
																9.1 With respect to any Lot, the Buyer's Premium shall be 18% (excluding VAT) of the Hammer Price. However, Seoul Auction may adjust the rate of the Buyer’s Premium with a prior notice in the website or the Auction Catalogue and/or elsewhere depending on the nature of the Lot.<br>
																9.2 If any Buyer’s Expenses should arise, the Buyer shall pay the Buyer’s Expenses in addition to the Buyer’s Premium to Seoul Auction.<br>
																9.3 The seller’s commission shall adhere to the terms of the Consignment Agreement. If no formal Consignment Agreement has been executed, the seller’s commission shall be 10% (excluding VAT) of the Hammer Price, and all expenses listed in these Auction Terms shall be considered as agreed to and accepted by the Consignor.<br>
																9.4 The Consignor shall accept that certain Lots may be subject to VAT, income tax and/or all other applicable taxes as stipulated by the relevant taxation laws (hereafter referred to as the "Applicable Taxes") and shall agree to pay the Applicable Taxes and/or to allow Seoul Auction to withhold and pay the Applicable Taxes on behalf of the Consignor to relevant authorities. However, final responsibility regarding the payment of the Applicable Taxes shall rest with the Buyer or the Consignor, and the Consignor shall be responsible for reviewing the existence and scope of all relevant taxation laws and for paying Applicable Taxes.<br>
																9.5 The Consignor shall be responsible to verify the issuance of the tax invoice or the cash payment receipt for the Hammer Price of the Lot. Seoul Auction shall not be responsible or liable for any and all consequences resulting from failure on the part of the Bidder to confirm the possibility of the issuance of tax receipts and/or cash receipts prior to placing a bid, and said consequences shall under no circumstances enable the Buyer to cancel or withdraw a winning bid.
															</p>
															<h4>Article 10 Payments of the Purchase Price and Delivery of Lots</h4>
															<p class="tb1">
																10.1 Seoul Auction shall provide to the Buyer, directly or through an electronic communications network (e-mail, text message, sns, etc.) an invoice indicating the Hammer Price, the Buyer’s Premium and all Buyer’s Expenses due from the Buyer to Seoul Auction pursuant to the list of the Lots, these Auction Terms and the Auction Catalogues and/or elsewhere on the date of the purchase or as soon as possible from the purchase date.<br>
																10.2 With respect to Lot(s) purchased by the Buyer, the Buyer shall pay to Seoul Auction (for itself and/ or on behalf of the Consignor) in accordance with these Auction Terms, the Auction Catalogues and/or elsewhere. The ownership of the artwork shall not transfer until Seoul Auction receives full amount of each of the following:<br>
																10.2.1 the full invoiced amount; and<br>
																10.2.2 any other Buyer's Expenses incurred after the invoice(s) has/have been sent to the Buyer, with all payments to be completed in full within seven calendar days (or within 21 days from the date of the sale of the Lot(s) if the Hammer Price is over 300 million KRW; provided however, 30% of the Purchase Price is paid to Seoul Auction within 7 calendar days from the date of the sale) from, but not including, the date of the sale of the Lot(s). If the Buyer has not remitted all aforementioned payments in full to Seoul Auction by the payment deadline, interest shall be charged at a rate of up to 2% per month on the unpaid amount due up to and including the date of payment. However, Seoul Auction may, at its discretion, waive the interest amount in part or in full, and Seoul Auction and the Buyer may, prior to the sale of the relevant Lot, agree in writing for the Purchase Price of such Lot to be paid in installments.<br>
																10.3 Unless otherwise agreed in writing between the Buyer and Seoul Auction: (i) the Buyer shall be personally liable to pay to Seoul Auction (for itself and/or on behalf of the Consignor) in accordance with these Auction Terms, the Auction Catalogues and/or elsewhere the Purchase Price and/or any Buyer's Expenses payable by the Buyer with respect to any Lot; and (ii) Seoul Auction will not accept any payment due to it (for itself and/or on behalf of the Consignor) from any other party other than the relevant Buyer.<br>
																10.4 If, with respect to any Lot, Seoul Auction (for itself and/or on behalf of the Consignor) does not receive the full amounts payable by the Buyer under this Clause 10 within seven calendar days from, but not including, the date of the sale of such Lot, Seoul Auction may, at its sole and absolute discretion as is delegated,take any of the following measures unless agreed in writing between the Buyer and Seoul Auction:<br>
																10.4.1 cancel the sale of such Lot and charge the Buyer the Buyer Withdrawal Fee which shall be due and payable by the Buyer on demand;<br>
																10.4.2 put up such Lot for resale in another Auction at Seoul Auction;<br>
																10.4.3 disclose any personal information on the Buyer to the relevant Consignor to the extent necessary for that Consignor to claim against the Buyer;<br>
																10.4.4 set off against or pay any amounts which Seoul Auction or any of its Affiliates may owe or be owed by the Buyer in any other transactions, the outstanding amount remaining unpaid by the Buyer; and/or<br>
																10.4.5 take such other action as Seoul Auction deems necessary or appropriate, without prejudice to any other rights or remedies available to Seoul Auction by law.<br>
																10.5 The Buyer may cancel his/her purchase of any Lot within seven calendar days from the Sale date, if agreed previously by Seoul Auction in writing;<br>
																10.5.1 by giving written notice of cancellation to Seoul Auction; and<br>
																10.5.2 paying to Seoul Auction the Buyer Withdrawal Fee, within seven calendar days from, but not including, the date of the sale of such Lot. The sale will be cancelled immediately upon receipt by Seoul Auction of such written notice and the Buyer Withdrawal Fee.<br>
																10.6 Unless otherwise agreed in writing between Seoul Auction and the Buyer, Seoul Auction shall only release the Lot(s) purchased by the Buyer to the Buyer or its authorized representative in accordance with this Clause 10.6. The Buyer shall collect, or procure the collection of, the Lot(s) purchased by him/her at his/her risk and expense within seven calendar days from, but not including, the date of the sale of the Lot(s), provided however, that Seoul Auction shall not be obliged to release any Lot:<br>
																10.6.1 until full payment of all amounts payable by the Buyer to Seoul Auction pursuant to this Clause 10 is duly received by Seoul Auction; or<br>
																10.6.2 without being provided with proof of identity of the collector and (in the case of an authorized representative) proof of authorization, satisfactory to Seoul Auction.<br>
																10.7 If agreed in writing between the Buyer and Seoul Auction, Seoul Auction shall arrange packaging, delivery and transit insurance of the Lot(s) purchased by the Buyer at the Buyer's expense and risk. Seoul Auction shall not be responsible for any damage to, or the loss of, such Lot during packaging and/or the transit period of such Lot, howsoever caused.<br>
																10.8 Seoul Auction shall keep the Lot(s) sold in an Auction at no charge until the expiry of seven calendar days from, but not including, the date of the sale of such Lot(s), after which the Lot(s) will be stored by Seoul Auction at the Buyer's risk. If the Buyer fails to collect any Lot within such time period regardless of whether such failure is caused by Seoul Auction's refusal to release such Lot due to not having received from the Buyer the full amounts due from the Buyer to Seoul Auction (for itself and/or on behalf of the Consignor) with respect to such Lot or not having received proof of identity and/or authorization pursuant to Clause 10.6, the Buyer shall pay to Seoul Auction the full amount of any and all costs including, but not limited to, the storage charge (calculated based on the storage charge per day of the storage facility operated by Seoul Auction) from the date of expiry of the aforementioned time period until the date of collection of such Lot(s) by the Buyer or his/her authorized representative, costs associated with transporting such Lot(s) to the storage facility, insurance fees and any and all other applicable fees. However, Seoul Auction may, at its discretion, waive the aforementioned amount in part or in full.<br>
																10.9 If any Lot is not collected by the Buyer or its authorized representative within 21 calendar days from, but not including, the date of the sale of such Lot for whatever reason, Seoul Auction shall not be liable for any damage to, or the loss of, such Lot(s), howsoever caused.
															</p>
															<h4>Article 11 Export and/or Import Licences</h4>
															<p class="tb1">The Buyer shall be responsible for obtaining any relevant export/import licences and/or permits (the "Licences") required for the export/import of the purchased Lot(s). Seoul Auction may, at the written request of the Buyer, introduce to Buyer a shipper to assist in obtaining the necessary Licences at the Buyer's expense and risk. Seoul Auction shall not be responsible whatsoever with respect to such introduction. Denial of the Licences and/or delay in obtaining the Licences with respect to any Lot shall not be a ground for the Buyer to cancel the sale of such Lot or refuse or delay payment of the full amounts payable by the Buyer to Seoul Auction (for itself and/or on behalf of the Consignor) pursuant to Clause 10.</p>
															<h4>Article 12 Sale After the Auction</h4>
															<p class="tb1">12.1 If any Lot (an "After Sale Lot") is not sold in an Auction because no bid matched or exceeded the Reserve Price at such Auction, Seoul Auction may take any of the following measures;
																12.1.1 receive bids in writing for such After Sale Lot subject to the relevant Reserve Price; and<br>
																12.1.2 accept the highest bid placed in accordance with this Clause 12, provided however, that Seoul Auction shall not be obliged to accept any bid if it deems, at its sole and absolute discretion as is delegated, as reflects the nature of sale through auction, to it, that the relevant Bidder has not provided all documents as may be requested by Seoul Auction pursuant to Clause 12.2 to its satisfaction.<br>
																12.2 A Bidder shall, when placing bids for any After Sale Lot, provide Seoul Auction with any supplementary document as may be requested by Seoul Auction in written notice within the time specified by Seoul Auction in such notice.<br>
																12.3 The Auction for any After Sale Lot shall be established on the date of the invoice from Seoul Auction to the Bidder notifying Seoul Auction's acceptance of his/her bid. The invoice will list the Lot(s) purchased by the Buyer, the Hammer Price, the Buyer's Premium and/or any Buyer's Expenses, due from the Buyer to Seoul Auction pursuant to the Lot purchased by the Buyer, the Auction Terms, the Auction Catalogue and/or elsewhere.<br>
																12.4 Clauses 1, 2, 3, 6, 7, 8, 9, 10, 11, 13, 14, 15, 16, 17, 18 and 19 of these Auction Terms and/or the relevant provisions in the Auction Catalogue and/or elsewhere shall apply with respect to the sale of any After Sale Lot in accordance with this Clause 12
															</p>
															<h4>Article 13 No Representations, Warranties nor Liabilities</h4>
															<p class="tb1">
																13.1 A Bidder agrees and acknowledges that all statements with respect to any Lot including, but not limited to, statements on authorship, title, medium and/or size, contained in any Auction Catalogue and/or elsewhere in writing or made orally by any of Seoul Auction, its directors, officers, employees and/or agents and/or the Seller at any time, are statements of opinion and not statements of fact. Insofar as is permitted by law and except as otherwise expressly provided in this Clause 13, Clause 14 and/or Clause 15, all representations, warranties, conditions, guarantees and stipulations, express or implied, statutory, customary or otherwise with respect to any Lot are and shall be expressly excluded (including, but without limitation, warranties, conditions as to title, rights to dispose, quiet possession, freedom from encumbrances, merchantable or satisfactory quality, fitness for purpose, description, size, quality, attribution, authenticity, medium, provenance or whether such Lot is subject to copyright and/or whether the Consignor and/or the Buyer acquires copyright in such Lot).<br>
																13.2 Insofar as is permitted by law, the Lots shall be sold on an "as is" basis as at the time of sale of the Lots (whether or not the Buyers are in attendance in person at the Auction). Descriptions in the Auction Catalogue and/or elsewhere may on occasion make reference to particular defects or deficiencies of a Lot but the absence of any such description with respect to any Lot shall not mean that such Lot is without defects or deficiencies. The Bidder shall be responsible to conduct his/her own research and satisfying himself/herself of the conditions of the Lots, including, but not limited to, damages and/or restorations of the Lots and with respect to any entries provided in the Auction Catalogues and/or elsewhere. Seoul Auction shall only accept a bid from a Bidder with respect to a Lot on the assumption that the Bidder has satisfied himself/herself of the conditions of such Lot and with respect to any entries provided in the Auction Catalogues and/or elsewhere. Seoul Auction shall not be responsible for damaged frames, howsoever caused.<br>
																13.3 Insofar as is permitted by law and except as otherwise expressly provided in these Auction Terms, the Auction Catalogues and/or elsewhere, neither Seoul Auction nor the Seller shall be liable, with the exception of cases of willful misconduct or gross negligence, to any Bidder or Buyer for the following:<br>
																13.3.1 errors or omissions in information, whether oral or written, provided by any of Seoul Auction, its directors, officers, employees and/or agents and/or the Seller, howsoever caused;<br>
																13.3.2 acts or omissions by any of Seoul Auction, its directors, officers, employees and/or agents and/or the Seller in relation to the conduct of any Auction and/or for any matter relating to the sale of any Lot, howsoever caused.
															</p>
															<h4>Article 14 Limited Warranties</h4>
															<p class="tb1">
																14.1 Seoul Auction warrants that the headline printed in BOLD BLACK with respect to such Lot on the first line in the Auction Catalogue (the "Headline") (as may be amended by any saleroom notice displayed in the auction hall or Seoul Auction official website during the relevant Auction Period) is true and accurate as at the date of the sale of such Lot (hereinafter referred to as the “Limited Warranty”). Provided however, Seoul Auction my limit the warranties on some Headline after a prior notice provided in the Auction Catalogue or the Auction Catalogues and/or elsewhere.<br>
																14.2 Seoul Auction shall not be liable for breach of the Limited Warranty with respect to any Lot unless a claim letter (defined below) with respect to such Lot is given by the Buyer to Seoul Auction in accordance with this Clause 14 before the expiry of three years from, but not including, the date of the sale of such Lot (hereinafter referred to as the "Warranty Period").<br>
																14.3 Subject to Clause 14.2, any Buyer wishing to claim under the Limited Warranty with respect to any Lot shall (i) send to Seoul Auction a letter (hereinafter referred to as the "Claim Letter") stipulating the date of the sale of such Lot, the Lot number and the grounds for his/her claim under the Limited Warranty within three months from, but not including, the date on which he/she became aware of a possible/actual breach of the Limited Warranty; and (ii) return to Seoul Auction the relevant Lot in the same condition as at the time of the sale of such Lot.<br>
																14.4 In the event of a dispute between the Buyer and Seoul Auction with respect to the grounds of the Buyer's claim under the Limited Warranty, Seoul Auction may require the Buyer to obtain, at the Buyer's expense, written opinions of two experts in the field mutually acceptable to Seoul Auction and the Buyer. Seoul Auction shall not be bound by such written opinions provided by the Buyer and may seek additional advice from other experts in the field at its own cost.<br>
																14.5 The Buyer shall not be entitled to claim under the Limited Warranty with respect to any Lot if:<br>
																14.5.1 the relevant Headline corresponded to the generally accepted opinion of scholars or experts at the time of the sale of such Lot;<br>
																14.5.2 the Auction Catalogue description, saleroom notice or Seoul Auction official website indicated that there were possibilities of dissenting opinion(s) from scholar(s) or a group of experts on the relevant Headline; or<br>
																14.5.3 the breach of the Limited Warranty can be proved only by means of either a scientific process not generally accepted for use until after publication of the relevant Auction Catalogue or a process which at the date of publication of the relevant Auction Catalogue was unreasonably expensive or impractical or likely to have caused damage to the Lot.<br>
																14.6 In the case of a breach of the Limited Warranty with respect to a Lot, Seoul Auction shall cancel the sale of such Lot and refund to the Buyer the Purchase Price paid by the Buyer in relation to the Lot.<br>
																14.7 In the event of a breach of the Limited Warranty with respect to a Lot, the Buyer's sole and exclusive remedy against Seoul Auction and/or the Seller shall be the cancellation of the sale and refund of the Purchase Price paid by the Buyer for such Lot. Neither Seoul Auction nor the Seller shall be liable for any special, indirect, consequential loss including, but not limited to, loss of profits or interests. For avoidance of any doubt, Seoul Auction shall not be liable to pay any interest or indemnify any loss incurred as a result of any foreign exchange rate fluctuation or otherwise.<br>
																14.8 The Buyer shall not assign nor transfer the benefits of the Limited Warranty. Unless agreed in writing between Seoul Auction and the Buyer, only the Buyer of the relevant Lot, as shown on the invoice issued by Seoul Auction, shall be eligible to claim under the Limited Warranty, provided that such Buyer shall have remained the owner of the Lot without disposing of any interest to any third party.<br>
																14.9 In the event that Seoul Auction assumes, in the stead of the Consignor, the liability for a breach of the Limited Warranty or any other such liability, the Consignor shall return to Seoul Auction all monies received from Seoul Auction with respect to the relevant Lots and indemnify Seoul Auction for all other consequential losses.<br>
																14.10 In the event that Seoul Auction receives from the Consignor documentation regarding authenticity and/or appraisal and provides the Buyer with any of the aforementioned documentation, Seoul Auction shall warrant only that such documentation provided to the Buyer is identical to such documentation received from the Consignor. Seoul Auction makes no warranties regarding the authenticity or validity of any documentation received from the Consignor or the contents thereof.
															</p>
															<h4>15 Limited Liability</h4>
															<p class="tb1">
																15.1 Without prejudice to Clauses 13 and/or 14 above, a Bidder's or Buyer's sole and exclusive remedy to any claim made by it against Seoul Auction and/or the Seller arising out of, or in connections with these Auction Terms, the Auction Catalogues and/or elsewhere with respect to any Lot shall be damages up to the Purchase Price of such Lot. Neither Seoul Auction nor the Seller shall be liable for any special, indirect, consequential loss including, but not limited to, loss of profits or loss of interest. For avoidance of any doubt, Seoul Auction shall not be liable to pay any interest or indemnify any loss incurred as a result of any foreign exchange rate fluctuation or otherwise.<br>
																15.2 These Auction Terms in no part shall exclude or limit Seoul Auction's liability with respect to any fraud, death or personal injury arising out of, or in connection with, any action or inaction by any of Seoul Auction, its officers, employees and/or agents in relation to the conduct of any Auction and/or sale of Lots.
															</p>
															<h4>Article 16 Amendments to the Auction Terms and the Auction Catalogue</h4>
															<p class="tb1">
																16.1 Seoul Auction may, at its discretion and at any time, amend the provisions of these Auction Terms. Any such amendments shall be posted on the first page of Seoul Auction’s official website at least seven calendar days prior to the effective date of any amendments relating to general terms, or at least thirty calendar days prior to the effective date of any amendments relating to key provisions or amendments disadvantageous to the client, and the relevant information shall be modified in the Auction Catalogue and/or elsewhere.<br>
																16.2 Seoul Auction may, at its discretion and at any time, amend any information in an Auction Catalogue and/or elsewhere including, but not limited to, the Auction Catalogue and/or elsewhere, and any such amendments shall be posted on Seoul Auction’s official website during the relevant Auction Period.
															</p>
															<h4>Article 17 Information Protection</h4>
															<p class="tb1">
																17.1 Prospective Bidders, Bidders and/or Buyers may be required to provide personal information in connection with placing bids for, and purchasing of, Lots at the Auction, and by agreeing to these Auction Terms, Consignors, Prospective Bidders, Bidders and/or Buyers agree to the collection and use of such personal information. All personal information may be used for the following purposes:<br>
																(i) all matters connected to the management and operation of Seoul Auction's business and the marketing and supply of Seoul Auction's services;<br>
																(ii) the transfer of such information to any place in and outside of Korea; and/or<br>
																(iii) any purpose relating to or in connection with compliance with any law, regulation, court order or order of a regulatory body.<br>
																17.2 All personal information shall be kept confidential, and Consignors, Prospective Bidders, Bidders and/or Buyers shall be deemed to have agreed. However, subject to the provisions of any applicable laws, the information may be disclosed to or used by any of the following companies or persons:<br>
																(i) Seoul Auction, its Affiliates and/or the Group;<br>
																(ii) any director, officer or employee of the Group, but only when carrying out the business of the Group;<br>
																(iii) any agent, contractor, third party service provider or other person authorised by the Group to provide administrative, telecommunications, computer or insurance, shipping or any other services to the Group in connection with the operation of its business;<br>
																(iv) credit reference agencies and, in the event of default, debt collection agencies;<br>
																(v) any other person under a duty of confidentiality to the Group; and/or<br>
																(vi) any person to whom the Group is under an obligation to make disclosure under the requirements of any law, regulation, court order or order of a regulatory body.<br>
																17.3 In general, and subject to certain exemptions, Prospective Bidders, Bidders and/or Buyers shall be entitled to claim the following measures:<br>
																(i) request access to his/her personal information, which shall be provided within 40 days;<br>
																(ii) request the correction or deletion of his/her personal information, which shall be made within 40 days; and/or<br>
																(iii) be given reasons if a request for access, correction or deletion is refused or unable to be complied with within 40 days.<br>
																17.4 Any request for access to and/or correction of Prospective Bidders, Bidders and/or Buyers' personal information, or for information regarding Seoul Auction's information protection policies and practices and the kinds of personal information held by Seoul Auction, shall be sent to Seoul Auction in accordance with Clause 18.6. Seoul Auction shall have the right to charge a reasonable fee for the processing of any request to access information.<br>
																17.5 If a Prospective Bidder, Bidder or Buyer is a corporate entity, Seoul Auction shall not use the personal information of such entity's data subjects for any purpose other than the purposes for which such entity notified its data subjects at the time of the collection of the information by such entity or a purpose directly related to that purpose (except where Seoul Auction has obtained the written consent of the data subject). The corporate prospective Bidder, Bidder or Buyer by signing the relevant registration form, confirms that (i) it has notified its data subjects that their personal information may be used for the purposes specified in Clause 17.1 and (ii) it agrees to indemnify Seoul Auction in relation to any loss or damage suffered by Seoul Auction as a result of its failure to notify its data subjects as set out in (i) above.
															</p>
															<h4>18. Application for the General Purchase Contract</h4>
															<p class="tb1">
																In case Seoul Auction is entrusted with an artwork to sell a Lot through General Purchase Contract or sells a Lot through a General Purchase Contract, the provisions of Clause 1 (Purpose), Clause 2 (Definitions), Clause 3 (Seoul Auction as an Agent or as the Seller), Clause 6 (Estimated Price), Clause 8 (Promotional Materials), Clause 9 (Buyer’s Premium), Clause 10 (Payment of the Purchase Price and Delivery of the Lot), Clause 11 (Export/ Import Licenses), Clause 13 (No Representations, Warranties and Responsibilities), Clause 14 (Limited Warranty), Clause 15 (Limited Liabilities), Clause 16 (Amendments to the Auction Terms and Auction Catalogues), Clause 17 (Information Protection), Clause 19 (Miscellaneous) and Clause 20 (Jurisdiction and Governing Laws) shall apply, unless otherwise agreed between the Consignor, Seller and Purchaser and not against the nature of the General Purchase Contract. In such a case, ‘Auction’ shall be ‘purchase contract,’ ‘Lot’ shall be ‘object of sales,’ ‘Auction Catalogue’ shall be ‘all documents in any form provided by Seoul Auction in relation to the concerned purchase contract (including but not limited to website, e-mail, text message, smart-phone application, listbook, brochure, condition report, proposal, research data, promotional material, advertisements, printouts, etc.), ’Bid’ and ‘successful Bid’ shall be ‘execution or establishment of a purchase contract,’ ‘Bidder’ and ‘Buyer’ shall be ‘Purchaser,’ ‘Bid Date’ shall be ‘purchase contract date,’ ‘Bid Price’ or ‘Bid Amount’ shall be ‘purchase price,’ ‘Bid Withdrawal Fee’ shall be ‘purchase contract withdrawal fee,’ and ‘Headline’ shall be ‘terms on the warranty.’
															</p>
															<h4>Article 19 Miscellaneous</h4>
															<p class="tb1">
																19.1 In the following case, Seoul Auction may occupy the Objects of the Consignor and Buyer under the management of Seoul Auction until the concerned time:
																19.1.1 Until the Consignor or the Buyer makes full payment of the amount payable to Seoul Auction or its affiliated companies;<br>
																19.1.2 Until a reasonable time, in case Seoul Auction becomes aware of a person asserting ownership or other rights on the Lot or upon reasonable suspicion on the authenticity of the Lot; 19.1.3 Until a client verification and registration procedure is completed to a level satisfactory to Seoul Auction; and/or<br>
																19.1.4 Until the time necessary when Seoul Auction is deemed to retain the concerned Object pursuant to relevant laws or due to government investigation. In such a case, Seoul Auction may levy storage fee or insurance fee to the concerned Consignor or the Buyer or Seoul Auction may transfer the Object to a warehouse of a third party or Seoul Auction and levy transportation fee, storage fee and insurance fee.<br>
																19.2 In case the Consignor or the Buyer needs to pay a certain amount to Seoul Auction or its affiliated company, Seoul Auction may sell the Objects of the Consignor or the Buyer retained by Seoul Auction in a reasonable method under as determined by Seoul Auction.<br>
																19.3 The Consignor or the Buyer permits Seoul Auction or its affiliated company to use the amounts payable to the Consignor or the Buyer for the following:<br>
																19.3.1 Payment of the amount payable to Seoul Auction by the Consignor or the Buyer;<br>
																19.3.2 Payment of the amount payable to its affiliated company on behalf of the Consignor or the Buyer.<br>
																19.4 Any and all payments due under these Auction Terms, the Auction Catalogues and/or elsewhere shall be payable in Korean Won. If the Buyer and Seoul Auction agree in writing for the Buyer to pay any amount due to Seoul Auction (for itself and/or on behalf of the Consignor), or for Seoul Auction to pay any amount due to it, in any currency other than Korean Won, the Buyer shall be liable to pay any additional expenses including, but not limited to, bank commissions and/or charges incurred by Seoul Auction in converting the Korean Won into such other currency. Any currency conversion shall be determined by Seoul Auction based on the rate for Korean Won provided by Seoul Money Brokerage Service on the date of payment or the specific date determined by Seoul Auction and Seoul Auction's decision as to such rate shall be conclusive. For avoidance of any doubt, Seoul Auction shall not be liable to indemnify any loss incurred as a result of any foreign exchange rate fluctuation or otherwise.<br>
																19.5 Any and all payments under these Auction Terms, the Auction Catalogues and/or elsewhere shall be made in cash or equivalent, including electronic remittance, cashiers checks and/or bank money orders in good cleared funds and in accordance with the these Auction Terms, the Auction Catalogues and/or elsewhere. With respect to any payment under these Auction Terms, the Auction Catalogues and/or elsewhere, if the payment due date is not a Business Day, then the immediately following Business Day shall be deemed to be the payment due date.<br>
																19.6 If any part of these Auction Terms, the Auction Catalogues and/or elsewhere is found by any court to be invalid, illegal or unenforceable, that part may be discounted and the rest of these Auction Terms, the Auction Catalogues and/or elsewhere shall continue to be valid and enforceable to the fullest extent permitted by law.<br>
																19.7 All notices, requests, claims, demands and other communications to Seoul Auction under these Auction Terms, the Auction Catalogues and/or elsewhere shall be in Korean or English in writing and shall be given or made (and shall be deemed to have been duly given or made upon receipt) by delivery in person, by registered mail, by facsimile with receipt confirmed (followed by delivery of an original via registered mail), by email with receipt confirmed by Seoul Auction (followed by delivery of an original via registered mail) or by registered mail to Seoul Auction at the following address:<br>
																<br>
																Seoul Auction Co. Ltd.,<br>
																11, Pyeongchang 31-gil, Jongno-gu, Seoul, Korea<br>
																Tel +82 (0)2 395 0330<br>
																Fax +82 (0)2 395 0338<br>
																E: info@seoulauction.com<br>
																<br>
																Notices to Consignors, Bidders and Buyers shall be provided to the address specified in the relate registration form or through the electronic communications network (e-mail, text message, SNS, etc.) to the following address. The relevant person shall notify Seoul Auction, in writing, in case of any changes to the address or contact information. If the relevant person is negligent in providing the notice and Seoul Auction’s notice, etc. is not delivered, he/she shall not raise any objections when the delivery is deemed to have been made on the date the notice from Seoul Auction typically would have arrived.<br>
																<br>
																19.8 Time shall be of the essence of these Auction Terms, the Auction Catalogues and/or elsewhere both as regards any dates, times and periods mentioned and as regards any dates, times and periods which may be substituted for them in accordance with these Auction Terms or by agreement in writing between the parties.<br>
																19.9 No waiver by or on behalf of Seoul Auction of any requirement of or any rights under these Auction Terms, the Auction Catalogues and/or elsewhere shall release any other party(ies) from the full performance of its/their remaining obligations under these Auction Terms, the Auction Catalogues and/or elsewhere. No single or partial exercise of or failure or delay in exercising, on the part of Seoul Auction, any right, power or remedy under these Auction Terms, the Auction Catalogues and/or elsewhere or the granting of time by Seoul Auction shall prejudice, affect or restrict the rights, powers and remedies of Seoul Auction under these Auction Terms, the Auction Catalogues and/or elsewhere, nor shall any waiver by Seoul Auction of any breach of these Auction Terms, the Auction Catalogues and/or elsewhere operate as a waiver of or in relation to any subsequent or any continuing breach of these Auction Terms, the Auction Catalogues and/or elsewhere.<br>
																19.10 These Auction Terms, the Auction Catalogues and/or elsewhere as amended from time to time in accordance with these Auction Terms set out the entire agreement and understanding between the parties relating to the subject matter hereof to the exclusion of any terms implied by law which may be excluded by contract and supersedes any previous written or oral agreement between the parties in relation to the matters dealt with in these Auction Terms, the Auction Catalogues and/or elsewhere as amended from time to time in accordance with these Auction Terms. It is agreed that no party has been induced to enter into these Auction Terms, the Auction Catalogues and/or elsewhere by any representation, warranty or undertaking not expressly incorporated in.<br>
																19.11 In the case of any ambiguity or discrepancy between the English, Chinese and/or Korean version of these Auction Terms, the Korean version shall prevail.
															</p>
															<h4>Article 20 Jurisdiction and Governing Law</h4>
															<p class="tb1">These Auction Terms shall be governed by the laws of Korea. The Seoul Central District Court shall have exclusive jurisdiction to settle any disputes which may arise out of or in connection with these Auction Terms, the Auction Catalogues and/or elsewhere. All Consignors, Bidders and Buyers irrevocably consent to the service of process or any other documents in connection with proceedings in any court by facsimile transmission, delivery in person, delivery by mail or in any other manner permitted by Korean law, at the law of the place of service or the law of jurisdiction where proceedings are instituted, at the last address of the Consignors, Bidders or the Buyers known to Seoul Auction or any other usual address.</p>
														</div>
		                                            </div>
		                                        </li>
												<li class="trp_acitem" data-index="2">
		                                            <div class="header-area">
														<div class="accordion_name eng_accordion">
		                                                    <div class="trp checkbox-box">
		                                                        <input id="checkbox_all3" tabindex="18" class="js_item" type="checkbox" name="chk_per" ng-change="onChangeCheckbox_P()"ng-model="form_data.personAgree1">
		                                                        <i></i>
		                                                        <label for="checkbox_all3"><span class="required">[Required]</span> Consent to collection<br class="only-pc"> and use of personal information</label>
		                                                    </div>
		                                                </div>
		                                                <a href="#" class="acc_btn">
															<i class="icon-accordion_arrow_down"></i>
		                                                </a>
		                                            </div>
		                                            <div class="con-area">
														<div class="policy_cont scroll-type">
															<p class="tb1">Seoul Auction Co., Ltd. collects the following minimum amount of personal information to manage members and provide quality services according to the consent of the information subject. The collected personal information will not be used for any purpose other than this collection and use purpose.
															</p>
															<h4>Collected items</h4>
															<p class="tb1">
																(Required)Name , date of birth , gender , login ID , password , home address , mobile phone number , email<br>
																(Optional)Home phone number
															</p>
															<h4>Purpose of collection and use of personal information</h4>
															<p class="tb1">
																The company uses the collected personal information for the following purposes.<br>
																1.Implementation of contract for service provision and provision of fee settlement contents according to service provision, purchase and payment through auction, etc., product delivery or billing address, financial transaction identity verification and financial service<br>
																2.Member management: Identity verification according to membership service use, personal identification, prevention of illegal use by bad members and prevention of unauthorized use, confirmation of intent to join, age verification, complaint handling, complaint handling, etc., delivery of notices
															</p>
															<h4>Period of retention and use of personal information</h4>
															<p class="tb1">In principle, after the purpose of collecting and using personal information is achieved, the information is destroyed without delay. However, if it is necessary to preserve in accordance with the provisions of the relevant laws, the member information is kept for a certain period set by the relevant laws and regulations.</p>
															<h4>The fact that you have the right to refuse consent and the disadvantages caused by refusal of consent</h4>
															<p class="tb1">*The above items are the minimum personal information necessary to provide the service, so if you refuse to agree, you will not be able to use the service, such as membership registration or auction participation.</p>
														</div>
		                                            </div>
		                                        </li>
		
		                                        <li class="trp_acitem" data-index="3">
		                                            <div class="header-area">
														<div class="accordion_name eng_accordion">
		                                                    <div class="trp checkbox-box">
		                                                        <input id="checkbox_all4" tabindex="19" class="js_item" type="checkbox" name="chk_per" ng-change="onChangeCheckbox_P()" ng-model="form_data.maketingAgree1">
		                                                        <i></i>
		                                                        <label for="checkbox_all4"><span>[Optional]</span> Consent to use of infor<br class="only-pc">mation for publicity and marketing</label>
		                                                    </div>
		                                                </div>
		                                                <a href="#" class="acc_btn" id="marketingPerson">
															<i class="icon-accordion_arrow_down"></i>
		                                                </a>
		                                            </div>
		                                            <div class="con-area">
														<div class="policy_cont tb1 scroll_no">
															Purpose of collection : For publicity and marketing purposes, such as providing company auction information, information on auction schedule, exhibition and new business introduction<br>
															Collection items : mobile phone number, e-mail address<br><br>

															*You may refuse to consent to the use of the company for promotional and marketing purposes, but in this case, auction information and auction schedule information services may be limited.
														</div>

		                                                <dl class="receive_info">
															<dt class="mem_txt">How to receive information</dt>
		                                                    <dd>
		                                                        <span class="trp checkbox-box">
		                                                            <input id="checkbox_1" tabindex="20" class="" type="checkbox" name="pushway_per" ng-change="clickPushWay()" ng-model="form_data.push_way_email">
		                                                            <i></i>
		                                                            <label for="checkbox_1">Email</label>
		                                                        </span>
		
		                                                        <span class="trp checkbox-box">
		                                                            <input id="checkbox_2" tabindex="21" class="" type="checkbox" name="pushway_per" ng-change="clickPushWay()" ng-model="form_data.push_way_sms">
		                                                            <i></i>
		                                                            <label for="checkbox_2">SMS</label>
		                                                        </span>
		
		                                                        <span class="trp checkbox-box">
		                                                            <input id="checkbox_3" tabindex="22" class="" type="checkbox" name="pushway_per" ng-change="clickPushWay()" ng-model="form_data.push_way_phone">
		                                                            <i></i>
		                                                            <label for="checkbox_3">Phone</label>
		                                                        </span>
		                                                    </dd>
		                                                </dl>
		                                            </div>
		                                        </li>
		                                    </ul>
		                                </div>
		                            </div>
		
		                        </div>
								</form>
		                        <div class="panel-footer">
		                            <article class="button-area">
		                                <div class="btn_set-float tac" ng-click="join()">
		                                    <a class="btn btn_point btn_lg disabled" tabindex="23" href="#" role="button" id="joinButton"><span>SAVE</span></a>
		                                </div>
		                            </article>
		                        </div>
		                    </div>
		                </div>
		            </section>
		        </div>
		        
		    </div>
    		<jsp:include page="../../include/en/footer.jsp" flush="false"/>
			<!-- stykey -->

			<div class="scroll_top-box">
				<div class="box-inner">
					<a href="#" class="btn-scroll_top js-scroll_top"><i class="icon-scroll_top"></i></a>
				</div>
			</div>
			<!-- // stykey -->

		</div>
    </div>
    
    <!-- validation alert -->
	<div id="popup_idsearch3-wrap" class="trp popupfixed-wrap login-popup">
	    <div class="popup-dim"></div>
	    <div class="popup-align mode-ms mode-mb_center">
	        <div class="popup-vertical">
	            <div class="popup-layer">
	                <div class="pop-panel">
	                    <div class="pop-header">
	                        <a class="btn_close icon-pop_close js-closepop" href="#" title="닫기">X</a>
	                        <div class="ico_box">
	                            <img class="only_ib-pc" src="/images/mobile/login/search_ico_01_pc.png">
	                            <img class="only_ib-mb" src="/images/mobile/login/search_ico_01.png">
	                        </div>
	                        <div class="title-box_tac title_md">
	                            <span class="title_tac tt4" id="alertMsg">필수 항목명을 입력해 주세요.</span>
	                        </div>
	                    </div>
	                    <div class="pop-body">
	                        <!--[0523]-->
	                        <article class="confirm_btn confirm_btn_md">
	                            <div class="btn_set-float tac">
	                                <a class="btn btn_point" href="#" role="button"><span>확인</span></a>
	                            </div>
	                        </article>
	                        <!--//[0523]-->
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div>
	</div>
	</body>
	<script>
		app.value('locale', 'en');
		var loginId = '${socialLoginId }';
		var name = '${name }';
		var email = '${email }';
		var socialLoginId = '${socialLoginId }';
		var socialEmail = '${socialEmail }';
	</script>
	<script src="/js/plugin/jquerylibrary.js" type="text/javascript"></script>
	<script src="/js/pages_common_ko.js" type="text/javascript"></script>
	<link rel="stylesheet" href="/css/plugin/csslibrary.css" type="text/css">
	<link rel="stylesheet" href="/css/pages_common_ko.css" type="text/css">
	<script type="text/javascript" src="/js/customer/join.js"></script>
</html>