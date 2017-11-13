{include file='admin/main.tpl'}

<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            链接列表
            <small>Link List</small>
        </h1>
    </section>

    <section class="content">
        <div class="row">
            <div class="col-xs-12">
                <p> <a class="btn btn-success btn-sm" href="/admin/link/create">添加</a> </p>
                <div class="box">
                    <div class="box-body table-responsive no-padding">
                        {$links->render()}
                        <table class="table table-hover">
                            <tr>
                                <th>ID</th>
                                <th>链接名称</th>
                                <th>是否显示</th>
                                <th>排序</th>
                                <th>最后更新时间</th>
                                <th>操作</th>
                            </tr>
                            {foreach $links as $link}
                            <tr>
                                <td>#{$link->id}</td>
                                <td><a href="{$link->link_uri}" target="_blank">{$link->link_name}</a></td>
                                <td>{$link->is_display}</td>
                                <td>{$link->sort}</td>
                                <td>{$link->updated|date_format:'%Y-%m-%d %H:%M:%S'}</td>
                                <td>
                                    <a class="btn btn-info btn-sm" href="/admin/link/{$link->id}/edit">编辑</a>
                                </td>
                            </tr>
                            {/foreach}
                        </table>
                        
                    </div><!-- /.box-body -->
                </div><!-- /.box -->
            </div>
        </div>

    </section><!-- /.content -->
</div>

{include file='admin/footer.tpl'}