afw.sie_21.actio_dynmq.depsm_tablr_form = {
  vjs_optio: {
    vbo_async:        true,
    vva_plugn_ajax:   "",
    vva_nom_coln_cle_primr: "SEQNC"
  },
  _afect_depsm_item: function(pva_id_tblr_form, pva_nom_apex, pva_type_item) {
    switch (pva_type_item)
    {
      case 'POPUP_COLOR':
        $page_item = afw.jQuery('#'+pva_nom_apex);
        vva_valr = afw.jQuery('#'+pva_id_tblr_form).val();
        $page_item.val(vva_valr);
        afw.jQuery('#'+pva_nom_apex+'_PREVIEW').css('background-color',vva_valr);
        
        $page_item.unbind('blur.sie_18_depsm');      
        $page_item.bind(
          'blur.sie_18_depsm',
          function(){
            afw.jQuery('#'+pva_id_tblr_form).val(afw.jQuery(this).val());          
            afw.jQuery('#'+pva_id_tblr_form).siblings('img.colorpreview').css('background-color',afw.jQuery(this).val());
          }
        );
        
        $page_item.unbind('onchange.sie_18_depsm');
        $page_item.bind(
          'onchange.sie_18_depsm',
          function(){
            afw.jQuery('#'+pva_id_tblr_form).val(afw.jQuery(this).val());          
            afw.jQuery('#'+pva_id_tblr_form).siblings('img.colorpreview').css('background-color',afw.jQuery(this).val());
          }
        );
        break;
      case 'PICK_DATE_YYYY_MM_DD':
        $page_item = afw.jQuery('#'+pva_nom_apex);
        $page_item.val(afw.jQuery('#'+pva_id_tblr_form).val());      
        $page_item.unbind('blur.sie_18_depsm');
        $page_item.bind(
          'blur.sie_18_depsm',
          function(){
            afw.jQuery('#'+pva_id_tblr_form).val(afw.jQuery(this).val());
          }
        );
        break;
      default:
        $page_item = afw.jQuery('#'+pva_nom_apex);
        $page_item.val(afw.jQuery('#'+pva_id_tblr_form).val());      
        $page_item.unbind('blur.sie_18_depsm');
        $page_item.bind(
          'blur.sie_18_depsm',
          function(){
            afw.jQuery('#'+pva_id_tblr_form).val(afw.jQuery(this).val());
          }
        );
    }
  },
  _afect_depsm: function(pjs_page_items) { 
    if (afw.jQuery('table.sie_18_tablr_form tr:eq(1)').length==0) {
      //S'il n'y a pas de rang�es, cacher les items de d�passements
      for (var i=0, vnu_nombr_page_item=pjs_page_items.row.length; i<vnu_nombr_page_item; i++) {
          $x_HideItemRow(pjs_page_items.row[i].NOM_APEX);
      }
    }
    else {
      //S'il y a des rang�es, afficher les items de d�passements
      for (var i=0, vnu_nombr_page_item=pjs_page_items.row.length; i<vnu_nombr_page_item; i++) {
          $x_ShowItemRow(pjs_page_items.row[i].NOM_APEX);
      }
      
      selct_rang = function() {      
        //d�s�lectionner et s�lectionner une rang�e
        afw.jQuery('table.sie_18_tablr_form tr.sie_18_range_tablr_form.selct').removeClass("selct");      
        afw.jQuery(this).addClass("selct");
        
        $coln = afw.jQuery('> td',this).filter(function(index) {
          var vbo_coln = false;
          afw.jQuery('label',this).each(function(i){
            if (afw.jQuery(this).text()==afw.sie_21.actio_dynmq.depsm_tablr_form.vjs_optio.vva_nom_coln_cle_primr) {vbo_coln = true;}
          });
          return  vbo_coln;
        });
        
        //afficher dans des items de pages l'overflow de la rang�e
        for (var i=0, vnu_nombr_page_item=pjs_page_items.row.length; i<vnu_nombr_page_item; i++) {
          var vva_attr_for;
          afw.jQuery('label:contains("'+pjs_page_items.row[i].DEPSM_ALIAS_COLN+'")',$coln).each(function(){
            if(afw.jQuery(this).text()==pjs_page_items.row[i].DEPSM_ALIAS_COLN) {
              vva_attr_for=afw.jQuery(this).attr('for');
            }
          });
          afw.sie_21.actio_dynmq.depsm_tablr_form._afect_depsm_item (vva_attr_for, pjs_page_items.row[i].NOM_APEX, pjs_page_items.row[i].TYPE_ITEM);
        }
      }
      
      focus_item = function() {
        afw.jQuery(this).closest('tr.sie_18_range_tablr_form:not(.selct)').click();
      }
      
      //D�saffecter sur chaque rang�e un �v�nement "onclick".
      afw.jQuery('table.sie_18_tablr_form tr.sie_18_range_tablr_form:gt(0)').unbind(
        'click.sie_18_depsm',
        selct_rang
      );
      
      //Affecter sur chaque rang�e un �v�nement "onclick".
      afw.jQuery('table.sie_18_tablr_form tr.sie_18_range_tablr_form:gt(0)').bind(
        'click.sie_18_depsm',
        selct_rang
      );
      
      //D�saffecter sur chaque item un �v�nement "onfocus".
      afw.jQuery('table.sie_18_tablr_form tr.sie_18_range_tablr_form:gt(0) input, table.sie_18_tablr_form tr.sie_18_range_tablr_form:gt(0) select').unbind(
        'focus.sie_18_depsm',
        focus_item
      );
      
      //Affecter sur chaque item un �v�nement "onfocus".
      afw.jQuery('table.sie_18_tablr_form tr.sie_18_range_tablr_form:gt(0) input, table.sie_18_tablr_form tr.sie_18_range_tablr_form:gt(0) select').bind(
        'focus.sie_18_depsm',
        focus_item
      );
      
      if (afw.jQuery("table.sie_18_tablr_form tr.sie_18_range_tablr_form label").filter(function(index) {
            return  afw.jQuery(this).text() == afw.sie_21.actio_dynmq.depsm_tablr_form.vjs_optio.vva_nom_coln_cle_primr && afw.jQuery(this).next().val() == '';
          }).length > 0) {
        //S�lectionner la nouvelle rang�e
        afw.jQuery("table.sie_18_tablr_form tr.sie_18_range_tablr_form label").filter(function(index) {
          return  afw.jQuery(this).text() == afw.sie_21.actio_dynmq.depsm_tablr_form.vjs_optio.vva_nom_coln_cle_primr && afw.jQuery(this).next().val() == '';
        }).click();
      }
      else {
        //S�lectionner la premi�re rang�e
        afw.jQuery('table.sie_18_tablr_form tr.sie_18_range_tablr_form:eq(1)').click();
      }
    }
  },
  initl : function (pjs_optio, i) {
    var plugn_depsm_tablr_form = this;
    
    //fusionner les options pass�es en param�tre et leurs valeurs par d�faut
    plugn_depsm_tablr_form.vjs_optio = afw.jQuery.extend(plugn_depsm_tablr_form.vjs_optio, pjs_optio);
    
    // Obtenir la liste des items qui doivent d�clencher l'affichage du message de confirmation
    afw.jQuery.exec_aplic_procs({
      async: plugn_depsm_tablr_form.vjs_optio.vbo_async,
      plugn_ajax: plugn_depsm_tablr_form.vjs_optio.vva_plugn_ajax,
      widget_action: "OBTEN_JSON_DEPSM_TABLR_FORM_ITEM",
      sucs_procs: afw.sie_21.actio_dynmq.depsm_tablr_form._afect_depsm
    });
    
    if (i != 1) {
      addRow_orign = addRow;
      addRow = function(pNewRowVals, pNewRowMap, pDispTypeMap) {
        addRow_orign(pNewRowVals, pNewRowMap, pDispTypeMap);
        afw.sie_21.actio_dynmq.depsm_tablr_form.initl(plugn_depsm_tablr_form.vjs_optio,1);
      }
    }
  }
};