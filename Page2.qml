import QtQuick 2.7

Page2Form {
    switchPassword.onTextChanged: {
        settings.switchPassword = switchPassword.text;
}
    token.onTextChanged: {
        settings.token = token.text;
}
    receiver.onTextChanged: {
        settings.to = receiver.text;
    }

    sender.onTextChanged: {
        settings.from = sender.text;
}


}
