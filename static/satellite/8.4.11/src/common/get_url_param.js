module.exports=function(sParam){var sPageURL=decodeURIComponent(window.location.search.substring(1)),sURLVariables=sPageURL.split("&"),sParameterName,i;for(i=0;i<sURLVariables.length;i++){sParameterName=sURLVariables[i].split("=");if(sParameterName[0]===sParam){return void 0===sParameterName[1]?!0:sParameterName[1]}}return};