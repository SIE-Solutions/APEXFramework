/**
 * @namespace afw.sie_21.item.selct_2
 */
afw.sie_21.item.selct_2 = {
    insta: [],
    obten: function (pnu_id) {
        for (i = 0; i < afw.sie_21.item.selct_2.insta.length; i++) {
            if (afw.sie_21.item.selct_2.insta[i].id == pnu_id) {
                return afw.sie_21.item.selct_2.insta[i];
            }
        }
    },
    suprm: function (pnu_id) {
        for (i = 0; i < afw.sie_21.item.selct_2.insta.length; i++) {
            if (afw.sie_21.item.selct_2.insta[i].id == pnu_id) {
                afw.sie_21.item.selct_2.insta.splice(i, 1);
            }
        }
    },
    /**
     * @constructor
     */
    selct_2: function (pjs_optio, pjs_calbc) {
        this.jQuery = afw.jQuery;
        var that = this;
        this.node = false;
        this.id = false;
        this.initl = initl;
        this._rafrc_cascd_lov = _rafrc_cascd_lov;

        this.optio = {
            vva_id_item: "",
            vva_plugn_ajax: "",
            vbo_load_remt_data: false,
            vbo_multp: false,
            vva_place_holdr: "",
            vbo_allow_clear: true,
            vnu_minm_reslt_for_searc: 10,
            vnu_minm_input_length: null,
            vnu_maxm_input_length: null,
            vnu_maxm_selct_size: null,
            vva_seprt: ':',
            vva_largr: '300px',
            vva_liste_item_parnt: "",
            vva_liste_item_submt: "",
            vbo_rafrc_optim: false
        };

        this.initl(pjs_optio);

        return that;

        function initl(pjs_optio) {
            //fusionner les options passées en paramètre et leurs valeurs par défaut
            that.optio = that.jQuery.extend(true, that.optio, pjs_optio);

            that.node = document.getElementById(that.optio.vva_id_item);

            if (!!that.node) {
                that.id = that.node.id;

                if (!that.optio.vbo_load_remt_data) {
                    that.jQuery("#" + that.optio.vva_id_item)
                        .select2({
                            placeholder: that.optio.vva_place_holdr,
                            allowClear: that.optio.vbo_allow_clear,
                            minimumResultsForSearch: that.optio.vnu_minm_reslt_for_searc,
                            minimumInputLength: that.optio.vnu_minm_input_length,
                            maximumInputLength: that.optio.vnu_maxm_input_length,
                            maximumSelectionSize: that.optio.vnu_maxm_selct_size,
                            separator: that.optio.vva_seprt,
                            closeOnSelect: true,
                            width: that.optio.vva_largr,
                            data: null
                        }
                    );
                } //end if (! that.optio.vbo_load_remt_data)
                else if (that.optio.vbo_load_remt_data) {
                    that.jQuery("#" + that.optio.vva_id_item)
                        .select2({
                            multiple: that.optio.vbo_multp,
                            placeholder: that.optio.vva_place_holdr,
                            allowClear: that.optio.vbo_allow_clear,
                            minimumInputLength: that.optio.vnu_minm_input_length,
                            maximumInputLength: that.optio.vnu_maxm_input_length,
                            maximumSelectionSize: that.optio.vnu_maxm_selct_size,
                            separator: that.optio.vva_seprt,
                            closeOnSelect: true,
                            width: that.optio.vva_largr,
                            data: null,
                            ajax: {
                                url: "wwv_flow.show",
                                dataType: 'json',
                                quietMillis: 100,
                                params: {
                                    type: "POST"
                                },
                                data: function (term, page) {
                                    return {
                                        p_flow_id: afw.sie_11.prodt.obten_numr_apex(),
                                        p_flow_step_id: afw.sie_13.page.obten_numr_apex(),
                                        p_instance: afw.sie_07.sesn.obten_numr_apex(),
                                        p_request: "PLUGIN=" + that.optio.vva_plugn_ajax,
                                        "p_arg_names": [],
                                        "p_arg_values": [],
                                        p_widget_action: "RECHR_LOV",
                                        x01: term
                                    };
                                },
                                results: function (data, page) {
                                    return {results: data.liste_valr};
                                }
                            },
                            initSelection: function (element, callback) {

                                var id = that.jQuery(element).val();

                                console.log(that.jQuery(element));
                                console.log(id);

                                if (id !== "") {
                                    that.jQuery.exec_aplic_procs({
                                        plugn_ajax: that.optio.vva_plugn_ajax,
                                        widget_action: "VALR_SELCT_INITL",
                                        x01: id,
                                        procs_retrn_data_type: "json",
                                        sucs_procs: function (data) {
                                            callback(data);
                                        }
                                    });

                                }
                            }
                        }
                    );

                    that.jQuery("#" + that.optio.vva_id_item)
                        .on("change", function () {
                            that.jQuery(that).trigger("apexbeforerefresh");
                        });


                } //end if (that.optio.vbo_load_remt_data)


                // if it's a cascading select list we have to register apexbeforerefresh and change events for our masters
                if (that.optio.vva_liste_item_parnt) {
                    that.jQuery(that.optio.vva_liste_item_parnt)
                        .bind("apexbeforerefresh", function () {
                            console.log('apexbeforerefresh');
                        })
                        .change(that._rafrc_cascd_lov);
                }
                // register the refresh event which is triggered by a manual refresh
                that.jQuery("#" + that.optio.vva_id_item).bind("apexrefresh", that._rafrc_cascd_lov);

            } //end if (that.node)
        }; //END initl

        // Clears the existing options and executes an AJAX call to get new values based
        // on the depending on fields
        function _rafrc_cascd_lov() {
            apex.widget.util.cascadingLov(
                "#" + that.optio.vva_id_item,
                that.optio.vva_plugn_ajax,
                {
                    p_widget_action: "_RAFRC_CASCD_LOV",
                },
                {
                    optimizeRefresh: that.optio.vbo_rafrc_optim,
                    dependingOn: that.optio.vva_liste_item_parnt,
                    pageItemsToSubmit: that.optio.vva_liste_item_submt,
                    clear: function () {

                        that.jQuery("#" + that.optio.vva_id_item).val("").trigger("change");

//                        that.jQuery("#" + that.optio.vva_id_item).select2('val', null);
                    },
                    success: function (data) {
                        console.log('success');
                        that.jQuery("#" + that.optio.vva_id_item).val("").trigger("change");
//                        that.jQuery("#" + that.optio.vva_id_item).select2('val', null);

//                                that.jQuery("#" + that.optio.vva_id_item).select2({
//                                    data:{ results: data, text: function(item) { return item.tag; } }
//                                });

                    }
                });

        }; // END _rafrc_cascd_lov

        return that;
    } //END selct_2
}