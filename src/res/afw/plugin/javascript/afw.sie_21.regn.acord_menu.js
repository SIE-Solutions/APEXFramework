/**
 * @namespace afw.sie_21.regn.acord_menu
 */
afw.sie_21.regn.acord_menu = {
  acord_menu_calbc : new Object(),
  insta : [],
  /**
   * @constructor
   */
  acord_menu : function(pjs_optio) {
    this.jQuery = afw.jQuery;
    var that = this;
    this.node = false;
    this.id = false;
    this.stock_sesn_sectn_ouver = false;
    this.stock_sesn_stat_plugn = false;

    this.vva_entet_html_orign = "";
    this.vva_entet_html_cible = "";

    this.initl = initl;
    this.afich = afich;
    this.cachr = cachr;
    this.redmn = redmn;

    this.optio = {
      vva_id_regn_acord : "",
      vva_header : ".acord_menu_enfan",
      vjs_icone : {
        "header" : "ui-icon-triangle-1-e",
        "headerSelected" : "ui-icon-triangle-1-s"
      },
      vjs_mesg : {
        vva_stat_ok : "Initialisation reussie",
        vva_stat_ereur : "Erreur lors de l'initialisation."
      }
    };
    //END optio

    this.initl(pjs_optio);

    return that;

    function initl(pjs_optio) {
      //fusionner les options pass�es en param�tre et leurs valeurs par d�faut
      that.optio = that.jQuery.extend(that.optio, pjs_optio);

      that.node = document.getElementById(that.optio.vva_id_regn_acord);

      // only proceed if that.regn_node and that.node are not false
      if (that.node) {
        that.id = that.node.id;
        that.stock_sesn_sectn_ouver = "afw.sie_21.regn.acord_menu." + afw.sie_07.sesn.obten_numr_apex() + ".sectn_ouver";
        that.stock_sesn_stat_plugn = "afw.sie_21.regn.acord_menu." + afw.sie_07.sesn.obten_numr_apex() + ".stat_plugn";

        try {
          that.jQuery(that.node).accordion({
            fillSpace: true,
            header : that.optio.vva_header,
            icons : that.optio.vjs_icone,
            active : parseInt((afw.sie_07.stock_sesn.obten_item(that.stock_sesn_sectn_ouver) == "") ? 0 : afw.sie_07.stock_sesn.obten_item(that.stock_sesn_sectn_ouver)),
            changestart : function(event, ui) {
              that.vva_entet_html_orign = ui.oldHeader.html();
              that.vva_entet_html_cible = ui.newHeader.html();
            },
            change : function(event, ui) {
              ui.newHeader.html(that.vva_entet_html_cible);
              ui.newHeader.addClass('ui-state-active');
              ui.oldHeader.html(that.vva_entet_html_orign);
            }
          });

          that.jQuery(that.node).bind('accordionchange', function(event, ui) {
            var vnu_noeud_actif = that.jQuery(that.node).accordion("option", "active");
            afw.sie_07.stock_sesn.defnr_item(that.stock_sesn_sectn_ouver, vnu_noeud_actif);
          });

          that.afich();
          that.redmn();

          afw.sie_07.stock_sesn.defnr_item(that.stock_sesn_stat_plugn, that.optio.vjs_mesg.vva_stat_ok);
        } catch(e) {
          afw.sie_07.stock_sesn.defnr_item(that.stock_sesn_stat_plugn, that.optio.vjs_mesg.vva_stat_ereur);
        }
      } //end if (that.node)
    };//END initl

    function afich() {
      that.jQuery(that.node).show();
    }//END afich

    function cachr() {
      that.jQuery(that.node).hide();
    }//END cachr

    function redmn() {
      that.jQuery(that.node).accordion("resize");
    }//END redmn

    return that;
  }//END acord_menu
}