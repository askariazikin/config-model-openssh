
$model_to_test = "Sshd" ;
$conf_file_name = 'sshd_config';
$conf_dir = '/etc/ssh' ;

@tests = (
    { 
        name => 'debian-671367' ,
        load_warnings => undef , # some weird warnings pop up in Perl smoke tests with perl 5.15.9
        check => { 
            'AuthorizedKeysFile:0' => '/etc/ssh/userkeys/%u',
            'AuthorizedKeysFile:1' => '/var/lib/misc/userkeys2/%u',
        },
        file_contents_like => {
            '/etc/ssh/sshd_config' => qr!/etc/ssh/userkeys/%u /var/lib/misc/userkeys2/%u! ,
        }
    },
);

1;
