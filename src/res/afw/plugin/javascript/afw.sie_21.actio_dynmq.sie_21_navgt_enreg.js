/*
  Limitations du plugin:
    L'utilisation DOIT enregistrer toute modification avant de naviguer vers le suivant ou le précédent. (Pas de confirm, simple redirection)
	Gère seulement les IR et les pages qui ont la navigation d'actives dans le framework
*/

/**
 * @namespace afw.sie_21.actio_dynmq.sie_21_navgt_enreg
 */
afw.sie_21.actio_dynmq.sie_21_navgt_enreg = {
  insta : [],
  obten : function(pnu_id) {
    for( i = 0; i < afw.sie_21.actio_dynmq.sie_21_navgt_enreg.insta.length; i++) {
      if(afw.sie_21.actio_dynmq.sie_21_navgt_enreg.insta[i].id == pnu_id) {
        return afw.sie_21.actio_dynmq.sie_21_navgt_enreg.insta[i];
      }
    }
  },
  suprm : function(pnu_id) {
    for( i = 0; i < afw.sie_21.actio_dynmq.sie_21_navgt_enreg.insta.length; i++) {
      if(afw.sie_21.actio_dynmq.sie_21_navgt_enreg.insta[i].id == pnu_id) {
        afw.sie_21.actio_dynmq.sie_21_navgt_enreg.insta.splice(i, 1);
      }
    }
  },
  /**
   * @constructor
   */
  sie_21_navgt_enreg : function(pjs_optio, pjs_calbc) {
    this.jQuery = afw.jQuery;
    var that = this;
    this.node = false;
    this.id = false;
    this.initl = initl;
	this._navgt_enreg = _navgt_enreg;

	
	//TODO::CONAL, mettre string regn_gauch et regn_droit en constant dans sie_21_plugn_navgt_enreg_pkg
    this.optio = {
      vnu_id_actio_dynmq : "",
      vva_html_id_actio_dynmq : "",
      vva_nom_plugn : "",
	  vva_regn_gauch : "",
	  vva_regn_droit : "",
	  vva_selct_forml : "form#wwvFlowForm",
	  vbo_dernr_enreg : false,
	  vbo_premr_enreg : false,
	  vva_url_premr : "",
	  vva_url_dernr : "",
	  vva_url_precd : "",
	  vva_url_suivn : ""
    };

    this.initl(pjs_optio);

    return that;
	
	function ajout_regn_gauch() {
	  that.jQuery(that.optio.vva_selct_forml).append(that.optio.vva_regn_gauch);
	}; //END ajout_regn_gauch
	
	function ajout_regn_droit() {
	  that.jQuery(that.optio.vva_selct_forml).append(that.optio.vva_regn_droit);
	}; //END ajout_regn_droit
	
	function _navgt_enreg(pva_url) {
	  window.location = pva_url;
	}; //END navgt_enreg
	
	function ajout_actio_boutn() {
		that.jQuery("div.sie_21_navgt_enreg.gauch i.navgt_enreg_precd").click(function() {
		  _navgt_enreg(that.optio.vva_url_precd);
		});
		
	    that.jQuery("div.sie_21_navgt_enreg.droit i.navgt_enreg_suivn").click(function() {
		  _navgt_enreg(that.optio.vva_url_suivn);
		});
	}; //END ajout_actio_boutn

    function initl(pjs_optio) {
      //fusionner les options passées en paramètre et leurs valeurs par défaut
      that.optio = that.jQuery.extend(true, that.optio, pjs_optio);

      that.id = that.optio.vva_html_id_actio_dynmq;
	  
	  //Trouver selecteur du formulaire
	  ajout_regn_gauch();
	  ajout_regn_droit();
	  
	  //Binder action sur les boutons
	  ajout_actio_boutn();
    }; //END initl

    return that;
  } //END sie_21_navgt_enreg
};
