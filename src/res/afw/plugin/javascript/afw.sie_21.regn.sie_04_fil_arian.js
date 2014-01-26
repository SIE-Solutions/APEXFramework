afw.jQuery(function () {
    window.onhashchange = function () {
        if (window.location.hash != "") {
            afw.jQuery(".navbar-sub1").addClass("outoffocus").removeClass("fixed");
            afw.jQuery(".navbar-sub2").addClass("outoffocus").removeClass("fixed");
        }
    };

    var postn_refrn = afw.jQuery(window).scrollTop();

    afw.jQuery(window).scroll(function () {
        var postn = afw.jQuery(window).scrollTop();

        if (postn == 0) {
            //on scroll top
            postn_refrn = postn;
            afw.jQuery(".navbar-sub1").addClass("top").removeClass("fixed").removeClass("outoffocus");
            afw.jQuery(".navbar-sub2").addClass("top").removeClass("fixed").removeClass("outoffocus");
        }
        else if (postn > postn_refrn) {
            //on scroll down
            postn_refrn = postn;
            afw.jQuery(".navbar-sub1").addClass("outoffocus").removeClass("fixed").removeClass("top");
            afw.jQuery(".navbar-sub2").addClass("outoffocus").removeClass("fixed").removeClass("top");

        } else if (postn < postn_refrn) {
            //on scroll top
            postn_refrn = postn;
            afw.jQuery(".navbar-sub1").addClass("fixed").removeClass("outoffocus").removeClass("top");
            afw.jQuery(".navbar-sub2").addClass("fixed").removeClass("outoffocus").removeClass("top");
        }
    });
});