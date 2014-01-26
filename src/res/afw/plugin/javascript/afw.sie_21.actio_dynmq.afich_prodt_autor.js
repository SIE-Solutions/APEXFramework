/**
 * @namespace afw.sie_21.actio_dynmq.afich_prodt_autor
 */
afw.sie_21.actio_dynmq.afich_prodt_autor = {
  insta: [],
  obten : function(pva_id_regn) {
    var vjs_insta;
    
    for (i=0; i<afw.sie_21.actio_dynmq.afich_prodt_autor.insta.length; i++) {
      if (afw.sie_21.actio_dynmq.afich_prodt_autor.insta[i].optio.vva_id_regn == pva_id_regn) {
        vjs_insta = afw.sie_21.actio_dynmq.afich_prodt_autor.insta[i];
        break;
      }
    }
    
    return vjs_insta;
  },
  suprm : function(pva_id_regn) {
    for (i=0; i<afw.sie_21.actio_dynmq.afich_prodt_autor.insta.length; i++) {
      if (afw.sie_21.actio_dynmq.afich_prodt_autor.insta[i].optio.vva_id_regn == pva_id_regn) {
        afw.sie_21.actio_dynmq.afich_prodt_autor.insta.splice(i,1);
      }
    }
  },
  /**
  * @constructor
  */
  afich_prodt_autor : function(pjs_optio) {
    var that                        = this;
    this.node                       = false;
    this.id                         = false;
    this.jQuery                     = afw.jQuery;
    this.initl                      = initl;
    this.afich_prodt_autor          = afich_prodt_autor;
    
    this.optio = {
      vva_selct_jquer_regn_afich: "#afich_prodt_autor",
      vjs_dialg: {
        vva_titre:          "Liste des produits autorisés",
        vbo_ouvri_autom:    true,
        vbo_modal:          true,
        vbo_redmn:          false,
        vbo_fermr_echap:    true,
        vva_clas_css:       "ui-afw",
        vbo_deplc:          false
      },
      vjs_ajax: {
        vva_type_reqst:   "POST",
        vva_reqst_url:    "wwv_flow.show",
        vva_flow_id:      afw.sie_11.prodt.obten_numr_apex(),
        vva_flow_step_id: afw.sie_13.page.obten_numr_apex(),
        vva_insta:        afw.sie_07.sesn.obten_numr_apex(),
        vva_plugn_ajax:   ""
      }
    };
    
    this.initl(pjs_optio);
    
    return that;
    
    function initl(pjs_optio) {
      //fusionner les options passées en paramètre et leurs valeurs par défaut
      that.optio = that.jQuery.extend(that.optio, pjs_optio);
      
      if (that.jQuery(that.optio.vva_selct_jquer_regn_afich).length > 0) {
        that.node = that.jQuery(that.optio.vva_selct_jquer_regn_afich).get();
      }
      
      if(that.node){
        that.id = that.node.id;
        that.afich_prodt_autor();
      }
    }; //END initl
    
    function afich_prodt_autor() {
      afw.jQuery.exec_aplic_procs({
        "plugn_ajax": that.optio.vjs_ajax.vva_plugn_ajax,
        "widget_action": "OBTEN_LIEN_CHANG_PRODT",
        "procs_retrn_data_type": "html",
        "sucs_procs": function(data) {
          that.jQuery(that.optio.vva_selct_jquer_regn_afich).html(data);
        }
      });
      
      that.jQuery('a:first',that.optio.vva_selct_jquer_regn_afich).click(function(){
        afw.jQuery.exec_aplic_procs({
          "plugn_ajax": that.optio.vjs_ajax.vva_plugn_ajax,
          "widget_action": "OBTEN_LISTE_PRODT_AUTOR",
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
              width:          400
             });
          }
        });
      });
      
    }; //END afich_prodt_autor
    
    return that;
  } //END afich_prodt_autor
}