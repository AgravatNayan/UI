function showConfirmMessage(head,msg,req_url,req_data)
{
	$.alert({title: head,
        content: msg,
        escapeKey: 'cancelAction',
        theme: 'material',
        type: 'red',
        closeIcon: true,
        buttons: {
            confirm: {
                btnClass: 'btn-danger',
                text: 'Yes',
                keys: ['Y', 'y','enter'],
                action: function () {
                	onconfirm(req_url, req_data);
                }
            },
            cancelAction: {
                text: 'No',
                btnClass: 'btn-secondary',
                keys: ['N', 'n'],
                action: function () {
                }
            }
        }
    });
}
function MessageBox(t, msg, type, icon)
{
    $.alert({
        title: t,
        icon: icon,
        type: type,
        content: msg,
        escapeKey: 'OK',
        theme: 'material',
        buttons: {
            OK: {
                btnClass: 'btn-' + type,
                keys: ['enter']

            }}

    });
}