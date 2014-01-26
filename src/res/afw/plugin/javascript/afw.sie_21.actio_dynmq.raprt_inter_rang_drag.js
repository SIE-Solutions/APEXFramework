/**
 * @namespace afw.sie_21.actio_dynmq.raprt_inter_rang_drag
 */
afw.sie_21.actio_dynmq.raprt_inter_rang_drag = {
  insta: [],
  obten : function(pva_id) {
    var vjs_insta;
    
    for (i=0; i<afw.sie_21.actio_dynmq.raprt_inter_rang_drag.insta.length; i++) {
      if (afw.sie_21.actio_dynmq.raprt_inter_rang_drag.insta[i].optio.vva_id_regn == pva_id) {
        vjs_insta = afw.sie_21.actio_dynmq.raprt_inter_rang_drag.insta[i];
        break;
      }
    }
    
    return vjs_insta;
  },
  suprm : function(pva_id) {
    for (i=0; i<afw.sie_21.actio_dynmq.raprt_inter_rang_drag.insta.length; i++) {
      if (afw.sie_21.actio_dynmq.raprt_inter_rang_drag.insta[i].optio.vva_id_regn == pva_id) {
        afw.sie_21.actio_dynmq.raprt_inter_rang_drag.insta.splice(i,1);
      }
    }
  },
  /**
  * @constructor
  */
  raprt_inter_rang_drag : function(pjs_optio, pjs_calbc) {
    var that                        = this;
    this.jQuery                     = afw.jQuery;
    this.node                       = false;
    this.id                         = false;
    this.table                      = false;
    this.initl                      = initl;
    this.trans_raprt_inter          = trans_raprt_inter;
    
    this.optio = {
      vva_id_regn_reprt:                    "",
      vva_clas_css_rang_drag:               "",
      vva_aide:                             "clone",
      vbo_revnr:                            false,
      vnu_duree_revnr:                      200,
      vva_selct_jquer_regn_drop:            ".region_drop",
      vjs_ajax: {
        vva_async:          false,
        vva_type_reqst:     "POST",
        vva_reqst_url:      "wwv_flow.show",
        vva_flow_id:        afw.sie_11.prodt.obten_numr_apex(),
        vva_flow_step_id:   afw.sie_13.page.obten_numr_apex(),
        vva_insta:          afw.sie_07.sesn.obten_numr_apex(),
        vva_plugn_ajax:     ""
      }
    };
    
    this.initl(pjs_optio, pjs_calbc);
    
    return that;
    
    function initl(pjs_optio, pjs_calbc) {
      //fusionner les options passées en paramètre et leurs valeurs par défaut
      that.optio = that.jQuery.extend(that.optio, pjs_optio);

      if (that.jQuery("#"+that.optio.vva_id_regn_reprt+" .apexir_WORKSHEET_DATA").length > 0) {
        that.node = document.getElementById(that.optio.vva_id_regn_reprt);
        that.table = that.jQuery("#"+that.optio.vva_id_regn_reprt+" .apexir_WORKSHEET_DATA");
      }
      
      if(that.node){
        that.id = that.node.id;
        that.trans_raprt_inter(pjs_calbc);
      }
    }; //END initl
    
    function trans_raprt_inter(pjs_calbc) {
    
      // Cacher la région le temps de faire sa transformation
      that.jQuery(that.table).hide();
        
      if (that.table.length > 0) {
        that.jQuery("tr:gt(0)",that.table)
          .addClass(that.optio.vva_clas_css_rang_drag);
        
        var c = {};
        
        that.jQuery("tr:gt(0) td",that.table)
          .css('overflow','visible');
        
        that.jQuery("tr:gt(0)",that.table)
          .draggable({
            "helper": that.optio.vva_aide,
            "revert":  that.optio.vva_revnr,
            "revertDuration": that.optio.vnu_duree_revnr,
            "start": function(event, ui) {
              c.tr = this;
              c.helper = ui.helper;
              that.jQuery(this).hide();
            },
            "stop": function(event, ui) {
              that.jQuery(this).show();
            }
          });
      }
      
      // Afficher la région après sa transformation
      that.jQuery(that.table).show();
      
      eval(pjs_calbc);
    }; //END trans_raprt_inter
    
    return that;
  } //END raprt_inter_rang_drag
}