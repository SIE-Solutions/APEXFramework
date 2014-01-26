/**
 * @namespace afw.sie_21.regn.sie_13_aide_page
 */
afw.sie_21.regn.sie_13_aide_page = {
  insta: [],
  obten : function(pva_id_regn) {
    var vjs_insta;
    
    for (i=0; i<afw.sie_21.regn.sie_13_aide_page.insta.length; i++) {
      if (afw.sie_21.regn.sie_13_aide_page.insta[i].optio.vva_id_regn == pva_id_regn) {
        vjs_insta = afw.sie_21.regn.sie_13_aide_page.insta[i];
        break;
      }
    }
    
    return vjs_insta;
  },
  suprm : function(pva_id_regn) {
    for (i=0; i<afw.sie_21.regn.sie_13_aide_page.insta.length; i++) {
      if (afw.sie_21.regn.sie_13_aide_page.insta[i].optio.vva_id_regn == pva_id_regn) {
        afw.sie_21.regn.sie_13_aide_page.insta.splice(i,1);
      }
    }
  },
  /**
  * @constructor
  */
  sie_13_aide_page : function(pjs_optio) {
    var that                        = this;
    this.node                       = false;
    this.id                         = false;
    this.jQuery                     = afw.jQuery;
    this.initl                      = initl;
    this.sie_13_aide_page           = sie_13_aide_page;
    
    this.optio = {
      vva_id_regn: "",
      vjs_dialg: {
        vva_titre:          "Aide page",
        vbo_ouvri_autom:    true,
        vbo_modal:          true,
        vbo_redmn:          false,
        vbo_fermr_echap:    true,
        vva_clas_css:       "",
        vbo_deplc:          false
      },
      vva_plugn_ajax:     ""
    };
    
    this.initl(pjs_optio);
    
    return that;
    
    function initl(pjs_optio) {
      //fusionner les options passées en paramètre et leurs valeurs par défaut
      that.optio = that.jQuery.extend(that.optio, pjs_optio);
      
      if (that.jQuery('#'+that.optio.vva_id_regn).length > 0) {
        that.node = that.jQuery('#'+that.optio.vva_id_regn).get();
      }
      
      if(that.node){
        that.id = that.node.id;
        that.sie_13_aide_page();
      }
    }; //END initl
    
    function sie_13_aide_page() {
      that.jQuery('#'+ that.optio.vva_id_regn +' .afich_sie_13_aide_page').click(function(){
        that.jQuery.exec_aplic_procs({
          "plugn_ajax": that.optio.vva_plugn_ajax,
          "widget_action": "OBTEN_AIDE_PAGE",
          "procs_retrn_data_type": "html",
          "sucs_procs": function(data) {
            that.jQuery(data).dialog({
              autoOpen:       that.optio.vjs_dialg.vbo_ouvri_autom,
              title:          that.optio.vjs_dialg.vva_titre,
              modal:          that.optio.vjs_dialg.vbo_modal,
              resizable:      that.optio.vjs_dialg.vbo_redmn,
              closeOnEscape:  that.optio.vjs_dialg.vbo_fermr_echap,
              dialogClass:    that.optio.vjs_dialg.vva_clas_css,
              draggable:      that.optio.vjs_dialg.vbo_deplc,
              width:          400,
              height:         480
             });
          }
        });
      });
      
    }; //END sie_13_aide_page
    
    return that;
  } //END sie_13_aide_page
}