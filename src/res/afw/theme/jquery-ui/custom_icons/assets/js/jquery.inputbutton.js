// a simple jquery plugin that extends the jquery ui button plugin to iconize submit and reset buttons
(function($){
    $.fn.extend({
        inputButton: function(options){
            return this.each(function(){
                var $me = $(this);
                if (($me.is(":submit, :reset ")) && ($.trim($me.val()) != "")) { /* value attribute is required. limit conversion to submit and reset input types */
                    var typeRegex = /input/gi;
                    var $clone = $me.clone();
                    var html = $("<div/>").append($clone).html();
                    html = html.replace(typeRegex, "button") + $me.val() + "</button>";
                    $me.replaceWith($(html).button(options));
                } else {
                    $me.button(options);
                }
            });
        }
    });
})(jQuery);
