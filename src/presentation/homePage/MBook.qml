import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import Librum.style 1.0
import Librum.icons 1.0


Item 
{
    id: root
    signal leftButtonClicked(int index)
    signal rightButtonClicked(int index, var mouse)
    signal moreOptionClicked(int index, var mouse)
    
    
    implicitWidth: 190
    implicitHeight: 322
    
    
    ColumnLayout
    {
        id: layout
        anchors.fill: parent
        spacing: 0
        
        Rectangle
        {
            id: upperBookPartRounding
            Layout.fillWidth: true
            Layout.preferredHeight: 16
            radius: 4
            color: Style.colorLightBorder
        }
        
        Rectangle
        {
            id: upperRect
            Layout.fillWidth: true
            Layout.preferredHeight: 230
            Layout.topMargin: -6
            color: Style.colorLightBorder
            
            ColumnLayout
            {
                id: topLayout
                anchors.centerIn: parent
                spacing: 0
                
                Image
                {
                    id: bookCover
                    Layout.alignment: Qt.AlignHCenter
                    Layout.topMargin: -10
                    sourceSize.height: 241
                    source: Icons.bookCover
                    fillMode: Image.PreserveAspectFit
                }
            }
        }
        
        
        Rectangle
        {
            id: lowerRect
            Layout.fillWidth: true
            Layout.preferredHeight: 90
            color: Style.colorBackground
            border.width: 1
            border.color: Style.colorLightBorder3
            
            ColumnLayout
            {
                id: bottomLayout
                property int inBookMargin : 14
                
                width: parent.width - inBookMargin*2
                anchors.horizontalCenter: parent.horizontalCenter
                spacing: 0
                
                Label
                {
                    id: bookName
                    Layout.fillWidth: true
                    Layout.preferredHeight: 32
                    Layout.topMargin: 5
                    text: model.title
                    font.weight: Font.Medium
                    color: Style.colorBaseTitle
                    font.pointSize: 11
                    lineHeight: 0.8
                    wrapMode: TextInput.WrapAnywhere
                    elide: Text.ElideRight
                }
                
                Label
                {
                    id: authorName
                    Layout.fillWidth: true
                    Layout.topMargin: 4
                    text: "Stephen R. Covey"
                    color: Style.colorLightText
                    font.pointSize: 10
                }
                
                RowLayout
                {
                    id: lowerRow
                    Layout.fillWidth: true
                    spacing: 0
                    
                    Rectangle
                    {
                        id: percentageBox
                        Layout.preferredWidth: 46
                        Layout.preferredHeight: 18
                        Layout.topMargin: 7
                        color: Style.colorLightPurple2
                        radius: 2
                        
                        Label
                        {
                            id: percentageLabel
                            anchors.centerIn: parent
                            horizontalAlignment: Text.AlignBottom
                            text: "27%"
                            font.weight: Font.DemiBold
                            color: Style.colorBaseTitle
                            font.pointSize: 10
                        }
                    }

                    Item { Layout.fillWidth: true }
                    
                    Image
                    {
                        id: moreIcon
                        Layout.preferredHeight: 20
                        Layout.rightMargin: -2
                        source: Icons.dots
                        fillMode: Image.PreserveAspectFit
                        antialiasing: false
                        
                        MouseArea
                        {
                            id: moreMouseArea
                            anchors.fill: parent
                            hoverEnabled: true
                        }
                    }
                }
            }
        }
    }
    
    MouseArea
    {
        anchors.fill: parent
        acceptedButtons: Qt.AllButtons
        
        onClicked:
            (mouse) =>
            {
                if(mouse.button === Qt.LeftButton)
                {
                    if(moreMouseArea.containsMouse)
                    {
                        root.moreOptionClicked(root.index, mouse);
                        return;
                    }

                    root.leftButtonClicked(root.index);
                }
                
                else if(mouse.button === Qt.RightButton) root.rightButtonClicked(root.index, mouse);
            }
    }
    
    
    function giveFocus()
    {
        root.forceActiveFocus();
    }
}