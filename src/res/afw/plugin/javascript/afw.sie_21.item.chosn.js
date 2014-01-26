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
        this.pob_objet = false;
        this.initl = initl;
        this._initl_cascd_lov = _initl_cascd_lov;
        this._ajout_overf = _ajout_overf;
        this._filtr_lov = _filtr_lov;

        this.optio = {
            vva_id_item: "",
            vva_mesg_aucun_don_trouv: "Aucune donnée trouvée",
            vva_id_item_parnt: "",
            var_id_item_parnt: [],
            vva_id_item_submt: false,
            var_id_item_submt: [],
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

        function _initl_cascd_lov() {
            if (that.optio.vva_id_item_parnt != "") {
                var vva_ajax_ident = null;

                vva_ajax_ident = that.optio.vva_plugn_ajax;

                that.optio.var_id_item_parnt = that.optio.vva_id_item_parnt.split(',');
                $(that.optio.var_id_item_parnt).each(function (i) {
                    that.optio.var_id_item_parnt[i] = '#' + that.optio.var_id_item_parnt[i];
                });

                if (!!that.optio.vva_id_item_submt) {
                    that.optio.var_id_item_submt = that.optio.vva_id_item_submt.split(',');
                }

                apex.widget.selectList_AFW("#" + that.optio.vva_id_item,
                    {   "ajaxIdentifier": vva_ajax_ident,
                        "dependingOnSelector": that.optio.var_id_item_parnt.join(','),
                        //"pageItemsToSubmit": (!!that.optio.vva_id_item_submt) ? that.optio.var_id_item_submt : "",
                        "optimizeRefresh": that.optio.vbo_rafrc_optim,
                        "nullValue": ""});

                that.jQuery("#" + that.optio.vva_id_item)
                    .bind("apexafterrefresh", function () {
                        that.jQuery("#" + that.optio.vva_id_item).trigger("chosen:updated");
                    });
            }
        };  //END _initl_cascd_lov

        function _ajout_overf() {
            if (that.jQuery("#" + that.optio.vva_id_item).closest("div").css("overflow") != "visible") {
                that.jQuery("#" + that.optio.vva_id_item).closest("div").css("overflow", "visible");
            }
        };  //END _ajout_overf

        function _filtr_lov(pva_optio_selct_list) {
//            console.log("_filtr_lov");
//            console.log("pva_optio_selct_list==");
//            console.log(pva_optio_selct_list);

//            console.log(that.jQuery("#" + that.optio.vva_id_item).chosen());

            //that.jQuery("#" + that.optio.vva_id_item + " option").remove();
            //that.jQuery("#" + that.optio.vva_id_item).append(pva_optio_selct_list);


            /*var old_results_data = afw.sie_21.item.chosn.obten(that.optio.vva_id_item).pob_objet.chosen.results_data;

             //console.log("old_results_data==");
             //console.log(old_results_data);

             for (_i = 0, _len_old = old_results_data.length; _i < _len_old; _i++) {
             if (!old_results_data[_i].selected) {
             //             console.log(old_results_data[_i]);

             that.jQuery("#" + that.optio.vva_id_item + " option:[value='" + old_results_data[_i].value + "']").remove();
             }
             }
             */
            //console.log(that.jQuery("#" + that.optio.vva_id_item + " option"));
//            console.log("Nombre option dans la LOV: "+that.jQuery("#" + that.optio.vva_id_item+ " option").length);
            that.jQuery("#" + that.optio.vva_id_item + " option").remove();
//            console.log("Nombre option dans la LOV: "+that.jQuery("#" + that.optio.vva_id_item+ " option").length);
            that.jQuery("#" + that.optio.vva_id_item).append(pva_optio_selct_list);
//            console.log("Nombre option dans la LOV: "+that.jQuery("#" + that.optio.vva_id_item+ " option").length);
        }; //END _filtr_lov

        function initl(pjs_optio) {
            //fusionner les options passées en paramètre et leurs valeurs par d�faut
            that.optio = that.jQuery.extend(that.optio, pjs_optio);

            that.node = document.getElementById(that.optio.vva_id_item);

            if (!!that.node) {
                that.id = that.node.id;
				
                that.jQuery("#" + that.optio.vva_id_item)
                    .chosen(
                    {// Search settings
                        no_results_text: that.optio.vva_mesg_aucun_don_trouv,
                        allow_single_deselect: that.optio.vbo_permt_deslc,
                        search_contains: that.optio.vbo_rechr_contn  //Option pour permettre le "contains" pour la recherche au lieu du début de mot
                    })
                    .change(function () {
                        that.jQuery("#" + that.optio.vva_id_item).trigger("apexbeforerefresh");
                    })
                    .bind("chosen:ajaxrefresh", function (event, pob_objet) {
                        that.pob_objet = pob_objet;
                        var vva_search_text = (!!pob_objet) ? pob_objet.search_text : "";

                        that.jQuery.exec_aplic_procs({
                            plugn_ajax: that.optio.vva_plugn_ajax,
                            widget_action: "FILTR_LOV",
                            x01: vva_search_text,
                            procs_retrn_data_type: "html",
                            sucs_procs: _filtr_lov
                        });
                    });

                that._initl_cascd_lov();
                that._ajout_overf();
            } //end if (that.node)
        }; //END initl

        return that;
    } //END chosn
}