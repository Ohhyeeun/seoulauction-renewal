Date.prototype.format = function (f) {
    if (!this.valueOf()) return " ";

    var weekName = ["일", "월", "화", "수", "목", "금", "토"];
    var d = this;

    return f.replace(/(yyyy|yy|MM|dd|E|hh|mm|ss|a\/p)/gi, function ($1) {
        switch ($1) {
            case "yyyy":
                return d.getFullYear();
            case "yy":
                return (d.getFullYear() % 1000).zf(2);
            case "MM":
                return (d.getMonth() + 1).zf(2);
            case "dd":
                return d.getDate().zf(2);
            case "E":
                return weekName[d.getDay()];
            case "HH":
                return d.getHours().zf(2);
            case "hh":
                return ((h = d.getHours() % 12) ? h : 12).zf(2);
            case "mm":
                return d.getMinutes().zf(2);
            case "ss":
                return d.getSeconds().zf(2);
            case "a/p":
                return d.getHours() < 12 ? "오전" : "오후";
            default:
                return $1;
        }
    });
};
String.prototype.string = function (len) {
    var s = '', i = 0;
    while (i++ < len) {
        s += this;
    }
    return s;
};
String.prototype.zf = function (len) {
    return "0".string(len - this.length) + this;
};
Number.prototype.zf = function (len) {
    return this.toString().zf(len);
};
// 커넥션정보
let w;

let con_try_cnt = 0;
let end_bid_time = 0;
let is_end_bid = false;

// 자동 응찰
let autoBiding = async function () {
    let val = $("#reservation_bid").val();
    let datet = new Date();
    let response = await fetch('https://dev-bid.seoulauction.xyz/bid', {
        method: "POST", body: JSON.stringify({
            customer: {
                sale_no: parseInt($("#sale_no").val()),
                lot_no: parseInt($("#lot_no").val()),
                cust_no: parseInt($("#cust_no").val()),
                paddle: 0,
                user_id: $("#user_id").val(),
                token: $("#token").val(),
                sale_type: 2,
                bid_type: 22,
            }, bid_cost: parseInt(val),
        }),
    });
    let vv = response.json();
    return vv;
}

// 1회 응찰
let biding = async function () {
    let val = document.getElementById("bid_new_cost_val").getAttribute("value");
    let url = '';
    if (window.location.protocol !== "https:") {
        url = 'http://dev-bid.seoulauction.xyz/bid';
    } else {
        url = 'https://dev-bid.seoulauction.xyz/bid';
    }
    let response = await fetch(url, {
        method: "POST", body: JSON.stringify({
            customer: {
                sale_no: parseInt($("#sale_no").val()),
                lot_no: parseInt($("#lot_no").val()),
                paddle: 0,
                user_id: $("#user_id").val(),
                cust_no: parseInt($("#cust_no").val()),
                token: $("#token").val(),
                sale_type: 2,
                bid_type: 21,
            }, bid_cost: parseInt(val),
        }),
    });
    let vv = response.json();
    return vv;
}

function bid() {
    biding();
}

// 자동응찰
function autoBid() {
    if ($("#reservation_bid").prop("disabled")) {
        var bidding_stop = $("#auto_bid_btn").trpLayerFixedPopup("#bidding_stop-wrap");
        bidding_stop.open(this); // or false
        popup_fixation("#bidding_stop-wrap");

        $("#bidding_stop-wrap .js-closepop, #bidding_stop-wrap .popup-dim, #auto_off_cancel, #auto_off_ok").bind("click", function($e) {
            $e.preventDefault();
            if ($(this).attr("id") === "auto_off_ok") {
                autoBiding();
                bidding_stop.close();
                $("#bidding_stop-wrap .js-closepop, #bidding_stop-wrap .popup-dim, #auto_off_cancel, #auto_off_ok").unbind("click");
                return
            }
            $("#bidding_stop-wrap .js-closepop, #bidding_stop-wrap .popup-dim, #auto_on_cancel, #auto_on_ok").unbind("click");
            bidding_stop.close();
        });
    } else {
        var bidding_go = $("#auto_bid_btn").trpLayerFixedPopup("#bidding_go-wrap");
        bidding_go.open(this); // or false
        popup_fixation("#bidding_go-wrap");

        $("#bidding_go-wrap .js-closepop, #bidding_go-wrap .popup-dim, #auto_on_cancel, #auto_on_ok").bind("click", function($e) {
            $e.preventDefault();
            if ($(this).attr("id") === "auto_on_ok") {
                autoBiding();
                bidding_go.close();
                $("#bidding_go-wrap .js-closepop, #bidding_go-wrap .popup-dim, #auto_on_cancel, #auto_on_ok").unbind("click");
                return
            }
            $("#bidding_go-wrap .js-closepop, #bidding_go-wrap .popup-dim, #auto_on_cancel, #auto_on_ok").unbind("click");
            bidding_go.close();
        });
    }
}
