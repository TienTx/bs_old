
function getContextPath() {
    return window.location.pathname.substring(0, window.location.pathname.indexOf("/", 2));
}
var contextPath = getContextPath();

//change value state option
$(document).ready(function () {
    $('.stateOption select').change(function () {
        var target = $(this);
        var state = target.val();
        var btOption = target.parent().parent().parent().find("button");
        var idOrder = btOption.attr("data-bind");
        btOption.attr("data-bind", idOrder + "#" + state);
        btOption.removeAttr("disabled");
    });
});

$(document).ready(function () {
    //update state
    $(".updateOrder").click(function (e) {
        var itemData = $(this).attr("data-bind");
        $.ajax({
            type: "POST",
            url: contextPath + "/seller/updateOrder",
            header: {
                Accept: "application/json; charset=utf-8",
                "Content-Type": "application/json; charset=utf-8"
            },
            data: "orderData=" + itemData + "&crUrl=" + $(location).attr('href'),
            success: function (response) {
                if (response !== null && response !== "cancelUpdateOrder") {
                    $(location).attr("href", response);
                } else {
                    $('.mnOrder h2').html("Update không thành công! Vui lòng thử lại!");
                }
            }
        });
        e.preventDefault();
    });
    //apply deals
    $(".applyDeals").click(function (e) {
        var taget = $(this);
        var itemData = taget.attr("data-bind");
        $.ajax({
            type: "POST",
            url: contextPath + "/staffstore/deals/applydeals",
            header: {
                Accept: "application/json; charset=utf-8",
                "Content-Type": "application/json; charset=utf-8"
            },
            data: "idB=" + itemData.split("#")[0] + "&idD=" + itemData.split("#")[1] + "&code=" + itemData.split("#")[2],
            success: function (response) {
                if (response !== null && response !== "canntApply") {
                    taget.replaceWith("<button>Đã áp dụng</button>");
                    setTimeout(function () {
                        window.location.reload();
                    }, 1000);
                }
            }
        });
        e.preventDefault();
    });
    //cancel deals
    $(".cancelDeals").click(function (e) {
        var taget = $(this);
        var itemData = taget.attr("data-bind");
        $.ajax({
            type: "POST",
            url: contextPath + "/staffstore/deals/canceldeals",
            header: {
                Accept: "application/json; charset=utf-8",
                "Content-Type": "application/json; charset=utf-8"
            },
            data: "idB=" + itemData.split("#")[0] + "&idD=" + itemData.split("#")[1] + "&code=" + itemData.split("#")[2],
            success: function (response) {
                if (response !== null && response !== "Fail") {
                    taget.replaceWith("<button>Đã huỷ áp dụng</button>");
                    setTimeout(function () {
                        window.location.reload();
                    }, 1000);
                }
            }
        });
        e.preventDefault();
    });
    //log out
    $("#lobtn").click(function (e) {
        $.ajax({
            type: "POST",
            url: contextPath + "/admin/logout",
            header: {
                Accept: "application/json; charset=utf-8",
                "Content-Type": "application/json; charset=utf-8"
            },
            success: function (response) {
                if (response !== null && response !== "Fail") {
                    $(location).attr("href", response);
                }
            }
        });
        e.preventDefault();
    });
    //delete deals
    $(".deleteDeals").click(function (e) {
        alert(1);
        var itemData = $(this).attr("data-bind");
        $.ajax({
            type: "POST",
            url: contextPath + "/staffstore/deleteDeals",
            header: {
                Accept: "application/json; charset=utf-8",
                "Content-Type": "application/json; charset=utf-8"
            },
            data: "crId=" + itemData,
            success: function (response) {
                alert(response);
                if (response !== null && response !== "Fail") {
                    window.location.reload();
                }
            }
        });
        e.preventDefault();
    });
    //add deals
    $("#addDeals").submit(function (e) {
        $.ajax({
            type: "POST",
            url: contextPath + "/staffstore/addDeals",
            header: {
                Accept: "application/json; charset=utf-8",
                "Content-Type": "application/json; charset=utf-8"
            },
            data: $("#addDeals").serialize(),
            success: function (response) {
                if (response !== null && response === "OK") {
                    window.location.reload();
                } else {
                    $('#addDeals h2').removeClass("hide");
                }
            }
        });
        e.preventDefault();
    });
    //EDIT deals
    $("#dtDeals").submit(function (e) {
        $.ajax({
            type: "POST",
            url: contextPath + "/staffstore/editDeals",
            header: {
                Accept: "application/json; charset=utf-8",
                "Content-Type": "application/json; charset=utf-8"
            },
            data: $("#dtDeals").serialize(),
            success: function (response) {
                if (response !== null && response !== "Fail") {
                    $(location).attr("href", response);
                } else {
                    $('#dtDeals h2').removeClass("hide");
                }
            }
        });
        e.preventDefault();
    });

    $('#dtDeals').find("input").attr("disabled", "disabled");
    $('#dtDeals').find("select").attr("disabled", "disabled");
    $('#editDeals').click(function () {
        $(this).parent().find("form").find("input").removeAttr("disabled");
        $(this).parent().find("form").find("select").removeAttr("disabled");
        $(this).parent().find("#cancelEdit").removeClass("hide");
        $(this).addClass("hide");
    });
    $('#cancelEdit').click(function () {
        $(this).parent().find("form").find("input").attr("disabled", "disabled");
        $(this).parent().find("form").find("select").attr("disabled", "disabled");
        $(this).parent().find("#editDeals").removeClass("hide");
        $(this).addClass("hide");
    });
    $('.adNav').height($('.mnOrder').height());
});

