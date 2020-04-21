var btnAdd01;
var btnAdd02;
var btnEdit01;
var btnEdit02;
var btnDelete01;
var btnDelete02;
var btnDelete01A;
var btnDelete02A;
var btnSave01;
var btnSave02;
var btnVerify01;
var btnVerify02;
var btnCancel01;
var btnCancel02;
var pnlData;
var pnlButtons01;
var pnlButtons02;
var pnlMain;
var SW;

function GetControls() {
    btnAdd01 = document.getElementById('<%=btnAdd01.ClientID %>')
    btnAdd02 = document.getElementById('<%=btnAdd02.ClientID %>')
    btnEdit01 = document.getElementById('<%=btnEdit01.ClientID %>')
    btnEdit02 = document.getElementById('<%=btnEdit02.ClientID %>')
    btnDelete01 = document.getElementById('<%=btnDelete01.ClientID %>')
    btnDelete02 = document.getElementById('<%=btnDelete02.ClientID %>')
    btnDelete01A = document.getElementById('<%=btnDelete01A.ClientID %>')
    btnDelete02A = document.getElementById('<%=btnDelete02A.ClientID %>')
    btnSave01 = document.getElementById('<%=btnSave01.ClientID %>')
    btnSave02 = document.getElementById('<%=btnSave02.ClientID %>')
    btnVerify01 = document.getElementById('<%=btnVerify01.ClientID %>')
    btnVerify02 = document.getElementById('<%=btnVerify02.ClientID %>')
    btnCancel01 = document.getElementById('<%=btnCancel01.ClientID %>')
    btnCancel02 = document.getElementById('<%=btnCancel02.ClientID %>')
    pnlData = document.getElementById('<%=pnlData.ClientID %>')
    pnlButtons01 = document.getElementById('<%=pnlButtons01.ClientID %>')
    pnlButtons02 = document.getElementById('<%=pnlButtons02.ClientID %>')
    pnlMain = document.getElementById('<%=pnlMain.ClientID %>')
    SW = true;
}

function SwitchVisibility(ctl, sw) {
    ctl = document.getElementById(ctl);
    if (sw) {
        ctl.style.cssText = "display:normal";
    } else {
        ctl.style.cssText = "display:none";
    }
}


function ButtonsAdd() {
    GetControls();
    SwitchVisibility(btnAdd01.id, false);
    SwitchVisibility(btnAdd02.id, false);
    SwitchVisibility(btnEdit01.id, false);
    SwitchVisibility(btnEdit02.id, false);
    SwitchVisibility(btnDelete01.id, false);
    SwitchVisibility(btnDelete02.id, false);
    SwitchVisibility(btnDelete01A.id, false);
    SwitchVisibility(btnDelete02A.id, false);
    SwitchVisibility(btnSave01.id, true);
    SwitchVisibility(btnSave02.id, true);
    SwitchVisibility(btnVerify01.id, false);
    SwitchVisibility(btnVerify02.id, false);
    SwitchVisibility(btnCancel01.id, true);
    SwitchVisibility(btnCancel02.id, true);
    SwitchVisibility(pnlData.id, false);
    SwitchVisibility(pnlMain.id, true);
}

function ButtonsEdit() {
    SwitchVisibility(btnAdd01.id, false);
    SwitchVisibility(btnAdd02.id, false);
    SwitchVisibility(btnEdit01.id, false);
    SwitchVisibility(btnEdit02.id, false);
    SwitchVisibility(btnDelete01.id, false);
    SwitchVisibility(btnDelete02.id, false);
    SwitchVisibility(btnDelete01A.id, false);
    SwitchVisibility(btnDelete02A.id, false);
    SwitchVisibility(btnSave01.id, true);
    SwitchVisibility(btnSave02.id, true);
    SwitchVisibility(btnVerify01.id, true);
    SwitchVisibility(btnVerify02.id, true);
    SwitchVisibility(btnCancel01.id, true);
    SwitchVisibility(btnCancel02.id, true);
    SwitchVisibility(pnlData.id, false);
    SwitchVisibility(pnlMain.id, true);
}

function ButtonsDelete() {
    SwitchVisibility(btnAdd01.id, false);
    SwitchVisibility(btnAdd02.id, false);
    SwitchVisibility(btnEdit01.id, false);
    SwitchVisibility(btnEdit02.id, false);
    SwitchVisibility(btnDelete01.id, false);
    SwitchVisibility(btnDelete02.id, false);
    SwitchVisibility(btnDelete01A.id, true);
    SwitchVisibility(btnDelete02A.id, true);
    SwitchVisibility(btnSave01.id, false);
    SwitchVisibility(btnSave02.id, false);
    SwitchVisibility(btnVerify01.id, false);
    SwitchVisibility(btnVerify02.id, false);
    SwitchVisibility(btnCancel01.id, true);
    SwitchVisibility(btnCancel02.id, true);
    SwitchVisibility(pnlData.id, false);
    SwitchVisibility(pnlMain.id, true);
}

