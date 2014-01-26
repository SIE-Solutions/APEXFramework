afw.sie_21.actio_dynmq.confr_sauvg = {
  insta : [],
  obten : function(pnu_id) {
    for( i = 0; i < afw.sie_21.actio_dynmq.confr_sauvg.insta.length; i++) {
      if(afw.sie_21.actio_dynmq.confr_sauvg.insta[i].id == pnu_id) {
        return afw.sie_21.actio_dynmq.confr_sauvg.insta[i];
      }
    }
  },
  suprm : function(pnu_id) {
    for( i = 0; i < afw.sie_21.actio_dynmq.confr_sauvg.insta.length; i++) {
      if(afw.sie_21.actio_dynmq.confr_sauvg.insta[i].id == pnu_id) {
        afw.sie_21.actio_dynmq.confr_sauvg.insta.splice(i, 1);
      }
    }
  },
  /**
   * @constructor
   */
  confr_sauvg : function(pjs_optio, pjs_calbc) {
    this.jQuery = afw.jQuery;
    var that = this;
    this.id = false;
    this.initl = initl;
    this._afect_actio_item = _afect_actio_item;
    this._afect_reqt_sauvg = _afect_reqt_sauvg;

    this._defnr_modif_item = _defnr_modif_item;
    this._bascl_icone = _bascl_icone;
    this._afich_icone_confr_sauvg = _afich_icone_confr_sauvg;

    this._afect_actio_boutn = _afect_actio_boutn;
    this._afect_actio_url = _afect_actio_url;
    this.obten_stat_modif_item = obten_stat_modif_item;
    this.reint = reint;

    //etait vjs_valr
    this.vjs_stat_modfc = {
      vbo_modif_item : false,
      var_liste_reqt_sauvg : [],
      vva_inter_id : ""
    }

    this.optio = {
      vnu_id_actio_dynmq : "",
      vva_html_id_actio_dynmq : "",
      vva_nom_plugn : "",
      vva_mesg_confr : "Êtes-vous certain de vouloir quitter cette page sans sauvegarder les modifications apportées?",
      vva_plugn_ajax : "",
      vjs_icone_sauvg : {
        vbo_afich_icone : true,
        vva_icone_sauvg : "/res/afw/images/sie_19_boutn/sauvg.png",
        vva_icone_confr_sauvg : "/res/afw/images/sie_19_boutn/confr_sauvg.png",
        vnu_icone_temps_rafrc : 2500,
        vva_sie_19_boutn : "sie_19_boutn_sauvg_enreg"
      }
    };

    this.initl(pjs_optio);

    function initl(pjs_optio) {
      //fusionner les options passées en paramètre et leurs valeurs par défaut
      that.optio = that.jQuery.extend(true, that.optio, pjs_optio);

      that.id = that.optio.vva_html_id_actio_dynmq;

      // Obtenir la liste des items qui doivent déclencher l'affichage du message de confirmation
      that.jQuery.exec_aplic_procs({
        async : that.optio.vbo_async,
        plugn_ajax : that.optio.vva_plugn_ajax,
        widget_action : "OBTEN_JSON_ITEM",
        sucs_procs : that._afect_actio_item
      });

      // Obtenir la liste des requêtes (soumission page) qui ne doivent pas afficher le message de confirmation
      that.jQuery.exec_aplic_procs({
        async : that.optio.vbo_async,
        plugn_ajax : that.optio.vva_plugn_ajax,
        widget_action : "OBTEN_JSON_REQT",
        //sucs_procs: "that._afect_actio_boutn",
        sucs_procs : that._afect_reqt_sauvg
      });

      //s'il faut confirmer la sauvegarde du présent formulaire,
      //demander à l'utiliser de confirmer la navigation au moment du "beforeunload"
      that.jQuery(window).bind("beforeunload.sie_21_actio_dynmq_confr_sauvg", function() {
        if(that.vjs_stat_modfc.vbo_modif_item) {
          var vva_reqt = that.jQuery("#pRequest").val();
          if(that.jQuery.inArray(vva_reqt, that.vjs_stat_modfc.var_liste_reqt_sauvg) == -1) {
            return that.optio.vva_mesg_confr;
          }
        }

      });
    }; //END initl

    function _defnr_modif_item(pbo_stat) {
      that.vjs_stat_modfc.vbo_modif_item = pbo_stat;
    }; //END _defnr_modif_item

    function _bascl_icone() {
      if(that.jQuery('#' + that.optio.vjs_icone_sauvg.vva_sie_19_boutn).attr("src") == that.optio.vjs_icone_sauvg.vva_icone_sauvg) {
        that.jQuery('#' + that.optio.vjs_icone_sauvg.vva_sie_19_boutn).attr("src", that.optio.vjs_icone_sauvg.vva_icone_confr_sauvg);
      } else {
        that.jQuery('#' + that.optio.vjs_icone_sauvg.vva_sie_19_boutn).attr("src", that.optio.vjs_icone_sauvg.vva_icone_sauvg);
      }
    }; //END _bascl_icone

    function _afich_icone_confr_sauvg() {
      that.jQuery('#' + that.optio.vjs_icone_sauvg.vva_sie_19_boutn).attr("src", that.optio.vjs_icone_sauvg.vva_icone_confr_sauvg);
    }; //END _afich_icone_confr_sauvg

    function _afect_actio_item(pjs_page_item) {
      var vva_jquer_selct = "";

      for(var i = 0, vnu_nombr_page_item = pjs_page_item.row.length; i < vnu_nombr_page_item; i++) {
        vva_jquer_selct += "#" + pjs_page_item.row[i].NOM_APEX + ",";
      }
      vva_jquer_selct = vva_jquer_selct.slice(0, -1);

      that.jQuery(vva_jquer_selct).bind('change.sie_21_actio_dynmq_confr_sauvg  keyup.sie_21_actio_dynmq_confr_sauvg', function() {
        that.vjs_stat_modfc.vbo_modif_item = true;
        if(that.optio.vjs_icone_sauvg.vbo_afich_icone && that.vjs_stat_modfc.vva_inter_id == "") {
          that._afich_icone_confr_sauvg();
          //that._bascl_icone();
          //that.vjs_stat_modfc.vva_inter_id = setInterval ( "that._bascl_icone()", that.optio.vjs_icone_sauvg.vnu_icone_temps_rafrc);
        }
      });
    }; //END _afect_actio_item

    function _afect_reqt_sauvg(pjs_reqt) {
      for( i = 0; vnu_nombr_reqt = pjs_reqt.row.length, i < vnu_nombr_reqt; i++) {
        that.vjs_stat_modfc.var_liste_reqt_sauvg.push(pjs_reqt.row[i].NOM_APEX);
      }
    }; //END _afect_reqt_sauvg

    function _afect_actio_boutn(pjs_page_boutn) {
      var vva_jquer_selct = "";

      for(var i = 0, vnu_nombr_page_item = pjs_page_boutn.row.length; i < vnu_nombr_page_item; i++) {
        vva_jquer_selct = vva_jquer_selct + "button#" + pjs_page_boutn.row[i].NOM_APEX + ",";
      }
      vva_jquer_selct = vva_jquer_selct.slice(0, -1);

      that.jQuery(vva_jquer_selct).each(function() {
        var $this = that.jQuery(this);
        var currEvents = $this.attr('onclick');
        $this.removeAttr('onclick').click(function() {
          that.vjs_stat_modfc.vbo_modif_item = false;
          clearInterval(that.vjs_stat_modfc.vva_inter_id);
        }).click(currEvents);
      });
    }; //END _afect_actio_boutn

    function _afect_actio_url(pjs_page_url) {
      var vva_jquer_selct = "";

      for(var i = 0, vnu_nombr_page_item = pjs_page_url.row.length; i < vnu_nombr_page_item; i++) {
        vva_jquer_selct = vva_jquer_selct + "a[href*='" + pjs_page_url.row[i].NOM_APEX + "']" + ",";
      }
      vva_jquer_selct = vva_jquer_selct.slice(0, -1);

      that.jQuery(vva_jquer_selct).each(function() {
        var $this = that.jQuery(this);
        $this.click(function() {
          that.vjs_stat_modfc.vbo_modif_item = false;
          clearInterval(that.vjs_stat_modfc.vva_inter_id);
        });
      });
    }; //END _afect_actio_url

    function obten_stat_modif_item() {
      return that.vjs_stat_modfc.vbo_modif_item;
    }; //END obten_stat_modif_item

    function reint() {
      that._defnr_modif_item(false);
    }; //END reint

    return that;
  } //END confr_sauvg
};
