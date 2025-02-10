

foreach (Finao\Permissions\Permission::withoutGlobalScopes()->get()->pluck('name')->map(fn ($s) => str($s)->reverse())->sort()->map(fn ($s) => $s->reverse())->values() as $name) {
    if (!str($name)->contains([
        'covid19report', 'covid19reporting', 'inductiondoc', 'induction_document', 'link', 'test', 'dynmenuitem', '_page', '_smsbroadcast', '_apollo_form', '_workflow', 'workingday', 'toastbroadcast', '_alert', 'helptip', '_cms', '_dropdown', 'view_user_guide', '_menu', 'update_role', 'apollo', 'sendtoast', 'smsreport', 'smsbroadcast', 'working_day', '_announcement', '_settings', 'file_management', '_file', 'access_sitemap', 'smsdeliveryreceipt', 'view_roles', 'view_history_role', 'edit_role', 'sms_report',
    ])) {
    echo "$name\n";
    }
}
