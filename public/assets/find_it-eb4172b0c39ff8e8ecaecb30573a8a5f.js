// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
function CIFI_run() {
    $("#demo-description").length == 0 && $("body").append('<div id="demo-description" title="Find it Compare It">Replace me</div>'), $("#demo-description").empty(), $("#demo-description").append("<iframe height='400' width='600'  src='http://fici.herokuapp.com/iframe/items/new?url=" + encodeURIComponent($(location).attr("href")) + "' ></iframe>"), $("#demo-description").dialog({width:660, height:460, modal:!0})
}
function CIFI_jquery_ui_wait() {
    typeof jQuery.ui == "undefined" ? window.setTimeout(CIFI_jquery_ui_wait, 100) : CIFI_run()
}
function CIFI_jquery_wait() {
    if (typeof jQuery == "undefined" || jQuery.fn.jquery <= "1.4.0")window.setTimeout(CIFI_jquery_wait, 100); else {
        if (typeof jQuery.ui == "undefined") {
            var e = document.createElement("script");
            e.type = "text/javascript", e.src = "https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.18/jquery-ui.min.js", document.getElementsByTagName("head")[0].appendChild(e);
            var t = document.createElement("link");
            t.rel = "stylesheet", t.href = "http://localhost:3000/assets/jquery-ui-1.8.21.custom.css", document.getElementsByTagName("head")[0].appendChild(t)
        }
        CIFI_jquery_ui_wait()
    }
}
if (typeof jQuery == "undefined" || jQuery.fn.jquery <= "1.4.0") {
    var script = document.createElement("script");
    script.type = "text/javascript", script.src = "https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js", document.getElementsByTagName("head")[0].appendChild(script)
}
CIFI_jquery_wait();