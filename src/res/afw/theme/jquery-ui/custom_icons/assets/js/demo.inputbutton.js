var initInterface = function(useThemeRoller){
    if(useThemeRoller){
        $("#switcher").themeswitcher({ loadTheme: "Smoothness", width: 220 });        
    }    
    
    $("input:submit:first").inputButton({ icons: { primary: "ui-icon-disk"} });
    $("input:reset:first").inputButton({ icons: { primary: "ui-icon-refresh"} });
    $("input:submit:last").inputButton({ icons: { primary: "fff-icon-disk"} });
    $("input:reset:last").inputButton({ icons: { primary: "fff-icon-arrow-refresh"} });
    
    $("form:first").submit(function(){
        alert("Submitting form...");
        return false;
    });
    
    setTimeout(function(){ 
        $("#loadMsg").remove(); 
        $("#demoContainer").fadeIn();        
    }, 1000);
};