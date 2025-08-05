DB::table('users')
    ->where('email', 'terry@finao.com.au')
    ->orWhere('email', 'admin@finao.com.au')
    ->update([
        'email' => 'admin@finao.com.au',
        'first_name' => 'finao',
        'last_name' => 'Dean',
    ]);


DB::table('users')->update([
    'photo' => null, 
    'password' => Hash::make('password')
]);
DB::table('emails_config')
    ->update([
        'mode' => 'OFF',
    ]);
/*DB::table('comms_users')->update([
    'password' => Hash::make('password')
]);*/

