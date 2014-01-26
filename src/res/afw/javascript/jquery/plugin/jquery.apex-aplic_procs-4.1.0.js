/*
 2 * jQuery APEX-Application-Process
 3 * By: Louis-Guillaume Carrier-Bédard [http://www.lgcarrier.com]
 4 * Version 0.0.1
 5 * Last Modified: 2009/11/21
 6 *
 7 * Copyright 2009 Louis-Guillaume Carrier-Bédard
 8 *
 9 * Licensed under the Apache License, Version 2.0 (the "License");
 10 * you may not use this file except in compliance with the License.
 11 * You may obtain a copy of the License at
 12 *
 13 * http://www.apache.org/licenses/LICENSE-2.0
 14 *
 15 * Unless required by applicable law or agreed to in writing, software
 16 * distributed under the License is distributed on an "AS IS" BASIS,
 17 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 18 * See the License for the specific language governing permissions and
 19 * limitations under the License.
 20 */

(function($) {

  $.exec_aplic_procs = function(pjs_optio) {
    var l_argmt_nams = [];
    var l_argmt_vals = [];

    var vjs_deflt = {
      async : false,
      type_reqst : "POST",
      reqst_url : "wwv_flow.show",
      flow_id : afw.sie_11.prodt.obten_numr_apex(),
      flow_step_id : afw.sie_13.page.obten_numr_apex(),
      insta : afw.sie_07.sesn.obten_numr_apex(),
      plugn_ajax : "",
      aplic_procs : "UPDATE_SESSION_STATE",
      procs_retrn_data_type : "json",
      sucs_procs : function() {
      },
      error_procs : function() {
      },
      compl_procs : function() {
      },
      argmt_nams : [],
      argmt_vals : [],
      widget_action : "",
      x01 : "",
      x02 : "",
      x03 : "",
      x04 : "",
      x05 : "",
      x06 : "",
      x07 : "",
      x08 : "",
      x09 : "",
      x10 : "",
      f01 : ""
    };

    var vjs_optio = $.extend(vjs_deflt, pjs_optio);

    if(( l_argmt_count = vjs_optio.argmt_nams.length) > 0) {
      for( i = 0; i < l_argmt_count; i++) {
        l_argmt_nams[i] = vjs_optio.argmt_nams[i];
        l_argmt_vals[i] = vjs_optio.argmt_vals[i];
      }
    }

    $.ajax({
      async : vjs_optio.async,
      type : vjs_optio.type_reqst,
      url : vjs_optio.reqst_url,
      data : {
        p_flow_id : vjs_optio.flow_id,
        p_flow_step_id : vjs_optio.flow_step_id,
        p_instance : vjs_optio.insta,
        p_request : (vjs_optio.plugn_ajax != "" ) ? "PLUGIN=" + vjs_optio.plugn_ajax : "APPLICATION_PROCESS=" + vjs_optio.aplic_procs,
        "p_arg_names" : l_argmt_nams,
        "p_arg_values" : l_argmt_vals,
        p_widget_action : vjs_optio.widget_action,
        x01 : vjs_optio.x01,
        x02 : vjs_optio.x02,
        x03 : vjs_optio.x03,
        x04 : vjs_optio.x04,
        x05 : vjs_optio.x05,
        x06 : vjs_optio.x06,
        x07 : vjs_optio.x07,
        x08 : vjs_optio.x08,
        x09 : vjs_optio.x09,
        x10 : vjs_optio.x10,
        f01 : vjs_optio.f01
      },
      dataType : vjs_optio.procs_retrn_data_type,
      success : function(data, textStatus) {
        eval(vjs_optio.sucs_procs(data));
      },
      error : function(data) {
        eval(vjs_optio.error_procs(data));
      },
      complete : function(data) {
        eval(vjs_optio.compl_procs(data));
      }
    });
  };

})(afw.jQuery);
