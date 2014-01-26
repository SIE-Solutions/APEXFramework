afw.sie_21.actio_dynmq.sie_18_depsm_tablr_form = {
  insta : [],
  obten : function(pnu_id) {
    for( i = 0; i < afw.sie_21.actio_dynmq.sie_18_depsm_tablr_form.insta.length; i++) {
      if(afw.sie_21.actio_dynmq.sie_18_depsm_tablr_form.insta[i].id == pnu_id) {
        return afw.sie_21.actio_dynmq.sie_18_depsm_tablr_form.insta[i];
      }
    }
  },
  suprm : function(pnu_id) {
    for( i = 0; i < afw.sie_21.actio_dynmq.sie_18_depsm_tablr_form.insta.length; i++) {
      if(afw.sie_21.actio_dynmq.sie_18_depsm_tablr_form.insta[i].id == pnu_id) {
        afw.sie_21.actio_dynmq.sie_18_depsm_tablr_form.insta.splice(i, 1);
      }
    }
  },
  /**
   * @constructor
   */
  sie_18_depsm_tablr_form : function(pjs_optio, pjs_calbc) {
    this.jQuery = afw.jQuery;
    var that = this;
    this.id = false;
    this.tablr_form_cible = false;
    this.vjs_afect_item_coln = {};
    this.vnu_id_fmap_coln_cle_primr = "";

    this.initl = initl;
    this._initl_depsm = _initl_depsm;
    this._defnr_tablr_form_cible = _defnr_tablr_form_cible;
    this._afich_item_depsm = _afich_item_depsm;
    this._trans_range_tablr_form = _trans_range_tablr_form;
    this._afect_depsm_item = _afect_depsm_item;

    this.optio = {
      vnu_id_actio_dynmq : "",
      vva_nom_plugn : "",
      vva_plugn_ajax : "",
      vva_nom_coln_cle_primr : "SEQNC"
    };

    this.initl(pjs_optio);

    return that;

    function initl(pjs_optio) {
      //fusionner les options passées en paramètre et leurs valeurs par défaut
      that.optio = that.jQuery.extend(true, that.optio, pjs_optio);

      that.id = that.optio.vva_html_id_actio_dynmq;

      //console.log(that.tablr_form_cible);

      if(!that.tablr_form_cible) {
        //console.log('override addRow');
        addRow_orign = addRow;
        addRow = function(pNewRowVals, pNewRowMap, pDispTypeMap) {
          addRow_orign(pNewRowVals, pNewRowMap, pDispTypeMap);
          afw.sie_21.actio_dynmq.sie_18_depsm_tablr_form.insta[0].initl({});
        }
      }

      that.jQuery.exec_aplic_procs({
        plugn_ajax : that.optio.vva_plugn_ajax,
        widget_action : "OBTEN_ITEM_DEPSM_TABLR_FORM",
        sucs_procs : that._initl_depsm
      });

    }; //END initl

    function _defnr_tablr_form_cible(pjs_page_items) {
      that.vnu_id_fmap_coln_cle_primr = that.jQuery("input[name='fmap'][value='" + that.optio.vva_nom_coln_cle_primr + "']").attr('id').substr(5);

      for(var i = 0, vnu_nombr_page_item = pjs_page_items.row.length; i < vnu_nombr_page_item; i++) {
        if(!that.tablr_form_cible) {
          that.tablr_form_cible = that.jQuery("input[name='fmap'][value='" + pjs_page_items.row[i].DEPSM_ALIAS_COLN + "']").prevAll("div:first").get(0);
        }
        that.vjs_afect_item_coln.row[i].ID_FMAP = that.jQuery("input[name='fmap'][value='" + pjs_page_items.row[i].DEPSM_ALIAS_COLN + "']").attr('id').substr(5);
      }
    }; //END _defnr_tablr_form_cible

    function _afich_item_depsm(pjs_page_items) {
      //S'il n'y a pas de rangées, cacher les items de dépassements
      //S'il y a des rangées, afficher les items de dépassements
      //if(that.jQuery('tr:gt(0):not(:last-child)', that.tablr_form_cible).length == 0) {
      if(that.jQuery('tr:gt(0)', that.tablr_form_cible).length == 0) {  
        for(var i = 0, vnu_nombr_page_item = pjs_page_items.row.length; i < vnu_nombr_page_item; i++) {
          $x_HideItemRow(pjs_page_items.row[i].NOM_APEX);
        }
      } else {
        for(var i = 0, vnu_nombr_page_item = pjs_page_items.row.length; i < vnu_nombr_page_item; i++) {
          $x_ShowItemRow(pjs_page_items.row[i].NOM_APEX);
        }
      }
    }; //END _afich_item_depsm

    function _afect_depsm_item(pva_id_tblr_form, pva_nom_apex, pva_type_item) {
      switch (pva_type_item) {
        case "PLUGIN_COM_SKILLBUILDERS_SUPER_LOV":
          that.jQuery("#" + pva_nom_apex).apex_super_lov('setValuesByReturn', that.jQuery("#" + pva_id_tblr_form).val());

          that.jQuery("#" + pva_nom_apex).unbind("onchange.sie_18_depsm").bind("onchange.sie_18_depsm", function() {
            that.jQuery("#" + pva_id_tblr_form).val(that.jQuery("#" + pva_nom_apex + "_HIDDENVALUE").val());
          });
          break;
        case "NATIVE_TEXTAREA":
          apex.item(pva_nom_apex).setValue(that.jQuery("#" + pva_id_tblr_form).val());
          that.jQuery("#" + pva_nom_apex).unbind("blur.sie_18_depsm").bind("blur.sie_18_depsm", function() {
            that.jQuery("#" + pva_id_tblr_form).val(that.jQuery(this).val());
          });
          break;
        default:
          apex.item(pva_nom_apex).setValue(that.jQuery('#' + pva_id_tblr_form).val());
          that.jQuery('#' + pva_nom_apex).unbind('blur.sie_18_depsm').bind('blur.sie_18_depsm', function() {
            that.jQuery('#' + pva_id_tblr_form).val(that.jQuery(this).val());
          });
      }

    }; //END _afect_depsm_item

    function _trans_range_tablr_form(pjs_page_items) {
      selct_rang = function() {
        //désélectionner et sélectionner une rangée
        that.jQuery("tr.sie_18_range_tablr_form.selct", that.tablr_form_cible).removeClass("selct");
        that.jQuery(this).addClass("selct");

        //afficher dans des items de pages l'overflow de la rangée
        for(var i = 0, vnu_nombr_page_item = pjs_page_items.row.length; i < vnu_nombr_page_item; i++) {
          vva_id_tblr_form = that.jQuery("input[name='f" + pjs_page_items.row[i].ID_FMAP.substr(1) + "']", this).attr("id");

          that._afect_depsm_item(vva_id_tblr_form, pjs_page_items.row[i].NOM_APEX, pjs_page_items.row[i].TYPE_ITEM);
        }
      }
      focus_item = function() {
        that.jQuery(this).closest("tr.sie_18_range_tablr_form:not(.selct)", that.tablr_form_cible).click();
      }

      //that.jQuery("tr:gt(0):not(:last-child)", that.tablr_form_cible).addClass("sie_18_range_tablr_form");
      that.jQuery("tr:gt(0)", that.tablr_form_cible).addClass("sie_18_range_tablr_form");

      that.jQuery("tr.sie_18_range_tablr_form", that.tablr_form_cible).unbind("click.sie_18_depsm", selct_rang).bind("click.sie_18_depsm", selct_rang);

      that.jQuery("tr.sie_18_range_tablr_form input, tr.sie_18_range_tablr_form select", that.tablr_form_cible).unbind('focus.sie_18_depsm', focus_item).bind('focus.sie_18_depsm', focus_item);

      if(that.jQuery("tr.sie_18_range_tablr_form label", that.tablr_form_cible).filter(function(index) {
        return that.jQuery(this).text() == that.optio.vva_nom_coln_cle_primr && that.jQuery(this).next().val() == '';
      }).length > 0) {
        //Sélectionner la nouvelle rangée
        that.jQuery("tr.sie_18_range_tablr_form label", that.tablr_form_cible).filter(function(index) {
          return that.jQuery(this).text() == that.optio.vva_nom_coln_cle_primr && that.jQuery(this).next().val() == '';
        }).click();
      } else {
        //Sélectionner la première rangée
        that.jQuery("tr.sie_18_range_tablr_form:eq(0)", that.tablr_form_cible).click();
      }

    }; //END _trans_range_tablr_form

    function _initl_depsm(pjs_page_items) {
      that.vjs_afect_item_coln = pjs_page_items;

      that._defnr_tablr_form_cible(that.vjs_afect_item_coln);
      that._afich_item_depsm(that.vjs_afect_item_coln);
      that._trans_range_tablr_form(that.vjs_afect_item_coln);
    }; //END _initl_depsm

    return that;
  } //END dialg
}