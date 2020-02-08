import QtQuick 2.12
import QtQuick.Controls 2.12

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("Scroll")

    Column {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter

        spacing: 10

        BusyIndicator {
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Button {
            id: buttonGenetareError
            text: "Generate random error"
            anchors.horizontalCenter: parent.horizontalCenter

            onClicked: dialog.open()
        }
    }

    Dialog {
        id: dialog
        // Define own property
        property int error: 0
        anchors.centerIn: parent
        width: parent.width * 0.7
        modal: true
        title: "Caution"
        closePolicy: Dialog.NoAutoClose


        onAboutToShow: {
            checkbox.checked = false
            error = Math.round(Math.random() * 1000)
        }

        Column {
            id: column
            spacing: 20
            anchors.fill: parent


            Label {
                id: label
                text: "Unexpected error occured: <b>"
                + dialog.error + "</b>. Confirm reading the information"
                wrapMode: Text.WordWrap
                textFormat: Text.RichText
                width: parent.width
            }

            CheckBox {
                id: checkbox
                text: "Understood"
                anchors.right: parent.right
            }

            Row {
                anchors.right: parent.right
                spacing: 20

                DialogButtonBox {
                    id: ok
                    enabled: checkbox.checked
                    standardButtons: Dialog.Ok

                    onClicked: {
                        dialog.accept()
                        dialog.close()
                    }
                }
            }

        }
    }

}
