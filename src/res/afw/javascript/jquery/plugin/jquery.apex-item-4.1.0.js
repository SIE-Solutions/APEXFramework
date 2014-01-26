/*
2 * jQuery APEX-Item
3 * By: Louis-Guillaume Carrier-Bédard [http://www.lgcarrier.com]
4 * Version 4.1.0
5 * Last Modified: 2011/01/03
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
    $.fn.obten_type_item = function(optio){
        var l_arg_names = [];
        var l_arg_values = [];
        var i = 0;
        
        var deflt = {
        };
        
        var o = $.extend(deflt, optio);
        
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

        return this.each(function() {});
    };
})(afw.jQuery);
