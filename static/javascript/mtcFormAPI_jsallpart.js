function GetCurrentPage()
{
    var currentPage = location.href

    if (currentPage.indexOf("errorMsg") != -1)
    {
        var currentPageSubstring = currentPage.substring(0, currentPage.indexOf("errorMsg"))
        var tempString = currentPage.substring(currentPage.indexOf("errorMsg"))

        if (tempString.indexOf("&") != -1)
        {
            tempString = tempString.substring(tempString.indexOf("&")+1)
            currentPage = currentPageSubstring + tempString
        }
        else if ((currentPageSubstring.indexOf("?") == currentPageSubstring.length - 1) ||
            (currentPageSubstring.indexOf("&") == currentPageSubstring.length - 1))
        {
            currentPage = currentPageSubstring.substring(0, currentPageSubstring.length - 1)
        }
        else
        {
            currentPage = currentPageSubstring
        }
    }

    if (document.getElementById("CurrentPage") != null)
    {
        var hiddenCurrentPage = document.getElementById("CurrentPage");

        hiddenCurrentPage.value = currentPage;
    }
}

function IsActionSFGA()
{
    var forms = document.forms;
    for( var i = 0; i < forms.length; i++ )
    {
        var form = forms[i];
        var _action = form.getAttribute("action");

        if (_action != null && (_action == "https://lct.salesforce.com/sfga" || _action == "http://lct.salesforce.com/sfga"))
        {
            return true;
        }
    }

    return false;
}

function ModifyReturnValueForSFGA(returnURL)
{
    var forms = document.forms;
    for( var i = 0; i < forms.length; i++ )
    {
        var form = forms[i];
        var _action = form.getAttribute("action");

        if (_action != null && (_action == "https://lct.salesforce.com/sfga" || _action == "http://lct.salesforce.com/sfga"))
        {
            for( var j = 0; j < form.elements.length; j++ )
            {
                var input = form.elements[j];
                if(input.name == 'sfga')
                {
                    var newInputValue;
                    var inputValue = input.value.split("&");

                    if (inputValue != null)
                    {
                        for (var k=0; k < inputValue.length; k++)
                        {
                            if (inputValue[k].indexOf("retURL=") == 0)
                            {
                                newInputValue = newInputValue + "&retURL=" + returnURL;
                            }
                            else if (newInputValue == null || newInputValue == "")
                            {
                                newInputValue = inputValue[k];
                            }
                            else
                            {
                                newInputValue = newInputValue + "&" + inputValue[k];
                            }
                        }
                    }
                    input.value = newInputValue

                    break;
                }
            }
        }
    }
}

function IsNullOrEmpty(_string)
{
    if (_string == null)
    {
        return true;
    }
    else
    {
        var s = _string.replace(" ", "");
        if (s.length == 0)
        {
            return true;
        }
    }
    return false;
}
