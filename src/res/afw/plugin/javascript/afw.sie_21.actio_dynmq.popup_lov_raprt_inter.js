/**
 * @namespace afw.sie_21.actio_dynmq.popup_lov_raprt_inter
 */
afw.sie_21.actio_dynmq.popup_lov_raprt_inter = {
  vjs_optio: {
    vbo_async: true,
    vva_plugn_ajax: "",
    vnu_seqnc: ""
  },
  _afect_valr_page_item: function(pjs_page_item) {
    for (var i=0, vnu_nombr_page_item=pjs_page_item.row.length; i<vnu_nombr_page_item; i++) {
      window.opener.afw.jQuery('#'+pjs_page_item.row[i].page_item).val(pjs_page_item.row[i].valr);
      //todo maj update session state... il faudrait p-e utiliser les DA a la place
    }
    window.close();
  },
  initl: function(pjs_optio) {
    //fusionner les options passées en paramètre et leurs valeurs par défaut
    this.vjs_optio = afw.jQuery.extend(this.vjs_optio, pjs_optio);
  },
  selct_rang: function(pjs_optio) {
    //fusionner les options passées en paramètre et leurs valeurs par défaut
    //this.vjs_optio = afw.jQuery.extend(this.vjs_optio, pjs_optio);
    
    //Obtenir a liste des items qui doivent recevoir des valeurs
    afw.jQuery.exec_aplic_procs({
      async: this.vjs_optio.vbo_async,
      plugn_ajax: this.vjs_optio.vva_plugn_ajax,
      widget_action: "OBTEN_JSON_VALR_PAGE_ITEM",
      x01: pjs_optio.vnu_seqnc,
      sucs_procs: this._afect_valr_page_item
    });
  }
}