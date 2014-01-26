/**
 * @namespace afw.sie_21.actio_dynmq.sie_41_gabrt_forml_repns
 */
afw.sie_21.actio_dynmq.sie_41_gabrt_forml_repns = {
  insta : [],
  obten : function(pnu_id) {
    for ( i = 0; i < afw.sie_21.actio_dynmq.sie_41_gabrt_forml_repns.insta.length; i++) {
      if (afw.sie_21.actio_dynmq.sie_41_gabrt_forml_repns.insta[i].id == pnu_id) {
        return afw.sie_21.actio_dynmq.sie_41_gabrt_forml_repns.insta[i];
      }
    }
  },
  suprm : function(pnu_id) {
    for ( i = 0; i < afw.sie_21.actio_dynmq.sie_41_gabrt_forml_repns.insta.length; i++) {
      if (afw.sie_21.actio_dynmq.sie_41_gabrt_forml_repns.insta[i].id == pnu_id) {
        afw.sie_21.actio_dynmq.sie_41_gabrt_forml_repns.insta.splice(i, 1);

        if (afw.jQuery.browser.msie != undefined && afw.jQuery.browser.msie && afw.jQuery.browser.version == "9.0") {
          //Bug avec IE9: SCRIPT5009: « Object » est indéfini
          //afw.jQuery("#" + pnu_id).dialog('destroy');

          myObj = document.getElementById(pnu_id).parentNode;
          myObj.parentNode.removeChild(myObj);
        } else {
          afw.jQuery("#" + pnu_id).dialog('destroy');
          afw.jQuery("#" + pnu_id).remove();
        }
      }
    }
  },
  /**
   * @constructor
   */
  sie_41_gabrt_forml_repns : function(pjs_optio, pjs_calbc) {
    this.jQuery = afw.jQuery;
    var that = this;
    this.node = false;
    this.id = false;
    this.initl = initl;
    this.ouvri = ouvri;
    this.fermr = fermr;
    this.fermr_detr = fermr_detr;
    this.obten_largr = obten_largr;
    this.defnr_largr = defnr_largr;
    this.obten_boutn = obten_boutn;
    this.defnr_boutn = defnr_boutn;
    this.defnr_optio = defnr_optio;
    this.defnr_drag_exter = defnr_drag_exter;
    this.obten_widgt = obten_widgt;
    this.defnr_actio_fermr = defnr_actio_fermr;

    this.optio = {
      vnu_id_actio_dynmq : "",
      vva_html_id_actio_dynmq : "",
      vva_plugn_ajax : "",
      vva_nom_plugn : "",
      vva_item_gabrt_detl_forml : "",
      vva_titre : "",
      vbo_modal : true,
      vbo_redmn : true,
      vbo_fermr_echap : true,
      vva_clas_css : "",
      vbo_deplc : true,
      vnu_largr : 800,
      vnu_hautr : 600
    };

    this.initl(pjs_optio);

    return that;

    function initl(pjs_optio) {
      //fusionner les options passées en paramètre et leurs valeurs par défaut
      that.optio = that.jQuery.extend(true, that.optio, pjs_optio);

      that.id = that.optio.vva_html_id_actio_dynmq;

      that.jQuery.exec_aplic_procs({
        plugn_ajax : that.optio.vva_plugn_ajax,
        widget_action : "OBTEN_TITRE",
        procs_retrn_data_type : "html",
        sucs_procs : function(data) {
          that.optio.vva_titre = data;
        }
      });

      that.jQuery.exec_aplic_procs({
        plugn_ajax : that.optio.vva_plugn_ajax,
        widget_action : "OUVRI_GABRT_FORML_REPNS",
        procs_retrn_data_type : "html",
        sucs_procs : function(data) {
          that.jQuery(data).dialog({
            autoOpen : true,
            title : that.optio.vva_titre,
            modal : that.optio.vbo_modal,
            resizable : that.optio.vbo_redmn,
            closeOnEscape : that.optio.vbo_fermr_echap,
            dialogClass : that.optio.vva_clas_css,
            draggable : that.optio.vbo_deplc,
            width : that.optio.vnu_largr,
            height : that.optio.vnu_hautr,
            close : function(event, ui) {
              that.fermr_detr();
            },
            create : function(event, ui) {
              that.node = document.getElementById(that.id);
            }
          });
        }
      });

      //that.jQuery("#" + that.id)

      //TODO::BOIER
      //that.jQuery(".gabrt_forml_navgr_precd",#AJOUTER_LE_SCOPE#)
      //that.jQuery(".gabrt_forml_navgr_suivn",#AJOUTER_LE_SCOPE#)

      that.jQuery(".gabrt_forml_navgr_precd").bind("click", function(event, ui) {
        that.fermr_detr();
        apex.event.trigger(document, "navgr_precd." + that.optio.vva_nom_plugn);
      });

      that.jQuery(".gabrt_forml_navgr_suivn").bind("click", function(event, ui) {
        that.fermr_detr();
        apex.event.trigger(document, "navgr_suivn." + that.optio.vva_nom_plugn);
      });

    };//END initl

    function ouvri() {
      that.jQuery("#" + that.id).parent().appendTo("body");

      that.jQuery("#" + that.id).dialog('open');
    };//END ouvri

    function fermr() {
      that.jQuery("#" + that.id).dialog('close');
    };//END fermr

    function fermr_detr() {
      afw.sie_21.actio_dynmq.sie_41_gabrt_forml_repns.suprm(that.id);
    };//END fermr_detr

    function obten_largr() {
      return that.jQuery("#" + that.id).dialog("option", "width");
    };//END obten_largr

    function defnr_largr(pnu_largr) {
      that.jQuery("#" + that.id).dialog("option", "width", pnu_largr);
    };//END defnr_largr

    function obten_boutn() {
      return that.jQuery("#" + that.id).dialog("option", "buttons");
    };//END obten_boutn

    function defnr_boutn(pjs_boutn) {
      that.jQuery("#" + that.id).dialog("option", "buttons", pjs_boutn);
    };//END defnr_boutn

    function defnr_optio(pjs_optio) {
      that.jQuery("#" + that.id).dialog("option", pjs_optio);
    };//END defnr_optio

    function defnr_drag_exter(pbo_condt) {
      if (pbo_condt) {
        that.jQuery("#" + that.id).dialog("widget").css("overflow", "valid");
      } else {
        that.jQuery("#" + that.id).dialog("widget").css("overflow", "hidden");
      }
    };//END defnr_drag_exter

    function obten_widgt() {
      return that.jQuery("#" + that.id).dialog("widget");
    };//END obten_widgt

    function defnr_actio_fermr(pjs_funct) {
      that.jQuery("#" + that.id).dialog("widget").bind("dialogclose", pjs_funct);
    };//END defnr_actio_fermr

    return that;
  } //END dialg
}