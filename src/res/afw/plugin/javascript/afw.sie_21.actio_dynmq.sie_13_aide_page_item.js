/**
 * @namespace afw.sie_21.actio_dynmq.sie_13_aide_page_item
 */
afw.sie_21.actio_dynmq.sie_13_aide_page_item = {
  vva_plugn_ajax : "",
  vbo_afich_multp : false,
  afich : function(pnu_numr_apex_page_item) {
    afw.jQuery.exec_aplic_procs({
      plugn_ajax : afw.sie_21.actio_dynmq.sie_13_aide_page_item.vva_plugn_ajax,
      widget_action : "OBTEN_AIDE",
      procs_retrn_data_type: "html",
      x01 : pnu_numr_apex_page_item,
      sucs_procs : function(pva_mesg_aide) {
        afw.jQuery(pva_mesg_aide).dialog({
          autoOpen : true,
          title : "Aide",
          modal : afw.sie_21.actio_dynmq.sie_13_aide_page_item.vbo_afich_multp,
          resizable : false,
          closeOnEscape : true,
          dialogClass : "",
          draggable : true,
          width : 300
        });
      }
    });
  }
}