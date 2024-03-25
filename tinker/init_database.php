DB::table('site_settings')->where('name', 'Logo')->update(['value' => '']);

DB::table('site_settings')->where('name', 'PDF logo')->update(['value' => '']);

DB::table('site_settings')->where('name', 'Login background')->update(['value' => '/img/login_bg.jpg']);

DB::table('users')
    ->where('email', 'terry@finao.com.au')
    ->update([
        'email' => 'admin@finao.com.au',
        'first_name' => 'finao',
        'last_name' => 'Dean',
    ]);


DB::table('users')->update([
    'photo' => null, 
    'password' => Hash::make('password')
]);
DB::table('comms_users')->update([
    'password' => Hash::make('password')
]);

