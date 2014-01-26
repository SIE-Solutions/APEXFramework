/**
 * @namespace afw.sie_21.regn.dialg
 */
afw.sie_21.regn.dialg = {
  insta: [],
  obten: function(pnu_id) {
    for (i=0; i<afw.sie_21.regn.dialg.insta.length; i++) {
      if (afw.sie_21.regn.dialg.insta[i].id == pnu_id) {
        return afw.sie_21.regn.dialg.insta[i];
      }
    }
  },
  suprm: function(pnu_id) {
    for (i=0; i<afw.sie_21.regn.dialg.insta.length; i++) {
      if (afw.sie_21.regn.dialg.insta[i].id == pnu_id) {
        afw.sie_21.regn.dialg.insta.splice(i,1);
      }
    }
  },
  /**
  * @constructor
  */
  dialg : function (pjs_optio, pjs_calbc){
    this.jQuery                     = afw.jQuery;
    var that                        = this;
    this.node                       = false;
    this.id                         = false;
    this.initl                      = initl;
    this.ouvri                      = ouvri;
    this.fermr                      = fermr;
    this.obten_largr                = obten_largr;
    this.defnr_largr                = defnr_largr;
    this.obten_boutn                = obten_boutn;
    this.defnr_boutn                = defnr_boutn;
    this.defnr_optio                = defnr_optio;
    this.defnr_drag_exter           = defnr_drag_exter;
    this.obten_widgt                = obten_widgt;
    this.defnr_actio_fermr          = defnr_actio_fermr;
    
    this.optio = {
      vva_id_regn:        "",
      vva_titre:          "",
      vbo_ouvri_autom:    false,
      vbo_modal:          true,
      vbo_redmn:          true,
      vbo_fermr_echap:    true,
      vva_clas_css:       "",
      vbo_deplc:          true,
      vnu_largr:          300,
      vjs_ajax: {
        vva_async:        false,
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
      
      try{
        switch(typeof(that.optio.vva_id_regn)){
          case 'string':
            that.node = document.getElementById(that.optio.vva_id_regn);
            break;
          default:
            that.node = false;
            break;
        }
      }catch(e){
        that.node = false;
      }
      
      // only proceed if that.node are not false
      if(that.node){
        that.id = that.node.id;
        
        that.jQuery("#"+that.optio.vva_id_regn).before('<div id="old_'+that.optio.vva_id_regn+'"></div>');
        
        that.jQuery("#"+that.optio.vva_id_regn)
          .dialog({autoOpen: that.optio.vbo_ouvri_autom,
                   title: that.optio.vva_titre,
                   modal: that.optio.vbo_modal,
                   resizable: that.optio.vbo_redmn,
                   closeOnEscape: that.optio.vbo_fermr_echap,
                   dialogClass: that.optio.vva_clas_css,
                   draggable: that.optio.vbo_deplc,
                   width: that.optio.vnu_largr,
                   close: function(event, ui) {
                    that.jQuery("#"+that.optio.vva_id_regn).parent().appendTo("#old_"+that.optio.vva_id_regn);
                   },
                   create: function(event, ui) {
                    if (!that.optio.vbo_ouvri_autom) {
                      that.jQuery("#"+that.optio.vva_id_regn).parent().appendTo("#old_"+that.optio.vva_id_regn);
                    }
                   }
                  });
          
      } //end if (that.node)
    }; //END initl
    
    function ouvri() {
      that.jQuery("#"+that.optio.vva_id_regn).parent()
        .appendTo("body");
    
      that.jQuery("#"+that.optio.vva_id_regn)
        .dialog('open');
    }; //END ouvri
    
    function fermr() {
      that.jQuery("#"+that.optio.vva_id_regn)
          .dialog('close');
    }; //END fermr
    
    function obten_largr() {
      return that.jQuery("#"+that.optio.vva_id_regn).dialog("option", "width");
    }; //END obten_largr
    
    function defnr_largr(pnu_largr) {
      that.jQuery("#"+that.optio.vva_id_regn).dialog( "option", "width", pnu_largr);
    }; //END defnr_largr
    
    function obten_boutn() {
      return that.jQuery("#"+that.optio.vva_id_regn).dialog("option", "buttons");
    }; //END obten_boutn
    
    function defnr_boutn(pjs_boutn) {
      that.jQuery("#"+that.optio.vva_id_regn).dialog( "option", "buttons", pjs_boutn);
    }; //END defnr_boutn
    
    function defnr_optio(pjs_optio) {
      that.jQuery("#"+that.optio.vva_id_regn).dialog("option", pjs_optio);
    }; //END defnr_optio
    
    function defnr_drag_exter(pbo_condt) {
      if (pbo_condt){
        that.jQuery("#"+that.optio.vva_id_regn).dialog("widget").css("overflow", "valid");
      }
      else {
        that.jQuery("#"+that.optio.vva_id_regn).dialog("widget").css("overflow", "hidden");
      }
    }; //END defnr_drag_exter
    
    function obten_widgt() {
      return that.jQuery("#"+that.optio.vva_id_regn).dialog( "widget" );
    }; //END obten_widgt
    
    function defnr_actio_fermr(pjs_funct) {
      that.jQuery("#"+that.optio.vva_id_regn).dialog("widget").bind("dialogclose", pjs_funct);
    }; //END defnr_actio_fermr
    
    return that;
  } //END dialg
}