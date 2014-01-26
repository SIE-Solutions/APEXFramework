/**
 * @namespace afw.sie_21.regn.arbre
 */
afw.sie_21.regn.arbre = {
  insta: [],
  /**
  * @constructor
  */
  arbre : function (pjs_optio, pjs_calbc){
    this.jQuery                                   = afw.jQuery;
    var that                                      = this;
    this.node                                     = false;
    this.id                                       = false;
    this.stock_sesn_json_arbre                    = false;
    this.stock_sesn_json_type_noeud               = false;
    this.stock_sesn_rafrc_arbre                   = false;
    this.stock_sesn_stat_plugn                    = false;
    
    this.obten_stock_sesn_json_arbre              = obten_stock_sesn_json_arbre;
    this.obten_stock_sesn_json_type_noeud         = obten_stock_sesn_json_type_noeud;
    this.obten_stock_sesn_json_arbre_string       = obten_stock_sesn_json_arbre_string;
    this.obten_stock_sesn_json_type_noeud_string  = obten_stock_sesn_json_type_noeud_string;
    this.obten_stock_sesn_stat_plugn              = obten_stock_sesn_stat_plugn;
    
    this.suprm_stock_sesn                         = suprm_stock_sesn;
    this.initl                                    = initl;
    this._afect_toltp                             = _afect_toltp;
    this._defnr_json_arbre                        = _defnr_json_arbre;
    this._defnr_json_type_noeud                   = _defnr_json_type_noeud;
    this._obten_json_arbre                        = _obten_json_arbre;
    this._obten_json_type_noeud_arbre             = _obten_json_type_noeud_arbre;
    this._obten_json_initl_arbre                  = _obten_json_initl_arbre;
    this._rafrc_json_initl_arbre                  = _rafrc_json_initl_arbre;
    this._initl_arbre                             = _initl_arbre;
    
    /**
    * @options
    */
    this.optio = {
      vva_id_div_regn:    "",
      vva_id_regn:        "",
	  vva_seqnc_plugn:	  "",
      vjs_arbre:          [],
      vva_async:          true,
      vva_type_reqst:     "POST",
      vva_reqst_url:      "wwv_flow.show",
      vva_flow_id:        afw.sie_11.prodt.obten_numr_apex(),
      vva_flow_step_id:   afw.sie_13.page.obten_numr_apex(),
      vva_insta:          afw.sie_07.sesn.obten_numr_apex(),
      vva_plugn_ajax:     "",
      vva_item_noeud:     "",
      vjs_noeud_actif:    [],
      vjs_theme: {
        vva_theme:  "afw",
        vbo_point:  false,
        vbo_icone:  true
      },
      vjs_core: {
        vnu_animt:  0
      },
      vva_mode_cache:                           "",
      vbo_charg_progr:                          true,
      vbo_rafrc_arbre:                          false,
      vjs_type_noeud:                           {},
      vva_selct_jquer_depsr_elemn:              false,
      vva_selct_jquer_glisr_elemn:              false,
      vva_item_fin_actio_glisr_elemn_arbre:     "",
      vjs_mesg: {
        vva_stat_ok: "Initialisation reussie",
        vva_stat_ereur: "Erreur lors de l'initialisation."
      }
    };  //END optio
    
    this.initl(pjs_optio);
    
    return that;
    
    function obten_stock_sesn_json_arbre () {
      return afw.sie_07.stock_sesn.obten_item(that.stock_sesn_json_arbre, "json");
    }; //END obten_stock_sesn_json_arbre
    
    function obten_stock_sesn_json_type_noeud () {
      return afw.sie_07.stock_sesn.obten_item(that.stock_sesn_json_type_noeud, "json");
    }; //END obten_stock_sesn_json_type_noeud
    
    function obten_stock_sesn_json_arbre_string () {
      return afw.sie_07.stock_sesn.obten_item(that.stock_sesn_json_arbre);
    }; //END obten_stock_sesn_json_arbre_string
    
    function obten_stock_sesn_json_type_noeud_string () {
      return afw.sie_07.stock_sesn.obten_item(that.stock_sesn_json_type_noeud);
    }; //END obten_stock_sesn_json_type_noeud_string
    
    function obten_stock_sesn_stat_plugn () {
      return afw.sie_07.stock_sesn.obten_item(that.stock_sesn_stat_plugn);
    }; //END obten_stock_sesn_stat_plugn
    
    function suprm_stock_sesn () {
      afw.sie_07.stock_sesn.suprm_item(that.stock_sesn_json_arbre);
      afw.sie_07.stock_sesn.suprm_item(that.stock_sesn_json_type_noeud);
      afw.sie_07.stock_sesn.suprm_item(that.stock_sesn_rafrc_arbre);
      afw.sie_07.stock_sesn.suprm_item(that.stock_sesn_stat_plugn);
    }; //END suprm_stock_sesn
    
    function initl(pjs_optio) {
      //fusionner les options passées en paramètre et leurs valeurs par défaut
      that.optio = that.jQuery.extend(that.optio, pjs_optio);
      
      try{
        switch(typeof(that.optio.vva_id_div_regn)){
          case 'string':
            that.node = document.getElementById(that.optio.vva_id_div_regn);
            break;
          case 'object':
            that.node = that.optio.vva_id_div_regn;
            break;
          default:
            that.node = false;
            break;
        }
      }catch(e){
        that.node = false;
      }
      
      if(that.node){
        that.id                             = that.node.id;
        that.stock_sesn_rafrc_arbre         = "afw.sie_21.regn.arbre."+that.optio.vva_seqnc_plugn+".rafrc_json_arbre";
        that.stock_sesn_json_arbre          = "afw.sie_21.regn.arbre."+that.optio.vva_seqnc_plugn+".json_arbre";
        that.stock_sesn_json_type_noeud     = "afw.sie_21.regn.arbre."+that.optio.vva_seqnc_plugn+".json_type_noeud";
        that.stock_sesn_stat_plugn          = "afw.sie_21.regn.arbre."+that.optio.vva_seqnc_plugn+".stat_plugn";
        
        // Initiliaser l'arbre
        if (that.optio.vva_mode_cache == "AUCUN" || that.optio.vbo_rafrc_arbre || that.jQuery.isEmptyObject(obten_stock_sesn_json_arbre())) {
          // Obtenir JSON types de noeuds
          // Obtenir JSON arbre
          that._obten_json_initl_arbre();
        }
        else if (afw.sie_07.stock_sesn.obten_item(that.stock_sesn_rafrc_arbre)=="1" && !that.jQuery.isEmptyObject(obten_stock_sesn_json_arbre())) {
          // Rafraichir JSON arbre
          that._rafrc_json_initl_arbre();
        } 
        else {
          // Obtenir JSON au niveau du sessionStorage
          that.optio.vjs_arbre = obten_stock_sesn_json_arbre();
          that.optio.vjs_type_noeud = obten_stock_sesn_json_type_noeud();
          _initl_arbre();
        }
      } //end if (that.node)
    }; //END initl
    
    function _afect_toltp() {
      that.jQuery("li a[title]",that.node)
        .cluetip({
          "hideLocal":        false,
          "clickThrough":     true,
          "showTitle":        true,
          "positionBy":       "auto",
          "arrows":           true,
          "splitTitle":       "|",//"sticky":           true,
          //"closePosition":    "title",
          hoverIntent: {
            sensitivity:  1,
            interval:     100,
            timeout:      1800
            }
          }
        );
    }; //END _afect_toltp
    
    function _defnr_json_arbre(pjs_data) {
      afw.sie_07.stock_sesn.defnr_item(that.stock_sesn_rafrc_arbre,1);
      afw.sie_07.stock_sesn.suprm_item(that.stock_sesn_rafrc_arbre);
      afw.sie_07.stock_sesn.defnr_item(that.stock_sesn_json_arbre, pjs_data);
      that.optio.vjs_arbre = pjs_data;
      _initl_arbre();
    }; //END _defnr_json_arbre
    
    function _defnr_json_type_noeud(pjs_data) {
      afw.sie_07.stock_sesn.defnr_item(that.stock_sesn_json_type_noeud, pjs_data);
      that.optio.vjs_type_noeud = pjs_data;
    }; //END _defnr_json_type_noeud
    
    function _obten_json_arbre() {
      that.jQuery.exec_aplic_procs({
        "plugn_ajax": that.optio.vva_plugn_ajax,
        "widget_action": "OBTEN_JSON_ARBRE",
        "sucs_procs": that._defnr_json_arbre
      });
    }; //END _obten_json_arbre
    
    function _obten_json_type_noeud_arbre() {
      that.jQuery.exec_aplic_procs({
        "plugn_ajax": that.optio.vva_plugn_ajax,
        "widget_action": "OBTEN_JSON_TYPE_NOEUD",
        "sucs_procs": function(pjs_data) {
          that._defnr_json_type_noeud(pjs_data);
          that._obten_json_arbre();
        }
      });
    }; //END _obten_json_type_noeud_arbre
    
    function _obten_json_initl_arbre() {
      that._obten_json_type_noeud_arbre();
    }; //END _obten_json_initl_arbre
    
    function _rafrc_json_initl_arbre() {
      that.optio.vjs_type_noeud = obten_stock_sesn_json_type_noeud();
      that._obten_json_arbre();
    }; //END _rafrc_json_initl_arbre
    
    function _initl_arbre() {
      try {
        
        that.jQuery("#"+that.optio.vva_id_div_regn)
          // CORE - open_node
          .bind("open_node.jstree", function (e, d) {
            try {
              var vva_noeud = d.args[0].attr("id");
            }
            catch(err) {
              var vva_noeud = d.args[0].id;
            }
            
            vva_noeud = vva_noeud.substr(vva_noeud.indexOf('_')+1);
            
            that.jQuery.exec_aplic_procs({
              "plugn_ajax": that.optio.vva_plugn_ajax,
              "widget_action": "OUVRI_NOEUD",
              "x01": vva_noeud
            });
            
            afw.sie_07.stock_sesn.defnr_item(that.stock_sesn_rafrc_arbre,1);
            
            //ajouter l'aide instantanée
            _afect_toltp();
          })
          // CORE - close_node
          .bind("close_node.jstree", function (e,d) {
            try {
              var vva_noeud = d.args[0].attr("id");
            }
            catch(err) {
              var vva_noeud = d.args[0].id;
            }
            
            vva_noeud = vva_noeud.substr(vva_noeud.indexOf('_')+1);
            
            that.jQuery.exec_aplic_procs({
              "plugn_ajax": that.optio.vva_plugn_ajax,
              "widget_action": "FERMR_NOEUD",
              "x01": vva_noeud
            });
            
            afw.sie_07.stock_sesn.defnr_item(that.stock_sesn_rafrc_arbre,1);
          })
          // CORE - select_node
          .bind("select_node.jstree", function (e,d) {
            if (!!d.args[1]) {
              that.jQuery.exec_aplic_procs({
                "plugn_ajax": that.optio.vva_plugn_ajax,
                "widget_action": "SELCT_NOEUD",
                "x01": d.rslt.obj.attr("id"),
                "sucs_procs": function() {
                  window.location = d.args[0].href;
                }
              });
            }
          })
          // CORE - loaded
          .bind("loaded.jstree", function () {
            //ajouter l'aide instantanée
            _afect_toltp();
          })
          .jstree({
            // CORE
            "core": {
              "animation": that.optio.vjs_core.vnu_animt
            },
            "themes": {
              "theme": that.optio.vjs_theme.vva_theme,
              "dots":  that.optio.vjs_theme.vbo_point,
              "icons":  that.optio.vjs_theme.vbo_icone
            },
            "types": that.optio.vjs_type_noeud,
            "ui": {
              "select_limit": 1,
              "initially_select": that.optio.vjs_noeud_actif
            },
            "dnd" : {
              "drop_target" : that.optio.vva_selct_jquer_depsr_elemn,
              "drag_target" : that.optio.vva_selct_jquer_glisr_elemn,
              "drag_check" : function (data) {
                if(data.r.attr("rel") == "racn") {
                  return false;
                }
                
                return {
                  after : false, 
                  before : false, 
                  inside : true 
                };
              },
              "drag_finish" : function (data) {
                that.jQuery.exec_aplic_procs({
                  "plugn_ajax": that.optio.vva_plugn_ajax,
                  "widget_action": "GLISR_ELEMN_ARBRE",
                  "x01": data.o.id,
                  "x02": data.r.attr("id"),
                  "sucs_procs": function() {
                    afw.sie_13.page.item.defnr_valr(that.optio.vva_item_fin_actio_glisr_elemn_arbre, data.o.id);
                  }
                });
              }
            },
            "json_data": {
              "progressive_render": that.optio.vbo_charg_progr,
              "data": that.optio.vjs_arbre,
              "ajax": {
                "async": that.optio.vva_async,
                "type": that.optio.vva_type_reqst,
                "url": that.optio.vva_reqst_url,
                "data": function(pva_id_noeud){
                  if (pva_id_noeud != -1) {
                    //vva_arg_names et vva_arg_values servent pour les items de page et d'application
                    var vva_arg_names = [];
                    var vva_arg_values = [];
                    var vva_noeud;
                    var vva_widget_action;
                   
                    vva_widget_action = "OBTEN_JSON_NOEUD";
                    vva_noeud = that.jQuery(pva_id_noeud).attr("id");
                    vva_noeud = vva_noeud.substr(vva_noeud.indexOf('_')+1);
                    
                    return {
                      "p_flow_id": that.optio.vva_flow_id,
                      "p_flow_step_id": that.optio.vva_flow_step_id,
                      "p_instance": that.optio.vva_insta,
                      "p_request": "PLUGIN="+that.optio.vva_plugn_ajax,
                      "p_arg_names": vva_arg_names,
                      "p_arg_values": vva_arg_values,
                      "p_widget_action": vva_widget_action,
                      "x01": vva_noeud
                    };
                  }
                  else {
                    return;
                  }
                },
                "success": function (data) {
                  if (!!data) {return data.d;}
                }
              }
            },
            // Plugins
            "plugins": ["themes","json_data","ui","types","dnd"]
          });
          
        afw.sie_07.stock_sesn.defnr_item(that.stock_sesn_stat_plugn, that.optio.vjs_mesg.vva_stat_ok);
      }
      catch(e) {
        afw.sie_07.stock_sesn.defnr_item(that.stock_sesn_stat_plugn, that.optio.vjs_mesg.vva_stat_ereur);
      }
    }; //END initl_arbre
    
    return that;
  }//END arbre
}