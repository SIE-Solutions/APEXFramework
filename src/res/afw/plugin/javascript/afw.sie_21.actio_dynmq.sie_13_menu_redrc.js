/**
 * @namespace afw.sie_21.actio_dynmq.sie_13_menu_redrc
 */
afw.sie_21.actio_dynmq.sie_13_menu_redrc = {
  vva_plugn_ajax : "",
  redrc : function(pnu_seqnc_racn, pva_url) {
    if(pva_url != "") {
      afw.jQuery.exec_aplic_procs({
        plugn_ajax : afw.sie_21.actio_dynmq.sie_13_menu_redrc.vva_plugn_ajax,
        widget_action : "DEFNR_ITEM_RACN",
        procs_retrn_data_type : "text",
        x01 : pnu_seqnc_racn,
        sucs_procs : function() {
          redirect(pva_url);
        }
      });
    }
  }
}