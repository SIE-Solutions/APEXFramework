/**
 * @namespace afw.sie_21.actio_dynmq.sie_12_modfr_mot_passe
 */
afw.sie_21.actio_dynmq.sie_12_modfr_mot_passe = {
  insta : [],
  obten : function(pnu_id) {
    for ( i = 0; i < afw.sie_21.actio_dynmq.sie_12_modfr_mot_passe.insta.length; i++) {
      if (afw.sie_21.actio_dynmq.sie_12_modfr_mot_passe.insta[i].id == pnu_id) {
        return afw.sie_21.actio_dynmq.sie_12_modfr_mot_passe.insta[i];
      }
    }
  },
  suprm : function(pnu_id) {
    for ( i = 0; i < afw.sie_21.actio_dynmq.sie_12_modfr_mot_passe.insta.length; i++) {
      if (afw.sie_21.actio_dynmq.sie_12_modfr_mot_passe.insta[i].id == pnu_id) {
        afw.sie_21.actio_dynmq.sie_12_modfr_mot_passe.insta.splice(i, 1);
      }
    }
  },
  afich : function() {
    afw.jQuery(document).trigger('sie_12_modfr_mp_afich');
  },
  /**
   * @constructor
   */
  sie_12_modfr_mot_passe : function(pjs_optio, pjs_calbc) {
    this.jQuery = afw.jQuery;
    var that = this;
    this.node = false;
    this.id = false;
    this.initl = initl;

    this.optio = {
      vnu_id_actio_dynmq : "",
      vva_nom_plugn : "",
      vva_plugn_ajax : ""
    };

    this.initl(pjs_optio);

    return that;

    function initl(pjs_optio) {
      //fusionner les options passées en paramètre et leurs valeurs par défaut
      that.optio = that.jQuery.extend(true, that.optio, pjs_optio);

      that.id = that.optio.vva_html_id_actio_dynmq;

      that.jQuery(document).bind("sie_12_modfr_mp_afich", function(event, ui) {
        apex.event.trigger(afw.jQuery(document), "afw_sie_21_actio_dynmq_sie_12_modfr_mp_afich." + that.optio.vva_nom_plugn);
      });
    };//END initl

    return that;
  } //END sie_12_modfr_mot_passe
}