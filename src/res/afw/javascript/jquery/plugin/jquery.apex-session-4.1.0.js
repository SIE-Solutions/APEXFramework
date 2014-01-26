/*
2 * jQuery APEX-Session
3 * By: Louis-Guillaume Carrier-Bédard [http://www.lgcarrier.com]
4 * Version 4.1.0
5 * Last Modified: 2012/01/03
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

(function ($) {        
    $.fn.updateSessionState = function(optio){
        var l_arg_names = [];
        var l_arg_values = [];
        var i = 0;
        
        var deflts = {
          async:        false,
          type_reqst:   'POST',
          reqst_url:    'wwv_flow.show',
          flow_id:      $('#pFlowId').val(),
          flow_step_id: $('#pFlowStepId').val(),
          insta:        $('#pInstance').val(),
          aplic_procs:  'UPDATE_SESSION_STATE'
        };
        
        var o = $.extend(deflts, optio);
        
        this.each(function() {
          obj = $(this);
          if (obj.attr("id").indexOf('_HIDDENVALUE')<0) {
            l_arg_names[i] = obj.attr("id");            
            
            if ($('#'+l_arg_names[i]+'_HIDDENVALUE').length==0) {
              l_arg_values[i] = obj.val();
            }
            else {
              l_arg_values[i] = $('#'+l_arg_names[i]+'_HIDDENVALUE').val();
            }
            i++;
          }
        });
        
        $.ajax({
            async: o.async,
            type: o.type_reqst,
            url: o.reqst_url,
            data: {'p_arg_names': l_arg_names,
                   'p_arg_values': l_arg_values,
                   p_flow_id: o.flow_id,
                   p_flow_step_id: o.flow_step_id,
                   p_instance: o.insta,
                   p_request: 'APPLICATION_PROCESS='+o.aplic_procs
            }
        });
        
        return this.each(function() {});
    };
    
    $.updateSessionState = function(optio,calbc) {
        var l_arg_names = [];
        var l_arg_values = [];

        var deflts = {
          async:        false,
          type_reqst:   'POST',
          reqst_url:    'wwv_flow.show',
          flow_id:      $('#pFlowId').val(),
          flow_step_id: $('#pFlowStepId').val(),
          insta:        $('#pInstance').val(),
          aplic_procs:  'UPDATE_SESSION_STATE',
          items: [],
          values: [],
          x01: '',
          x02: '',
          x03: '',
          x04: '',
          x05: '',
          x06: '',
          x07: '',
          x08: '',
          x09: '',
          x10: ''
        };
        
        var o = $.extend(deflts, optio);
        
        if((l_items_count=o.items.length)>0) {
            for (i=0;i<l_items_count;i++) {
                l_arg_names[i] = o.items[i];
                l_arg_values[i] = o.values[i];
            }
        }
      
        $.ajax({
            async: o.async,
            type: o.type_reqst,
            url: o.reqst_url,
            data: {p_flow_id: o.flow_id,
                   p_flow_step_id: o.flow_step_id,
                   p_instance: o.insta,
                   p_request: 'APPLICATION_PROCESS='+o.aplic_procs,
                   'p_arg_names': l_arg_names,
                   'p_arg_values': l_arg_values,
                   x01: o.x01,
                   x02: o.x02,
                   x03: o.x03,
                   x04: o.x04,
                   x05: o.x05,
                   x06: o.x06,
                   x07: o.x07,
                   x08: o.x08,
                   x09: o.x09,
                   x10: o.x10
            },
            complete: function(){
              eval(calbc);
            }
        });      
    };
    
})(afw.jQuery);