// StaffManager
$(document).ready(function () {
    $('.btnDelBook').click(function () {
        var idBook = $(this).attr("data-id");
        delBook(idBook);
    });
    $('.odop').click(function () {
        $('#odcart').slideDown(500);
    });

    $("#odcart").submit(function (e) {
        $.ajax({
            type: "POST",
            url: contextPath + "/staffmanager/orderDistributor",
            header: {
                Accept: "application/json; charset=utf-8",
                "Content-Type": "application/json; charset=utf-8"
            },
            data: $("#odcart").serialize(),
            success: function (response) {
                if(response === "true"){
                    alert('Đặt hàng thành công');
                    window.location = contextPath + "/staffmanager";
                }else{
                    alert('Xảy ra lỗi');
                }
//                if (response !== null && response === "OK") {
//                    $(location).attr("href", contextPath + "/ordersuccessful.html");
//                } else {
//                    $('#ordererror h2').removeClass("hide");
//                }
            }
        });

        e.preventDefault();
    });
});
function delBook(idBook) {
    $.ajax({
        type: "POST",
        data: "idBook=" + idBook,
        url: contextPath + "/staffmanager/delBook",
        header: {
            Accept: "application/json; charset=utf-8",
            "Content-Type": "application/json; charset=utf-8"
        },
        success: function (response) {
            if (response === "true") {
                window.location.reload();
            }
        }
    });
}
function convertString(str) {
    str = str.trim();
    str = str.replaceAll("\\s+", "-");
    str = str.replaceAll("\\-+", "-");
    str = str.replaceAll("(à|á|ạ|ả|ã|â|ầ|ấ|ậ|ẩ|ẫ|ă|ằ|ắ|ặ|ẳ|ẵ)", "a");
    str = str.replaceAll("(è|é|ẹ|ẻ|ẽ|ê|ề|ế|ệ|ể|ễ)", "e");
    str = str.replaceAll("(ì|í|ị|ỉ|ĩ)", "i");
    str = str.replaceAll("(ò|ó|ọ|ỏ|õ|ô|ồ|ố|ộ|ổ|ỗ|ơ|ờ|ớ|ợ|ở|ỡ)", "o");
    str = str.replaceAll("(ù|ú|ụ|ủ|ũ|ư|ừ|ứ|ự|ử|ữ)", "u");
    str = str.replaceAll("(ỳ|ý|ỵ|ỷ|ỹ)", "y");
    str = str.replaceAll("(đ)", "d");
    str = str.replaceAll("ç", "c");
    str = str.replaceAll("Ç", "C");
    str = str.replaceAll("\\`|\\~|\\!|\\@|\\#|\\$|\\%|\\^|\\&|\\*|\\(|"
            + "\\)|\\_|\\=|\\+|\\{|\\[|\\}|\\]|\\<|\\,|\\>|\\.|\\?|"
            + "\\/|\\;|\\:", "");
    str = str.replaceAll("(À|Á|Ạ|Ả|Ã|Â|Ầ|Ấ|Ậ|Ẩ|Ẫ|Ă|Ằ|Ắ|Ặ|Ẳ|Ẵ)", "A");
    str = str.replaceAll("(È|É|Ẹ|Ẻ|Ẽ|Ê|Ề|Ế|Ệ|Ể|Ễ)", "E");
    str = str.replaceAll("(Ì|Í|Ị|Ỉ|Ĩ)", "I");
    str = str.replaceAll("(Ò|Ó|Ọ|Ỏ|Õ|Ô|Ồ|Ố|Ộ|Ổ|Ỗ|Ơ|Ờ|Ớ|Ợ|Ở|Ỡ)", "O");
    str = str.replaceAll("(Ù|Ú|Ụ|Ủ|Ũ|Ư|Ừ|Ứ|Ự|Ử|Ữ)", "U");
    str = str.replaceAll("(Ỳ|Ý|Ỵ|Ỷ|Ỹ)", "Y");
    str = str.replaceAll("(Đ)", "D");
    str = str.replaceAll("'", "");
    str = str.toLowerCase();
    return str;
}
