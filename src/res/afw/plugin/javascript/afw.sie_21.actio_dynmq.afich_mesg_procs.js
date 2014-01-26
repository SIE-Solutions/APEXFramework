/**
 * @namespace afw.sie_21.actio_dynmq.afich_mesg_procs
 */
afw.sie_21.actio_dynmq.afich_mesg_procs = {
  insta : [],
  obten : function(pnu_id) {
    for ( i = 0; i < afw.sie_21.actio_dynmq.afich_mesg_procs.insta.length; i++) {
      if (afw.sie_21.actio_dynmq.afich_mesg_procs.insta[i].id == pnu_id) {
        return afw.sie_21.actio_dynmq.afich_mesg_procs.insta[i];
      }
    }
  },
  suprm : function(pnu_id) {
    for ( i = 0; i < afw.sie_21.actio_dynmq.afich_mesg_procs.insta.length; i++) {
      if (afw.sie_21.actio_dynmq.afich_mesg_procs.insta[i].id == pnu_id) {
        afw.sie_21.actio_dynmq.afich_mesg_procs.insta.splice(i, 1);
      }
    }
  },
  /**
   * @constructor
   */
  afich_mesg_procs : function(pjs_optio, pjs_calbc) {
    this.jQuery = afw.jQuery;
    var that = this;
    this.node = false;
    this.id = false;
    this.initl = initl;

    this.optio = {
      vva_id_div_mesg : "sie_mesg_apex",
      vva_mesg : "",
      vva_procs_retr_type_don : "html",
      vva_async : false,
      vva_type_reqst : "POST",
      vva_reqst_url : "wwv_flow.show",
      vva_flow_id : afw.sie_11.prodt.obten_numr_apex(),
      vva_flow_step_id : afw.sie_13.page.obten_numr_apex(),
      vva_insta : afw.sie_07.sesn.obten_numr_apex(),
      vva_plugn_ajax : ""
    };

    this.initl(pjs_optio);

    return that;

    function initl(pjs_optio) {
      //fusionner les options pass�es en param�tre et leurs valeurs par d�faut
      that.optio = that.jQuery.extend(that.optio, pjs_optio);

      afw.jQuery.exec_aplic_procs({
        "plugn_ajax" : that.optio.vva_plugn_ajax,
        "widget_action" : "OBTEN_MESG",
        "procs_retrn_data_type" : that.optio.vva_procs_retr_type_don,
        "sucs_procs" : function(pjs_data) {
          if (pjs_data != "") {
            that.jQuery('#' + that.optio.vva_id_div_mesg).html(pjs_data);
          }
        }
      });

    };//END initl

    return that;
  } //END afich_mesg_procs
}