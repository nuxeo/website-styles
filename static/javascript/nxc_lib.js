var nextitemexist = 'false';
var previoustimerident = '';
var timerident = '';
var totheleft = 0;
var currentPositionOfTheTable = 0;
var tablewidth = 0;

function show( id )
{
    document.getElementById( id ).style.display="block";
}

function hide( id )
{
    document.getElementById( id ).style.display="none";
}

function customerslogoleft()
{
    tablewidth = document.getElementById( 'customers_logo_list' ).clientWidth;
    if ( tablewidth + currentPositionOfTheTable < tablewidth - 105 )
    {
        currentPositionOfTheTable = currentPositionOfTheTable + 530;
        document.getElementById( 'customers_logo_list' ).style.marginLeft = currentPositionOfTheTable+'px';
    }

    if (currentPositionOfTheTable > -105)
    {
        document.getElementById( 'logos_to_the_left' ).src= leftunactivearrow;
    }
    if ( currentPositionOfTheTable > 537-tablewidth)
    {
        document.getElementById( 'logos_to_the_right' ).src= rightactivearrow;
    }
}

function customerslogoright()
{
    tablewidth = document.getElementById( 'customers_logo_list' ).clientWidth;
    if ( tablewidth + currentPositionOfTheTable > 530 )
    {
        currentPositionOfTheTable = currentPositionOfTheTable - 530;
        document.getElementById( 'customers_logo_list' ).style.marginLeft = currentPositionOfTheTable+'px';
    }
    if ( currentPositionOfTheTable < -105 )
    {
        document.getElementById( 'logos_to_the_left' ).src= leftactivearrow;
    }
    if ( currentPositionOfTheTable < 537-tablewidth)
    {
        document.getElementById( 'logos_to_the_right' ).src= rightunactivearrow;
    }
}

function setlanguagelink( obj )
{
    if ( document.getElementById('Search') )
    {
        var a = obj.href.indexOf('/content/search?SearchText=', 0);
        if ( a == -1 )
        {
            var languagelink = obj.href + '/content/search?SearchText=' + document.getElementById('Search').value;
            obj.href = languagelink;
        }
    }
}

function toggletab(activetab, activeblock, hidetab, hideblock, hidetab2, hideblock2, hidetab3, hideblock3)
{
    hide( hideblock );
    document.getElementById(hidetab).className="";
    hide( hideblock2 );
    document.getElementById(hidetab2).className="";
    hide( hideblock3 );
    document.getElementById(hidetab3).className="";
    show( activeblock );
    document.getElementById(activetab).className="selected";
}

function getCookie(name) {
    var cookie = " " + document.cookie;
    var search = " " + name + "=";
    var setStr = null;
    var offset = 0;
    var end = 0;
    if (cookie.length > 0) {
        offset = cookie.indexOf(search);
        if (offset != -1) {
            offset += search.length;
            end = cookie.indexOf(";", offset)
            if (end == -1) {
                end = cookie.length;
            }
            setStr = unescape(cookie.substring(offset, end));
        }
    }
    return(setStr);
}

/**
* Fills form #download_register_form_id with provided userDataString
* Function is called from the function xajax_getformdataXajax()
*
* @param {String} userDataString    A params divided with the ; to fill the form with.
* example "FirstName=TestName;LastName=;"
* @return NULL
*/
function fillformdata(userDataString)
{
    var userDataArray = new Array();
    var dataField = new Array();
    var stringforform = '';

    if( userDataString != null )
    {
        userDataArray = userDataString.split(';');
        var downloadRegisterForm = document.getElementById("download_register_form_id");
        for ( i = 0; i < userDataArray.length; i++ )
        {
            dataField = userDataArray[i].split( '=' );
            if (document.getElementById(dataField[0]))
            {
                stringforform = '';
                stringforform = dataField[1].replace( /\+/g, " " );
                document.getElementById(dataField[0]).value = stringforform;
            }
        }
    }
}


function isEmailCorrect(formname, fieldname)
{
    var re = /^\w+([\.-]?\w+)*@(((([a-z0-9]{2,})|([a-z0-9][-][a-z0-9]+))[\.][a-z0-9])|([a-z0-9]+[-]?))+[a-z0-9]+\.([a-z]{2}|(com|net|org|edu|int|mil|gov|arpa|biz|aero|name|coop|info|pro|museum))$/i;
    if(re.test(eval("document.forms['"+formname+"']."+fieldname+".value")))
    {
        return true;
    }
    else {
        alert("Email is incorrect!");
        eval("document.forms['"+formname+"']."+fieldname+".focus()");
        return false;
    }
}

