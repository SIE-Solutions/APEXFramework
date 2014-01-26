/**
 * @namespace afw.sie_21.actio_dynmq.dml_obten_clob
 */
afw.sie_21.actio_dynmq.dml_obten_clob = {
  insta : [],
  obten : function(pnu_id) {
    for( i = 0; i < afw.sie_21.actio_dynmq.dml_obten_clob.insta.length; i++) {
      if(afw.sie_21.actio_dynmq.dml_obten_clob.insta[i].id == pnu_id) {
        return afw.sie_21.actio_dynmq.dml_obten_clob.insta[i];
      }
    }
  },
  suprm : function(pnu_id) {
    for( i = 0; i < afw.sie_21.actio_dynmq.dml_obten_clob.insta.length; i++) {
      if(afw.sie_21.actio_dynmq.dml_obten_clob.insta[i].id == pnu_id) {
        afw.sie_21.actio_dynmq.dml_obten_clob.insta.splice(i, 1);
      }
    }
  },
  /**
   * @constructor
   */
  dml_obten_clob : function(pjs_optio, pjs_calbc) {
    this.jQuery = afw.jQuery;
    var that = this;
    this.id = false;
    this.initl = initl;

    this._dml_obten_clob = _dml_obten_clob;

    this.optio = {
      vnu_id_actio_dynmq : "",
      vva_html_id_actio_dynmq : "",
      vva_nom_plugn : "",
      vva_table : "",
      vva_coln_cle_primr_1 : "",
      vva_item_cle_primr_1 : "",
      vva_coln_cle_primr_2 : "",
      vva_item_cle_primr_2 : "",
      var_liste_coln : [],
      var_liste_items : [],
      vbo_ckedt : true,
      vva_procs_retr_type_don : "html",
      vva_plugn_ajax : ""
    };

    this.initl(pjs_optio);

    return that;

    function initl(pjs_optio) {
      //fusionner les options pass�es en param�tre et leurs valeurs par d�faut
      that.optio = that.jQuery.extend(true, that.optio, pjs_optio);

      that.id = that.optio.vva_html_id_actio_dynmq;

      that.jQuery(document).bind("dml_obten_clob_termn", function(event, ui) {
        // apex.event.trigger(that.jQuery(document),event.type+that.optio.vva_nom_plugn);
      });
      if(that.optio.var_liste_items.length > 0) {
        that._dml_obten_clob();
        that.jQuery(document).trigger('dml_obten_clob_termn');
      }

    }; //END initl

    function _dml_obten_clob() {
      //vnu_telvs_termn = 0;

      for( i = 0, vnu_nombr_items = that.optio.var_liste_items.length; i < vnu_nombr_items; i++) {
        var var_clob = $s_Split(apex.item(that.optio.var_liste_items[i]).getValue(), 4000);

        afw.jQuery.exec_aplic_procs({
          "plugn_ajax" : that.optio.vva_plugn_ajax,
          "widget_action" : "DML_OBTEN_CLOB",
          "procs_retrn_data_type" : that.optio.vva_procs_retr_type_don,
          "x01" : that.optio.vva_table,
          "x02" : that.optio.vva_coln_cle_primr_1,
          "x03" : that.optio.vva_item_cle_primr_1,
          "x04" : that.optio.vva_coln_cle_primr_2,
          "x05" : that.optio.vva_item_cle_primr_2,
          "x06" : that.optio.var_liste_coln[i],
          "x07" : that.optio.var_liste_items[i],
          "sucs_procs" : function(pjs_data) {
            if(that.optio.vbo_ckedt) {
              CKEDITOR.instances[that.optio.var_liste_items[i]].setData(pjs_data);
            } else {
              that.jQuery('#' + that.optio.var_liste_items[i]).html(pjs_data);
            }
          }
        });
      }

    }; //END _dml_obten_clob

    return that;
  } //END dml_obten_clob
}