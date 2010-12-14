#!/usr/bin/env perl
use strict;
use warnings;

use Plack::Builder;
use Plack::App::File;
use Cwd;
use Template;
use Plack::Request;
use Plack::Response;

my $root = cwd;
my $template = Template->new( { INCLUDE_PATH => [$root], POST_CHOMP => 1 } );

my $app = sub {
    my $req  = Plack::Request->new(shift @_);
    my $resp = $req->new_response(200);

    my $output = "";
    my $file;
    if ($req->path_info =~ m!([^./]+)\.(php|html)!) {
        $file = "$1.tt";
    }
    else {
        $file = "index.tt";
    }
    $template->process($file, { req => $req, resp => $resp }, \$output)
        or die $template->error;

    $resp->content($output);
    $resp->finalize;
};

builder {
    enable "Plack::Middleware::XSendfile";
    mount "/favicon.ico" => Plack::App::File->new(file => "$root/favicon.ico");
    enable "Plack::Middleware::Static" => (
        path => qr{^/static/}, 
        root => $root,
    );
    enable "Plack::Middleware::Static" => (
        path => qr{\.(png|jpg|gif|css)$}, 
        root => $root,
    );
    mount '/' => $app;
};
