/**
 * @namespace afw.sie_21.actio_dynmq.sie_13_aide_page
 */
afw.sie_21.actio_dynmq.sie_13_aide_page = {
  insta : [],
  obten : function(pnu_id) {
    for ( i = 0; i < afw.sie_21.actio_dynmq.sie_13_aide_page.insta.length; i++) {
      if (afw.sie_21.actio_dynmq.sie_13_aide_page.insta[i].id == pnu_id) {
        return afw.sie_21.actio_dynmq.sie_13_aide_page.insta[i];
      }
    }
  },
  suprm : function(pnu_id) {
    for ( i = 0; i < afw.sie_21.actio_dynmq.sie_13_aide_page.insta.length; i++) {
      if (afw.sie_21.actio_dynmq.sie_13_aide_page.insta[i].id == pnu_id) {
        afw.sie_21.actio_dynmq.sie_13_aide_page.insta.splice(i, 1);
      }
    }
  },
  afich : function() {
    afw.jQuery(document).trigger('afw_sie_21_actio_dynmq_sie_13_aide_page_afich');
  },
  /**
   * @constructor
   */
  sie_13_aide_page : function(pjs_optio, pjs_calbc) {
    this.jQuery = afw.jQuery;
    var that = this;
    this.node = false;
    this.id = false;
    this.initl = initl;

    this.optio = {
      vnu_id_actio_dynmq : "",
      vva_nom_plugn : "",
      vva_plugn_ajax : "",
      vjs_dialg : {
        vva_titre : "Aide",
        vbo_ouvri_autom : true,
        vbo_modal : true,
        vbo_redmn : false,
        vbo_fermr_echap : true,
        vva_clas_css : "ui-afw",
        vbo_deplc : false
      }
    };

    this.initl(pjs_optio);

    return that;

    function initl(pjs_optio) {
      //fusionner les options passées en paramètre et leurs valeurs par défaut
      that.optio = that.jQuery.extend(true, that.optio, pjs_optio);

      that.id = that.optio.vva_html_id_actio_dynmq;

      that.jQuery(document).bind("afw_sie_21_actio_dynmq_sie_13_aide_page_afich", function(event, ui) {
        apex.event.trigger(afw.jQuery(document), "afw_sie_21_actio_dynmq_sie_13_aide_page_afich." + that.optio.vva_nom_plugn);

        afw.jQuery.exec_aplic_procs({
          "plugn_ajax" : that.optio.vva_plugn_ajax,
          "widget_action" : "OBTEN_AIDE_PAGE",
          "procs_retrn_data_type" : "html",
          "sucs_procs" : function(data) {
            that.jQuery(data).dialog({
              autoOpen : that.optio.vjs_dialg.vbo_ouvri_autom,
              title : that.optio.vjs_dialg.vva_titre,
              modal : that.optio.vjs_dialg.vbo_modal,
              resizable : that.optio.vjs_dialg.vbo_redmn,
              closeOnEscape : that.optio.vjs_dialg.vbo_fermr_echap,
              dialogClass : that.optio.vjs_dialg.vva_clas_css,
              draggable : that.optio.vjs_dialg.vbo_deplc,
              width : 640,
              height : 480
            });
          }
        });

      });
    };//END initl

    return that;
  } //END sie_13_aide_page
}