import QtQuick 2.7

Page1Form {
    orderBox1.onCurrentTextChanged: {
        textField1.text = "SN" + settings.switchPassword + orderBox1.currentText
}
    function prompt(text){
        logger.text = text
        console.log(text)
    }



    button1.onClicked: {
        console.log("Button Pressed. Entered text: " + textField1.text + orderBox1.currentText);
        if (textField1.text == ""){
            return
        }

        console.log("to"+settings.to);
        console.log("from"+settings.from);

        var doc = new XMLHttpRequest();
        var params = "token=" + settings.token + "&destination=" + settings.to + "&from=" + settings.from + "&message=" + textField1.text;
        console.log(params);
        var url = "https://apps.netelip.com/sms/api.php";
        doc.open("POST", url, true);
        // Send the proper header information along with the request
        doc.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        doc.setRequestHeader("Content-length", params.length);
        doc.setRequestHeader("Connection", "close");

        doc.onreadystatechange = function() {
            if (doc.readyState == XMLHttpRequest.HEADERS_RECEIVED) {
                console.log("Headers -->");
                console.log(doc.getAllResponseHeaders ());
                console.log("Last modified -->");
                console.log(doc.getResponseHeader ("Last-Modified"));

            } else if (doc.readyState == XMLHttpRequest.DONE) {
                switch(doc.status) {
                    case 200:
                        prompt(qsTr("OK - Message sent succesfully, will receive SMS response in ") + settings.from)
                        /*
                        var a = doc.responseXML.documentElement;
                        for (var ii = 0; ii < a.childNodes.length; ++ii) {
                            prompt(a.childNodes[ii].nodeName);
                        }
                        console.log("Headers -->");
                        console.log(doc.getAllResponseHeaders ());
                        console.log("Last modified -->");
                        console.log(doc.getResponseHeader ("Last-Modified"));
                        */
                        break;
                    case 401:
                        prompt(qsTr("Error: Unauthorized - authentication error, check token"))
                        break;
                    case 402:
                        prompt(qsTr("Error: Payment required - insuficient money to send sms"))
                        break;
                    case 412:
                        prompt(qsTr("Error: Precondition failed - unknown error"))
                        break;
                    case 103:
                        prompt(qsTr("Error: Bad parameters"))
                        break;
                    case 109:
                        prompt(qsTr("Error: Mandatory parameter not given"))
                        break;
                    case 404:
                        prompt(qsTr("Error: Sent SMS ID not found"))
                        break;
                    default:
                        prompt(qsTr("Error: Unknown"))
                }
            }
        }
        doc.send(params);
    }
}
