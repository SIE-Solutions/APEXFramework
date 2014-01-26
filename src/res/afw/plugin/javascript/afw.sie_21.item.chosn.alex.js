/**
 * @namespace afw.sie_21.item.chosn
 */
afw.sie_21.item.chosn = {
    insta: [],
    obten: function (pnu_id) {
        for (i = 0; i < afw.sie_21.item.chosn.insta.length; i++) {
            if (afw.sie_21.item.chosn.insta[i].id == pnu_id) {
                return afw.sie_21.item.chosn.insta[i];
            }
        }
    },
    suprm: function (pnu_id) {
        for (i = 0; i < afw.sie_21.item.chosn.insta.length; i++) {
            if (afw.sie_21.item.chosn.insta[i].id == pnu_id) {
                afw.sie_21.item.chosn.insta.splice(i, 1);
            }
        }
    },
    /**
     * @constructor
     */
    chosn: function (pjs_optio, pjs_calbc) {
        this.jQuery = afw.jQuery;
        var that = this;
        this.node = false;
        this.id = false;
        this.initl = initl;
        this._initl_cascd_lov = _initl_cascd_lov;
        this._ajout_overf = _ajout_overf;
        this._rafrc_lov = _rafrc_lov;
        this._reint_liste = _reint_liste;

        this.optio = {
            vva_id_item: "",
            vva_mesg_aucun_don_trouv: "Aucune donn�e trouv�e",
            vva_id_item_parnt: "",
            vva_id_item_submt: "",
            vbo_rafrc_optim: true,
            vbo_permt_deslc: false,
            vbo_rechr_contn: true,
            vva_type_reqst: "POST",
            vva_reqst_url: "wwv_flow.show",
            vva_flow_id: afw.sie_11.prodt.obten_numr_apex(),
            vva_flow_step_id: afw.sie_13.page.obten_numr_apex(),
            vva_insta: afw.sie_07.sesn.obten_numr_apex(),
            vva_plugn_ajax: ""
        };

        this.initl(pjs_optio);

        return that;

        function _reint_liste() {
            var vva_selct_id_item = afw.jQuery("#" + that.optio.vva_id_item);

//        console.log("_reint_liste");
//        console.log(that.optio.vva_id_item);

            /*if ( "nullValue" in pOptions ) {
             afw.jQuery( 'option[value!="' + apex.util.escapeCSS( gOptions.nullValue ) + '"]', gSelectList$ ).remove();
             } else {*/
            afw.jQuery('option[value!="' + apex.util.escapeCSS( gOptions.nullValue ) + '"]', vva_selct_id_item).remove();
            afw.jQuery(vva_selct_id_item).trigger("apexafterrefresh");
            //}
        };
        //END _reint_liste

        function _rafrc_lov() {
            apex.widget.util.cascadingLov(
                that.jQuery("#" + that.optio.vva_id_item),
                that.optio.vva_plugn_ajax,
                {    pageItems: that.jQuery("#" + that.optio.vva_id_item_submt),
                    p_widget_action: "RAFRC_LOV"
                },
                {   optimizeRefresh: that.optio.vbo_rafrc_optim,
                    dependingOn: that.jQuery("#" + that.optio.vva_id_item_parnt),
                    clear: that._reint_liste,
                    success: function (pjs_json) {
                        var vva_html = "";

                        that.jQuery
                            .each(pjs_json.values, function () {
                                vva_html = vva_html + '<option value="' + this.r + '">' + this.d + '</option>';
                            });

                        that.jQuery("#" + that.optio.vva_id_item)
                            .append(vva_html)
                            .trigger("apexafterrefresh");

                        /* Possiblement g�rer les chosen sur un mobile ?
                         if( $.mobile ) {
                         gSelectList$.selectmenu('refresh', true);
                         }
                         */

                        // Set the default value of the page item.
                        // The change event is also needed by cascading LOVs so that they are refreshed with the
                        // current selected value as well (bug# 9907473)
                        //$s( gSelectList$[0], pjs_json[ "default" ] );
                    }
                });
        };
        //END _rafrc_lov

        function _initl_cascd_lov() {
            if (that.optio.vva_id_item_parnt) {
//                console.log('INIT CASCA LOV');

                that.jQuery("#" + that.optio.vva_id_item_parnt)
                    .bind("apexbeforerefresh", that._reint_liste)
                    .change(that._rafrc_lov);

                that.jQuery("#" + that.optio.vva_id_item)
                    .bind("apexrefresh", that._rafrc_lov)
                    .bind("apexafterrefresh", function () {
                        that.jQuery("#" + that.optio.vva_id_item).trigger("liszt:updated");
                    });
            }
        };  //END _initl_cascd_lov

        function _ajout_overf() {
            if (that.jQuery("#" + that.optio.vva_id_item).closest("div").css("overflow") != "visible") {
                that.jQuery("#" + that.optio.vva_id_item).closest("div").css("overflow", "visible");
            }
        };  //END _ajout_overf

        function initl(pjs_optio) {
            //fusionner les options pass�es en param�tre et leurs valeurs par d�faut
            that.optio = that.jQuery.extend(that.optio, pjs_optio);

            that.node = document.getElementById(that.optio.vva_id_item);

            // only proceed if that.node are not false
            if (that.node) {
                that.id = that.node.id;

                vob_chosn = that.jQuery("#" + that.optio.vva_id_item)
                    .chosen(
                    {// Search settings
                        no_results_text: that.optio.vva_mesg_aucun_don_trouv,
                        allow_single_deselect: that.optio.vbo_permt_deslc,
                        search_contains: that.optio.vbo_rechr_contn  //Option pour permettre le "contains" pour la recherche au lieu du d�but de mot
                    });



//                console.log("Chosen apres init");
//                console.log(vob_chosn);
                that.jQuery("#" + that.optio.vva_id_item)
                    .change(function () {
                        that.jQuery("#" + that.optio.vva_id_item).trigger("apexbeforerefresh");
                    })
                    .bindWithDelay("keyUp", function (e) {
                    }, 500)
                    //Event que je me suis cr�er pour lever le keyup (Une touche est pes�e pour rechercher)
                    .bind("liszt:ajaxrefresh", function (event, pob_objet) {
                        that.jQuery.exec_aplic_procs({
                            plugn_ajax: that.optio.vva_plugn_ajax,
                            widget_action: "OBTEN_LOV",
                            x01: pob_objet.search_text,
                            sucs_procs: function (pjs_json) {
                                var vnu_tail_optio, vnu_tail_json, vta_tabl, vnu_compt, vnu_compt_j, vbo_trouv, vjs_json;
                                vta_tabl = that.jQuery("#" + that.optio.vva_id_item)[0].options;
                                vjs_json = (pjs_json.values) ? pjs_json.values : pjs_json;
                                vbo_trouv = false;

                                //Ajuster l'index pour s'accorder au array interne du chosen
                                for (vnu_compt = 0, vnu_tail_optio = vta_tabl.length; vnu_compt < vnu_tail_optio; vnu_compt++) {
                                    for (vnu_compt_j = 0, vnu_tail_json = vjs_json.length; vnu_compt_j < vnu_tail_json; vnu_compt_j++) {
                                        if (vta_tabl[vnu_compt].value == vjs_json[vnu_compt_j].r) {
                                            if (vta_tabl[vnu_compt].selected && pob_objet.chosen.is_multiple) {
                                                vjs_json.splice(vnu_compt_j, 1);
                                                vnu_tail_json--;
                                            } else {
                                                vjs_json[vnu_compt_j].i = vnu_compt; //Pour l'index
                                            }
                                            vbo_trouv = true;
                                        }
                                    }
                                }

                                //Si rien n'est trouv�, alors c'est que ca n'existe pas dans la liste et on coupe les valeurs
                                if (!vbo_trouv) {
                                    vjs_json.splice(0, vjs_json.length);
                                }

                                //Filtrer les data avec ce qui existe d�j� (selected), seulement pour les listes multiples
                                //J'aimerai bien pouvoir filtrer directement avec le "select" de l'item, pour �viter de faire travailler le server inutilement,
                                //mais de la fa�on que le plugin est fait, il se sert d'un index personnalis� pour faire le mapping entre sa liste et le select list d'apex
//                                console.log('objet chosen');
//                                console.log(pob_objet.chosen);
                                //Devrait �tre un array avec plein d'options comme le select_to_array("selector")
                                pob_objet.chosen.update_results_data(vjs_json);
                            }
                        });
                    });


                that.jQuery("#" + that.optio.vva_id_item).trigger("liszt:updated");
                that._initl_cascd_lov();
                that._ajout_overf();
            } //end if (that.node)
        }; //END initl

        return that;
    } //END chosn
}