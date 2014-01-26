/**
 * @namespace afw.sie_21.actio_dynmq.soumt_clob
 */
afw.sie_21.actio_dynmq.soumt_clob = {
  insta : [],
  obten : function(pnu_id) {
    for( i = 0; i < afw.sie_21.actio_dynmq.soumt_clob.insta.length; i++) {
      if(afw.sie_21.actio_dynmq.soumt_clob.insta[i].id == pnu_id) {
        return afw.sie_21.actio_dynmq.soumt_clob.insta[i];
      }
    }
  },
  suprm : function(pnu_id) {
    for( i = 0; i < afw.sie_21.actio_dynmq.soumt_clob.insta.length; i++) {
      if(afw.sie_21.actio_dynmq.soumt_clob.insta[i].id == pnu_id) {
        afw.sie_21.actio_dynmq.soumt_clob.insta.splice(i, 1);
      }
    }
  },
  /**
   * @constructor
   */
  soumt_clob : function(pjs_optio, pjs_calbc) {
    this.jQuery = afw.jQuery;
    var that = this;
    this.id = false;
    this.initl = initl;

    this._creer_colct_clob = _creer_colct_clob;
    this._telvs_clob = _telvs_clob;

    this.optio = {
      vnu_id_actio_dynmq : "",
      vva_html_id_actio_dynmq : "",
      vva_nom_plugn : "",
      vva_reqt_soums_page : "",
      var_liste_items : [],
      vbo_ckedt : true,
      vva_plugn_ajax : ""
    };

    this.initl(pjs_optio);

    return that;

    function initl(pjs_optio) {
      //fusionner les options pass�es en param�tre et leurs valeurs par d�faut
      that.optio = that.jQuery.extend(true, that.optio, pjs_optio);

      that.id = that.optio.vva_html_id_actio_dynmq;

      var vva_evenm_termn = "soumt_" + that.optio.vva_reqt_soums_page + ((that.optio.vva_reqt_soums_page != "") ? "_" : "") + "clob_termn";

      that.jQuery(document).bind(vva_evenm_termn, function(event, ui) {
        // apex.event.trigger(that.jQuery(document),event.type+that.optio.vva_nom_plugn);
      });
      
      if(that.optio.var_liste_items.length > 0) {
        that._creer_colct_clob();
        that.jQuery(document).trigger(vva_evenm_termn);
      }

    }; //END initl

    function _telvs_clob() {
      //vnu_telvs_termn = 0;      
      for( i = 0, vnu_nombr_items = that.optio.var_liste_items.length; i < vnu_nombr_items; i++) {

        var var_clob;
        if(that.optio.vbo_ckedt) {
          var_clob = $s_Split(CKEDITOR.instances[that.optio.var_liste_items[i]].getData(), 4000);
          CKEDITOR.instances[that.optio.var_liste_items[i]].setData("");
        } else {
          var_clob = $s_Split(apex.item(that.optio.var_liste_items[i]).getValue(), 4000);
          that.jQuery('#' + that.optio.var_liste_items[i]).html("");
        }

        afw.jQuery.exec_aplic_procs({
          "plugn_ajax" : that.optio.vva_plugn_ajax,
          "widget_action" : "TELVS_CLOB",
          "x01" : that.optio.var_liste_items[i],
          "f01" : var_clob,
          "sucs_procs" : function(pjs_data) {
            //incrementer  vnu_telvs_termn
          }
        });
      }

    }; //END _telvs_clob

    function _creer_colct_clob() {
      afw.jQuery.exec_aplic_procs({
        "plugn_ajax" : that.optio.vva_plugn_ajax,
        "widget_action" : "CREER_COLCT_CLOB",
        "sucs_procs" : function(pjs_data) {
          that._telvs_clob();
        }
      });
    }; //END _creer_colct_clob

    return that;
  } //END soumt_clob
}