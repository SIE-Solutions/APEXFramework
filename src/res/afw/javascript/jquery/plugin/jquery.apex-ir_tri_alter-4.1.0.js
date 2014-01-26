/*
 * jQuery APEX-Interactive Report alternate sort
 * By: Louis-Guillaume Carrier-Bédard [http://lgcarrier.blogspot.com]
 * Version 4.1.0
 * Last Modified: 2012/01/03
 *
 * Copyright 2009 Louis-Guillaume Carrier-Bédard
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

(function ($) {
  $.trans_IR_tri_alter = function(optio,calbc) {
        
    var defau = {
       debug: false
    };
      
    var o = $.extend(defau, optio);
    
    if($('div#apexir_DATA_PANEL').length > 0 && !$('div#apexir_DATA_PANEL').get(0).tri_alter) {

      $.post(
        "wwv_flow.show",
        { p_flow_id:$('#pFlowId').val(),
          p_flow_step_id:$('#pFlowStepId').val(),
          p_instance:$('#pInstance').val(),
          p_request:"APPLICATION_PROCESS=INFO_TRI_ALTER"
        },
        function(jQueryCode){
          if(!$('div#apexir_DATA_PANEL').get(0).tri_alter) {
            var colns;
            try {
              eval("colns=" + jQueryCode + ";");
            }
            catch (e) {
              colns = [];
            }
            
            $('div#apexir_DATA_PANEL').get(0).tri_alter = {
              trait:1,
              colns: colns
            };
            
            for (var i = 0; i < colns.length; i++) {
              if (colns[i].ordre == 1) {
                $('#apexir_' + colns[i].nom.replace(/[$]/,"\\$")).append(colns[i].img);
              }
            }
          }
        }
      );
      
      //Mode DEBUG
      if(o.debug){
        console.log("execution de la fonction $.trans_IR_tri_alter();");
      }
      
      eval(calbc);
    }
  }  

})(afw.jQuery);
