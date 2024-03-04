/**
 * NukeViet Content Management System
 * @version 4.x
 * @author VINADES.,JSC <contact@vinades.vn>
 * @copyright (C) 2009-2021 VINADES.,JSC. All rights reserved
 * @license GNU/GPL version 2 or any later version
 * @see https://github.com/nukeviet The NukeViet CMS GitHub project
 */

/* Các tùy chỉnh JS của giao diện nên để vào đây */

var isScrolled = false;
$(window).on("scroll", function () {
  if ($(".scroll-to-top").length) {
    var strickyScrollPos = 100;
    if ($(window).scrollTop() > 0) {
        isScrolled = true;
    } else {
        isScrolled = false;
    }
    if ($(window).scrollTop() > strickyScrollPos) {
      $(".scroll-to-top").show();
    } else if ($(this).scrollTop() <= strickyScrollPos) {
      $(".scroll-to-top").hide();
    }
  }
});

function toggleBoxCatesMobile() {
    $("#box-show-cates-mobile").toggleClass("show-cates");
}

function toggleClassMenuCatesHeader(is_home, leave = 0) {
    var isOnDiv = true;
    $("#box-cates-with-btn").on('mouseleave', function () {
        isOnDiv = false;
        $("#box-cates-with-btn").hide();
    });
    
    if (!is_home || isScrolled) {
        if (leave) {
            if (isOnDiv) {
                $("#box-cates-with-btn").show();
            } else {
                $("#box-cates-with-btn").hide();
            }
        } else {
            $("#box-cates-with-btn").show();
        }
    }
}

function actionMoreLess() {
  var boxOuter = ".data_more_less",
    boxInner = ".data_more_less_inner",
    boxBody = ".data_more_less_body",
    showMore = $(".action_more"),
    showLess = $(".action_less");
  $(boxInner).each(function () {
    var $this = $(this),
      bodyDataH = $this.find(boxBody).height();
    $this.css("max-height", $this.data("height"));
    var $thisH = $this.height();
    if (bodyDataH > $thisH) {
      $this.closest(boxOuter).removeClass("action_disabled");
    } else {
      $this.closest(boxOuter).addClass("action_disabled");
    }
  });
  showMore.click(function (e) {
    e.preventDefault();
    var $this = $(this),
      boxInnerH = $this.closest(boxOuter).find(boxInner).height(),
      boxInnerUpdate =
        boxInnerH + $this.closest(boxOuter).find(boxInner).data("increase-by"),
      boxBodyH = $this.closest(boxOuter).find(boxBody).height();
    setTimeout(function () {
      if (boxBodyH > boxInnerUpdate) {
        $this
          .closest(boxOuter)
          .removeClass("less_active")
          .find(boxInner)
          .css("max-height", boxInnerUpdate);
      } else {
        $this
          .closest(boxOuter)
          .addClass("less_active")
          .find(boxInner)
          .css("max-height", "none");
      }
    }, 10);
  });
  showLess.click(function () {
    $(this)
      .closest(boxOuter)
      .removeClass("less_active")
      .find(boxInner)
      .css(
        "max-height",
        $(this).closest(boxOuter).find(boxInner).data("height")
      );
    return false;
  });
}
actionMoreLess();
