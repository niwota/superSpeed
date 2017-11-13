<?php

namespace App\Services;

use App\Models\Link;

class Linkapp{
    public static function getLinks(){
        $links = Link::where('is_display',1)->orderBy('sort','desc')->select('link_name','link_uri')->get();
        return $links;
    }
}