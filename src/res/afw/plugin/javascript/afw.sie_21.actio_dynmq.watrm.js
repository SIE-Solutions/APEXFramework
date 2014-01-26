/**
 * @namespace afw.sie_21.actio_dynmq.watrm
 */
afw.sie_21.actio_dynmq.watrm = {
  vjs_optio: {
    vbo_reptr: false;
  },
  initl: function(pjs_optio) {
    this.vjs_optio = afw.jQuery.extend(this.vjs_optio, pjs_optio);
    if (vbo_reptr) {
      afw.jQuery('body').append('<div class="watrm"><img src="/res/sem/images/menu/warning.png" /></div>');
    }
    else {
      afw.jQuery('body').append('<div class="watrm"><img src="/res/sem/images/menu/warning.png" /></div>');
    }
    
  },
  activ: function(pjs_optio) {
    this.vjs_optio = afw.jQuery.extend(this.vjs_optio, pjs_optio);
  },
  desct: function(pjs_optio) {
    this.vjs_optio = afw.jQuery.extend(this.vjs_optio, pjs_optio);
  }
}