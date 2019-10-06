/**
 * Created by 심온 on 2017-04-03.
 */
var $btn = $(".content_btn>a");
$btn.click(function () {
    var $this = $(this);
    $btn.removeClass("on");
    $this.addClass("on");
})