/**
 * @namespace afw.sie_21.item.tokn_input
 */
afw.sie_21.item.tokn_input = {
  insta: [],
  obten: function(pnu_id) {
    for (i=0; i<afw.sie_21.item.tokn_input.insta.length; i++) {
      if (afw.sie_21.item.tokn_input.insta[i].id == pnu_id) {
        return afw.sie_21.item.tokn_input.insta[i];
      }
    }
  },
  suprm: function(pnu_id) {
    for (i=0; i<afw.sie_21.item.tokn_input.insta.length; i++) {
      if (afw.sie_21.item.tokn_input.insta[i].id == pnu_id) {
        afw.sie_21.item.tokn_input.insta.splice(i,1);
      }
    }
  },
  /**
  * @constructor
  */
  tokn_input : function (pjs_optio, pjs_calbc){
    this.jQuery                     = afw.jQuery;
    var that                        = this;
    this.node                       = false;
    this.id                         = false;
    this.initl                      = initl;
    
    this.optio = {
      vva_id_item:            "",
      vjs_tokn_local:         "",
      vnu_largr:              null,
      vnu_delai_rechr:        300,
      vnu_nombr_carct_minm:   1,
      vva_valr_rechr:         "name",
      vva_contn_json:         null,
      vva_texte_aide:         "",
      vva_texte_aucun_reslt:  "",
      vva_texte_rechr_activ:  "",
      var_pre_popl:           null,
      vbo_prevn_doubl:        false,
      vnu_nombr_tokn_maxm:    null,
      vva_async:        false,
      vva_type_reqst:   "POST",
      vva_reqst_url:    "wwv_flow.show",
      vva_flow_id:      afw.sie_11.prodt.obten_numr_apex(),
      vva_flow_step_id: afw.sie_13.page.obten_numr_apex(),
      vva_insta:        afw.sie_07.sesn.obten_numr_apex(),
      vva_plugn_ajax:   ""
    };
    
    this.initl(pjs_optio);
    
    return that;
    
    function initl(pjs_optio) {
      //fusionner les options passées en paramètre et leurs valeurs par défaut
      that.optio = that.jQuery.extend(that.optio, pjs_optio);
      
      that.node = document.getElementById(that.optio.vva_id_item);
      
      // only proceed if that.node are not false
      if(that.node){
        that.id = that.node.id;
        
        that.jQuery("#"+that.optio.vva_id_item)
          .tokenInput(
            (( that.optio.vjs_tokn_local != "" ) ? that.optio.vjs_tokn_local : that.optio.vva_reqst_url),
            {// Search settings
              method:               that.optio.vva_type_reqst,
              queryParam:           "p_flow_id=" + that.optio.vva_flow_id +
                                    "&p_flow_step_id=" + that.optio.vva_flow_step_id +
                                    "&p_instance=" + that.optio.vva_insta +
                                    "&p_request=PLUGIN=" +
                                    that.optio.vva_plugn_ajax +
                                    "&p_widget_action=OBTEN_LOV" + "&x01",
              searchDelay:          that.optio.vnu_delai_rechr,
              minChars:             that.optio.vnu_nombr_carct_minm,
              propertyToSearch:     that.optio.vva_valr_rechr,
              jsonContainer:        that.optio.vva_contn_json,
              //contentType:          "json",
              // Prepopulation settings
              prePopulate:          that.optio.var_pre_popl,
              processPrePopulate:   false,
              // Display settings
              hintText:             that.optio.vva_texte_aide,
              noResultsText:        that.optio.vva_texte_aucun_reslt,
              searchingText:        that.optio.vva_texte_rechr_activ,
              deleteText:           "&times;",
              animateDropdown:      true,
              //theme:                "fadq",
              // Tokenization settings
              tokenLimit:           that.optio.vnu_nombr_tokn_maxm,
              tokenDelimiter:       ",",
              preventDuplicates:    that.optio.vbo_prevn_doubl,
              tokenValue:           "id",
              // Callbacks
              onResult:             null,
              onAdd:                null,
              onDelete:             null,
              onReady:              null,
              // Other settings
              idPrefix:             "token-input-"
            });
            
        if (that.optio.vnu_largr != null) {
          that.jQuery("#"+that.optio.vva_id_item).prev('ul').width(that.optio.vnu_largr);
        }
        
      } //end if (that.node)
    }; //END initl
    
    return that;
  } //END tokn_input
}