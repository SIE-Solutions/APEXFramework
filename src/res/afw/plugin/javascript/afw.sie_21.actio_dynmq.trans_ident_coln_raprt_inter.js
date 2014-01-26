/**
 * @namespace afw.sie_21.actio_dynmq.trans_ident_coln_raprt_inter
 */
afw.sie_21.actio_dynmq.trans_ident_coln_raprt_inter = {
  insta : [],
  obten : function(pnu_id) {
    for( i = 0; i < afw.sie_21.actio_dynmq.trans_ident_coln_raprt_inter.insta.length; i++) {
      if(afw.sie_21.actio_dynmq.trans_ident_coln_raprt_inter.insta[i].id == pnu_id) {
        return afw.sie_21.actio_dynmq.trans_ident_coln_raprt_inter.insta[i];
      }
    }
  },
  suprm : function(pnu_id) {
    for( i = 0; i < afw.sie_21.actio_dynmq.trans_ident_coln_raprt_inter.insta.length; i++) {
      if(afw.sie_21.actio_dynmq.trans_ident_coln_raprt_inter.insta[i].id == pnu_id) {
        afw.sie_21.actio_dynmq.trans_ident_coln_raprt_inter.insta.splice(i, 1);
      }
    }
  },
  /**
   * @constructor
   */
  trans_ident_coln_raprt_inter : function(pjs_optio, pjs_calbc) {
    this.jQuery = afw.jQuery;
    var that = this;
    this.node = false;
    this.id = false;
    this.initl = initl;

    this.optio = {
      vnu_id_actio_dynmq : "",
      vva_html_id_actio_dynmq : "",
      vva_nom_plugn : "",
      vjs_ident_coln : {}
    };

    this.initl(pjs_optio);

    return that;

    function initl(pjs_optio) {
      //fusionner les options passées en paramètre et leurs valeurs par défaut
      that.optio = that.jQuery.extend(true, that.optio, pjs_optio);

      that.id = that.optio.vva_html_id_actio_dynmq;

      gReport.controls.computation_orign = gReport.controls.computation;

      gReport.controls.computation = function(pID) {
        gReport.controls.computation_orign(pID);

        afw.jQuery("#apexir_CONTROL_PANEL_DROP").live("focus", function() {
          that.jQuery("#apexir_CONTROL_PANEL_DROP table.calculator:first tr").each(function(i) {
            var vva_ident_coln = that.jQuery('td:first', this).text().replace('.', '');
            if(that.optio.vjs_ident_coln[vva_ident_coln] != undefined) {
              that.jQuery('td:last', this).text(that.optio.vjs_ident_coln[vva_ident_coln]);
            }
          });
        });
      };
    }; //END initl

    return that;
  } //END trans_ident_coln_raprt_inter
};
