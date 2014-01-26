/**
 * @namespace afw.sie_21.actio_dynmq.trans_raprt_sql
 */
afw.sie_21.actio_dynmq.trans_raprt_sql = function(pId){
};

$a_report_orign = $a_report;

$a_report = function(pId,pMin,pMax,pFetched,pSort,pRefreshMode) {
  apex.jQuery('#report_' + pId + '_catch').trigger('apexbeforerefresh', pId);
  
  var l_URL = 'p='+$v('pFlowId')+':'+$v('pFlowStepId')+':'+$v('pInstance')+':FLOW_PPR_OUTPUT_R'+pId+'_';

  if (pRefreshMode) {
    if (pRefreshMode === 'current'){
    }
    else if (pRefreshMode === 'reset') {
        l_URL += 'reset_R_' + pId;
    }
  }
  else {
    if (!!pSort) {
      l_URL += pSort+'::RP&fsp_region_id='+pId;
    } else {
      l_URL += 'pg_R_'+pId+':NO&pg_max_rows='+pMax+'&pg_min_row='+pMin+'&pg_rows_fetched='+pFetched;
    }
  }

  var lRequest = new apex.ajax.url(
    l_URL,
    function(pResponse){
      var l_s = pResponse.readyState;
      var l_Id = lRequest.report_id;
      if(l_s == 1){
      }
      else if(l_s == 2||l_s == 3){
      }
      else if(l_s == 4){
        var lTemp = $u_js_temp_drop();
        apex.jQuery('#report_'+l_Id+'_catch').attr('id', 'report_'+l_Id+'_catch_old');
        apex.jQuery(lTemp).html(pResponse.responseText);
        
        // Transformer le rapport SQL
        afw.sie_21.actio_dynmq.trans_raprt_sql(pId);
        
        apex.jQuery('#report_'+l_Id+'_catch_old').replaceWith(apex.jQuery('#report_'+l_Id+'_catch'));
        apex.jQuery(lTemp).empty();
        apex.jQuery('#report_' + pId + '_catch').trigger('apexafterrefresh', pId);
      }
      else{
        return false;
      }
    }
  );
  
  lRequest.report_id = pId;
  lRequest._get();
  return;  
};