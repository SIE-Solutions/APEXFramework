/**
 * @namespace afw.sie_21.regn.drop
 */
afw.sie_21.regn.drop = {
  insta: [],
  obten: function(pva_id) {
    var vjs_insta;
    
    for (i=0; i<afw.sie_21.regn.drop.insta.length; i++) {
      if (afw.sie_21.regn.drop.insta[i].id == pva_id) {
        vjs_insta = afw.sie_21.regn.drop.insta[i];
        break;
      }
    }
    
    return vjs_insta;
  },
  suprm: function(pva_id) {
    for (i=0; i<afw.sie_21.regn.drop.insta.length; i++) {
      if (afw.sie_21.regn.drop.insta[i].id == pva_id) {
        afw.sie_21.regn.drop.insta.splice(i,1);
      }
    }
  },
  /**
  * @constructor
  */
  drop : function (pjs_optio, pjs_calbc){
    this.jQuery                     = afw.jQuery;
    var that                        = this;
    this.node                       = false;
    this.id                         = false;
    this.initl                      = initl;
    this.defnr_acept                = defnr_acept;
    this.activ                      = activ;
    this.desct                      = desct;
    
    this.optio = {
      vva_id_regn:        "",
      vva_acept:          "",
      vva_id_item_drop:   "",
      vbo_cachr_regn:     false
    };
    
    this.initl(pjs_optio);
    
    return that;
    
    function initl(pjs_optio) {
      //fusionner les options passées en paramètre et leurs valeurs par défaut
      that.optio = that.jQuery.extend(that.optio, pjs_optio);
      
      that.node = document.getElementById(that.optio.vva_id_regn);
      
      if(that.node){
        that.id = that.node.id;
        
        that.jQuery("#"+that.id)
          .droppable({
            activeClass: "ui-state-hover",
            hoverClass: "ui-state-active",
            drop: function(event, ui) {
              vva_valr_drop = that.jQuery("input[type='hidden']",ui.draggable).val();
              ui.draggable.remove();
              ui.helper.remove();
              apex.item(that.optio.vva_id_item_drop).setValue(vva_valr_drop);
            }
          });
        
        if (that.optio.vva_acept != "") {
          that.defnr_acept(that.optio.vva_acept);
        }
        
      } //end if (that.node)
    }; //END initl
    
    function defnr_acept(pva_acept) {
      that.jQuery("#"+that.id).droppable("option", "accept", pva_acept);
    }; //END defnr_boutn
    
    function activ() {
      if (that.optio.vbo_cachr_regn) {
        that.jQuery("#"+that.id).show();
      }
    }; //END activ
    
    function desct() {
      if (that.optio.vbo_cachr_regn) {
        that.jQuery("#"+that.id).hide();
      }
    }; //END desct
    
    return that;
  } //END drop
}