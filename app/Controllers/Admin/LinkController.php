<?php

namespace App\Controllers\Admin;

use App\Controllers\AdminController;
use App\Models\Link;

class LinkController extends AdminController{
    public function index($request, $response, $args){
        $pageNum = 1;
        if (isset($request->getQueryParams()["page"])) {
            $pageNum = $request->getQueryParams()["page"];
        }
        $links = Link::orderBy('sort','desc')->paginate(15, ['*'], 'page', $pageNum);
        $links->setPath('/admin/link');
        return $this->view()->assign('links', $links)->display('admin/link/index.tpl');
    }

    public function create($request, $response, $args){
        return $this->view()->display('admin/link/create.tpl');
    }

    public function add($request, $response, $args){
        $link = new Link();
        $link->link_name = $request->getParam('name');
        $link->link_uri = $request->getParam('uri');
        $link->is_display = $request->getParam('display');
        $link->sort = $request->getParam('sort');
        $link->created = time();
        $link->updated = time();
        if (!$link->save()) {
            $rs['ret'] = 0;
            $rs['msg'] = "添加失败";
            return $response->getBody()->write(json_encode($rs));
        }
        $rs['ret'] = 1;
        $rs['msg'] = "链接添加成功";
        return $response->getBody()->write(json_encode($rs));
    }

    public function edit($request, $response, $args){
        $id = $args['id'];
        $link = Link::find($id);
        if($link == null){
            return $this->redirect($response,'/admin/link');
        }

        return $this->view()->assign('link', $link)->display('admin/link/edit.tpl');
    }

    public function update($request, $response, $args){
        $id = $args['id'];
        $link = Link::find($id);
        if($link ==  null){
            $rs['ret'] = 0;
            $rs['msg'] = "更新失败";
            return $response->getBody()->write(json_encode($rs));
        }
        $link->link_name = $request->getParam('name');
        $link->link_uri = $request->getParam('uri');
        $link->is_display = $request->getParam('display');
        $link->sort = $request->getParam('sort');
        $link->updated = time();
        if (!$link->save()) {
            $rs['ret'] = 0;
            $rs['msg'] = "更新失败";
            return $response->getBody()->write(json_encode($rs));
        }
        $rs['ret'] = 1;
        $rs['msg'] = "链接更新成功";
        return $response->getBody()->write(json_encode($rs));
    }
}