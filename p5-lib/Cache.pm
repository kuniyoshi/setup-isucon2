package Cache;
use strict;
use warnings;
use Data::Dumper;
use Cache::Memcached;

sub new {
    my $class = shift;
    my $memd  = Cache::Memcached->new({  
        servers => ['192.168.1.121:11211'],
#        compress_threshold => 10_000,
    });
    bless { memd => $memd }, $class;
}


sub set {
    my $self = shift;
    my ($key,$val,$exptime) = @_;
    if (defined $key && defined $val) {
        return $self->{memd}->set($key,$val,($exptime || 1)) or die $!;
    }else{
        warn 'set nothing';
    }
}

sub get {
    my $self = shift;
    my $key  = shift || die q/no key/;
    $self->{memd}->get($key);
}

sub delete {
    my $self = shift;
    my $key  = shift || die q/no key/;
    $self->{memd}->delete($key);
}

1;

